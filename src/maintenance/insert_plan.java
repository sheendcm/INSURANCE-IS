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
@WebServlet("/addnewplan")
public class insert_plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_plan() {
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
		
		String Plan_Name = request.getParameter("Plan_Name");
		String Plan_Description = request.getParameter("Plan_Description");
		String Plan_Period = request.getParameter("Plan_Period");
		String Added_By = request.getParameter("Added_By");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement plandetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_plan_details( plan_name, plan_description, plan_period, plan_addedby) VALUES ('"+Plan_Name+"','"+Plan_Description+"','"+Plan_Period+"','"+Added_By+"')");
			plandetails.executeUpdate();
			
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
