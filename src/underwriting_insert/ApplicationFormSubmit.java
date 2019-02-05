package underwriting_insert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
@WebServlet("/insert")
public class ApplicationFormSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationFormSubmit() {
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
		String foractivity = "Added application number"+request.getParameter("AF_applicationnumber");
		
		String AF_applicationnumber = request.getParameter("AF_applicationnumber");
		String AF_dateapplied = request.getParameter("AF_dateapplied");
		
		String agent_id = request.getParameter("agent_id");
		String Added_By = request.getParameter("Added_By");
		
		String p_preexist = request.getParameter("p_preexist");
		
		String LI_surname = request.getParameter("LI_surname");
		String LI_givenname = request.getParameter("LI_givenname");
		String LI_middlename = request.getParameter("LI_middlename");
		String LI_alias = request.getParameter("LI_alias");
		String LI_gender = request.getParameter("LI_gender");
		String LI_civilstatus = request.getParameter("LI_civilstatusThis");
		String LI_salutation = request.getParameter("LI_salutation");
		String LI_birthdate = request.getParameter("LI_birthdate");
		String LI_nationality = request.getParameter("LI_nationality");
		String LI_placeofbirth = request.getParameter("LI_placeofbirth");
		String LI_occupation = request.getParameter("LI_occupation");
		String LI_natureofwork = request.getParameter("LI_natureofwork");
		String LI_employer = request.getParameter("LI_employer");
		String LI_natureofemployer = request.getParameter("LI_natureofemployer");
		String LI_annualincome = request.getParameter("LI_annualincome");
		String LI_networth = request.getParameter("LI_networth");
		String LI_sourceoffunds = request.getParameter("LI_sourceoffundsThis");
		String LI_mobilenumber = request.getParameter("LI_mobilenumber");
		String LI_telephonenumber = request.getParameter("LI_telephonenumber");
		String LI_emailaddress = request.getParameter("LI_emailaddress");
		String LI_presentaddress = request.getParameter("LI_presentaddress");
		String LI_presentcountry = request.getParameter("LI_presentcountry");
		String LI_presentzipcode = request.getParameter("LI_presentzipcode");
		String LI_permanentaddress = request.getParameter("LI_permanentaddress");
		String LI_permanentcountry = request.getParameter("LI_permanentcountry");
		String LI_permanentzipcode = request.getParameter("LI_permanentzipcode");
		String LI_businessaddress = request.getParameter("LI_businessaddress");
		String LI_businesscountry = request.getParameter("LI_businesscountry");
		String LI_businesszipcode = request.getParameter("LI_businesszipcode");
		String LI_reltopolicyowner = request.getParameter("LI_reltopolicyowner");

		String P_clientnumber = request.getParameter("P_clientnumber");
		String P_surname = request.getParameter("P_surname");
		String P_givenname = request.getParameter("P_givenname");
		String P_middlename = request.getParameter("P_middlename");
		String P_alias = request.getParameter("P_alias");
		String P_gender = request.getParameter("P_gender");
		String P_civilstatus = request.getParameter("P_civilstatusThis");
		String P_salutation = request.getParameter("P_salutation");
		String P_birthdate = request.getParameter("P_birthdate");
		String P_nationality = request.getParameter("P_nationality");
		String P_placeofbirth = request.getParameter("P_placeofbirth");
		String P_occupation = request.getParameter("P_occupation");
		String P_natureofwork = request.getParameter("P_natureofwork");
		String P_employer = request.getParameter("P_employer");
		String P_natureofemployer = request.getParameter("P_natureofemployer");
		String P_annualincome = request.getParameter("P_annualincome");
		String P_networth = request.getParameter("P_networth");
		String P_sourceoffunds = request.getParameter("P_sourceoffundsThis");
		String P_mobilenumber = request.getParameter("P_mobilenumber");
		String P_telephonenumber = request.getParameter("P_telephonenumber");
		String P_emailaddress = request.getParameter("P_emailaddress");
		String P_presentaddress = request.getParameter("P_presentaddress");
		String P_presentcountry = request.getParameter("P_presentcountry");
		String P_presentzipcode = request.getParameter("P_presentzipcode");
		String P_permanentaddress = request.getParameter("P_permanentaddress");
		String P_permanentcountry = request.getParameter("P_permanentcountry");
		String P_permanentzipcode = request.getParameter("P_permanentzipcode");
		String P_businessaddress = request.getParameter("P_businessaddress");
		String P_businesscountry = request.getParameter("P_businesscountry");
		String P_businesszipcode = request.getParameter("P_businesszipcode");
		
