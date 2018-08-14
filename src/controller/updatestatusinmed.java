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
@WebServlet("/updatestatusinmed")
public class updatestatusinmed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatestatusinmed() {
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
		
		String reqstatus_id = request.getParameter("reqstatus_id");
		
		

		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{		PreparedStatement reqstatusupdate = (PreparedStatement) conn.prepareStatement("update r_application_status_details \r\n" + 
				"set as_status = 'In Medical Department' where as_ref_c_id ='"+reqstatus_id+"' ");
				reqstatusupdate.executeUpdate();
				PreparedStatement msdetails = (PreparedStatement) conn.prepareStatement("Insert into r_medical_status_details (ms_ref_c_id, ms_status) values ('"+reqstatus_id+"','Pending')");
				msdetails.executeUpdate();
				
				
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
