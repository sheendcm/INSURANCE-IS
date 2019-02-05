package maintenance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.PreparedStatement;

import db.Conn;
/**
 * Servlet implementation class insert
 */
@WebServlet("/addnewuser")
public class insert_system_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_system_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		String User_EmployeeNumber = request.getParameter("User_EmployeeNumber");
		String User_Name = request.getParameter("User_Name");
		String User_AppointmentDate = request.getParameter("User_AppointmentDate");
		String User_Gender = request.getParameter("User_Gender");
		String User_CivilStatus = request.getParameter("User_CivilStatus");
		String User_EmailAddress = request.getParameter("User_EmailAddress");
		String User_Address = request.getParameter("User_Address");
		String User_TelephoneNumber = request.getParameter("User_TelephoneNumber");
		String User_MobileNumber = request.getParameter("User_MobileNumber");
		
		String AddedBy = request.getParameter("Added_By");
		String UserType = request.getParameter("User_Type");
		String Department = request.getParameter("Department");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
		
		String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        
		try
		{	
			PreparedStatement personaldetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_system_user_personal_details(supd_employeenumber, supd_name, supd_appointmentdate, supd_gender, supd_civilstatus, supd_emailaddress, supd_address, supd_telephonenumber, supd_mobilenumber, supd_addedby) values ('"+User_EmployeeNumber+"','"+User_Name+"','"+User_AppointmentDate+"','"+User_Gender+"','"+User_CivilStatus+"','"+User_EmailAddress+"','"+User_Address+"','"+User_TelephoneNumber+"','"+User_MobileNumber+"','"+AddedBy+"')");
			PreparedStatement logindetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_system_user_login_details( suld_password) VALUES ('"+saltStr+"')");
			PreparedStatement userdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_system_user_details( sud_department, sud_usertype, sud_ref_supd_id, sud_ref_suld_id) VALUES ('"+Department+"','"+UserType+"',(SELECT MAX(supd_id) from r_system_user_personal_details),(SELECT MAX(suld_id) from r_system_user_login_details))");
			
			personaldetails.executeUpdate();
			logindetails.executeUpdate();
			userdetails.executeUpdate();
		
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
