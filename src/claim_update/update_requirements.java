package claim_update;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

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
@WebServlet("/updatereqclaim")
public class update_requirements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_requirements() {
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
		
		String chkRequirements = request.getParameter("chkRequirements");
		String rsid = request.getParameter("rsid");
		String sud_id = request.getParameter("sud_id");
		
		String[] chkRequirements_list = chkRequirements.split(":");
		
		Date date = new Date();
		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement setunchecked = (PreparedStatement) conn.prepareStatement("UPDATE r_claim_requirements_checklist_details SET crc_status='' where crc_ref_crs_id='"+rsid+"' ");
			setunchecked.executeUpdate();			
			for(int i = 0; i < chkRequirements_list.length; i++)
			{
				
			PreparedStatement updatereq = (PreparedStatement) conn.prepareStatement("UPDATE r_claim_requirements_checklist_details SET crc_status='checked' where crc_id='"+chkRequirements_list[i]+"' ");
			updatereq.executeUpdate();
				
			}
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Updated the requirements of a claim',"+sud_id+")");
			atdetails.executeUpdate();
			
			int allcountreq=0;
			int countreq=0;
			
			String query2 = "select * from r_claim_requirements_checklist_details crc LEFT JOIN r_claim_requirements_status_details crs ON crs.crs_id=crc.crc_ref_crs_id WHERE crc.crc_ref_crs_id="+rsid+" ";
			Statement stmt2 = conn.createStatement();
			ResultSet rs2 = stmt2.executeQuery(query2);
			while(rs2.next())
			{
				allcountreq = rs2.getRow();
			}
			rs2.close();
            stmt2.close();
            
            String query3 = "select * from r_claim_requirements_checklist_details crc LEFT JOIN r_claim_requirements_status_details crs ON crs.crs_id=crc.crc_ref_crs_id WHERE crc.crc_ref_crs_id="+rsid+" and crc.crc_status='checked' ";
			Statement stmt3 = conn.createStatement();
			ResultSet rs3 = stmt3.executeQuery(query3);
			while(rs3.next())
			{
				countreq = rs3.getRow();
			}
			rs3.close();
            stmt3.close();
            
            if(allcountreq==countreq)
            {
            	PreparedStatement updatereqcompletion = (PreparedStatement) conn.prepareStatement("UPDATE r_claim_requirements_status_details SET crs_completion ='Completed', crs_datereqcompleted='"+modifiedDate+"' where crs_id='"+rsid+"' ");
            	updatereqcompletion.executeUpdate();
            }
            else
            {
            	PreparedStatement updatereqcompletion1 = (PreparedStatement) conn.prepareStatement("UPDATE r_claim_requirements_status_details SET crs_completion ='Pending' where crs_id='"+rsid+"' ");
            	updatereqcompletion1.executeUpdate();
            }
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