		String BO_name = request.getParameter("BO_name");
		String BO_contactnumber = request.getParameter("BO_contactnumber");
		
		String PB_name = request.getParameter("PB_name");
		String PB_birthdate = request.getParameter("PB_birthdate");
		String PB_gender = request.getParameter("PB_gender");
		String PB_reltoinsured = request.getParameter("PB_reltoinsured");
		String PB_share = request.getParameter("PB_share");
		String PB_typeofbeneficiary = request.getParameter("PB_typeofbeneficiary");
		String PB_beneficiarydesignation = request.getParameter("PB_beneficiarydesignation");
		String PB_placeofbirth = request.getParameter("PB_placeofbirth");
		String PB_nationality = request.getParameter("PB_nationality");
		String PB_presentaddress = request.getParameter("PB_presentaddress");
		String PB_country = request.getParameter("PB_country");
		String PB_zipcode = request.getParameter("PB_zipcode");
		
		String SB_name = request.getParameter("SB_name");
		String SB_birthdate = request.getParameter("SB_birthdate");
		String SB_gender = request.getParameter("SB_gender");
		String SB_reltoinsured = request.getParameter("SB_reltoinsured");
		String SB_share = request.getParameter("SB_share");
		String SB_typeofbeneficiary = request.getParameter("SB_typeofbeneficiary");
		String SB_beneficiarydesignation = request.getParameter("SB_beneficiarydesignation");
		String SB_placeofbirth = request.getParameter("SB_placeofbirth");
		String SB_nationality = request.getParameter("SB_nationality");
		String SB_presentaddress = request.getParameter("SB_presentaddress");
		String SB_country = request.getParameter("SB_country");
		String SB_zipcode = request.getParameter("SB_zipcode");
		
		String PI_planname = request.getParameter("PI_planname");
		String PI_sumassured = request.getParameter("PI_sumassured");
		String PI_annualizedpremium = request.getParameter("PI_annualizedpremium");
		String PI_initialpremiumpaid = request.getParameter("PI_initialpremiumpaid");
		String PI_modeofpayment = request.getParameter("PI_modeofpayment");
		
		String NMI_height = request.getParameter("NMI_height");
		String NMI_weight = request.getParameter("NMI_weight");
		String NMI_1details = request.getParameter("NMI_1details");
		String NMI_2details = request.getParameter("NMI_2details");
		String NMI_3details = request.getParameter("NMI_3details");
		String NMI_4details = request.getParameter("NMI_4details");
		String NMI_5details = request.getParameter("NMI_5details");
		String NMI_6details = request.getParameter("NMI_6details");
		String NMI_7details = request.getParameter("NMI_7details");
		String NMI_8details = request.getParameter("NMI_8details");
		String NMI_9details = request.getParameter("NMI_9details");
		String NMI_10details = request.getParameter("NMI_10details");
		String NMI_1 = request.getParameter("NMI_1");
		String NMI_2 = request.getParameter("NMI_2");
		String NMI_3 = request.getParameter("NMI_3");
		String NMI_4 = request.getParameter("NMI_4");
		String NMI_5 = request.getParameter("NMI_5");
		String NMI_6 = request.getParameter("NMI_6");
		String NMI_7 = request.getParameter("NMI_7");
		String NMI_8 = request.getParameter("NMI_8");
		String NMI_9 = request.getParameter("NMI_9");
		String NMI_10 = request.getParameter("NMI_10");
		
		String pi_name = request.getParameter("pi_name");
		
		String[] pi_name_list = pi_name.split(":");
		
		String amount = request.getParameter("amount");
		
		String[] pi_amount_list = amount.split(":");
		
