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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
	
        
        String userid = request.getParameter("userid");
		String newPass = request.getParameter("newPass");
//cwp1 red
//cwp2 green	
//cwp3 gold
		
		
		

		// UPDATE r_policyowner_login_details SET pl_password = '123' WHERE pl_id=1	

		try
		{		
			Conn databases = new Conn(); 
			Connection conn = databases.getConnection();
			PreparedStatement changePass = (PreparedStatement) conn.prepareStatement("UPDATE r_policyowner_login_details SET pl_password = '"+newPass+"' where pl_id = "+userid+"");
				// changePass.setString(1,userid);
				// changePass.setString(2,newPass);
				changePass.executeUpdate();
					
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
