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

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import db.Conn;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class login extends HttpServlet {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		
		request.setAttribute("error", error);
		
		try 
		{
			Conn conn = new Conn();
			Connection connection = conn.getConnection();
			
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM r_login_details WHERE login_username ='"+username+"' and login_password='"+password+"' ");
		
			if(rs.next())
			{	
				usernamedb = rs.getString("login_username");
				passworddb = rs.getString("login_password");
				if(username.equals(usernamedb)&&(password.equals(passworddb)))
						{
							response.sendRedirect("application-form.jsp");
						}
				else {
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
					requestDispatcher.forward(request, response);				}
					}
		}
		catch (Exception e) 
		{
		
		}
		
		
	}
}

	
