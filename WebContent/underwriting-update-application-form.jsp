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

<body>
<% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();

%>
<%
			try{ 
				String query1 = " SELECT COUNT(*) FROM (SELECT c.c_id as cid, af.af_applicationnumber as ApplicationNumber FROM application_requirements_details ar LEFT JOIN client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN application_progress_details ap ON ap.ap_ref_c_id = c.c_id LEFT JOIN application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id  LEFT JOIN policy_information_details pi ON c.c_ref_pi_id=pi.pi_id LEFT JOIN form_completion_details fc ON fc.fc_ref_c_id=c.c_id where ap.ap_form='Pending') as Countme";
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				while(rs1.next())
				{
				
			%>

<section>
  
  <div class="leftpanel">
    
    <div class="logopanel" style="margin-bottom:50px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <style>
       </style>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="underwriting-progress-view.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
		<li><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li class="active"><a href="underwriting-pending-application-view.jsp"><span class="pull-right badge badge-success" style="background-color:#ff4444; color:white;"><%out.print(rs1.getInt("COUNT(*)")); %></span><i class="fa fa-pencil"></i> <span>Pending Application</span></a></li>
        <li><a href="underwriting-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
		<li><a href="underwriting-issued-policy-view.jsp"><i class="fa  fa-check-circle"></i> <span>Issued Policy</span></a></li>
		<li><a href="underwriting-declined-policy-view.jsp"><i class="fa fa-times-circle"></i> <span>Declined Policy</span></a></li>
      </ul>
<%
				}
				rs1.close();
            stmt1.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				%>
      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <div class="headerbar">
       
      
      <div class="header-right">
        <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
                Malene Dizon
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>
          <li>
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-plus"></i> Application Form <span>Update Application</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">Prulife UK</a></li>
          <li><a href="pending-application.jsp">Pending Application</a></li>
          <li class="active">Update Application</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     <% 	
					String ss =request.getParameter("id");
					try{ 
				String query = "SELECT * FROM application_requirements_details ar LEFT JOIN client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN application_progress_details ap ON ap.ap_ref_c_id = c.c_id LEFT JOIN application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id  LEFT JOIN policy_information_details pi ON c.c_ref_pi_id=pi.pi_id LEFT JOIN form_completion_details fc ON fc.fc_ref_c_id=c.c_id WHERE c.c_id="+ss+"";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				%>  
      <div class="row">
      <label style="display:none;" id="cid"><%out.print(ss); %></label>
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
		.mybutton1
					{
						padding:6px 15px;
						font-size: 13px;
						color:#3F729B;
						border-color:#3F729B;
						background-color:#ffffff;
						border-width:1px;
					}
					.mybutton1:hover
					{
						padding:6px 15px;
						font-size: 13px;
						color:#356083;
						border-color:#356083;
						background-color:#ffffff;
					}
		.mybutton2
					{
						padding:6px 15px;
						font-size: 13px;
						background-color:#3F729B;
					}
					.mybutton2:hover
					{
						padding:6px 15px;
						font-size: 13px;
						background-color:#356083;
					}
		</style>
            <div class="row">
            <div class="col-md-8">
            <div class="form-group col-md-4"style="padding-left:0px;">
                  <label class="col-sm-5 control-label mylabel1" align="right">Application Number</label>
                  <div class="col-sm-7" style="padding-left:20px; padding-right:0px;">
                    <input type="text" name="AF_applicationnumber" id="AF_applicationnumber" value="<%out.print(rs.getString("af_applicationnumber")); %>" class="form-control mytextbox1" disabled/>
                    <input type="text" name="clientid" id="clientid" value="<%out.print(rs.getInt("c_id")); %>" class="form-control mytextbox1" style="display:none;" disabled/>
                  </div>
                </div>
            <div class="form-group col-md-4" style="padding-left:0px;">
                  <label class="col-sm-5 control-label mylabel1" align="right">Client Number</label>
                  <div class="col-sm-7" style="padding-left:20px; padding-right:0px;">
                    <input type="text" name="AF_clientnumber" id="AF_clientnumber" class="form-control mytextbox1" value="<%out.print(rs.getString("af_clientnumber")); %>"  />
                  </div>
                </div>
            <div class="form-group col-md-4" style="padding-left:0px;">
					  <label class="col-sm-4 control-label mylabel1" align="right">Date Applied</label>
					  <div class="input-group"  style="padding-left:20px; padding-right:0px;">
					<input type="text" class="form-control mytextbox1" placeholder="mm/dd/yyyy" id="AF_dateapplied" value="<%out.print(rs.getString("af_dateapplied")); %>">
					<span class="input-group-addon mytextbox1"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
            </div>
            
					<style>
					.mybtn
					{
						background-color:#00c853;
						border-color:#00c853;
					}
					.mybtn:hover
					{
						background-color:#009624;
						border-color:#009624;
					}
					.mybtn1
					{
						background-color:#2962ff;
						border-color:#2962ff;
					}
					.mybtn1:hover
					{
						background-color:#0039cb;
						border-color:#0039cb;
					}
					</style>
            <div class="col-md-4" align="right">
                  <button class="btn btn-primary mybutton1" id="btnSubmitAF" style="margin-right:10px;"> Save</button>
			  	<button class="btn btn-success mybutton2" id="btnMarkAsCompleted"> Mark as Completed</button>
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
                </ul>
                
                <div class="tab-content">
                  <div class="tab-pane" id="basicinfo">
				  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Agent Information</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-8">
                  <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="AI_name" id="AI_name" class="form-control mytextbox" value="<%out.print(rs.getString("ai_name")); %>"/>
                  </div>
                </div>
			<div class="form-group col-md-8">
                  <label class="col-sm-4 control-label mylabel" align="right">Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="AI_code" id="AI_code" class="form-control mytextbox" value="<%out.print(rs.getString("ai_code")); %>"/>
                  </div>
                </div>
			<div class="form-group col-md-8">
                  <label class="col-sm-4 control-label mylabel" align="right">Branch</label>
                  <div class="col-sm-8">
                    <input type="text" name="AI_branch" id="AI_branch" class="form-control mytextbox" value="<%out.print(rs.getString("ai_branch")); %>"/>
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
		document.getElementById('licsother').style.display = "block";
		}
		else{
		document.getElementById('licsother').style.display = "none";
		}
		}
		
		function li_sfother(elem){
		if(elem.value == "Other"){
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
                    <input type="text" name="LI_surname" id="LI_surname" class="form-control mytextbox"  value="<%out.print(rs.getString("li_surname")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Given Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_givenname" id="LI_givenname" class="form-control mytextbox"  value="<%out.print(rs.getString("li_givenname")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Middle Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_middlename" id="LI_middlename" class="form-control mytextbox"  value="<%out.print(rs.getString("li_middlename")); %>"/>
                  </div>
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Other Name / Alias</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_alias" id="LI_alias" class="form-control mytextbox"  value="<%out.print(rs.getString("li_alias")); %>"/>
                  </div>
                </div>
                </div>

			<div class="col-md-4">
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
                                    <script>
					                var ligender = "<%out.print(rs.getString("li_gender")); %>";
					                
					                if(ligender=="Male"){
					                 document.getElementById("LImale").checked = true;
					                }
					                else if (ligender=="Female"){
					                 document.getElementById("LIfemale").checked = true;
					                }
					                
					                </script>
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
							<input type="text" id="LI_civilstatus_other" name="LI_civilstatus_other" class="form-control mytextbox" value="<%out.print(rs.getString("li_civilstatus")); %>"/>
						  </div>
						</div>
						<script>
					                var licivilstatus = "<%out.print(rs.getString("li_civilstatus")); %>";
					                if(licivilstatus=="Single" || licivilstatus=="Married"||licivilstatus==""){
					                $('#LI_civilstatus').val(licivilstatus);
					                }
					                else{
					                $('#LI_civilstatus').val('Other');
					                $("#licsother").css({ display: "block" });
					                }
					                
					                </script>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Salutation</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_salutation" id="LI_salutation" class="form-control mytextbox"  value="<%out.print(rs.getString("li_salutation")); %>"/>
					  </div>
					</div>
						</div>
			<div class="col-md-4">
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="LI_birthdate" value="<%out.print(rs.getString("li_birthdate")); %>">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_nationality" id="LI_nationality" class="form-control mytextbox"  value="<%out.print(rs.getString("li_nationality")); %>"/>
					  </div>
					</div>
			<div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
              <div class="col-sm-8">
                <textarea name="LI_placeofbirth" id="LI_placeofbirth" class="form-control" rows="4"><%out.print(rs.getString("li_placeofbirth")); %></textarea>
              </div>
            </div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Occupation</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_occupation" id="LI_occupation" class="form-control mytextbox"  value="<%out.print(rs.getString("li_occupation")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Work</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_natureofwork" id="LI_natureofwork" class="form-control mytextbox"  value="<%out.print(rs.getString("li_natureofwork")); %>"/>
                  </div>
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Employer</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_employer" id="LI_employer" class="form-control mytextbox"  value="<%out.print(rs.getString("li_employer")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nature of Employer</label>
                  <div class="col-sm-8">
                    <input type="text"name="LI_natureofemployer" id="LI_natureofemployer" class="form-control mytextbox"  value="<%out.print(rs.getString("li_natureofemployer")); %>"/>
                  </div>
                </div>
                </div>
			<div class="col-md-4">
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Gross Annual Income</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_annualincome" id="LI_annualincome" class="form-control mytextbox"  value="<%out.print(rs.getString("li_annualincome")); %>"/>
					  </div>
					</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Net Worth</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_networth" id="LI_networth" class="form-control mytextbox"  value="<%out.print(rs.getString("li_networth")); %>"/>
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
							<input type="text" name="LI_sourceoffunds_other" id="LI_sourceoffunds_other" class="form-control mytextbox"value="<%out.print(rs.getString("li_sourceoffunds")); %>" />
						  </div>
						</div>
						</div>
						<script>
					                var lisourceoffunds = "<%out.print(rs.getString("li_sourceoffunds")); %>";
					                if(lisourceoffunds=="Salary" || lisourceoffunds=="Business" || lisourceoffunds==""){
					                $('#LI_sourceoffunds').val(licivilstatus);
					                }
					                else{
					                $('#LI_sourceoffunds').val('Other');
					                $("#lisfother").css({ display: "block" });
					                }
					                
					                </script>
			<div class="col-md-4">
             <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Mobile Number</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_mobilenumber" id="LI_mobilenumber" class="form-control mytextbox"  value="<%out.print(rs.getString("li_mobilenumber")); %>"/>
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Telephone Number</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_telephonenumber" id="LI_telephonenumber" class="form-control mytextbox"  value="<%out.print(rs.getString("li_telephonenumber")); %>"/>
					  </div>
					</div>
			<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Email Address</label>
					  <div class="col-sm-8">
						<input type="text" name="LI_emailaddress" id="LI_emailaddress" class="form-control mytextbox"  value="<%out.print(rs.getString("li_emailaddress")); %>"/>
					  </div>
					</div>
                </div>
          </div><hr>
		  <div class="row">
            <div class="col-md-4"><br><br>
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Present Address</label>
					  <div class="col-sm-8">
						<textarea name="LI_presentaddress" id="LI_presentaddress" class="form-control" rows="3"><%out.print(rs.getString("li_presentaddress")); %></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_presentcountry" id="LI_presentcountry" class="form-control mytextbox"  value="<%out.print(rs.getString("li_presentcountry")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_presentzipcode" id="LI_presentzipcode" class="form-control mytextbox"  value="<%out.print(rs.getString("li_presentzipcode")); %>"/>
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
						<textarea name="LI_permanentaddress" id="LI_permanentaddress" class="form-control" rows="3"><%out.print(rs.getString("li_permanentaddress")); %></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_permanentcountry" id="LI_permanentcountry" class="form-control mytextbox"  value="<%out.print(rs.getString("li_permanentcountry")); %>" />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_permanentzipcode" id="LI_permanentzipcode" class="form-control mytextbox"  value="<%out.print(rs.getString("li_permanentzipcode")); %>" />
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
						<textarea name="LI_businessaddress" id="LI_businessaddress" class="form-control" rows="3"><%out.print(rs.getString("li_businessaddress")); %></textarea>
					  </div>
					</div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_businesscountry" id="LI_businesscountry" class="form-control mytextbox"  value="<%out.print(rs.getString("li_businesscountry")); %>"/>
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
                  <div class="col-sm-8">
                    <input type="text" name="LI_businesszipcode" id="LI_businesszipcode" class="form-control mytextbox" value="<%out.print(rs.getString("li_businesszipcode")); %>" />
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
		else if(elem.value == "samefromlifeinsured"){
		document.getElementById('p1').style.display = "block";
			
			  var surname = document.getElementById('LI_surname').value;
			  var givenname = document.getElementById('LI_givenname').value;
			  var middlename = document.getElementById('LI_middlename').value;
			  var alias = document.getElementById('LI_alias').value;
			  var gender = $('input[name=LI_gender]:checked').val();
			  var civilstatus = document.getElementById('LI_civilstatus').value;
			  var salutation = document.getElementById('LI_salutation').value;
			  var birthdate = document.getElementById('LI_birthdate').value;
			  var nationality = document.getElementById('LI_nationality').value;
			  var placeofbirth = document.getElementById('LI_placeofbirth').value;
			  var occupation = document.getElementById('LI_occupation').value;
			  var natureofwork = document.getElementById('LI_natureofwork').value;
			  var employer = document.getElementById('LI_employer').value;
			  var natureofemployer = document.getElementById('LI_natureofemployer').value;
			  var annualincome = document.getElementById('LI_annualincome').value;
			  var networth = document.getElementById('LI_networth').value;
			  var sourceoffunds = document.getElementById('LI_sourceoffunds').value;
			  var mobilenumber = document.getElementById('LI_mobilenumber').value;
			  var telephonenumber = document.getElementById('LI_telephonenumber').value;
			  var emailaddress = document.getElementById('LI_emailaddress').value;
			  var presentaddress = document.getElementById('LI_presentaddress').value;
			  var presentcountry = document.getElementById('LI_presentcountry').value;
			  var presentzipcode = document.getElementById('LI_presentzipcode').value;
			  var permanentaddress = document.getElementById('LI_permanentaddress').value;
			  var permanentcountry = document.getElementById('LI_permanentcountry').value;
			  var permanentzipcode = document.getElementById('LI_permanentzipcode').value;
			  var businessaddress = document.getElementById('LI_businessaddress').value;
			  var businesscountry = document.getElementById('LI_businesscountry').value;
			  var businesszipcode = document.getElementById('LI_businesszipcode').value;
			  
			  
			  document.getElementById('P_surname').value= surname ;
			  document.getElementById('P_givenname').value= givenname;
			  document.getElementById('P_middlename').value= middlename;
			  document.getElementById('P_alias').value= alias;
			  
			  if (gender=="Male")
			  document.getElementById('Pmale').checked= true;
			  else if (gender=="Female")
			  document.getElementById('Pfemale').checked= true;
			  
			  if (gender=="Male")
			  document.getElementById('Pmale').checked= true;
			  
			  
			  document.getElementById('P_civilstatus').value= civilstatus;
			  document.getElementById('P_salutation').value= salutation;
			  document.getElementById('P_birthdate').value= birthdate;
			  document.getElementById('P_nationality').value= nationality;
			  document.getElementById('P_placeofbirth').value= placeofbirth;
			  document.getElementById('P_occupation').value= occupation;
			  document.getElementById('P_natureofwork').value= natureofwork;
			  document.getElementById('P_employer').value= employer;
			  document.getElementById('P_natureofemployer').value= natureofemployer;
			  document.getElementById('P_annualincome').value= annualincome;
			  document.getElementById('P_networth').value= networth;
			  document.getElementById('P_sourceoffunds').value= sourceoffunds;
			  document.getElementById('P_mobilenumber').value= mobilenumber;
			  document.getElementById('P_telephonenumber').value= telephonenumber;
			  document.getElementById('P_emailaddress').value= emailaddress;
			  document.getElementById('P_presentaddress').value= presentaddress;
			  document.getElementById('P_presentcountry').value= presentcountry;
			  document.getElementById('P_presentzipcode').value= presentzipcode;
			  document.getElementById('P_permanentaddress').value= permanentaddress;
			  document.getElementById('P_permanentcountry').value= permanentcountry;
			  document.getElementById('P_permanentzipcode').value= permanentzipcode;
			  document.getElementById('P_businessaddress').value= businessaddress;
			  document.getElementById('P_businesscountry').value= businesscountry;
			  document.getElementById('P_businesszipcode').value= businesszipcode;
  
		}
		else{
		document.getElementById('p1').style.display = "none";
		
		}
		}
		
		function p_csother(elem){
		if(elem.value == "Other"){
		document.getElementById('pcsother').style.display = "block";
		}
		else{
		document.getElementById('pcsother').style.display = "none";
		}
		}
		
		function p_sfother(elem){
		if(elem.value == "Other"){
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
				  <option value="samefromlifeinsured">Policyowner is same from the Life Insured</option>
				  <%
			try{ 
				String query2 = "SELECT p_id, CONCAT (p_givenname,' ',p_middlename,' ',p_surname) as Name FROM policyowner_details";
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery(query2);
				while(rs2.next())
				{
			%>
                  <option value="<%out.print(rs2.getInt("p_id")); %>"><%out.print(rs2.getString("Name")); %></option>
                  <%
                  }
            rs2.close();
            stmt2.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
                </select>
              </div>
            </div>
            <script>
					                var pid = "<%out.print(rs.getInt("p_id")); %>";
					                if(pid==null){
					                $('#p_preexist').val('');
					                }
					                else{
					                $('#p_preexist').val(pid);
					                }
					                
					                </script>
		</div></div>
        <div class="panel-body" id="p1" style="display:none;">
          <div class="row">
            <div class="col-md-4">
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
                </div><br>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Other Name / Alias</label>
                  <div class="col-sm-8">
                    <input type="text" name="P_alias" id="P_alias" class="form-control mytextbox" />
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
						<input type="text" name="P_nationality" id="P_nationality" class="form-control mytextbox" />
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
						<input type="text" name="P_annualincome" id="P_annualincome" class="form-control mytextbox" />
					  </div>
					</div>
					<div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Net Worth</label>
					  <div class="col-sm-8">
						<input type="text" name="P_networth" id="P_networth" class="form-control mytextbox" />
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
 	  
                  </div>
                  <div class="tab-pane" id="beneficiary">
                    <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Details of Beneficial Owner</h4>
        </div>
		<script type="text/javascript">
				function BoYes(val){
				 var element=document.getElementById('p2');
				 if(val=='Yes')
					 element.style.display='block';
				 else  
					 element.style.display='none';
					 document.getElementById('BO_name').value = "";
					 document.getElementById('BO_contactnumber').value = "";
				}
				</script>
		<div class="panel-body">
		<div class="row">
					<div class="col-md-3"></div>
					<label class="col-sm-4 control-label mylabel" >Tick yes if the Beneficial Owner details are provided.</label>
					<div class="rdio rdio-default col-md-1">
								<input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
								<label class="control-label mylabel" for="yes">Yes</label>
							  </div>
					<div class="rdio rdio-default col-md-1">
								<input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');"/>
								<label class="control-label mylabel" for="no">No</label>
							  </div>
					</div></div>
        <div class="panel-body" id="p2" style="display:none;">
          <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-8">
          
            <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="BO_name" id="BO_name" class="form-control mytextbox" value="<%out.print(rs.getString("bo_name")); %>"/>
                  </div>
                </div>
			<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Contact Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="BO_contactnumber" id="BO_contactnumber" class="form-control mytextbox" value="<%out.print(rs.getString("bo_contactnumber")); %>" />
                  </div>
                </div>
                <script>
					                var boname = "<%out.print(rs.getString("bo_name")); %>";
					                var bocontactnumber = "<%out.print(rs.getString("bo_contactnumber")); %>";
					                
					                if(boname=="" || boname==null && bocontactnumber=="" || bocontactnumber==null ){
					                 document.getElementById("no").checked = true;
					                }
					                else{
					                 document.getElementById("yes").checked = true;
					                 document.getElementById("p2").style.display = 'block';
					                }
					                
					                </script>
          </div>
          </div>
        </div><!-- panel-body -->
      </div><!-- panel -->
	  
	  <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Beneficiary</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4 myfg">
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_name" id="PB_name" class="form-control mytextbox"  value="<%out.print(rs.getString("pb_name")); %>"/>
                  </div>
					</div>
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="PB_birthdate" value="<%out.print(rs.getString("pb_birthdate")); %>">
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
                      <script>
					                var pbgender = "<%out.print(rs.getString("pb_gender")); %>";
					                
					                if(pbgender=="Male"){
					                 document.getElementById("PBmale").checked = true;
					                }
					                else if(pbgender=="Female"){
					                 document.getElementById("PBfemale").checked = true;
					                }
					                
					                </script>
					  <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
						  <div class="col-sm-8">
							<textarea name="PB_placeofbirth" id="PB_placeofbirth" class="form-control" rows="4"><%out.print(rs.getString("pb_placeofbirth")); %></textarea>
						  </div>
						</div>
                </div>
			<div class="form-group col-md-4 myfg">
                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Nationality</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_nationality" id="PB_nationality" class="form-control mytextbox" value="<%out.print(rs.getString("pb_nationality")); %>"/ />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Relationship to Insured</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_reltoinsured" id="PB_reltoinsured" class="form-control mytextbox" value="<%out.print(rs.getString("pb_reltoinsured")); %>"/ />
                  </div>
                </div>
				<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">% Share</label>
                  <div class="col-sm-8">
                    <input type="text" name="PB_share" id="PB_share" class="form-control mytextbox" value="<%out.print(rs.getString("pb_share")); %>"/ />
                  </div>
                </div>
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Type of Beneficiary</label>
                        <div class="col-sm-8">
                          <select class="select1" name="PB_typeofbeneficiary" id="PB_typeofbeneficiary" onchange="p_csother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Primary">Primary</option>
                            <option value="Secondary">Secondary</option>
                          </select>
                        </div>
                      </div>
                      <script>
					                var pbtypeofbeneficiary = "<%out.print(rs.getString("pb_typeofbeneficiary")); %>";
					                
					                $('#PB_typeofbeneficiary').val(pbtypeofbeneficiary);
					                
					                </script>
				<div class="form-group myfg">
                        <label class="col-sm-4 mylabel"align="right">Beneficiary Designation</label>
                        <div class="col-sm-8">
                          <select class="select1" name="PB_beneficiarydesignation" id="PB_beneficiarydesignation"  onchange="p_csother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Revocable">Revocable</option>
                            <option value="Irrevocable">Irrevocable</option>
                          </select>
                        </div>
                      </div>
                       <script>
					                var pbbeneficiarydesignation = "<%out.print(rs.getString("pb_beneficiarydesignation")); %>";
					                
					                $('#PB_beneficiarydesignation').val(pbbeneficiarydesignation);
					                
					                </script>
                </div>
				
			<div class="form-group col-md-4 myfg">
                  <div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Address</label>
						  <div class="col-sm-8">
							<textarea name="PB_presentaddress" id="PB_presentaddress" class="form-control" rows="4"><%out.print(rs.getString("pb_presentaddress")); %></textarea>
						  </div>
						</div>
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
						  <div class="col-sm-8">
							<input type="text" name="PB_country" id="PB_country" class="form-control mytextbox" value="<%out.print(rs.getString("pb_country")); %>"/ />
						  </div>
						</div>
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Zip Code</label>
						  <div class="col-sm-8">
							<input type="text" name="PB_zipcode" id="PB_zipcode" class="form-control mytextbox" value="<%out.print(rs.getString("pb_zipcode")); %>"/ />
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
                          <select class="select1"  name="PI_planname" id="PI_planname" onchange="p_csother(this)">
                            <option value="" selected>Choose...</option>
                             <%
			try{ 
				String query3 = "SELECT plan_id, plan_name FROM plan_details";
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
                      <script>
					                var planid = "<%out.print(rs.getInt("pi_ref_plan_id")); %>";
					                if(planid==null){
					                $('#PI_planname').val("");
					                }
					                else{
					                $('#PI_planname').val(planid);
					                }
					                
					                </script>
			<div class="form-group col-md-4">
                  <label class="col-sm-4 control-label mylabel" align="right">Sum Assured</label>
                  <div class="input-group col-md-8"  style="padding-left: 10px; padding-right: 10px;">
						  <input type="text" class="form-control mytextbox" name="PI_sumassured" id="PI_sumassured" value="<%out.print(rs.getString("pi_sumassured")); %>"/>
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
            <div class="form-group col-md-3">
                  <div class="form-group">
						  <label class="col-sm-5 control-label mylabel" align="right">Annualized Premium</label>
						  <div class="col-sm-7">
							<input type="text" name="PI_annualizedpremium" id="PI_annualizedpremium" class="form-control mytextbox" value="<%out.print(rs.getString("pi_annualizedpremium")); %>"/>
						  </div>
						</div>
                </div>
				<div class="form-group col-md-3">
						<div class="form-group">
						  <label class="col-sm-5 control-label mylabel" align="right">Initial Premium Paid</label>
						  <div class="col-sm-7">
							<input type="text" name="PI_initialpremiumpaid" id="PI_initialpremiumpaid" class="form-control mytextbox" value="<%out.print(rs.getString("pi_initialpremiumpaid")); %>" />
						  </div>
						</div>
                </div>
			<div class="form-group col-md-3">
                        <label class="col-sm-4 mylabel" align="right">Mode of Payment</label>
                        <div class="col-sm-8">
                          <select class="select1" onchange="p_csother(this)" name="PI_modeofpayment" id="PI_modeofpayment">
                            <option value="" selected>Choose...</option>
                            <option value="Annual">Annual</option>
                            <option value="Semi-annual">Semi-annual</option>
							<option value="Quarterly">Quarterly</option>
							<option value="Monthly">Monthly</option>
                          </select>
                        </div>
                      </div>
                       <script>
					                var pimodeofpayment = "<%out.print(rs.getString("pi_modeofpayment")); %>";
					                $('#PI_modeofpayment').val(pimodeofpayment);
					                
					                </script>
			<div class="form-group col-md-3">
                        <label class="col-sm-4 mylabel" align="right">Method of Payment</label>
                        <div class="col-sm-8">
                          <select class="select1" onchange="p_csother(this)" name="PI_methodofpayment" id="PI_methodofpayment">
                            <option value="" selected>Choose...</option>
                            <option value="Cash">Cash</option>
                            <option value="Check">Check</option>
							<option value="Post-dated Check">Post-dated Check</option>
							<option value="Credit Card">Credit Card</option>
							<option value="Auto-debit Arrangement">Auto-debit Arrangement</option>
                          </select>
                        </div>
                      </div>
                      <script>
					                var pimethodofpayment = "<%out.print(rs.getString("pi_methodofpayment")); %>";
					                $('#PI_methodofpayment').val(pimethodofpayment);
					                
					                </script>
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
						  <input type="text" class="form-control mytextbox" id="PI_benefit_amount1"  name="PI_Amount" disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount2" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount3" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount4" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount5" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount6" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount7" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount8" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount9" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount10" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount11" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount12" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount13" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount14" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount15" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount16" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
					  <div class="form-group myfm">
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
						  <input type="text" class="form-control mytextbox"  id="PI_benefit_amount17" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
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
						  <input type="text" class="form-control mytextbox"  id="PI_variable_amount1" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_variable_amount2"  name="PI_Amount" disabled />
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
						  <input type="text" class="form-control mytextbox" id="PI_hospital_amount2" name="PI_Amount"  disabled/>
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
						  <input type="text" class="form-control mytextbox" id="PI_hospital_amount3" name="PI_Amount"   disabled/>
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
						  <input type="text" class="form-control mytextbox" id="PI_hospital_amount4" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                </div>
			<div class="form-group col-md-4">
                  <div class="form-group myfm">
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
						  <input type="text" class="form-control mytextbox"  id="PI_hospital_amount5" name="PI_Amount"  disabled/>
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount1" name="PI_Amount"   disabled/>
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount2" name="PI_Amount"   disabled/>
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
						  <input type="text" class="form-control mytextbox"  id="PI_personal_amount3" name="PI_Amount"   disabled/>
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount4" name="PI_Amount"  disabled />
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount5" name="PI_Amount"  disabled />
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount6" name="PI_Amount"  disabled />
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount7" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
                  <div class="form-group myfm">
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
						  <input type="text" class="form-control mytextbox" id="PI_personal_amount8" name="PI_Amount"  disabled />
						  <span class="input-group-addon myspan1">.00</span>
						</div>
                      </div>
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
    <%		}
            rs.close();
            stmt.close();
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
		
			var AF_applicationnumber = $('#AF_applicationnumber').val();
			var AF_clientnumber = $('#AF_clientnumber').val();
			var AF_dateapplied = $('#AF_dateapplied').val();
		
			var AI_name = $('#AI_name').val();
			var AI_code = $('#AI_code').val();
			var AI_branch = $('#AI_branch').val();
			
			var p_preexist = $('#tryme').val();
			
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
			var P_alias = $('#P_alias').val();
			
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
			
			var PI_planname = $('#PI_planname').val();
			var PI_sumassured = $('#PI_sumassured').val();
			var PI_annualizedpremium = $('#PI_annualizedpremium').val();
			var PI_initialpremiumpaid = $('#PI_initialpremiumpaid').val(); 
			var PI_modeofpayment = $('#PI_modeofpayment').val();
			var PI_methodofpayment = $('#PI_methodofpayment').val();
			
			var LI_gender = $('input[name=LI_gender]:checked').val();
			var P_gender = $('input[name=P_gender]:checked').val();
			var PB_gender = $('input[name=PB_gender]:checked').val();
			
			var LI_birthdate = $('#LI_birthdate').val();
			var P_birthdate = $('#P_birthdate').val();
			var PB_birthdate = $('#PB_birthdate').val();
			
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
					AF_applicationnumber:AF_applicationnumber,
					AF_clientnumber:AF_clientnumber,
					AF_dateapplied:AF_dateapplied,
					
					AI_name:AI_name,
					AI_code:AI_code,
					AI_branch:AI_branch,
					
					p_preexist:p_preexist,
					
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
					P_givenname:P_givenname,
					P_middlename:P_middlename,
					P_alias:P_alias,
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
					P_reltolifeinsured:P_reltolifeinsured,
					
					BO_name:BO_name,
					BO_contactnumber:BO_contactnumber,
					
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
					
					PI_planname:PI_planname,
					PI_sumassured:PI_sumassured,
					PI_annualizedpremium:PI_annualizedpremium,
					PI_initialpremiumpaid:PI_initialpremiumpaid,
					PI_modeofpayment:PI_modeofpayment,
					PI_methodofpayment:PI_methodofpayment,
					
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
		
		$("#btnMarkAsCompleted").click(function() {
		
			var clientid = $('#clientid').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					clientid:clientid
					
				},
				url:'updateformcompleted',
				success: function(result){
					
					swal("Success!", "Application Completed!", "success");
					setTimeout(location.reload.bind(location), 4000);
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
