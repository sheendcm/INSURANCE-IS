package underwriting_update;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

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
@WebServlet("/approvepolicy")
public class UpdateStatusIssued extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatusIssued() {
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
		
		String asid = request.getParameter("asid");
		String modeofpayment = request.getParameter("modeofpayment");
		int annualizedpremium = Integer.parseInt(request.getParameter("annualizedpremium"));
		String polid = request.getParameter("polid");
		String sud_id = request.getParameter("sud_id");
		
		Date date = new Date();
		String modifiedDate1= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
		
        int dividepayment;
		
        
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{
				PreparedStatement statusupdate = (PreparedStatement) conn.prepareStatement("update r_approval_status_details \r\n" + 
				"set as_status = 'Issued', as_completion='Completed', as_datecompleted='"+modifiedDate1+"' where as_id ='"+asid+"' ");
				statusupdate.executeUpdate();
						
						
				
	            
	            
	            if (modeofpayment.equals("Annual"))
	            {
	            	Calendar calendar = Calendar.getInstance();         
	                calendar.add(Calendar.MONTH, 12);
	                calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
	                Date nextMonthFirstDay = calendar.getTime();
	                calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
	                Date nextMonthLastDay = calendar.getTime();
	                

	        		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(nextMonthLastDay);
	        		
	            	PreparedStatement next = (PreparedStatement) conn.prepareStatement("INSERT INTO t_payment_details ( payment_amount, payment_due_date, payment_method, payment_status, payment_ref_pol_id) VALUES ('"+annualizedpremium+"','"+modifiedDate+"','','Pending',"+polid+") ");
	            	next.executeUpdate();
	            	
	            	
	            }
	            if (modeofpayment.equals("Semi-annual"))
	            	{
	            	
	            	
	            	dividepayment=annualizedpremium/2;
	            	
	            	for(int i = 0; i < 12; i+=6)
					{	
	            		
	            		Calendar calendar = Calendar.getInstance();         
		                calendar.add(Calendar.MONTH, i+6);
		                calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		                Date nextMonthFirstDay = calendar.getTime();
		                calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		                Date nextMonthLastDay = calendar.getTime();
		                

		        		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(nextMonthLastDay);
		        		
	            		PreparedStatement next = (PreparedStatement) conn.prepareStatement("INSERT INTO t_payment_details(payment_amount, payment_due_date, payment_status,payment_ref_pol_id,payment_method) VALUES ('"+dividepayment+"','"+modifiedDate+"','Pending',"+polid+",'')");
	            		next.executeUpdate();
						
					}
	            	}
	            if (modeofpayment.equals("Quarterly"))
            	{
            	
            	
            	dividepayment=annualizedpremium/4;
            	
            	for(int i = 0; i < 12; i+=3)
				{	
            		Calendar calendar = Calendar.getInstance();         
	                calendar.add(Calendar.MONTH, i+3);
	                calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
	                Date nextMonthFirstDay = calendar.getTime();
	                calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
	                Date nextMonthLastDay = calendar.getTime();
	                

	        		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(nextMonthLastDay);
            		
            		PreparedStatement next = (PreparedStatement) conn.prepareStatement("INSERT INTO t_payment_details(payment_amount, payment_due_date, payment_status, payment_ref_pol_id, payment_method) VALUES ('"+dividepayment+"','"+modifiedDate+"','Pending',"+polid+",'')");
            		next.executeUpdate();
					
				}
            	}
	            if (modeofpayment.equals("Monthly"))
	            {
	            	
	            	
	            	dividepayment=annualizedpremium/12;
	            	
	            	for(int i = 0; i < 12; i++)
					{	
	            		Calendar calendar = Calendar.getInstance();         
		                calendar.add(Calendar.MONTH, i);
		                calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		                Date nextMonthFirstDay = calendar.getTime();
		                calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		                Date nextMonthLastDay = calendar.getTime();
		                

		        		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(nextMonthLastDay);
	            		
	            		PreparedStatement next = (PreparedStatement) conn.prepareStatement("INSERT INTO t_payment_details(payment_amount, payment_due_date, payment_status,payment_ref_pol_id,payment_method) VALUES ('"+dividepayment+"','"+modifiedDate+"','Pending',"+polid+",'')");
	            		next.executeUpdate();
						
					}
	            	}
	            
	            PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Approved an application',"+sud_id+")");
				atdetails.executeUpdate();	
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
