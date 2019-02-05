package claim_insert;

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
@WebServlet("/criticalillnessinsert")
public class critical_illness_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public critical_illness_insert() {
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
		
		String sud_id = request.getParameter("sud_id");
		String policyid = request.getParameter("policyid");
		String CIHD_hospitalname = request.getParameter("CIHD_hospitalname");
		String CIHD_hospitaladdress = request.getParameter("CIHD_hospitaladdress");
		String CIHD_admissiondate = request.getParameter("CIHD_admissiondate");
		String CIHD_admissionnum = request.getParameter("CIHD_admissionnum");
		String CIHD_daysconfine = request.getParameter("CIHD_daysconfine");
		String CIHD_dischargedate = request.getParameter("CIHD_dischargedate");
		String CIHD_wardnum = request.getParameter("CIHD_wardnum");
		String CIHD_diagnosis = request.getParameter("CIHD_diagnosis");
		
		String illnessdetails = request.getParameter("illnessdetails");
		String firstconsultation = request.getParameter("firstconsultation");
		String symptomsexperienced = request.getParameter("symptomsexperienced");
		String symptomsbegin = request.getParameter("symptomsbegin");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement hdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_hospitalization_details(h_hospitalname, h_hospitaladdress, h_dateofadmission, h_admissionnumber, h_daysofconfinement, h_dateofdischarge, h_roomnumber, h_finaldiagnosis, h_doctorincharge) VALUES ('"+CIHD_hospitalname+"','"+CIHD_hospitaladdress+"','"+CIHD_admissiondate+"','"+CIHD_admissionnum+"','"+CIHD_daysconfine+"','"+CIHD_dischargedate+"','"+CIHD_wardnum+"','"+CIHD_diagnosis+"','John Doe')");
			
			PreparedStatement hldetails = (PreparedStatement) conn.prepareStatement("INSERT INTO  r_health_details (hl_detailsofillness, hl_firstconsultation, hl_symptomsexperienced, hl_symptomsbegin) VALUES ('"+illnessdetails+"','"+firstconsultation+"','"+symptomsexperienced+"','"+symptomsbegin+"')");
			
			PreparedStatement dcdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO  r_critical_illness_details(ci_ref_hl_id, ci_ref_h_id, ci_ref_pol_id) VALUES ((select max(hl_id) from r_health_details),(select max(h_id) from r_hospitalization_details),"+policyid+")");
			
			PreparedStatement cddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claiming_details(c_ref_ci_id, c_typeofclaim) VALUES ((select max(ci_id) from r_critical_illness_details),'Critical Illness')");
			
			PreparedStatement cfsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_form_status_details(cfs_completion) VALUES ('Completed')");

			PreparedStatement crsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_requirements_status_details(crs_completion, crs_status) VALUES ('Pending','Pending')");
			
			PreparedStatement clsddetails = (PreparedStatement)  conn.prepareStatement("INSERT INTO r_claim_legal_status_details(cls_completion, cls_status, cls_remarks) VALUES ('Pending','Pending','')");
			
			PreparedStatement casddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_approval_status_details(cas_completion, cas_status) VALUES ('Pending','Pending')");
			
			PreparedStatement csddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claim_status_details(cs_ref_c_id, cs_ref_cfs_id, cs_ref_crs_id, cs_ref_cls_id, cs_ref_cas_id) VALUES ((select max(c_id) from t_claiming_details),(select max(cfs_id) from r_claim_form_status_details),(select max(crs_id) from r_claim_requirements_status_details),(select max(cls_id) from r_claim_legal_status_details),(select max(cas_id) from r_claim_approval_status_details))");
			
			hdetails.executeUpdate();
			
			hldetails.executeUpdate();
			
			dcdetails.executeUpdate();
			
			cddetails.executeUpdate();
			
			cfsddetails.executeUpdate();
			
			crsddetails.executeUpdate();
			
			clsddetails.executeUpdate();
			
			casddetails.executeUpdate();
			
			csddetails.executeUpdate();
			
			String query = "SELECT * FROM r_claiming_requirements_details where cr_type='Critical Illness' or cr_type='All types of claim'  ";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next())
			{	
				String chk = rs.getString("cr_requirement");
				PreparedStatement checklist = (PreparedStatement) conn.prepareStatement("insert into r_claim_requirements_checklist_details (crc_req, crc_status, crc_ref_crs_id) values ('"+chk+"','',(SELECT MAX(crs_id) from r_claim_requirements_status_details ))");
				checklist.executeUpdate();
			}
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Added Claim Form - Critical Illness',"+sud_id+")");
			atdetails.executeUpdate();
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
