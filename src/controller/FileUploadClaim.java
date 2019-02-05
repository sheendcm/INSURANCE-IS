package controller;
 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServletClaim")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadClaim extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/insurance_is_db";
    private String dbUser = "root";
    private String dbPass = "";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        

        String pol_id = request.getParameter("pol_id");
        String filereq_name = request.getParameter("filereqname");
        String filedesc = request.getParameter("filedesc");
        String filetype = request.getParameter("filetype");
        
        int polid = Integer.parseInt(pol_id);	
        
        InputStream inputStream = null; // input stream of the upload file
        String fileName = null;
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("requirementfile");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO r_file_details ( f_ref_pol_id, f_file, f_name, f_description, f_type) values (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
             
            statement.setInt(1, polid);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
            
            statement.setString(3, filereq_name);
            statement.setString(4, filedesc);
            statement.setString(5, filetype);
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded!";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/claim-with-pending-requirements-view.jsp").forward(request, response);
        }
    }
}