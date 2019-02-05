package maintenance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
@WebServlet("/editreq")
public class update_requirements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_requirements() {
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
		
		String req_id = request.getParameter("req_id");
		String Req_Name_Edit = request.getParameter("Req_Name_Edit");
		String Req_Description_Edit = request.getParameter("Req_Description_Edit");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement reqdetails = (PreparedStatement) conn.prepareStatement("UPDATE r_requirements_details SET req_name = '"+Req_Name_Edit+"', req_description='"+Req_Description_Edit+"' WHERE req_id="+req_id+" ");
			reqdetails.executeUpdate();
			
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
