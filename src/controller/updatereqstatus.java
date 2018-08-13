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
@WebServlet("/updatereqstatus")
public class updatereqstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatereqstatus() {
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
		String req_1 = request.getParameter("req_1");
		String req_2 = request.getParameter("req_2");
		String req_3 = request.getParameter("req_3");
		String req_4 = request.getParameter("req_4");
		String req_5 = request.getParameter("req_5");
		
		

		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{		PreparedStatement reqstatusupdate = (PreparedStatement) conn.prepareStatement("UPDATE r_application_requirements_details SET ar_req1 = "+req_1+", ar_req2 = "+req_2+", ar_req3 = "+req_3+", ar_req4 = "+req_4+", ar_req5 = "+req_5+" WHERE ar_ref_c_id = '"+reqstatus_id+"' ");
				reqstatusupdate.executeUpdate();
				
				
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
