package medical;

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
@WebServlet("/medicaldecline")
public class UpdateMedicalStatus1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicalStatus1() {
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
		
		String ms_id = request.getParameter("ms_id");
		String remarks = request.getParameter("remarks");
		String sud_id = request.getParameter("sud_id");
		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{		PreparedStatement updatehealthy = (PreparedStatement) conn.prepareStatement("update r_medical_status_details \r\n" + 
				"set ms_status = 'In poor health' , ms_remarks='"+remarks+"' where ms_id ='"+ms_id+"' ");
				updatehealthy.executeUpdate();
				
				PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Declined Application',"+sud_id+")");
				atdetails.executeUpdate();	
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
