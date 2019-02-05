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
@WebServlet("/editplan")
public class update_plan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_plan() {
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
		
		String Plan_Id_Edit = request.getParameter("plan_id");
		String Plan_Name_Edit = request.getParameter("Plan_Name_Edit");
		String Plan_Description_Edit = request.getParameter("Plan_Description_Edit");
		String Plan_Period_Edit = request.getParameter("Plan_Period_Edit");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement plandetails = (PreparedStatement) conn.prepareStatement("UPDATE r_plan_details SET plan_name = '"+Plan_Name_Edit+"', plan_description='"+Plan_Description_Edit+"', plan_period='"+Plan_Period_Edit+"' WHERE plan_id="+Plan_Id_Edit+" ");
			plandetails.executeUpdate();
			
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
