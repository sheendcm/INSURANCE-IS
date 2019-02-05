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
@WebServlet("/addnewmanager")
public class insert_manager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_manager() {
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
		
		String Manager_EmployeeNumber = request.getParameter("Manager_EmployeeNumber");
		String Manager_Name = request.getParameter("Manager_Name");
		String Manager_AppointmentDate = request.getParameter("Manager_AppointmentDate");
		String Manager_Gender = request.getParameter("Manager_Gender");
		String Manager_CivilStatus = request.getParameter("Manager_CivilStatus");
		String Manager_EmailAddress = request.getParameter("Manager_EmailAddress");
		String Manager_Address = request.getParameter("Manager_Address");
		String Manager_TelephoneNumber = request.getParameter("Manager_TelephoneNumber");
		String Manager_MobileNumber = request.getParameter("Manager_MobileNumber");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
		
        
		try
		{	
			PreparedStatement personaldetails = (PreparedStatement) conn.prepareStatement("INSERT INTO system_user_personal_details( supd_employeenumber, supd_name, supd_appointmentdate, supd_gender, supd_civilstatus, supd_emailaddress, supd_address, supd_telephonenumber, supd_mobilenumber) VALUES ('"+Manager_EmployeeNumber+"','"+Manager_Name+"','"+Manager_AppointmentDate+"','"+Manager_Gender+"','"+Manager_CivilStatus+"','"+Manager_EmailAddress+"','"+Manager_Address+"','"+Manager_TelephoneNumber+"','"+Manager_MobileNumber+"')");
			PreparedStatement logindetails = (PreparedStatement) conn.prepareStatement("INSERT INTO system_user_login_details( suld_username, suld_password) VALUES ('"+Manager_EmployeeNumber+"','"+saltStr+"')");
			PreparedStatement userdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO system_user_details( sud_usertype, sud_ref_supd_id, sud_ref_suld_id) VALUES ('Manager',(SELECT MAX(supd_id) from system_user_personal_details),(SELECT MAX(suld_id) from system_user_login_details))");
			
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
