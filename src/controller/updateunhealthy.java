package controller;

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
 * Servlet implementation class updatereqstatus
 */
@WebServlet("/updateunhealthy")
public class updateunhealthy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateunhealthy() {
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
		
		String id_unhealthy = request.getParameter("id_unhealthy");
		
		

		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{		PreparedStatement reqstatusupdate = (PreparedStatement) conn.prepareStatement("update r_medical_status_details \r\n" + 
				"set ms_status = 'Unhealthy' where ms_ref_c_id ='"+id_unhealthy+"' ");
				reqstatusupdate.executeUpdate();
				
				
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
