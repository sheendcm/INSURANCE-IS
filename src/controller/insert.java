package controller;

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
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
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
		
		String AF_applicationnumber = request.getParameter("AF_applicationnumber");
		String AF_clientnumber = request.getParameter("AF_clientnumber");
		String AF_dateapplied = request.getParameter("AF_dateapplied");
		
		String AI_name = request.getParameter("AI_name");
		String AI_code = request.getParameter("AI_code");
		String AI_branch = request.getParameter("AI_branch");
		
		String LI_surname = request.getParameter("LI_surname");
		String LI_givenname = request.getParameter("LI_givenname");
		String LI_middlename = request.getParameter("LI_middlename");
		String LI_alias = request.getParameter("LI_alias");
		String LI_gender = request.getParameter("LI_gender");
		String LI_civilstatus = request.getParameter("LI_civilstatus");
		String LI_civilstatusother = request.getParameter("LI_civilstatusother");
		String LI_salutation = request.getParameter("LI_salutation");
		String LI_birthdate = request.getParameter("LI_birthdate");
		String LI_age = request.getParameter("LI_age");
		String LI_nationality = request.getParameter("LI_nationality");
		String LI_placeofbirth = request.getParameter("LI_placeofbirth");
		String LI_tinsssgsis = request.getParameter("LI_tinsssgsis");
		String LI_occupation = request.getParameter("LI_occupation");
		String LI_natureofwork = request.getParameter("LI_natureofwork");
		String LI_employer = request.getParameter("LI_employer");
		String LI_natureofemployer = request.getParameter("LI_natureofemployer");
		String LI_annualincome = request.getParameter("LI_annualincome");
		String LI_networth = request.getParameter("LI_networth");
		String LI_sourceoffunds = request.getParameter("LI_sourceoffunds");
		String LI_sourceoffundsother = request.getParameter("LI_sourceoffundsother");
		String LI_taxreturnfiling = request.getParameter("LI_taxreturnfiling");
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
		String LI_occupationchange = request.getParameter("LI_occupationchange");
		String LI_addresschange = request.getParameter("LI_addresschange");
		
		String P_surname = request.getParameter("P_surname");
		String P_givenname = request.getParameter("P_givenname");
		String P_middlename = request.getParameter("P_middlename");
		String P_alias = request.getParameter("P_alias");
		String P_gender = request.getParameter("P_gender");
		String P_civilstatus = request.getParameter("P_civilstatus");
		String P_civilstatusother = request.getParameter("P_civilstatusother");
		String P_salutation = request.getParameter("P_salutation");
		String P_birthdate = request.getParameter("P_birthdate");
		String P_age = request.getParameter("P_age");
		String P_nationality = request.getParameter("P_nationality");
		String P_placeofbirth = request.getParameter("P_placeofbirth");
		String P_tinsssgsis = request.getParameter("P_tinsssgsis");
		String P_occupation = request.getParameter("P_occupation");
		String P_natureofwork = request.getParameter("P_natureofwork");
		String P_employer = request.getParameter("P_employer");
		String P_natureofemployer = request.getParameter("P_natureofemployer");
		String P_annualincome = request.getParameter("P_annualincome");
		String P_networth = request.getParameter("P_networth");
		String P_sourceoffunds = request.getParameter("P_sourceoffunds");
		String P_sourceoffundsother = request.getParameter("P_sourceoffundsother");
		String P_taxreturnfiling = request.getParameter("P_taxreturnfiling");
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
		String P_occupationchange = request.getParameter("P_occupationchange");
		String P_addresschange = request.getParameter("P_addresschange");
		String P_preferredaddress = request.getParameter("P_preferredaddress");
		String P_reltolifeinsured = request.getParameter("P_reltolifeinsured");
		
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
		String PI_currency = request.getParameter("PI_currency");
		
		
		Conn databases = new Conn(); 
		Connection conn = databases.getConnection();
        
        
		try
		{		PreparedStatement afdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_application_form_details(af_applicationnumber, af_clientnumber, af_dateapplied) VALUES ('"+AF_applicationnumber+"','"+AF_clientnumber+"','"+AF_dateapplied+"')");
				afdetails.executeUpdate();
				PreparedStatement aidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_agent_information_details(ai_name, ai_code, ai_branch) VALUES ('"+AI_name+"','"+AI_code+"','"+AI_branch+"')",Statement.RETURN_GENERATED_KEYS);
				aidetails.executeUpdate();
				PreparedStatement lidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_life_insured_details(li_surname, li_givenname, li_middlename, li_alias, li_gender, li_civilstatus, li_civilstatusother, li_salutation, li_birthdate, li_age, li_nationality, li_placeofbirth, li_tinsssgsis, li_occupation, li_natureofwork, li_employer, li_natureofemployer, li_annualincome, li_networth, li_sourceoffunds, li_sourceoffundsother, li_taxreturnfiling, li_mobilenumber, li_telephonenumber, li_emailaddress, li_presentaddress, li_presentcountry, li_presentzipcode, li_permanentaddress, li_permanentcountry, li_permanentzipcode, li_businessaddress, li_businesscountry, li_businesszipcode, li_occupationchange, li_addresschange) VALUES ('"+LI_surname+"','"+LI_givenname+"','"+LI_middlename+"','"+LI_alias+"','"+LI_gender+"','"+LI_civilstatus+"','"+LI_civilstatusother+"','"+LI_salutation+"','"+LI_birthdate+"','"+LI_age+"','"+LI_nationality+"','"+LI_placeofbirth+"','"+LI_tinsssgsis+"','"+LI_occupation+"','"+LI_natureofwork+"','"+LI_employer+"','"+LI_natureofemployer+"','"+LI_annualincome+"','"+LI_networth+"','"+LI_sourceoffunds+"','"+LI_sourceoffundsother+"','"+LI_taxreturnfiling+"','"+LI_mobilenumber+"','"+LI_telephonenumber+"','"+LI_emailaddress+"','"+LI_presentaddress+"','"+LI_presentcountry+"','"+LI_presentzipcode+"','"+LI_permanentaddress+"','"+LI_permanentcountry+"','"+LI_permanentzipcode+"','"+LI_businessaddress+"','"+LI_businesscountry+"','"+LI_businesszipcode+"','"+LI_occupationchange+"','"+LI_addresschange+"')",Statement.RETURN_GENERATED_KEYS);
				lidetails.executeUpdate();
				PreparedStatement pdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_policyowner_details(p_surname, p_givenname, p_middlename, p_alias, p_gender, p_civilstatus, p_civilstatusother, p_salutation, p_birthdate, p_age, p_nationality, p_placeofbirth, p_tinsssgsis, p_occupation, p_natureofwork, p_employer, p_natureofemployer, p_annualincome, p_networth, p_sourceoffunds, p_sourceoffundsother, p_taxreturnfiling, p_mobilenumber, p_telephonenumber, p_emailaddress, p_presentaddress, p_presentcountry, p_presentzipcode, p_permanentaddress, p_permanentcountry, p_permanentzipcode, p_businessaddress, p_businesscountry, p_businesszipcode, p_occupationchange, p_addresschange,p_preferredaddress, p_reltolifeinsured) VALUES ('"+P_surname+"','"+P_givenname+"','"+P_middlename+"','"+P_alias+"','"+P_gender+"','"+P_civilstatus+"','"+P_civilstatusother+"','"+P_salutation+"','"+P_birthdate+"','"+P_age+"','"+P_nationality+"','"+P_placeofbirth+"','"+P_tinsssgsis+"','"+P_occupation+"','"+P_natureofwork+"','"+P_employer+"','"+P_natureofemployer+"','"+P_annualincome+"','"+P_networth+"','"+P_sourceoffunds+"','"+P_sourceoffundsother+"','"+P_taxreturnfiling+"','"+P_mobilenumber+"','"+P_telephonenumber+"','"+P_emailaddress+"','"+P_presentaddress+"','"+P_presentcountry+"','"+P_presentzipcode+"','"+P_permanentaddress+"','"+P_permanentcountry+"','"+P_permanentzipcode+"','"+P_businessaddress+"','"+P_businesscountry+"','"+P_businesszipcode+"','"+P_occupationchange+"','"+P_addresschange+"','"+P_preferredaddress+"','"+P_reltolifeinsured+"')",Statement.RETURN_GENERATED_KEYS);
				pdetails.executeUpdate();
				PreparedStatement bodetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_beneficial_owner_details(bo_name, bo_contactnumber) VALUES ('"+BO_name+"','"+BO_contactnumber+"')",Statement.RETURN_GENERATED_KEYS);
				bodetails.executeUpdate();
				PreparedStatement pbdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_primary_beneficiary_details(pb_name, pb_birthdate, pb_gender, pb_reltoinsured, pb_share, pb_typeofbeneficiary, pb_beneficiarydesignation, pb_placeofbirth, pb_nationality, pb_presentaddress, pb_country, pb_zipcode) VALUES ('"+PB_name+"','"+PB_birthdate+"','"+PB_gender+"','"+PB_reltoinsured+"','"+PB_share+"','"+PB_typeofbeneficiary+"','"+PB_beneficiarydesignation+"','"+PB_placeofbirth+"','"+PB_nationality+"','"+PB_presentaddress+"','"+PB_country+"','"+PB_zipcode+"')",Statement.RETURN_GENERATED_KEYS);
				pbdetails.executeUpdate();
				PreparedStatement sbdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_secondary_beneficiary_details(sb_name, sb_birthdate, sb_gender, sb_reltoinsured, sb_share, sb_typeofbeneficiary, sb_beneficiarydesignation, sb_placeofbirth, sb_nationality, sb_presentaddress, sb_country, sb_zipcode) VALUES ('"+SB_name+"','"+SB_birthdate+"','"+SB_gender+"','"+SB_reltoinsured+"','"+SB_share+"','"+SB_typeofbeneficiary+"','"+SB_beneficiarydesignation+"','"+SB_placeofbirth+"','"+SB_nationality+"','"+SB_presentaddress+"','"+SB_country+"','"+SB_zipcode+"')",Statement.RETURN_GENERATED_KEYS);
				sbdetails.executeUpdate();
				PreparedStatement pidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_policy_information_details(pi_planname, pi_sumassured, pi_currency, pi_annualizedpremium, pi_initialpremiumpaid, pi_modeofpayment, pi_methodofpayment, pi_nonforfeitureopt, pi_dividendopt, pi_agreement) VALUES ('"+PI_planname+"','"+PI_sumassured+"','"+PI_currency+"','','','','','','','')");
				pidetails.executeUpdate();
				PreparedStatement cdetails = (PreparedStatement) conn.prepareStatement("INSERT INTO r_client_details (c_ref_af_id, c_ref_ai_id, c_ref_li_id, c_ref_p_id, c_ref_bo_id, c_ref_pb_id, c_ref_sb_id, c_ref_pi_id) values ((SELECT MAX(af_id) from r_application_form_details ),(SELECT MAX(ai_id) from r_agent_information_details ),(SELECT MAX(li_id) from r_life_insured_details ),(SELECT MAX(p_id) from r_policyowner_details ),(SELECT MAX(bo_id) from r_beneficial_owner_details ),(SELECT MAX(pb_id) from r_primary_beneficiary_details ),(SELECT MAX(sb_id) from r_secondary_beneficiary_details ),(SELECT MAX(pi_id) from r_policy_information_details ))");
				cdetails.executeUpdate();
				PreparedStatement asdetails = (PreparedStatement) conn.prepareStatement("insert into r_application_status_details (as_ref_c_id, as_status) values ((SELECT MAX(as_id) from r_application_status_details), 'Pending')");
				asdetails.executeUpdate();
			
		} 
		catch (Exception e)
		{
			out.print(e);
		} 
	
	}

}
