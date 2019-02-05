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
@WebServlet("/deathclaiminsert")
public class death_claim_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public death_claim_insert() {
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
		String DCHD_deathcause = request.getParameter("DCHD_deathcause");
		String DCHD_datedeath = request.getParameter("DCHD_datedeath");
		String DCHD_timedeath = request.getParameter("DCHD_timedeath");
		String DCHD_deathplace = request.getParameter("DCHD_deathplace");
		String DCHD_doctorname = request.getParameter("DCHD_doctorname");
		String DCHD_doctornumber = request.getParameter("DCHD_doctornumber");
		String DCHD_doctoraddress = request.getParameter("DCHD_doctoraddress");
		String DCHD_medattendantname = request.getParameter("DCHD_medattendantname");
		String DCHD_medattendantnumber = request.getParameter("DCHD_medattendantnumber");
		String DCHD_medattendantaddress = request.getParameter("DCHD_medattendantaddress");
		

		String DCHD_hospitalname = request.getParameter("DCHD_hospitalname");
		String DCHD_hospitaladdress = request.getParameter("DCHD_hospitaladdress");
		String DCHD_admissiondate = request.getParameter("DCHD_admissiondate");
		String DCHD_admissionnum = request.getParameter("DCHD_admissionnum");
		String DCHD_daysconfine = request.getParameter("DCHD_daysconfine");
		String DCHD_dischargedate = request.getParameter("DCHD_dischargedate");
		String DCHD_wardnum = request.getParameter("DCHD_wardnum");
		String DCHD_diagnosis = request.getParameter("DCHD_diagnosis");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement ddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_death_details(d_causeofdeath, d_dateofdeath, d_timeofdeath, d_placeofdeath, d_doctorcertifyingdeath, d_doctorcontactnumber, d_doctoraddress, d_assistantcertifyingdeath, d_assistantcontactnumber, d_assistantaddress, d_buriedorcremate) VALUES ('"+DCHD_deathcause+"','"+DCHD_datedeath+"','"+DCHD_timedeath+"','"+DCHD_deathplace+"','"+DCHD_doctorname+"','"+DCHD_doctornumber+"','"+DCHD_doctoraddress+"','"+DCHD_medattendantname+"','"+DCHD_medattendantnumber+"','"+DCHD_medattendantaddress+"','')");
			
			PreparedStatement hdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_hospitalization_details(h_hospitalname, h_hospitaladdress, h_dateofadmission, h_admissionnumber, h_daysofconfinement, h_dateofdischarge, h_roomnumber, h_finaldiagnosis, h_doctorincharge) VALUES ('"+DCHD_hospitalname+"','"+DCHD_hospitaladdress+"','"+DCHD_admissiondate+"','"+DCHD_admissionnum+"','"+DCHD_daysconfine+"','"+DCHD_dischargedate+"','"+DCHD_wardnum+"','"+DCHD_diagnosis+"','John Doe')");
			
			PreparedStatement dcdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_death_claim_details(dc_ref_d_id, dc_ref_h_id, dc_ref_pol_id) VALUES ((select max(d_id) from r_death_details), (select max(h_id) from r_hospitalization_details),"+policyid+")");
			
			PreparedStatement cddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claiming_details(c_ref_dc_id, c_typeofclaim) VALUES ((select max(dc_id) from r_death_claim_details),'Death Claim')");
			
			PreparedStatement cfsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_form_status_details(cfs_completion) VALUES ('Completed')");

			PreparedStatement crsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_requirements_status_details(crs_completion, crs_status) VALUES ('Pending','Pending')");
			
			PreparedStatement clsddetails = (PreparedStatement)  conn.prepareStatement("INSERT INTO r_claim_legal_status_details(cls_completion, cls_status, cls_remarks) VALUES ('Pending','Pending','')");
			
			PreparedStatement casddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_approval_status_details(cas_completion, cas_status) VALUES ('Pending','Pending')");
			
			PreparedStatement csddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claim_status_details(cs_ref_c_id, cs_ref_cfs_id, cs_ref_crs_id, cs_ref_cls_id, cs_ref_cas_id) VALUES ((select max(c_id) from t_claiming_details),(select max(cfs_id) from r_claim_form_status_details),(select max(crs_id) from r_claim_requirements_status_details),(select max(cls_id) from r_claim_legal_status_details),(select max(cas_id) from r_claim_approval_status_details))");
			
			ddetails.executeUpdate();
			
			hdetails.executeUpdate();
			
			dcdetails.executeUpdate();
			
			cddetails.executeUpdate();
			
			cfsddetails.executeUpdate();
			
			crsddetails.executeUpdate();
			
			clsddetails.executeUpdate();
			
			casddetails.executeUpdate();
			
			csddetails.executeUpdate();
			
			String query = "SELECT * FROM r_claiming_requirements_details where cr_type='Death Claim' or cr_type='All types of claim'  ";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{	
				String chk = rs.getString("cr_requirement");
				PreparedStatement checklist = (PreparedStatement) conn.prepareStatement("insert into r_claim_requirements_checklist_details (crc_req, crc_status, crc_ref_crs_id) values ('"+chk+"','',(SELECT MAX(crs_id) from r_claim_requirements_status_details ))");
				checklist.executeUpdate();
			}
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Added Claim Form - Death Claim',"+sud_id+")");
			atdetails.executeUpdate();
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
