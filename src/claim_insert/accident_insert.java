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
@WebServlet("/accidentclaiminsert")
public class accident_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accident_insert() {
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
		String ACHD_hospitalname = request.getParameter("ACHD_hospitalname");
		String ACHD_hospitaladdress = request.getParameter("ACHD_hospitaladdress");
		String ACHD_admissiondate = request.getParameter("ACHD_admissiondate");
		String ACHD_admissionnum = request.getParameter("ACHD_admissionnum");
		String ACHD_daysconfine = request.getParameter("ACHD_daysconfine");
		String ACHD_dischargedate = request.getParameter("ACHD_dischargedate");
		String ACHD_wardnum = request.getParameter("ACHD_wardnum");
		String ACHD_diagnosis = request.getParameter("ACHD_diagnosis");
		
		String accidentdate = request.getParameter("accidentdate");
		String accidenttime = request.getParameter("accidenttime");
		String accidentplace = request.getParameter("accidentplace");
		String accidentcause = request.getParameter("accidentcause");
		String accidentextent = request.getParameter("accidentextent");
		String accidentdetails = request.getParameter("accidentdetails");
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	
			PreparedStatement hdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_hospitalization_details(h_hospitalname, h_hospitaladdress, h_dateofadmission, h_admissionnumber, h_daysofconfinement, h_dateofdischarge, h_roomnumber, h_finaldiagnosis, h_doctorincharge) VALUES ('"+ACHD_hospitalname+"','"+ACHD_hospitaladdress+"','"+ACHD_admissiondate+"','"+ACHD_admissionnum+"','"+ACHD_daysconfine+"','"+ACHD_dischargedate+"','"+ACHD_wardnum+"','"+ACHD_diagnosis+"','John Doe')");
			
			PreparedStatement acdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_accident_info_details (ai_accidentdate, ai_accidenttime, ai_accidentplace, ai_accidentcause, ai_accidentextent, ai_accidentdetails) VALUES ('"+accidentdate+"','"+accidenttime+"','"+accidentplace+"','"+accidentcause+"','"+accidentextent+"','"+accidentdetails+"')");
			
			PreparedStatement dcdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_accident_details (a_ref_ai_id, a_ref_h_id, a_ref_pol_id) VALUES ((select max(ai_id) from r_accident_info_details),(select max(h_id) from r_hospitalization_details),"+policyid+")");
			
			PreparedStatement cddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claiming_details(c_ref_a_id, c_typeofclaim) VALUES ((select max(a_id) from r_accident_details),'Accident')");
			
			PreparedStatement cfsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_form_status_details(cfs_completion) VALUES ('Completed')");

			PreparedStatement crsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_requirements_status_details(crs_completion, crs_status) VALUES ('Pending','Pending')");
			
			PreparedStatement clsddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_legal_status_details(cls_completion, cls_status, cls_remarks) VALUES ('Pending','Pending','')");
			
			PreparedStatement casddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_claim_approval_status_details(cas_completion, cas_status) VALUES ('Pending','Pending')");
			
			PreparedStatement csddetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_claim_status_details(cs_ref_c_id, cs_ref_cfs_id, cs_ref_crs_id, cs_ref_cls_id, cs_ref_cas_id) VALUES ((select max(c_id) from t_claiming_details),(select max(cfs_id) from r_claim_form_status_details),(select max(crs_id) from r_claim_requirements_status_details),(select max(cls_id) from r_claim_legal_status_details),(select max(cas_id) from r_claim_approval_status_details))");
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('Added Claim Form - Accident',"+sud_id+")");
			
			hdetails.executeUpdate();
			
			acdetails.executeUpdate();
			
			dcdetails.executeUpdate();
			
			cddetails.executeUpdate();
			
			cfsddetails.executeUpdate();
			
			crsddetails.executeUpdate();
			
			clsddetails.executeUpdate();
			
			casddetails.executeUpdate();
			
			csddetails.executeUpdate();
			
			String query = "SELECT * FROM r_claiming_requirements_details where cr_type='Accident' or cr_type='All types of claim'  ";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next())
			{	
				String chk = rs.getString("cr_requirement");
				PreparedStatement checklist = (PreparedStatement) conn.prepareStatement("insert into r_claim_requirements_checklist_details (crc_req, crc_status, crc_ref_crs_id) values ('"+chk+"','',(SELECT MAX(crs_id) from r_claim_requirements_status_details ))");
				checklist.executeUpdate();
			}
			
			atdetails.executeUpdate();
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
