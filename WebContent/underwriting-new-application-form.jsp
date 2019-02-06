<%@page import="java.sql.*"%>
<%@page import="db.Conn" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/lavienew.png" type="image/png">

  <title>La Vie Insurance</title>

  <link href="css/style.default.css" rel="stylesheet">
  
    <!-- Debug -->
    <script src="https://localhost:32123/livereload.js"></script>

    <!-- This is what you need -->
    <script src="./SweetAlert for Bootstrap_files/sweetalert.js.download"></script>
    <link rel="stylesheet" href="./SweetAlert for Bootstrap_files/sweetalert.css">
   
</head>

<body style="background-color:#1C2331;">
<% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();

%>
<%	int userid=0;
		if (session != null) {
			if (session.getAttribute("e_id") != null) {
				userid = (Integer) session.getAttribute("e_id");
			}
			else {
				response.sendRedirect("login.jsp");
			}
		}
%>

<section>
  
  <div class="leftpanel">
    <%
			try{ 
				String query5 = " SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id LEFT JOIN r_approval_status_details asd ON asd.as_id=psd.ps_ref_as_id where ms_completion='Completed' and as_completion='Pending' ";
				Statement stmt5 = conn.createStatement();
				ResultSet rs5 = stmt5.executeQuery(query5);
				while(rs5.next())
				{
				
	%>
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> UNDERWRITING DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="underwriting-progress-view.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
		<li class="active"><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li><a href="underwriting-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
        <li><a href="underwriting-policy-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Policy Evaluation</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Policy</span></a>
          <ul class="children">
            <li><a href="underwriting-issued-policy-view.jsp"><i class="fa fa-caret-right"></i> Issued Policy</a></li>
            <li><a href="underwriting-declined-policy-view.jsp"><i class="fa fa-caret-right"></i> Declined Policy</a></li>
          </ul>
        </li>
        <li><a href="underwriting-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
      </ul>

      
    </div><!-- leftpanelinner -->
    <%	}
            rs5.close();
            stmt5.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
    %>
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <%
			try{ 
				String query1 = " SELECT * FROM r_system_user_details sud INNER JOIN r_system_user_personal_details supd on supd.supd_id=sud.sud_ref_supd_id INNER JOIN r_system_user_login_details suld ON suld.suld_id=sud.sud_ref_suld_id where sud.sud_id="+userid+" ";
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				while(rs1.next())
				{
				
			%>
    
    <div class="headerbar">
       
      
      <div class="header-right">
      <form action="LogoutServlet" method="post">
      
        <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
                <%out.print(rs1.getString("supd_name")); %>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                <li><button type="submit" id="submitBtn" style="display:none;" data-validate="contact-form">Hidden Button</button></li>
                
                 <li><a href="javascript:;" class="myClass" onclick="$('#submitBtn').click();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>
          <li>
          </li>
        </ul>
       </form>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-plus"></i> Application Form <span>Add new application</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Underwriting Department</a></li>
          <li class="active">Application Form</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            <div class="panel-heading">
            <style>
		.mylabel1
		{
			font-size:90%;
			padding:0px;
		}
		.mytextbox1
		{
			padding:5px 8px;
			font-size:85%;
		}
		.mytextbox2
		{
			padding:5px 8px;
			font-size:90%;
		}
		.mybutton1
		{
			padding:6px 15px;
			font-size: 13px;
			background-color:#3F729B;
		}
		.mybutton1:hover
		{
			padding:6px 15px;
			font-size: 13px;
			background-color:#356083;
		}
		</style>
            <div class="row">
            <div class="col-md-8">
            <div class="form-group col-md-6"style="padding-left:0px;">
                  <label class="col-sm-5 control-label mylabel" align="right">Application Number</label>
                  <div class="col-sm-7" style="padding-left:20px; padding-right:0px;">
                    <input type="number" name="AF_applicationnumber" id="AF_applicationnumber" class="form-control mytextbox" required/>
                  </div>
                </div>
           <div class="form-group col-md-6" style="padding-left:0px;">
					  <label class="col-sm-4 control-label mylabel" align="right">Date Applied</label>
					  <div class="input-group"  style="padding-left:20px; padding-right:0px;">
					<input type="text" class="form-control mytextbox" placeholder="mm/dd/yyyy" id="AF_dateapplied">
					<span class="input-group-addon mytextbox"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
            </div>
            
            <div class="col-md-4" align="right">
            <input type="text" name="Added_By" id="Added_By" value="<%out.print(rs1.getInt("sud_id")); %>" style="display:none;" />
                  <button class="btn btn-primary mybutton1" id="btnSubmitAF" style="margin-right:10px;"> Save</button>
                </div>
            </div>
</div>
            <div class="panel-body panel-body-nopadding">
              
              <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard">
                
                <ul class="nav nav-pills nav-justified">
                  <li><a href="#basicinfo" data-toggle="tab"> Basic Information</a></li>
                  <li><a href="#beneficiary" data-toggle="tab"> Beneficiary</a></li>
				  <li><a href="#policyinfo" data-toggle="tab"> Policy Information</a></li>
				  <li><a href="#nonmedicalinfo" data-toggle="tab"> Non-Medical Information</a></li>
                </ul>
                
                <div class="tab-content">
                  <div class="tab-pane" id="basicinfo">
				  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Agent Information</h4>
        </div>
        <div class="panel-body">
          <div class="row">
          
          <div class="form-group myfg">
                  <label class="col-sm-3 control-label mylabel" align="right">Agent Name</label>
                  <div class="col-sm-5">
                     <select class="select2 mytextbox" style="font-size:85%;padding-left:7px;padding-top:7px;"  id="agent_id" name="agent_id" >
                  <option value="" selected>Choose agent here ...</option>
				  <%
			try{ 
				String query4 = "select * from r_system_user_details sud inner join r_system_user_personal_details supd on sud.sud_ref_supd_id=supd.supd_id inner join r_system_user_login_details suld on sud.sud_ref_suld_id=suld.suld_id WHERE sud.sud_usertype ='Agent'";
				Statement stmt4 = conn.createStatement();
				ResultSet rs4 = stmt4.executeQuery(query4);
				while(rs4.next())
				{
			%>
                  <option value="<%out.print(rs4.getInt("sud_id")); %>"><%out.print(rs4.getString("supd_name")); %></option>
                  <%
                  }
            rs4.close();
            stmt4.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
                </select>
                  </div>
                </div>
            
          </div>
        </div><!-- panel-body -->
        </div>
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Details of Policyowner</h4>
        </div>
		<style>
		.mylabel
		{
			font-size:85%;
		}
		.mytextbox
		{
			padding:7px 10px;
			font-size:85%;
		}
		.myfg
		{
			margin-bottom:7px;
		}
		.myselect
		{
			
		}
		</style>
		<script>
		function newpolicyowner(elem){
		document.getElementById('tryme').value= elem.value;
		if(elem.value == "addnewpolicyowner"){
		document.getElementById('p1').style.display = "block";
		
		document.getElementById('P_surname').value= "";
			  document.getElementById('P_givenname').value= "";
			  document.getElementById('P_middlename').value= "";
			  document.getElementById('P_alias').value= "";
			  document.getElementById('Pmale').checked= false;
			  document.getElementById('Pfemale').checked= false;
			  
			  document.getElementById('P_civilstatus').value= "";
			  document.getElementById('P_salutation').value= "";
			  document.getElementById('P_birthdate').value= "";
			  document.getElementById('P_nationality').value= "";
			  document.getElementById('P_placeofbirth').value= "";
			  document.getElementById('P_occupation').value= "";
			  document.getElementById('P_natureofwork').value= "";
			  document.getElementById('P_employer').value= "";
			  document.getElementById('P_natureofemployer').value= "";
			  document.getElementById('P_annualincome').value= "";
			  document.getElementById('P_networth').value= "";
			  document.getElementById('P_sourceoffunds').value= "";
			  document.getElementById('P_mobilenumber').value= "";
			  document.getElementById('P_telephonenumber').value= "";
			  document.getElementById('P_emailaddress').value= "";
			  document.getElementById('P_presentaddress').value= "";
			  document.getElementById('P_presentcountry').value= "";
			  document.getElementById('P_presentzipcode').value= "";
			  document.getElementById('P_permanentaddress').value= "";
			  document.getElementById('P_permanentcountry').value= "";
			  document.getElementById('P_permanentzipcode').value= "";
			  document.getElementById('P_businessaddress').value= "";
			  document.getElementById('P_businesscountry').value= "";
			  document.getElementById('P_businesszipcode').value= "";
		}
		else{
		document.getElementById('p1').style.display = "none";
		
		}
		}
		
		function p_csother(elem){
		if(elem.value == "Other"){
		document.getElementById('P_civilstatus_other').value = "";
		document.getElementById('pcsother').style.display = "block";
		}
		else{
		document.getElementById('pcsother').style.display = "none";
		}
		}
		
		function p_sfother(elem){
		if(elem.value == "Other"){
		document.getElementById('P_sourceoffunds_other').value = "";
		document.getElementById('psfother').style.display = "block";
		}
		else{
		document.getElementById('psfother').style.display = "none";
		}
		}
		
		function copyvalueaddress1() {
		if(document.getElementById('p_ba_sameas_present').checked)
			 {
			  var p_present_a = document.getElementById('P_presentaddress').value;
			  var p_present_c = document.getElementById('P_presentcountry').value;
			  var p_present_z = document.getElementById('P_presentzipcode').value;
			  
			  document.getElementById('P_businessaddress').value= p_present_a;
			  document.getElementById('P_businesscountry').value= p_present_c;
			  document.getElementById('P_businesszipcode').value= p_present_z;
			}
		else{
			document.getElementById('P_businessaddress').value= "";
			  document.getElementById('P_businesscountry').value="";
			  document.getElementById('P_businesszipcode').value= "";
		}
  
		}
		
		function copyvalueaddress() {
		if(document.getElementById('p_pa_sameas_present').checked)
			 {
			  var p_present_a = document.getElementById('P_presentaddress').value;
			  var p_present_c = document.getElementById('P_presentcountry').value;
			  var p_present_z = document.getElementById('P_presentzipcode').value;
			  
			  document.getElementById('P_permanentaddress').value= p_present_a;
			  document.getElementById('P_permanentcountry').value= p_present_c;
			  document.getElementById('P_permanentzipcode').value= p_present_z;
			}
			else{
			document.getElementById('P_permanentaddress').value="";
			  document.getElementById('P_permanentcountry').value= "";
			  document.getElementById('P_permanentzipcode').value= "";
			}
  
		}
		</script>
		<div class="panel-body">
		
        <div class="row">
		<div class="form-group myfg">
              <label class="col-sm-3 control-label mylabel" align="right">Policyowner</label>
              <div class="col-sm-5">
              <input type="text" name="tryme" id="tryme" class="form-control mytextbox" style="display:none;"/>
                <select class="select2 mytextbox" style="font-size:85%;padding-left:7px;padding-top:7px;" data-placeholder="Choose pre-existing policyowner" id="p_preexist" name="p_preexist" onchange="newpolicyowner(this)">
                  <option value="" selected>Choose pre-existing policyowner</option>
				  <option value="addnewpolicyowner">Policyowner doesn't exist. Add new.</option>
				  <option value="addnewpolicyowner">Policyowner and life insured is same.</option>
				  <%
			try{ 
				String query = "SELECT p_id, CONCAT (p_givenname,' ',p_middlename,' ',p_surname) as Name FROM r_policyowner_details";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
                  <option value="<%out.print(rs.getInt("p_id")); %>"><%out.print(rs.getString("Name")); %></option>
                  <%
                  }
            rs.close();
            stmt.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
                </select>
              </div>
            </div>
		</div></div>
        <div class="panel-body" id="p1" style="display:none;">
          <div class="row">
            <div class="col-md-4">
            <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Client Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_clientnumber" id="P_clientnumber" class="form-control mytextbox" />
                  </div>
                </div><br>
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Surname</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_surname" id="P_surname" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Given Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_givenname" id="P_givenname" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Middle Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_middlename" id="P_middlename" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
                  <div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Gender</label>
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="Pmale" value="Male" name="P_gender">
                            <label for="Pmale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="Pfemale" name="P_gender">
                            <label for="Pfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Civil Status</label>
                        <div class="col-sm-8">
                          <select class="select1" id="P_civilstatus" name="P_civilstatus" onchange="p_csother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Other">Others</option>
                          </select>
                        </div>
                      </div>
					<div class="form-group myfg" id="pcsother" style="display:none;">
						  <label class="col-sm-4 control-label mylabel" align="right"></label>
						  <div class="col-sm-8">
							<input type="text" name="P_civilstatus_other" id="P_civilstatus_other" class="form-control mytextbox" />
						  </div>
						</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Salutation</label>
					  <div class="col-sm-8">
						<input type="text" name="P_salutation" id="P_salutation" class="form-control mytextbox" />
					  </div>
					</div>
						</div>
			<div class="col-md-4">
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="P_birthdate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
					  <div class="col-sm-8">
						<select class="select2" id="P_nationality" name="P_nationality">
                            <option value="" selected>Choose...</option>
                            <option value="Afghan">Afghan</option>
                            <option value="Albanian">Albanian</option>
                            <option value="Algerian">Algerian</option>
                            <option value="American">American</option>
                            <option value="Australian">Australian</option>
                            <option value="Belgian">Belgian</option>
                            <option value="Brazilian">Brazilian</option>
                            <option value="Bulgarian">Bulgarian</option>
                            <option value="Cambodian">Cambodian</option>
                            <option value="Canadian">Canadian</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Dane">Dane</option>
                            <option value="Dominican">Dominican</option>
                            <option value="Egyptian">Egyptian</option>
                            <option value="Ethiopian">Ethiopian</option>
                            <option value="French">French</option>
                            <option value="German">German</option>
                            <option value="Greek">Greek</option>
                            <option value="Filipino">Filipino</option>
                            <option value="Hungarian">Hungarian</option>
                            <option value="Indian">Indian</option>
                            <option value="Indonesian">Indonesian</option>
                            <option value="Italian">Italian</option>
                            <option value="Jamaican">Jamaican</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Korean">Korean</option>
                            <option value="Malaysian">Malaysian</option>
                            <option value="Mongolian">Mongolian</option>
                            <option value="Nigerian">Nigerian</option>
                            <option value="Romanian">Romanian</option>
                            <option value="Russian">Russian</option>
                            <option value="Serbian">Serbian</option>
                            <option value="Singaporean">Singaporean</option>
                            <option value="South African">South African</option>
                            <option value="Taiwanese ">Taiwanese </option>
                            <option value="Vietnamese ">Vietnamese </option>
                            
                          </select>
					  </div>
					</div>
			<div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
              <div class="col-sm-8">
                <textarea name="P_placeofbirth" id="P_placeofbirth" class="form-control" rows="4"></textarea>
              </div>
            </div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Occupation</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_occupation" id="P_occupation" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Work</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_natureofwork" id="P_natureofwork" class="form-control mytextbox" />
                  </div>
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Employer</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_employer" id="P_employer" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Employer</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_natureofemployer" id="P_natureofemployer" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Gross Annual Income</label>
					  <div class="col-sm-8">
						<input type="number" name="P_annualincome" id="P_annualincome" class="form-control mytextbox" />
					  </div>
					</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Net Worth</label>
					  <div class="col-sm-8">
						<input type="number" name="P_networth" id="P_networth" class="form-control mytextbox" />
					  </div>
					</div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Sources of funds</label>
                        <div class="col-sm-8">
                          <select class="select1" name="P_sourceoffunds" id="P_sourceoffunds" onchange="p_sfother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Salary<">Salary</option>
                            <option value="Business">Business</option>
                            <option value="Other">Others</option>
                          </select>
                        </div>
                      </div>
					<div class="form-group myfg" id="psfother" style="display:none;">
						  <label class="col-sm-4 control-label mylabel" align="right"></label>
						  <div class="col-sm-8">
							<input type="text" name="P_sourceoffunds_other" id="P_sourceoffunds_other" class="form-control mytextbox" />
						  </div>
						</div>
						</div>
			<div class="col-md-4">
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Mobile Number</label>
					  <div class="col-sm-8">
						<input type="text" name="P_mobilenumber" id="P_mobilenumber" class="form-control mytextbox" />
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Telephone Number</label>
					  <div class="col-sm-8">
						<input type="text" name="P_telephonenumber" id="P_telephonenumber" class="form-control mytextbox" />
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Email Address</label>
					  <div class="col-sm-8">
						<input type="text" name="P_emailaddress" id="P_emailaddress" class="form-control mytextbox" />
					  </div>
					</div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4"><br><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Present Address</label>
					  <div class="col-sm-8">
						<textarea name="P_presentaddress" id="P_presentaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_presentcountry" id="P_presentcountry" class="form-control mytextbox" />
                  </div>
                </div> 
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_presentzipcode" id="P_presentzipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<div class="ckbox ckbox-default">
                        <input type="checkbox" value="1" id="p_pa_sameas_present" onchange="copyvalueaddress()"/>
                        <label class="control-label mylabel" for="p_pa_sameas_present" style="font-size:90%;">Same as Present Address</label>
                      </div></div>
			</div><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Permanent Address</label>
					  <div class="col-sm-8">
						<textarea name="P_permanentaddress" id="P_permanentaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_permanentcountry" id="P_permanentcountry" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_permanentzipcode" id="P_permanentzipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
				<div class="col-md-4">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
					<div class="ckbox ckbox-default">
								<input type="checkbox" value="1" id="p_ba_sameas_present" onchange="copyvalueaddress1()"/>
								<label class="control-label mylabel" for="p_ba_sameas_present" style="font-size:90%;">Same as Present Address</label>
							  </div></div>
					</div><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Business Address</label>
					  <div class="col-sm-8">
						<textarea name="P_businessaddress" id="P_businessaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_businesscountry" id="P_businesscountry" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_businesszipcode" id="P_businesszipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel --> 
        
        
         <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Details of Life Insured</h4>
        </div>
		<style>
		.mylabel
		{
			font-size:90%;
		}
		.mytextbox
		{
			padding:7px 10px;
		}
		</style>
		<script>
		
		function li_csother(elem){
		if(elem.value == "Other"){
		document.getElementById('LI_civilstatus_other').value = "";
		document.getElementById('licsother').style.display = "block";
		}
		else{
		document.getElementById('licsother').style.display = "none";
		}
		}
		
		function li_sfother(elem){
		if(elem.value == "Other"){
		document.getElementById('LI_sourceoffunds_other').value = "";
		document.getElementById('lisfother').style.display = "block";
		}
		else{
		document.getElementById('lisfother').style.display = "none";
		}
		}
		
		function copyvalueaddress3() {
		if(document.getElementById('li_ba_sameas_present').checked)
			 {
			  var li_present_a = document.getElementById('LI_presentaddress').value;
			  var li_present_c = document.getElementById('LI_presentcountry').value;
			  var li_present_z = document.getElementById('LI_presentzipcode').value;
			  
			  document.getElementById('LI_businessaddress').value= li_present_a;
			  document.getElementById('LI_businesscountry').value= li_present_c;
			  document.getElementById('LI_businesszipcode').value= li_present_z;
			}
		else{
			document.getElementById('LI_businessaddress').value= "";
			  document.getElementById('LI_businesscountry').value="";
			  document.getElementById('LI_businesszipcode').value= "";
		}
  
		}
		
		function copyvalueaddress2() {
		if(document.getElementById('li_pa_sameas_present').checked)
			 {
			  var li_present_a = document.getElementById('LI_presentaddress').value;
			  var li_present_c = document.getElementById('LI_presentcountry').value;
			  var li_present_z = document.getElementById('LI_presentzipcode').value;
			  
			  document.getElementById('LI_permanentaddress').value= li_present_a;
			  document.getElementById('LI_permanentcountry').value= li_present_c;
			  document.getElementById('LI_permanentzipcode').value= li_present_z;
			}
			else{
			document.getElementById('LI_permanentaddress').value="";
			  document.getElementById('LI_permanentcountry').value= "";
			  document.getElementById('LI_permanentzipcode').value= "";
			}
  
		}
		</script>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-4">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Surname</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_surname" id="LI_surname" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Given Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_givenname" id="LI_givenname" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Middle Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_middlename" id="LI_middlename" class="form-control mytextbox" />
                  </div>
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Other Name / Alias</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_alias" id="LI_alias" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
			<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Relationship to Policyowner</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_reltopolicyowner" id="LI_reltopolicyowner" class="form-control mytextbox" />
                  </div>
                </div>
                  <div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Gender</label>
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="LImale" value="Male" name="LI_gender">
                            <label for="LImale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="LIfemale" name="LI_gender">
                            <label for="LIfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Civil Status</label>
                        <div class="col-sm-8">
                          <select class="select1" id="LI_civilstatus" name="LI_civilstatus" onchange="li_csother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Other">Others</option>
                          </select>
                        </div>
                      </div>
					<div class="form-group myfg" id="licsother" style="display:none;">
						  <label class="col-sm-4 control-label mylabel" align="right"></label>
						  <div class="col-sm-8">
							<input type="text" id="LI_civilstatus_other" name="LI_civilstatus_other" class="form-control mytextbox" />
						  </div>
						</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Salutation</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_salutation" id="LI_salutation" class="form-control mytextbox" />
					  </div>
					</div>
						</div>
			<div class="col-md-4">
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="LI_birthdate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
					  <div class="col-sm-8">
						<select class="select2" id="LI_nationality" name="LI_nationality">
                            <option value="" selected>Choose...</option>
                            <option value="Afghan">Afghan</option>
                            <option value="Albanian">Albanian</option>
                            <option value="Algerian">Algerian</option>
                            <option value="American">American</option>
                            <option value="Australian">Australian</option>
                            <option value="Belgian">Belgian</option>
                            <option value="Brazilian">Brazilian</option>
                            <option value="Bulgarian">Bulgarian</option>
                            <option value="Cambodian">Cambodian</option>
                            <option value="Canadian">Canadian</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Dane">Dane</option>
                            <option value="Dominican">Dominican</option>
                            <option value="Egyptian">Egyptian</option>
                            <option value="Ethiopian">Ethiopian</option>
                            <option value="French">French</option>
                            <option value="German">German</option>
                            <option value="Greek">Greek</option>
                            <option value="Filipino">Filipino</option>
                            <option value="Hungarian">Hungarian</option>
                            <option value="Indian">Indian</option>
                            <option value="Indonesian">Indonesian</option>
                            <option value="Italian">Italian</option>
                            <option value="Jamaican">Jamaican</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Korean">Korean</option>
                            <option value="Malaysian">Malaysian</option>
                            <option value="Mongolian">Mongolian</option>
                            <option value="Nigerian">Nigerian</option>
                            <option value="Romanian">Romanian</option>
                            <option value="Russian">Russian</option>
                            <option value="Serbian">Serbian</option>
                            <option value="Singaporean">Singaporean</option>
                            <option value="South African">South African</option>
                            <option value="Taiwanese ">Taiwanese </option>
                            <option value="Vietnamese ">Vietnamese </option>
                            
                          </select>
					  </div>
					</div>
			<div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
              <div class="col-sm-8">
                <textarea name="LI_placeofbirth" id="LI_placeofbirth" class="form-control" rows="4"></textarea>
              </div>
            </div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Occupation</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_occupation" id="LI_occupation" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Work</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_natureofwork" id="LI_natureofwork" class="form-control mytextbox" />
                  </div>
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Employer</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_employer" id="LI_employer" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Employer</label>
                  <div class="col-sm-8">
                    <input type="text"name="LI_natureofemployer" id="LI_natureofemployer" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Gross Annual Income</label>
					  <div class="col-sm-8">
						<input type="number" name="LI_annualincome" id="LI_annualincome" class="form-control mytextbox" />
					  </div>
					</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Net Worth</label>
					  <div class="col-sm-8">
						<input type="number" name="LI_networth" id="LI_networth" class="form-control mytextbox" />
					  </div>
					</div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Sources of funds</label>
                        <div class="col-sm-8">
                          <select class="select1" name="LI_sourceoffunds" id="LI_sourceoffunds" onchange="li_sfother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Salary">Salary</option>
                            <option value="Business">Business</option>
                            <option value="Other">Others</option>
                          </select>
                        </div>
                      </div>
					<div class="form-group myfg" id="lisfother" style="display:none;">
						  <label class="col-sm-4 control-label mylabel" align="right"></label>
						  <div class="col-sm-8">
							<input type="text" name="LI_sourceoffunds_other" id="LI_sourceoffunds_other" class="form-control mytextbox" />
						  </div>
						</div>
						</div>
			<div class="col-md-4">
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Mobile Number</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_mobilenumber" id="LI_mobilenumber" class="form-control mytextbox" />
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Telephone Number</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_telephonenumber" id="LI_telephonenumber" class="form-control mytextbox" />
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Email Address</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_emailaddress" id="LI_emailaddress" class="form-control mytextbox" />
					  </div>
					</div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4"><br><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Present Address</label>
					  <div class="col-sm-8">
						<textarea name="LI_presentaddress" id="LI_presentaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_presentcountry" id="LI_presentcountry" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_presentzipcode" id="LI_presentzipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
			<div class="col-md-4">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<div class="ckbox ckbox-default">
                        <input type="checkbox" value="1" id="li_pa_sameas_present" onchange="copyvalueaddress2()"/>
                        <label class="control-label mylabel" for="li_pa_sameas_present" style="font-size:90%;">Same as Present Address</label>
                      </div></div>
			</div><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Permanent Address</label>
					  <div class="col-sm-8">
						<textarea name="LI_permanentaddress" id="LI_permanentaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_permanentcountry" id="LI_permanentcountry" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_permanentzipcode" id="LI_permanentzipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
				<div class="col-md-4">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
					<div class="ckbox ckbox-default">
								<input type="checkbox" value="1" id="li_ba_sameas_present" onchange="copyvalueaddress3()"/>
								<label class="control-label mylabel" for="li_ba_sameas_present" style="font-size:90%;">Same as Present Address</label>
							  </div></div>
					</div><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Business Address</label>
					  <div class="col-sm-8">
						<textarea name="LI_businessaddress" id="LI_businessaddress" class="form-control" rows="3"></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_businesscountry" id="LI_businesscountry" class="form-control mytextbox" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_businesszipcode" id="LI_businesszipcode" class="form-control mytextbox" />
                  </div>
                </div>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->  
                 
 	  
                  </div>
                  <div class="tab-pane" id="beneficiary">
                   
	
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;" id="template">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Primary Beneficiary</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4 myfg">
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_name" id="PB_name" class="form-control mytextbox" />
                  </div>
					</div>
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="PB_birthdate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Gender</label>
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="PBmale" value="Male" name="PB_gender">
                            <label for="PBmale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="PBfemale" name="PB_gender">
                            <label for="PBfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
					  <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
						  <div class="col-sm-8">
							<textarea name="PB_placeofbirth" id="PB_placeofbirth" class="form-control" rows="4"></textarea>
						  </div>
						</div>
                </div>
			<div class="form-group col-md-4 myfg">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
                  <div class="col-sm-8">
                    <select class="select2" id="PB_nationality" name="PB_nationality">
                            <option value="" selected>Choose...</option>
                            <option value="Afghan">Afghan</option>
                            <option value="Albanian">Albanian</option>
                            <option value="Algerian">Algerian</option>
                            <option value="American">American</option>
                            <option value="Australian">Australian</option>
                            <option value="Belgian">Belgian</option>
                            <option value="Brazilian">Brazilian</option>
                            <option value="Bulgarian">Bulgarian</option>
                            <option value="Cambodian">Cambodian</option>
                            <option value="Canadian">Canadian</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Dane">Dane</option>
                            <option value="Dominican">Dominican</option>
                            <option value="Egyptian">Egyptian</option>
                            <option value="Ethiopian">Ethiopian</option>
                            <option value="French">French</option>
                            <option value="German">German</option>
                            <option value="Greek">Greek</option>
                            <option value="Filipino">Filipino</option>
                            <option value="Hungarian">Hungarian</option>
                            <option value="Indian">Indian</option>
                            <option value="Indonesian">Indonesian</option>
                            <option value="Italian">Italian</option>
                            <option value="Jamaican">Jamaican</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Korean">Korean</option>
                            <option value="Malaysian">Malaysian</option>
                            <option value="Mongolian">Mongolian</option>
                            <option value="Nigerian">Nigerian</option>
                            <option value="Romanian">Romanian</option>
                            <option value="Russian">Russian</option>
                            <option value="Serbian">Serbian</option>
                            <option value="Singaporean">Singaporean</option>
                            <option value="South African">South African</option>
                            <option value="Taiwanese ">Taiwanese </option>
                            <option value="Vietnamese ">Vietnamese </option>
                            
                          </select>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Relationship to Insured</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_reltoinsured" id="PB_reltoinsured" class="form-control mytextbox" />
                  </div>
                </div>
				<!-- <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">% Share</label>
                  <div class="col-sm-8">
                    <input type="number" name="PB_share" id="PB_share" class="form-control mytextbox" value="100" disabled/>
                  </div>
                </div>
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Type of Beneficiary</label>
                        <div class="col-sm-8">
                          <select class="select1" name="PB_typeofbeneficiary" id="PB_typeofbeneficiary" disabled>
                            <option value="" selected>Choose...</option>
                            <option value="Primary" selected>Primary</option>
                            <option value="Secodary">Secodary</option>
                          </select>
                        </div>
                      </div> -->
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel"align="right">Beneficiary Designation</label>
                        <div class="col-sm-8">
                          <select class="select1" name="PB_beneficiarydesignation" id="PB_beneficiarydesignation">
                            <option value="" selected>Choose...</option>
                            <option value="Revocable">Revocable</option>
                            <option value="Irrevocable">Irrevocable</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Address</label>
						  <div class="col-sm-8">
							<textarea name="PB_presentaddress" id="PB_presentaddress" class="form-control" rows="4"></textarea>
						  </div>
						</div>
                </div>
				
			<div class="form-group col-md-4 myfg">
                  
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
						  <div class="col-sm-8">
							<input type="text" name="PB_country" id="PB_country" class="form-control mytextbox" />
						  </div>
						</div>
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
						  <div class="col-sm-8">
							<input type="text" name="PB_zipcode" id="PB_zipcode" class="form-control mytextbox" />
						  </div>
						</div>
						
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
      
      <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;" id="template">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Secondary Beneficiary</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4 myfg">
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="SB_name" id="SB_name" class="form-control mytextbox" />
                  </div>
					</div>
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="SB_birthdate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
					<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Gender</label>
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="SBmale" value="Male" name="SB_gender">
                            <label for="SBmale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="SBfemale" name="SB_gender">
                            <label for="SBfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
					  <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
						  <div class="col-sm-8">
							<textarea name="SB_placeofbirth" id="SB_placeofbirth" class="form-control" rows="4"></textarea>
						  </div>
						</div>
                </div>
			<div class="form-group col-md-4 myfg">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
                  <div class="col-sm-8">
                    <select class="select2" id="SB_nationality" name="SB_nationality">
                            <option value="" selected>Choose...</option>
                            <option value="Afghan">Afghan</option>
                            <option value="Albanian">Albanian</option>
                            <option value="Algerian">Algerian</option>
                            <option value="American">American</option>
                            <option value="Australian">Australian</option>
                            <option value="Belgian">Belgian</option>
                            <option value="Brazilian">Brazilian</option>
                            <option value="Bulgarian">Bulgarian</option>
                            <option value="Cambodian">Cambodian</option>
                            <option value="Canadian">Canadian</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Dane">Dane</option>
                            <option value="Dominican">Dominican</option>
                            <option value="Egyptian">Egyptian</option>
                            <option value="Ethiopian">Ethiopian</option>
                            <option value="French">French</option>
                            <option value="German">German</option>
                            <option value="Greek">Greek</option>
                            <option value="Filipino">Filipino</option>
                            <option value="Hungarian">Hungarian</option>
                            <option value="Indian">Indian</option>
                            <option value="Indonesian">Indonesian</option>
                            <option value="Italian">Italian</option>
                            <option value="Jamaican">Jamaican</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Korean">Korean</option>
                            <option value="Malaysian">Malaysian</option>
                            <option value="Mongolian">Mongolian</option>
                            <option value="Nigerian">Nigerian</option>
                            <option value="Romanian">Romanian</option>
                            <option value="Russian">Russian</option>
                            <option value="Serbian">Serbian</option>
                            <option value="Singaporean">Singaporean</option>
                            <option value="South African">South African</option>
                            <option value="Taiwanese ">Taiwanese </option>
                            <option value="Vietnamese ">Vietnamese </option>
                            
                          </select>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Relationship to Insured</label>
                  <div class="col-sm-8">
                    <input type="text" name="SB_reltoinsured" id="SB_reltoinsured" class="form-control mytextbox" />
                  </div>
                </div>
				<!-- <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">% Share</label>
                  <div class="col-sm-8">
                    <input type="number" name="SB_share" id="SB_share" class="form-control mytextbox" value="100" disabled/>
                  </div>
                </div>
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Type of Beneficiary</label>
                        <div class="col-sm-8">
                          <select class="select1" name="SB_typeofbeneficiary" id="SB_typeofbeneficiary" disabled>
                            <option value="" selected>Choose...</option>
                            <option value="Primary" >Primary</option>
                            <option value="Secodary" selected>Secodary</option>
                          </select>
                        </div>
                      </div> -->
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel"align="right">Beneficiary Designation</label>
                        <div class="col-sm-8">
                          <select class="select1" name="SB_beneficiarydesignation" id="SB_beneficiarydesignation">
                            <option value="" selected>Choose...</option>
                            <option value="Revocable">Revocable</option>
                            <option value="Irrevocable">Irrevocable</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Address</label>
						  <div class="col-sm-8">
							<textarea name="SB_presentaddress" id="SB_presentaddress" class="form-control" rows="4"></textarea>
						  </div>
						</div>
                </div>
				
			<div class="form-group col-md-4 myfg">
                  
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
						  <div class="col-sm-8">
							<input type="text" name="SB_country" id="SB_country" class="form-control mytextbox" />
						  </div>
						</div>
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
						  <div class="col-sm-8">
							<input type="text" name="SB_zipcode" id="SB_zipcode" class="form-control mytextbox" />
						  </div>
						</div>
						
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
      
                  </div>
                  <div class="tab-pane" id="policyinfo">
                    <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Policy Information</h4>
        </div>
        <div class="panel-body">
          <div class="row">
           <div class="form-group col-md-5">
                        <label class="col-sm-4 mylabel" align="right">Plan Name</label>
                        <div class="col-sm-8">
                          <select class="select1"  name="PI_planname" id="PI_planname">
                            <option value="" selected>Choose...</option>
                             <%
			try{ 
				String query3 = "SELECT plan_id, plan_name FROM r_plan_details";
				Statement stmt3 = conn.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				while(rs3.next())
				{
			%>
                  <option value="<%out.print(rs3.getInt("plan_id")); %>"><%out.print(rs3.getString("plan_name")); %></option>
                  <%
                  }
            rs3.close();
            stmt3.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
                          </select>
                        </div>
                      </div>
			<div class="form-group col-md-4">
                  <label class="col-sm-4 control-label mylabel" align="right">Sum Assured</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="number" class="form-control mytextbox" name="PI_sumassured" id="PI_sumassured"/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Premium Information</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4">
                  <div class="form-group">
                   <label class="col-sm-4 control-label mylabel" align="right">Annualized Premium</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="number" class="form-control mytextbox" name="PI_annualizedpremium" id="PI_annualizedpremium"/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                </div>
                </div>
                <div class="form-group col-md-4">
                  <div class="form-group">
                   <label class="col-sm-4 control-label mylabel" align="right">Initial Premium Paid</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="number" class="form-control mytextbox" name="PI_initialpremiumpaid" id="PI_initialpremiumpaid"/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                </div>
                </div>
			<div class="form-group col-md-4">
                        <label class="col-sm-4 mylabel" align="right">Mode of Payment</label>
                        <div class="col-sm-8">
                          <select class="select1" name="PI_modeofpayment" id="PI_modeofpayment">
                            <option value="" selected>Choose...</option>
                            <option value="Annual">Annual</option>
                            <option value="Semi-annual">Semi-annual</option>
							<option value="Quarterly">Quarterly</option>
							<option value="Monthly">Monthly</option>
                          </select>
                        </div>
                      </div>
                      <style>
                      .myspan1{
                      font-size:85%;
                      }
                      </style>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Benefits and Amount</h4>
        </div>
        <div class="panel-body">
		<style>
		.myfm
		{
			margin-bottom:20px;
		}
		</style>
          <div class="row">
            <div class="form-group col-md-4">
                  
					<div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Accelerated Total and Permanent Disability" id="PI_benefit1" name="PI_Name" onclick="PiBenefit1(this.checked, 'textBox')" />
                            <label for="PI_benefit1" style="font-size:85%; display:inline;">Accelerated Total and Permanent Disability</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_benefit_amount1"  name="PI_Amount" disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Accidental Death and Disablement Benefit" id="PI_benefit2" name="PI_Name" onclick="PiBenefit2(this.checked, 'textBox')" />
                            <label for="PI_benefit2" style="font-size:85%; display:inline;">Accidental Death and Disablement Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount2" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Acclerated Life Care Benefit" id="PI_benefit3" name="PI_Name" onclick="PiBenefit3(this.checked, 'textBox')" />
                            <label for="PI_benefit3" style="font-size:85%; display:inline;">Acclerated Life Care Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount3" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Additional Term Rider" id="PI_benefit4" name="PI_Name" onclick="PiBenefit4(this.checked, 'textBox')" />
                            <label for="PI_benefit4" style="font-size:85%; display:inline;">Additional Term Rider</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount4" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Crisis Cover Benefit" id="PI_benefit5" name="PI_Name" onclick="PiBenefit5(this.checked, 'textBox')" />
                            <label for="PI_benefit5" style="font-size:85%; display:inline;">Crisis Cover Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount5" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm" >
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Crisis Cover Plus Benefit for Term" id="PI_benefit6" name="PI_Name" onclick="PiBenefit6(this.checked, 'textBox')" />
                            <label for="PI_benefit6" style="font-size:85%; display:inline;">Crisis Cover Plus Benefit for Term</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount6" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
                  
					<div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Crisis Cover Waiver" id="PI_benefit7" name="PI_Name" onclick="PiBenefit7(this.checked, 'textBox')" />
                            <label for="PI_benefit7" style="font-size:85%; display:inline;">Crisis Cover Waiver</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount7" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Life Care Advcance Plus" id="PI_benefit8" name="PI_Name" onclick="PiBenefit8(this.checked, 'textBox')" />
                            <label for="PI_benefit8" style="font-size:85%; display:inline;">Life Care Advcance Plus</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount8" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Life Care Plus" id="PI_benefit9" name="PI_Name" onclick="PiBenefit9(this.checked, 'textBox')" />
                            <label for="PI_benefit9" style="font-size:85%; display:inline;">Life Care Plus</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount9" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Life Care Waiver" id="PI_benefit10" name="PI_Name" onclick="PiBenefit10(this.checked, 'textBox')" />
                            <label for="PI_benefit10" style="font-size:85%; display:inline;">Life Care Waiver</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount10" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Mulitple Life Cycle Plus" id="PI_benefit11" name="PI_Name" onclick="PiBenefit11(this.checked, 'textBox')" />
                            <label for="PI_benefit11" style="font-size:85%; display:inline;">Mulitple Life Cycle Plus</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount11" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm" >
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Non-accelerated Total and Permanent Disability Benefit" id="PI_benefit12" name="PI_Name" onclick="PiBenefit12(this.checked, 'textBox')" />
                            <label for="PI_benefit12" style="font-size:85%; display:inline;">Non-accelerated Total and Permanent Disability Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount12" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
                  
					<div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Payor Term Benefit" id="PI_benefit13" name="PI_Name" onclick="PiBenefit13(this.checked, 'textBox')" />
                            <label for="PI_benefit13" style="font-size:85%; display:inline;">Payor Term Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount13" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Payor Waiver of Regular Premium" id="PI_benefit14" name="PI_Name" onclick="PiBenefit14(this.checked, 'textBox')" />
                            <label for="PI_benefit14" style="font-size:85%; display:inline;">Payor Waiver of Regular Premium</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount14" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Renewable Convertible Level Term Assurance Benefit" id="PI_benefit15" name="PI_Name" onclick="PiBenefit15(this.checked, 'textBox')" />
                            <label for="PI_benefit15" style="font-size:85%; display:inline;">Renewable Convertible Level Term Assurance Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount15" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Waiver of Premium on TPD" id="PI_benefit16" name="PI_Name" onclick="PiBenefit16(this.checked, 'textBox')" />
                            <label for="PI_benefit16" style="font-size:85%; display:inline;">Waiver of Premium on TPD</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount16" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					 <!--   <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Others" id="PI_benefit17" name="PI_Name" onclick="PiBenefit17(this.checked, 'textBox')" />
                            <label for="PI_benefit17" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						</div>
                      </div>
					  <div class="form-group myfm" >
                        <div class="col-sm-7">
                          <input type="text" class="form-control mytextbox" name="PI_Name" id="PI_benefit17other" onchange="benefit17other()" disabled/>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_benefit_amount17" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>-->
                      <script type="text/javascript">
						 function benefit17other()
						 {	
						   var b17other = document.getElementById('PI_benefit17other').value;
						   document.getElementById('PI_benefit17').value= b17other;
						 }
						</script>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Variable Life Rider and Amount</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group myfm col-md-4">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Variable Life Rider (One-off Premium)" id="PI_variable1" name="PI_Name" onclick="PiVariable1(this.checked, 'textBox')" />
                            <label for="PI_variable1" style="font-size:85%; display:inline;">Variable Life Rider (One-off Premium)</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_variable_amount1" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
			<div class="form-group myfm col-md-4">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Variable Life Rider (Regular Premium)" id="PI_variable2" name="PI_Name" onclick="PiVariable2(this.checked, 'textBox')" />
                            <label for="PI_variable2" style="font-size:85%; display:inline;">Variable Life Rider (Regular Premium)</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_variable_amount2"  name="PI_Amount" disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Hospital Income Benefits and Amount</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4">
                  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Daily Hospital Income Benefit" id="PI_hospital1" name="PI_Name" onclick="PiHospital1(this.checked, 'textBox')" />
                            <label for="PI_hospital1" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="text" class="form-control mytextbox"  id="PI_hospital_amount1" name="PI_Amount"   disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Intensive Care Unit Benefit" id="PI_hospital2" name="PI_Name" onclick="PiHospital2(this.checked, 'textBox')" />
                            <label for="PI_hospital2" style="font-size:85%; display:inline;">Intensive Care Unit Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_hospital_amount2" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
                  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Surgical Expense Benefit" id="PI_hospital3" name="PI_Name" onclick="PiHospital3(this.checked, 'textBox')" />
                            <label for="PI_hospital3" style="font-size:85%; display:inline;">Surgical Expense Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_hospital_amount3" name="PI_Amount"   disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Long-term Hospitalization Benefit" id="PI_hospital4" name="PI_Name" onclick="PiHospital4(this.checked, 'textBox')" />
                            <label for="PI_hospital4" style="font-size:85%; display:inline;">Long-term Hospitalization Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_hospital_amount4" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
                 <!--  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Others" id="PI_hospital5" name="PI_Name" onclick="PiHospital5(this.checked, 'textBox')" />
                            <label for="PI_hospital5" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <input type="text" class="form-control mytextbox" id="PI_hospital5other" onchange="hospital5other()" disabled/>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_hospital_amount5" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div> -->
                      <script type="text/javascript">
						 function hospital5other()
						 {	
						   var h5other = document.getElementById('PI_hospital5other').value;
						   document.getElementById('PI_hospital5').value= h5other;
						 }
						</script>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Personal Accident Benefits and Amount</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4">
                  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Daily Hospital Income Benefit" id="PI_personal1" name="PI_Name" onclick="PiPersonal1(this.checked, 'textBox')" />
                            <label for="PI_personal1" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount1" name="PI_Amount"   disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Daily Hospital Income Benefit" id="PI_personal2" name="PI_Name" onclick="PiPersonal2(this.checked, 'textBox')" />
                            <label for="PI_personal2" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount2" name="PI_Amount"   disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Intensive Care Unit Benefit" id="PI_personal3" name="PI_Name" onclick="PiPersonal3(this.checked, 'textBox')" />
                            <label for="PI_personal3" style="font-size:85%; display:inline;">Intensive Care Unit Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox"  id="PI_personal_amount3" name="PI_Amount"   disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
			<div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Daily Hospital Income Benefit" id="PI_personal4" name="PI_Name" onclick="PiPersonal4(this.checked, 'textBox')" />
                            <label for="PI_personal4" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount4" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Surgical Expense Benefit" id="PI_personal5" name="PI_Name" onclick="PiPersonal5(this.checked, 'textBox')" />
                            <label for="PI_personal5" style="font-size:85%; display:inline;">Surgical Expense Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount5" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Long-term Hospitalization Benefit" id="PI_personal6" name="PI_Name" onclick="PiPersonal6(this.checked, 'textBox')" />
                            <label for="PI_personal6" style="font-size:85%; display:inline;">Long-term Hospitalization Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount6" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
			<div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Daily Hospital Income Benefit" id="PI_personal7" name="PI_Name" onclick="PiPersonal7(this.checked, 'textBox')" />
                            <label for="PI_personal7" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount7" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                  <!-- <div class="form-group myfm">
                        <div class="col-sm-7">
                          <div class="ckbox ckbox-default">
                        <input type="checkbox" value="Others" id="PI_personal8" name="PI_Name" onclick="PiPersonal8(this.checked, 'textBox')" />
                            <label for="PI_personal8" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="input-group col-sm-5">
						</div>
                      </div>
					  <div class="form-group myfm">
                        <div class="col-sm-7">
                          <input type="text" class="form-control mytextbox" id="PI_personal8other" onchange="personal8other()" disabled/>
                        </div>
						<div class="input-group col-sm-5">
						  <input type="number" class="form-control mytextbox" id="PI_personal_amount8" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div> -->
                       <script type="text/javascript">
						 function personal8other()
						 {	
						   var p8other = document.getElementById('PI_personal8other').value;
						   document.getElementById('PI_personal8').value= p8other;
						 }
						</script>
                </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
<script>
function PiBenefit1(bEnable, textBoxID){document.getElementById('PI_benefit_amount1').disabled = !bEnable;
document.getElementById('PI_benefit_amount1').value = "";}
function PiBenefit2(bEnable, textBoxID){document.getElementById('PI_benefit_amount2').disabled = !bEnable;
document.getElementById('PI_benefit_amount2').value = "";}
function PiBenefit3(bEnable, textBoxID){document.getElementById('PI_benefit_amount3').disabled = !bEnable;
document.getElementById('PI_benefit_amount3').value = "";}
function PiBenefit4(bEnable, textBoxID){document.getElementById('PI_benefit_amount4').disabled = !bEnable;
document.getElementById('PI_benefit_amount4').value = "";}
function PiBenefit5(bEnable, textBoxID){document.getElementById('PI_benefit_amount5').disabled = !bEnable;
document.getElementById('PI_benefit_amount5').value = "";}
function PiBenefit6(bEnable, textBoxID){document.getElementById('PI_benefit_amount6').disabled = !bEnable;
document.getElementById('PI_benefit_amount6').value = "";}
function PiBenefit7(bEnable, textBoxID){document.getElementById('PI_benefit_amount7').disabled = !bEnable;
document.getElementById('PI_benefit_amount7').value = "";}
function PiBenefit8(bEnable, textBoxID){document.getElementById('PI_benefit_amount8').disabled = !bEnable;
document.getElementById('PI_benefit_amount8').value = "";}
function PiBenefit9(bEnable, textBoxID){document.getElementById('PI_benefit_amount9').disabled = !bEnable;
document.getElementById('PI_benefit_amount9').value = "";}
function PiBenefit10(bEnable, textBoxID){document.getElementById('PI_benefit_amount10').disabled = !bEnable;
document.getElementById('PI_benefit_amount10').value = "";}
function PiBenefit11(bEnable, textBoxID){document.getElementById('PI_benefit_amount11').disabled = !bEnable;
document.getElementById('PI_benefit_amount11').value = "";}
function PiBenefit12(bEnable, textBoxID){document.getElementById('PI_benefit_amount12').disabled = !bEnable;
document.getElementById('PI_benefit_amount12').value = "";}
function PiBenefit13(bEnable, textBoxID){document.getElementById('PI_benefit_amount13').disabled = !bEnable;
document.getElementById('PI_benefit_amount13').value = "";}
function PiBenefit14(bEnable, textBoxID){document.getElementById('PI_benefit_amount14').disabled = !bEnable;
document.getElementById('PI_benefit_amount14').value = "";}
function PiBenefit15(bEnable, textBoxID){document.getElementById('PI_benefit_amount15').disabled = !bEnable;
document.getElementById('PI_benefit_amount15').value = "";}
function PiBenefit16(bEnable, textBoxID){document.getElementById('PI_benefit_amount16').disabled = !bEnable;
document.getElementById('PI_benefit_amount16').value = "";}
function PiBenefit17(bEnable, textBoxID){document.getElementById('PI_benefit_amount17').disabled = !bEnable;
document.getElementById('PI_benefit17other').disabled = !bEnable;
document.getElementById('PI_benefit_amount17').value = ""; document.getElementById('PI_benefit17other').value = "";}

function PiVariable1(bEnable, textBoxID){document.getElementById('PI_variable_amount1').disabled = !bEnable;
document.getElementById('PI_variable_amount1').value = "";}
function PiVariable2(bEnable, textBoxID){document.getElementById('PI_variable_amount2').disabled = !bEnable;
document.getElementById('PI_variable2yearstobebilled').disabled = !bEnable;
document.getElementById('PI_variable_amount2').value = ""; document.getElementById('PI_variable2yearstobebilled').value = "";}

function PiHospital1(bEnable, textBoxID){document.getElementById('PI_hospital_amount1').disabled = !bEnable;
document.getElementById('PI_hospital_amount1').value = "";}
function PiHospital2(bEnable, textBoxID){document.getElementById('PI_hospital_amount2').disabled = !bEnable;
document.getElementById('PI_hospital_amount2').value = "";}
function PiHospital3(bEnable, textBoxID){document.getElementById('PI_hospital_amount3').disabled = !bEnable;
document.getElementById('PI_hospital_amount3').value = "";}
function PiHospital4(bEnable, textBoxID){document.getElementById('PI_hospital_amount4').disabled = !bEnable;
document.getElementById('PI_hospital_amount4').value = "";}
function PiHospital5(bEnable, textBoxID){document.getElementById('PI_hospital_amount5').disabled = !bEnable;
document.getElementById('PI_hospital5other').disabled = !bEnable;
document.getElementById('PI_hospital_amount5').value = ""; document.getElementById('PI_hospital5other').value = "";}

function PiPersonal1(bEnable, textBoxID){document.getElementById('PI_personal_amount1').disabled = !bEnable;
document.getElementById('PI_personal_amount1').value = "";}
function PiPersonal2(bEnable, textBoxID){document.getElementById('PI_personal_amount2').disabled = !bEnable;
document.getElementById('PI_personal_amount2').value = "";}
function PiPersonal3(bEnable, textBoxID){document.getElementById('PI_personal_amount3').disabled = !bEnable;
document.getElementById('PI_personal_amount3').value = "";}
function PiPersonal4(bEnable, textBoxID){document.getElementById('PI_personal_amount4').disabled = !bEnable;
document.getElementById('PI_personal_amount4').value = "";}
function PiPersonal5(bEnable, textBoxID){document.getElementById('PI_personal_amount5').disabled = !bEnable;
document.getElementById('PI_personal_amount5').value = "";}
function PiPersonal6(bEnable, textBoxID){document.getElementById('PI_personal_amount6').disabled = !bEnable;
document.getElementById('PI_personal_amount6').value = "";}
function PiPersonal7(bEnable, textBoxID){document.getElementById('PI_personal_amount7').disabled = !bEnable;
document.getElementById('PI_personal_amount7').value = "";}
function PiPersonal8(bEnable, textBoxID){document.getElementById('PI_personal_amount8').disabled = !bEnable;
document.getElementById('PI_personal8other').disabled = !bEnable;
document.getElementById('PI_personal_amount8').value = ""; document.getElementById('PI_personal8other').value = "";}

							</script>
	  
	  
                  </div>
 <div class="tab-pane" id="nonmedicalinfo">
                    <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Height and Weight</h4>
        </div>
		<div class="panel-body">
          <div class="row">
          <div class="col-md-1"></div>
          
            <div class="form-group myfg col-md-4">
                  <label class="col-sm-4 control-label mylabel" align="right">Height</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="number" class="form-control mytextbox" name="NMI_height" id="NMI_height"/>
						  <span class="input-group-addon myspan1">cm.</span>
						</div>
                </div>
			<div class="form-group myfg col-md-4">
                  <label class="col-sm-4 control-label mylabel" align="right">Weight</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="number" class="form-control mytextbox" name="NMI_weight" id="NMI_weight"/>
						  <span class="input-group-addon myspan1">lbs.</span>
						</div>
                </div>
          </div>
      </div><!-- panel -->
	  
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Non-Medical Information</h4>
        </div>
        <div class="panel-body">
        
        <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Tick yes if the life insured have the following:</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					  </div>
					<label class="col-sm-8 control-label mylabel" align="center">Details of "YES" Answer</label>
				 </div> 
          </div>
          <hr>
          <script type="text/javascript">
				function NMI_1Yes(val){
				 if(val=='Yes')document.getElementById('NMI_1details').disabled=false;
				 if(val=='No')document.getElementById('NMI_1details').disabled=true;}
				 
				 function NMI_2Yes(val){
				 if(val=='Yes')document.getElementById('NMI_2details').disabled=false;
				 if(val=='No')document.getElementById('NMI_2details').disabled=true;}
				 
				 function NMI_3Yes(val){
				 if(val=='Yes')document.getElementById('NMI_3details').disabled=false;
				 if(val=='No')document.getElementById('NMI_3details').disabled=true;}
				 
				 function NMI_4Yes(val){
				 if(val=='Yes')document.getElementById('NMI_4details').disabled=false;
				 if(val=='No')document.getElementById('NMI_4details').disabled=true;}
				 
				 function NMI_5Yes(val){
				 if(val=='Yes')document.getElementById('NMI_5details').disabled=false;
				 if(val=='No')document.getElementById('NMI_5details').disabled=true;}
				 
				 function NMI_6Yes(val){
				 if(val=='Yes')document.getElementById('NMI_6details').disabled=false;
				 if(val=='No')document.getElementById('NMI_6details').disabled=true;}
				 
				 function NMI_7Yes(val){
				 if(val=='Yes')document.getElementById('NMI_7details').disabled=false;
				 if(val=='No')document.getElementById('NMI_7details').disabled=true;}
				 
				 function NMI_8Yes(val){
				 if(val=='Yes')document.getElementById('NMI_8details').disabled=false;
				 if(val=='No')document.getElementById('NMI_8details').disabled=true;}
				 
				 function NMI_9Yes(val){
				 if(val=='Yes')document.getElementById('NMI_9details').disabled=false;
				 if(val=='No')document.getElementById('NMI_9details').disabled=true;}
				 
				 function NMI_10Yes(val){
				 if(val=='Yes')document.getElementById('NMI_10details').disabled=false;
				 if(val=='No')document.getElementById('NMI_10details').disabled=true;}
				 
				</script>
          
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">AIDS-related condition</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes1" value="Yes" name="NMI_1" onclick="NMI_1Yes('Yes');"/>
								<label class="control-label mylabel" for="yes1">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no1" name="NMI_1" onclick="NMI_1Yes('No');"/>
								<label class="control-label mylabel" for="no1">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_1details" id="NMI_1details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Receiving treatment or taking medication of any kind</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes2" value="Yes" name="NMI_2" onclick="NMI_2Yes('Yes');"/>
								<label class="control-label mylabel" for="yes2">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no2" name="NMI_2" onclick="NMI_2Yes('No');"/>
								<label class="control-label mylabel" for="no2">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_2details" id="NMI_2details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Taken habit-forming drug or other addiction</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes3" value="Yes" name="NMI_3" onclick="NMI_3Yes('Yes');"/>
								<label class="control-label mylabel" for="yes3">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no3" name="NMI_3" onclick="NMI_3Yes('No');"/>
								<label class="control-label mylabel" for="no3">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_3details" id="NMI_3details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Drinking alcoholic beverages</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes4" value="Yes" name="NMI_4" onclick="NMI_4Yes('Yes');"/>
								<label class="control-label mylabel" for="yes4">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no4" name="NMI_4" onclick="NMI_4Yes('No');"/>
								<label class="control-label mylabel" for="no4">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_4details" id="NMI_4details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Smoking or history of smoking cigarettes/tobacco</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes5" value="Yes" name="NMI_5" onclick="NMI_5Yes('Yes');"/>
								<label class="control-label mylabel" for="yes5">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no5" name="NMI_5" onclick="NMI_5Yes('No');"/>
								<label class="control-label mylabel" for="no5">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_5details" id="NMI_5details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Disorder of the brain or nervous system</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes6" value="Yes" name="NMI_6" onclick="NMI_6Yes('Yes');"/>
								<label class="control-label mylabel" for="yes6">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no6" name="NMI_6" onclick="NMI_6Yes('No');"/>
								<label class="control-label mylabel" for="no6">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_6details" id="NMI_6details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Disorder of the lungs or respiratory system</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes7" value="Yes" name="NMI_7" onclick="NMI_7Yes('Yes');"/>
								<label class="control-label mylabel" for="yes7">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no7" name="NMI_7" onclick="NMI_7Yes('No');"/>
								<label class="control-label mylabel" for="no7">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_7details" id="NMI_7details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Disorder of the heart or circulatory system</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes8" value="Yes" name="NMI_8" onclick="NMI_8Yes('Yes');"/>
								<label class="control-label mylabel" for="yes8">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no8" name="NMI_8" onclick="NMI_8Yes('No');"/>
								<label class="control-label mylabel" for="no8">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_8details" id="NMI_8details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Diabetes, thyroid or other endocrine disorder</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes9" value="Yes" name="NMI_9" onclick="NMI_9Yes('Yes');"/>
								<label class="control-label mylabel" for="yes9">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no9" name="NMI_9" onclick="NMI_9Yes('No');"/>
								<label class="control-label mylabel" for="no9">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_9details" id="NMI_9details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
          <div class="row">
          <div class="col-sm-1"></div>
					  <label class="col-sm-4 control-label mylabel">Arthritis, rheumatism or other disorder of bones, joints or muscles</label>
					  <div class="col-sm-6">
					  <div class="col-sm-4">
					   <div class="rdio rdio-default col-md-6">
								<input type="radio" id="yes10" value="Yes" name="NMI_10" onclick="NMI_10Yes('Yes');"/>
								<label class="control-label mylabel" for="yes10">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-6">
								<input type="radio" value="No" id="no10" name="NMI_10" onclick="NMI_10Yes('No');"/>
								<label class="control-label mylabel" for="no10">No</label>
							  </div>
					  </div>
					<div class="col-sm-8">
					<textarea class="form-control" rows="2" name="NMI_10details" id="NMI_10details" disabled></textarea>
                    
                  </div>
				 </div> 
          </div>
          <hr>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  
                  </div>               
                </div><!-- tab-content -->
                
                <ul class="pager wizard">
                    <li class="previous"><a href="javascript:void(0)">Previous</a></li>
                    <li class="next"><a href="javascript:void(0)">Next</a></li>
                  </ul>
                
              </div><!-- #basicWizard -->
              
            </div><!-- panel-body -->
          </div><!-- panel -->
          
        </div><!-- col-md-12 -->
        
      </div><!-- row -->

      
    </div><!-- contentpanel -->
    
     <%	}
            rs1.close();
            stmt1.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
    
    
  </div><!-- mainpanel -->
  
  <div class="rightpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-justified">
        <li class="active"><a href="#rp-alluser" data-toggle="tab"><i class="fa fa-users"></i></a></li>
        <li><a href="#rp-favorites" data-toggle="tab"><i class="fa fa-heart"></i></a></li>
        <li><a href="#rp-history" data-toggle="tab"><i class="fa fa-clock-o"></i></a></li>
        <li><a href="#rp-settings" data-toggle="tab"><i class="fa fa-gear"></i></a></li>
    </ul>

  </div><!-- rightpanel -->
  
</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>


<script src="js/bootstrap-wizard.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.min.js"></script>


<script src="js/custom.js"></script>
<script>
jQuery(document).ready(function(){
    
    "use strict";

  // Basic Wizard
  jQuery('#basicWizard').bootstrapWizard();
  
  
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
  
    // Select1
  jQuery(".select1").select2({
    width: '100%',
    minimumResultsForSearch: -1
  });
  
    // Date Picker
  jQuery('#P_birthdate').datepicker();
  jQuery('#LI_birthdate').datepicker();
  jQuery('#PB_birthdate').datepicker();
  jQuery('#SB_birthdate').datepicker();
  jQuery('#AF_dateapplied').datepicker();
  
  jQuery('#datepicker-inline').datepicker();
  
  jQuery('#datepicker-multiple').datepicker({
    numberOfMonths: 3,
    showButtonPanel: true
  });
  
    // Basic Form
  jQuery("#basicForm").validate({
    highlight: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-error');
    }
  });
  
  
});
</script>
 <script type="text/javascript">
	$(document).ready(function (){

		
	
		
		$("#btnSubmitAF").click(function() {
		
			var sud_id = $('#sud_id').val();
			
			var AF_applicationnumber = $('#AF_applicationnumber').val();
			var AF_dateapplied = $('#AF_dateapplied').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
		
			var agent_id = $('#agent_id').val();
			var Added_By = $('#Added_By').val();
			
			var p_preexist = $('#tryme').val();
			
			var LI_reltopolicyowner = $('#LI_reltopolicyowner').val();
			var LI_surname = $('#LI_surname').val();
			var LI_givenname = $('#LI_givenname').val();
			var LI_middlename = $('#LI_middlename').val();
			var LI_alias = $('#LI_alias').val();
			
			var LI_civilstatusThis = "";
			var LI_civilstatus = $('#LI_civilstatus').val();
			var LI_civilstatus_other = $('#LI_civilstatus_other').val();
			if (LI_civilstatus=="Other")
				LI_civilstatusThis=LI_civilstatus_other;
			else LI_civilstatusThis=LI_civilstatus;
			
			var LI_salutation = $('#LI_salutation').val();
			var LI_nationality = $('#LI_nationality').val();
			var LI_placeofbirth = $('#LI_placeofbirth').val();
			var LI_occupation = $('#LI_occupation').val();
			var LI_natureofwork = $('#LI_natureofwork').val();
			var LI_employer = $('#LI_employer').val();
			var LI_natureofemployer = $('#LI_natureofemployer').val();
			var LI_annualincome = $('#LI_annualincome').val();
			var LI_networth = $('#LI_networth').val();
			
			var LI_sourceoffundsThis = "";
			var LI_sourceoffunds = $('#LI_sourceoffunds').val();
			var LI_sourceoffunds_other = $('#LI_sourceoffunds_other').val();
			if (LI_sourceoffunds=="Other")
				LI_sourceoffundsThis=LI_sourceoffunds_other;
			else LI_sourceoffundsThis=LI_sourceoffunds;
			
			var LI_mobilenumber = $('#LI_mobilenumber').val();
			var LI_telephonenumber = $('#LI_telephonenumber').val();
			var LI_emailaddress = $('#LI_emailaddress').val();
			var LI_presentaddress = $('#LI_presentaddress').val();
			var LI_presentcountry = $('#LI_presentcountry').val();
			var LI_presentzipcode = $('#LI_presentzipcode').val();
			var LI_permanentaddress = $('#LI_permanentaddress').val();
			var LI_permanentcountry = $('#LI_permanentcountry').val();
			var LI_permanentzipcode = $('#LI_permanentzipcode').val();
			var LI_businessaddress = $('#LI_businessaddress').val();
			var LI_businesscountry = $('#LI_businesscountry').val();
			var LI_businesszipcode = $('#LI_businesszipcode').val();
			
			var P_surname = $('#P_surname').val();
			var P_givenname = $('#P_givenname').val();
			var P_middlename = $('#P_middlename').val();
			var P_clientnumber = $('#P_clientnumber').val();
			
			var P_civilstatusThis = "";
			var P_civilstatus = $('#P_civilstatus').val();
			var P_civilstatus_other = $('#P_civilstatus_other').val();
			if (P_civilstatus=="Other")
				P_civilstatusThis=P_civilstatus_other;
			else P_civilstatusThis=P_civilstatus;
			
			var P_salutation = $('#P_salutation').val();
			var P_nationality = $('#P_nationality').val();
			var P_placeofbirth = $('#P_placeofbirth').val();
			var P_occupation = $('#P_occupation').val();
			var P_natureofwork = $('#P_natureofwork').val();
			var P_employer = $('#P_employer').val();
			var P_natureofemployer = $('#P_natureofemployer').val();
			var P_annualincome = $('#P_annualincome').val();
			var P_networth = $('#P_networth').val();
			
			var P_sourceoffundsThis = "";
			var P_sourceoffunds = $('#P_sourceoffunds').val();
			var P_sourceoffunds_other = $('#P_sourceoffunds_other').val();
			if (P_sourceoffunds=="Other")
				P_sourceoffundsThis=P_sourceoffunds_other;
			else P_sourceoffundsThis=P_sourceoffunds;
			
			var P_mobilenumber = $('#P_mobilenumber').val();
			var P_telephonenumber = $('#P_telephonenumber').val();
			var P_emailaddress = $('#P_emailaddress').val();
			var P_presentaddress = $('#P_presentaddress').val();
			var P_presentcountry = $('#P_presentcountry').val();
			var P_presentzipcode = $('#P_presentzipcode').val();
			var P_permanentaddress = $('#P_permanentaddress').val();
			var P_permanentcountry = $('#P_permanentcountry').val();
			var P_permanentzipcode = $('#P_permanentzipcode').val();
			var P_businessaddress = $('#P_businessaddress').val();
			var P_businesscountry = $('#P_businesscountry').val();
			var P_businesszipcode = $('#P_businesszipcode').val();
			var P_reltolifeinsured = $('#P_reltolifeinsured').val();
			
			var BO_name = $('#BO_name').val();
			var BO_contactnumber = $('#BO_contactnumber').val();
			
			var PB_name = $('#PB_name').val();
			var PB_reltoinsured = $('#PB_reltoinsured').val();
			var PB_share = $('#PB_share').val();
			var PB_typeofbeneficiary = $('#PB_typeofbeneficiary').val();
			var PB_beneficiarydesignation = $('#PB_beneficiarydesignation').val();
			var PB_placeofbirth = $('#PB_placeofbirth').val();
			var PB_nationality = $('#PB_nationality').val();
			var PB_presentaddress = $('#PB_presentaddress').val();
			var PB_country = $('#PB_country').val();
			var PB_zipcode = $('#PB_zipcode').val();
			
			var SB_name = $('#SB_name').val();
			var SB_reltoinsured = $('#SB_reltoinsured').val();
			var SB_share = $('#SB_share').val();
			var SB_typeofbeneficiary = $('#SB_typeofbeneficiary').val();
			var SB_beneficiarydesignation = $('#SB_beneficiarydesignation').val();
			var SB_placeofbirth = $('#SB_placeofbirth').val();
			var SB_nationality = $('#SB_nationality').val();
			var SB_presentaddress = $('#SB_presentaddress').val();
			var SB_country = $('#SB_country').val();
			var SB_zipcode = $('#SB_zipcode').val();
			
			var PI_planname = $('#PI_planname').val();
			var PI_sumassured = $('#PI_sumassured').val();
			var PI_annualizedpremium = $('#PI_annualizedpremium').val();
			var PI_initialpremiumpaid = $('#PI_initialpremiumpaid').val(); 
			var PI_modeofpayment = $('#PI_modeofpayment').val();
			
			var LI_gender = $('input[name=LI_gender]:checked').val();
			var P_gender = $('input[name=P_gender]:checked').val();
			var PB_gender = $('input[name=PB_gender]:checked').val();
			var SB_gender = $('input[name=SB_gender]:checked').val();
			
			var NMI_height = $('#NMI_height').val();
			var NMI_weight = $('#NMI_weight').val();
			var NMI_1details = $('#NMI_1details').val();
			var NMI_2details = $('#NMI_2details').val();
			var NMI_3details = $('#NMI_3details').val();
			var NMI_4details = $('#NMI_4details').val();
			var NMI_5details = $('#NMI_5details').val();
			var NMI_6details = $('#NMI_6details').val();
			var NMI_7details = $('#NMI_7details').val();
			var NMI_8details = $('#NMI_8details').val();
			var NMI_9details = $('#NMI_9details').val();
			var NMI_10details = $('#NMI_10details').val();
			
			var NMI_1 = $('input[name=NMI_1]:checked').val();
			var NMI_2 = $('input[name=NMI_2]:checked').val();
			var NMI_3 = $('input[name=NMI_3]:checked').val();
			var NMI_4 = $('input[name=NMI_4]:checked').val();
			var NMI_5 = $('input[name=NMI_5]:checked').val();
			var NMI_6 = $('input[name=NMI_6]:checked').val();
			var NMI_7 = $('input[name=NMI_7]:checked').val();
			var NMI_8 = $('input[name=NMI_8]:checked').val();
			var NMI_9 = $('input[name=NMI_9]:checked').val();
			var NMI_10 = $('input[name=NMI_10]:checked').val();
			
			var LI_birthdate = $('#LI_birthdate').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
			var P_birthdate = $('#P_birthdate').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
			var PB_birthdate = $('#PB_birthdate').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
			var SB_birthdate = $('#SB_birthdate').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
			
			
			
			var checks = document.getElementsByName('PI_Name');
	
			var pi_name='';
			for(i=0; i<32; i++)
			{
				if(checks[i].checked===true){
					pi_name+=checks[i].value+":";
				}
			}
			
			var check = document.getElementsByName('PI_Amount');
			var amount = "";
			for(j=0; j<32; j++)
			{		if(check[j].disabled===false){
					amount+=check[j].value+":";
					}
			}
			
			

			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					
					AF_applicationnumber:AF_applicationnumber,
					AF_dateapplied:AF_dateapplied,
					
					agent_id:agent_id,
					Added_By:Added_By,
					
					p_preexist:p_preexist,
					
					LI_reltopolicyowner:LI_reltopolicyowner,
					LI_surname:LI_surname,
					LI_givenname:LI_givenname,
					LI_middlename:LI_middlename,
					LI_alias:LI_alias,
					LI_gender:LI_gender,
					LI_civilstatusThis:LI_civilstatusThis,
					LI_salutation:LI_salutation,
					LI_birthdate:LI_birthdate,
					LI_nationality:LI_nationality,
					LI_placeofbirth:LI_placeofbirth,
					LI_occupation:LI_occupation,
					LI_natureofwork:LI_natureofwork,
					LI_employer:LI_employer,
					LI_natureofemployer:LI_natureofemployer,
					LI_annualincome:LI_annualincome,
					LI_networth:LI_networth,
					LI_sourceoffundsThis:LI_sourceoffundsThis,
					LI_mobilenumber:LI_mobilenumber,
					LI_telephonenumber:LI_telephonenumber,
					LI_emailaddress:LI_emailaddress,
					LI_presentaddress:LI_presentaddress,
					LI_presentcountry:LI_presentcountry,
					LI_presentzipcode:LI_presentzipcode,
					LI_permanentaddress:LI_permanentaddress,
					LI_permanentcountry:LI_permanentcountry,
					LI_permanentzipcode:LI_permanentzipcode,
					LI_businessaddress:LI_businessaddress,
					LI_businesscountry:LI_businesscountry,
					LI_businesszipcode:LI_businesszipcode,
					
					P_surname:P_surname,
					P_clientnumber:P_clientnumber,
					P_givenname:P_givenname,
					P_middlename:P_middlename,
					P_gender:P_gender,
					P_civilstatusThis:P_civilstatusThis,
					P_salutation:P_salutation,
					P_birthdate:P_birthdate,
					P_nationality:P_nationality,
					P_placeofbirth:P_placeofbirth,
					P_occupation:P_occupation,
					P_natureofwork:P_natureofwork,
					P_employer:P_employer,
					P_natureofemployer:P_natureofemployer,
					P_annualincome:P_annualincome,
					P_networth:P_networth,
					P_sourceoffundsThis:P_sourceoffundsThis,
					P_mobilenumber:P_mobilenumber,
					P_telephonenumber:P_telephonenumber,
					P_emailaddress:P_emailaddress,
					P_presentaddress:P_presentaddress,
					P_presentcountry:P_presentcountry,
					P_presentzipcode:P_presentzipcode,
					P_permanentaddress:P_permanentaddress,
					P_permanentcountry:P_permanentcountry,
					P_permanentzipcode:P_permanentzipcode,
					P_businessaddress:P_businessaddress,
					P_businesscountry:P_businesscountry,
					P_businesszipcode:P_businesszipcode,
					
					PB_name:PB_name,
					PB_birthdate:PB_birthdate,
					PB_gender:PB_gender,
					PB_reltoinsured:PB_reltoinsured,
					PB_share:PB_share,
					PB_typeofbeneficiary:PB_typeofbeneficiary,
					PB_beneficiarydesignation:PB_beneficiarydesignation,
					PB_placeofbirth:PB_placeofbirth,
					PB_nationality:PB_nationality,
					PB_presentaddress:PB_presentaddress,
					PB_country:PB_country,
					PB_zipcode:PB_zipcode,
					
					SB_name:SB_name,
					SB_birthdate:SB_birthdate,
					SB_gender:SB_gender,
					SB_reltoinsured:SB_reltoinsured,
					SB_share:SB_share,
					SB_typeofbeneficiary:SB_typeofbeneficiary,
					SB_beneficiarydesignation:SB_beneficiarydesignation,
					SB_placeofbirth:SB_placeofbirth,
					SB_nationality:SB_nationality,
					SB_presentaddress:SB_presentaddress,
					SB_country:SB_country,
					SB_zipcode:SB_zipcode,
					
					PI_planname:PI_planname,
					PI_sumassured:PI_sumassured,
					PI_annualizedpremium:PI_annualizedpremium,
					PI_initialpremiumpaid:PI_initialpremiumpaid,
					PI_modeofpayment:PI_modeofpayment,
					
					NMI_height:NMI_height,
					NMI_weight:NMI_weight,
					NMI_1details:NMI_1details,
					NMI_2details:NMI_2details,
					NMI_3details:NMI_3details,
					NMI_4details:NMI_4details,
					NMI_5details:NMI_5details,
					NMI_6details:NMI_6details,
					NMI_7details:NMI_7details,
					NMI_8details:NMI_8details,
					NMI_9details:NMI_9details,
					NMI_10details:NMI_10details,
					NMI_1:NMI_1,
					NMI_2:NMI_2,
					NMI_3:NMI_3,
					NMI_4:NMI_4,
					NMI_5:NMI_5,
					NMI_6:NMI_6,
					NMI_7:NMI_7,
					NMI_8:NMI_8,
					NMI_9:NMI_9,
					NMI_10:NMI_10,
					
					pi_name:pi_name,
					amount:amount
					
				},
				url:'insert',
				success: function(result){
					
					swal("Success!", "Application Added!", "success");
					setTimeout(location.reload.bind(location), 1000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		
	});
</script>		
</body>
</html>
