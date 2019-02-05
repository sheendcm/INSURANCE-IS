package underwriting_update;

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
@WebServlet("/updatereq")
public class UpdateRequirementStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRequirementStatus() {
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
			PreparedStatement setunchecked = (PreparedStatement) conn.prepareStatement("UPDATE r_requirements_checklist_details SET rc_status='' where rc_ref_rs_id='"+rsid+"' ");
			setunchecked.executeUpdate();			
			for(int i = 0; i < chkRequirements_list.length; i++)
			{
				
			PreparedStatement updatereq = (PreparedStatement) conn.prepareStatement("UPDATE r_requirements_checklist_details SET rc_status='checked' where rc_id='"+chkRequirements_list[i]+"' ");
			updatereq.executeUpdate();
				
			}
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Updated requirements of an application',"+sud_id+")");
			atdetails.executeUpdate();	
			
			int allcountreq=0;
			int countreq=0;
			
			String query2 = "select * from r_policy_details pd LEFT JOIN r_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_policyowner_details pod on pod.p_id=pd.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN r_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_requirements_status_details rsd ON rsd.rs_id=psd.ps_ref_rs_id LEFT JOIN r_requirements_checklist_details rcd ON rcd.rc_ref_rs_id=rsd.rs_id where rcd.rc_ref_rs_id="+rsid+" ";
			Statement stmt2 = conn.createStatement();
			ResultSet rs2 = stmt2.executeQuery(query2);
			while(rs2.next())
			{
				allcountreq = rs2.getRow();
			}
			rs2.close();
            stmt2.close();
            
            String query3 = "select * from r_policy_details pd LEFT JOIN r_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_policyowner_details pod on pod.p_id=pd.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN r_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_requirements_status_details rsd ON rsd.rs_id=psd.ps_ref_rs_id LEFT JOIN r_requirements_checklist_details rcd ON rcd.rc_ref_rs_id=rsd.rs_id where rcd.rc_ref_rs_id="+rsid+" and rcd.rc_status='checked' ";
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
            	PreparedStatement updatereqcompletion = (PreparedStatement) conn.prepareStatement("UPDATE r_requirements_status_details SET rs_completion ='Completed', rs_datereqcompleted='"+modifiedDate+"' where rs_id='"+rsid+"' ");
            	updatereqcompletion.executeUpdate();
            }
            else
            {
            	PreparedStatement updatereqcompletion1 = (PreparedStatement) conn.prepareStatement("UPDATE r_requirements_status_details SET rs_completion ='Pending' where rs_id='"+rsid+"' ");
            	updatereqcompletion1.executeUpdate();
            }
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
