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
@WebServlet("/edituser")
public class update_system_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_system_user() {
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
		
		String user_id = request.getParameter("user_id");
		String User_CivilStatus = request.getParameter("User_CivilStatus");
		String User_EmailAddress = request.getParameter("User_EmailAddress");
		String User_Address = request.getParameter("User_Address");
		String User_TelephoneNumber = request.getParameter("User_TelephoneNumber");
		String User_MobileNumber = request.getParameter("User_MobileNumber");
		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
		
        
		try
		{	
			
			
				PreparedStatement personaldetails = (PreparedStatement) conn.prepareStatement("UPDATE r_system_user_personal_details SET  supd_civilstatus='"+User_CivilStatus+"', supd_emailaddress='"+User_EmailAddress+"', supd_address='"+User_Address+"', supd_telephonenumber='"+User_TelephoneNumber+"', supd_mobilenumber='"+User_MobileNumber+"' where supd_id="+user_id+" ");;
				
				personaldetails.executeUpdate();
			
			
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