		String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        
        Date date = new Date();
		String modifiedDate= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{	

			PreparedStatement lipdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_life_insured_personal_details(li_surname, li_givenname, li_middlename, li_alias, li_gender, li_civilstatus, li_salutation, li_birthdate, li_nationality, li_placeofbirth, li_occupation, li_natureofwork, li_employer, li_natureofemployer, li_annualincome, li_networth, li_sourceoffunds, li_mobilenumber, li_telephonenumber, li_emailaddress, li_presentaddress, li_presentcountry, li_presentzipcode, li_permanentaddress, li_permanentcountry, li_permanentzipcode, li_businessaddress, li_businesscountry, li_businesszipcode, li_rel_to_policyowner) VALUES ('"+LI_surname+"','"+LI_givenname+"','"+LI_middlename+"','"+LI_alias+"','"+LI_gender+"','"+LI_civilstatus+"','"+LI_salutation+"','"+LI_birthdate+"','"+LI_nationality+"','"+LI_placeofbirth+"','"+LI_occupation+"','"+LI_natureofwork+"','"+LI_employer+"','"+LI_natureofemployer+"','"+LI_annualincome+"','"+LI_networth+"','"+LI_sourceoffunds+"','"+LI_mobilenumber+"','"+LI_telephonenumber+"','"+LI_emailaddress+"','"+LI_presentaddress+"','"+LI_presentcountry+"','"+LI_presentzipcode+"','"+LI_permanentaddress+"','"+LI_permanentcountry+"','"+LI_permanentzipcode+"','"+LI_businessaddress+"','"+LI_businesscountry+"','"+LI_businesszipcode+"','"+LI_reltopolicyowner+"')");

			PreparedStatement nmidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_non_medical_information_details(nmid_height, nmid_weight, nmid_1, nmid_1details, nmid_2, nmid_2details, nmid_3, nmid_3details, nmid_4, nmid_4details, nmid_5, nmid_5details, nmid_6, nmid_6details, nmid_7, nmid_7details, nmid_8, nmid_8details, nmid_9, nmid_9details, nmid_10, nmid_10details) VALUES ('"+NMI_height+"','"+NMI_weight+"','"+NMI_1+"','"+NMI_1details+"','"+NMI_2+"','"+NMI_2details+"','"+NMI_3+"','"+NMI_3details+"','"+NMI_4+"','"+NMI_4details+"','"+NMI_5+"','"+NMI_5details+"','"+NMI_6+"','"+NMI_6details+"','"+NMI_7+"','"+NMI_7details+"','"+NMI_8+"','"+NMI_8details+"','"+NMI_9+"','"+NMI_9details+"','"+NMI_10+"','"+NMI_10details+"')");

			PreparedStatement lidetails = (PreparedStatement) conn.prepareStatement("insert into r_life_insured_details (lid_ref_li_id, lid_ref_nmid_id) values ((SELECT MAX(li_id) from r_life_insured_personal_details ),(SELECT MAX(nmid_id) from r_non_medical_information_details ))");

			PreparedStatement pbdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_beneficiary_details(b_name, b_birthdate, b_gender, b_reltoinsured, b_share, b_typeofbeneficiary, b_beneficiarydesignation, b_placeofbirth, b_nationality, b_presentaddress, b_country, b_zipcode, b_ref_lid_id) VALUES ('"+PB_name+"','"+PB_birthdate+"','"+PB_gender+"','"+PB_reltoinsured+"','"+PB_share+"','"+PB_typeofbeneficiary+"','"+PB_beneficiarydesignation+"','"+PB_placeofbirth+"','"+PB_nationality+"','"+PB_presentaddress+"','"+PB_country+"','"+PB_zipcode+"',(SELECT MAX(li_id) from r_life_insured_personal_details ))");
			
			PreparedStatement sbdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_beneficiary_details(b_name, b_birthdate, b_gender, b_reltoinsured, b_share, b_typeofbeneficiary, b_beneficiarydesignation, b_placeofbirth, b_nationality, b_presentaddress, b_country, b_zipcode, b_ref_lid_id) VALUES ('"+SB_name+"','"+SB_birthdate+"','"+SB_gender+"','"+SB_reltoinsured+"','"+SB_share+"','"+SB_typeofbeneficiary+"','"+SB_beneficiarydesignation+"','"+SB_placeofbirth+"','"+SB_nationality+"','"+SB_presentaddress+"','"+SB_country+"','"+SB_zipcode+"',(SELECT MAX(li_id) from r_life_insured_personal_details ))");

			PreparedStatement pdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_policyowner_details(p_clientnumber, p_surname, p_givenname, p_middlename, p_alias, p_gender, p_civilstatus, p_salutation, p_birthdate, p_nationality, p_placeofbirth, p_occupation, p_natureofwork, p_employer, p_natureofemployer, p_annualincome, p_networth, p_sourceoffunds, p_mobilenumber, p_telephonenumber, p_emailaddress, p_presentaddress, p_presentcountry, p_presentzipcode, p_permanentaddress, p_permanentcountry, p_permanentzipcode, p_businessaddress, p_businesscountry, p_businesszipcode) VALUES ('"+P_clientnumber+"','"+P_surname+"','"+P_givenname+"','"+P_middlename+"','"+P_alias+"','"+P_gender+"','"+P_civilstatus+"','"+P_salutation+"','"+P_birthdate+"','"+P_nationality+"','"+P_placeofbirth+"','"+P_occupation+"','"+P_natureofwork+"','"+P_employer+"','"+P_natureofemployer+"','"+P_annualincome+"','"+P_networth+"','"+P_sourceoffunds+"','"+P_mobilenumber+"','"+P_telephonenumber+"','"+P_emailaddress+"','"+P_presentaddress+"','"+P_presentcountry+"','"+P_presentzipcode+"','"+P_permanentaddress+"','"+P_permanentcountry+"','"+P_permanentzipcode+"','"+P_businessaddress+"','"+P_businesscountry+"','"+P_businesszipcode+"')");

			PreparedStatement pldetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_policyowner_login_details(pl_password, pl_ref_p_id) VALUES ('"+saltStr+"',(SELECT MAX(p_id) from r_policyowner_details )) ");

			PreparedStatement pidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_policy_information_details(pi_ref_plan_id, pi_sumassured, pi_annualizedpremium, pi_initialpremiumpaid, pi_modeofpayment) VALUES ('"+PI_planname+"','"+PI_sumassured+"','"+PI_annualizedpremium+"','"+PI_initialpremiumpaid+"','"+PI_modeofpayment+"')");
			
			PreparedStatement poldetails = (PreparedStatement) conn.prepareStatement("insert into t_policy_details (pol_ref_ai_id, pol_ref_li_id, pol_ref_p_id, pol_ref_pi_id) values ("+agent_id+",(SELECT MAX(lid_id) from r_life_insured_details ),(SELECT MAX(p_id) from r_policyowner_details ),(SELECT MAX(pi_id) from r_policy_information_details ))");

			PreparedStatement poldetails1 = (PreparedStatement) conn.prepareStatement("insert into t_policy_details (pol_ref_ai_id, pol_ref_li_id, pol_ref_p_id, pol_ref_pi_id) values ("+agent_id+",(SELECT MAX(lid_id) from r_life_insured_details ),"+p_preexist+",(SELECT MAX(pi_id) from r_policy_information_details ))");
			
			PreparedStatement afdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO t_application_form_details(af_applicationnumber, af_dateapplied, af_ref_pol_id, af_ref_sud_id) VALUES ('"+AF_applicationnumber+"','"+AF_dateapplied+"',(Select max(pol_id) from t_policy_details),"+Added_By+")");
			
			PreparedStatement fsdetails = (PreparedStatement) conn.prepareStatement("insert into r_form_status_details ( fs_completion, fs_dateformcompleted) values ('Completed','"+modifiedDate+"') ");
			
			PreparedStatement rsdetails = (PreparedStatement) conn.prepareStatement("insert into r_requirements_status_details ( rs_completion) values ('Pending') ");
			
			PreparedStatement msdetails = (PreparedStatement) conn.prepareStatement("insert into r_medical_status_details (ms_completion, ms_status, ms_remarks) values ('Pending','Pending','')");
			
			PreparedStatement asdetails = (PreparedStatement) conn.prepareStatement("insert into r_approval_status_details (as_completion, as_status) values ('Pending','Pending')");
			
			PreparedStatement psdetails = (PreparedStatement) conn.prepareStatement("insert into t_policy_status_details (ps_ref_fs_id, ps_ref_rs_id, ps_ref_ms_id, ps_ref_as_id, ps_ref_pol_id) values ((SELECT MAX(fs_id) from r_form_status_details),(SELECT MAX(rs_id) from r_requirements_status_details),(SELECT MAX(ms_id) from r_medical_status_details),(SELECT MAX(as_id) from r_approval_status_details),(SELECT MAX(pol_id) from t_policy_details))");
			
			PreparedStatement atdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_audit_trail_details(at_activity, at_ref_sud_id) VALUES ('"+foractivity+"',"+sud_id+")");
			
			
			
			if(p_preexist.equals("addnewpolicyowner") || p_preexist.equals(""))
			{
				lipdetails.executeUpdate();
				
				nmidetails.executeUpdate();
				
				lidetails.executeUpdate();
				
				pbdetails.executeUpdate();
				
				sbdetails.executeUpdate();
				
				pdetails.executeUpdate();
				
				pldetails.executeUpdate();
				
				pidetails.executeUpdate();
				
				if(pi_name==null || pi_name==""){}
				
				else
				{
					for(int i = 0; i < pi_name_list.length; i++)
					{
						
					PreparedStatement benefitdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_benefit_details(benefit_name, benefit_amount, benefit_ref_pi_id) VALUES ('"+pi_name_list[i]+"','"+pi_amount_list[i]+"',(SELECT MAX(pi_id) from r_policy_information_details ))");
					benefitdetails.executeUpdate();
						
					}
				}
				
				poldetails.executeUpdate();
				
				afdetails.executeUpdate();
				
				fsdetails.executeUpdate();

				rsdetails.executeUpdate();
				
				msdetails.executeUpdate();
				
				asdetails.executeUpdate();
				
				psdetails.executeUpdate();
				
				String query = "SELECT * FROM r_requirements_details";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{	
					String chk = rs.getString("req_name");
					PreparedStatement checklist = (PreparedStatement) conn.prepareStatement("insert into r_requirements_checklist_details (rc_req, rc_status, rc_ref_rs_id) values ('"+chk+"','',(SELECT MAX(rs_id) from r_requirements_status_details ))");
					checklist.executeUpdate();
				}
				
				atdetails.executeUpdate();
				
			}
			
			else {
				
				lipdetails.executeUpdate();
				
				nmidetails.executeUpdate();
				
				lidetails.executeUpdate();
				
				pbdetails.executeUpdate();
				
				sbdetails.executeUpdate();
				
				pidetails.executeUpdate();
				
				if(pi_name==null || pi_name==""){}
				
				else
				{
					for(int i = 0; i < pi_name_list.length; i++)
					{
						
					PreparedStatement benefitdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_benefit_details(benefit_name, benefit_amount, benefit_ref_pi_id) VALUES ('"+pi_name_list[i]+"','"+pi_amount_list[i]+"',(SELECT MAX(pi_id) from r_policy_information_details ))");
					benefitdetails.executeUpdate();
						
					}
				}
				
				poldetails1.executeUpdate();
				
				afdetails.executeUpdate();
				
				fsdetails.executeUpdate();

				rsdetails.executeUpdate();
				
				msdetails.executeUpdate();
				
				asdetails.executeUpdate();
				
				psdetails.executeUpdate();
				

				String query = "SELECT * FROM r_requirements_details";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{	
					String chk = rs.getString("req_name");
					PreparedStatement checklist = (PreparedStatement) conn.prepareStatement("insert into r_requirements_checklist_details (rc_req, rc_status, rc_ref_rs_id) values ('"+chk+"','',(SELECT MAX(rs_id) from r_requirements_status_details ))");
					checklist.executeUpdate();
				}
				
				atdetails.executeUpdate();
				
			}
			
		
		}
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
