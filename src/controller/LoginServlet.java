package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import db.Conn;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	     
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String error = request.getParameter("error");
		
		String usernamedb="";
		String passworddb="";
		
		int id;
		
		request.setAttribute("error", error);
		
		try 
		{
			Conn conn = new Conn();
			Connection connection = conn.getConnection();
			
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM r_system_user_details sud INNER JOIN r_system_user_personal_details supd on supd.supd_id=sud.sud_ref_supd_id INNER JOIN r_system_user_login_details suld ON suld.suld_id=sud.sud_ref_suld_id WHERE supd_employeenumber ='"+username+"' and suld_password='"+password+"' ");
			
			Statement statement1 = connection.createStatement();
			ResultSet rs1 = statement1.executeQuery("SELECT * FROM r_policyowner_login_details pld INNER JOIN r_policyowner_details pd ON pd.p_id=pld.pl_ref_p_id WHERE p_clientnumber ='"+username+"' and pl_password='"+password+"' ");
			
			if(rs.next())
			{	
				
				int sud_id = rs.getInt("sud_id");
				String usertype = rs.getString("sud_usertype");
				String department = rs.getString("sud_department");

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
				   LocalDateTime now = LocalDateTime.now();  
				   String datetimenow = dtf.format(now);  

				PreparedStatement atdetails = (PreparedStatement) connection.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Login',"+sud_id+")");
				atdetails.executeUpdate();
				
				
				if(usertype.equals("Admin"))
						{
							HttpSession session = request.getSession(true); 
							
							session.setAttribute("e_id", sud_id);
							session.setMaxInactiveInterval(900); // 15 mins
							response.sendRedirect("maintenance-dashboard.jsp");
						}
				if(department.equals("Underwriting"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("underwriting-progress-view.jsp");
				}
				
				if(department.equals("Medical"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("medical-department.jsp");
				}
				if(department.equals("Cashier"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("cashiering-payments-view.jsp");
				}
				if(department.equals("Claiming"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("claim-dashboard.jsp");
				}
				if(department.equals("Legal"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("legal-department.jsp");
				}
				if(department.equals("Cash Disbursement"))
				{
					HttpSession session = request.getSession(true); 
					
					session.setAttribute("e_id", sud_id);
					session.setMaxInactiveInterval(900); // 15 mins
					response.sendRedirect("cash-disbursement-new.jsp");
				}
					}
			if(rs1.next())
			{	
				
				int pid = rs1.getInt("p_id");

				HttpSession session = request.getSession(true); 
				
				session.setAttribute("e_id", pid);
				session.setMaxInactiveInterval(900); // 15 mins
				response.sendRedirect("client-life-insured-view.jsp"); 

				
					}
			else {
				
				
				
				 // sets the message in request scope
	            request.setAttribute("Message", "Incorrect username or password!");
	             
	            // forwards to the message page
	            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
               rd.forward(request, response); 
	            
               request.getRequestDispatcher("/employee-login.jsp").forward(request, response);
				}
		}
		catch (Exception e) 
		{
		
		}
		
		
	}
}

	
