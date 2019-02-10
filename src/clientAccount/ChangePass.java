package clientAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import db.Conn;
/**
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePass() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
	
        
        String userid = request.getParameter("userid");
		String newPass = request.getParameter("newPass");

			Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
		
		try
		{		PreparedStatement changePass = (PreparedStatement) conn.prepareStatement("update r_policyowner_login_details \r\n" + 
				"set pl_password ='"+newPass+"' where pl_id ='"+userid+"' ");
				changePass.executeUpdate();
				
				// PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Approved Application',"+sud_id+")");
				// atdetails.executeUpdate();	
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
