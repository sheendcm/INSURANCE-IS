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
@WebServlet("/addnewreq")
public class insert_requirements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_requirements() {
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
		
		String Req_Name = request.getParameter("Req_Name");
		String Req_Description = request.getParameter("Req_Description");
		String Claim_Type = request.getParameter("Claim_Type");
		String Added_By = request.getParameter("Added_By");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			if(Claim_Type=="" || Claim_Type==null)
			{
			PreparedStatement reqdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_requirements_details( req_name, req_description, req_addedby) VALUES ('"+Req_Name+"', '"+Req_Description+"', '"+Added_By+"') ");
			reqdetails.executeUpdate();
			}
			else
			{
				PreparedStatement reqdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claiming_requirements_details( cr_requirement, cr_description, cr_addedby, cr_type) VALUES ('"+Req_Name+"', '"+Req_Description+"', '"+Added_By+"','"+Claim_Type+"') ");
				reqdetails.executeUpdate();
			}
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
