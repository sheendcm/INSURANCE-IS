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
  <link href="css/jquery.datatables.css" rel="stylesheet">
  <link rel="stylesheet" href="css/bootstrap-timepicker.min.css" />
  

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
<%		int userid=0;
		if (session != null) {
			if (session.getAttribute("e_id") != null) {
				userid = (Integer) session.getAttribute("e_id");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	%>
	
<section>
  
  <div class="leftpanel">
    <%
			try{ 
				String query5 = "SELECT COUNT(cs_id) as countme FROM t_claim_status_details cs LEFT JOIN r_claim_legal_status_details cls ON cls.cls_id=cs.cs_ref_cls_id LEFT JOIN r_claim_approval_status_details cas ON cas.cas_id=cs.cs_ref_cas_id WHERE cls.cls_completion='Completed' AND cas.cas_completion='Pending' ";
				Statement stmt5 = conn.createStatement();
				ResultSet rs5 = stmt5.executeQuery(query5);
				while(rs5.next())
				{
				
			%>
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> CLAIMING DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="claim-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="nav-parent nav-active active"><a href=""><i class="fa fa-pencil"></i> <span>Claim Form</span></a>
          <ul class="children" style="display: block">
            <li class="active"><a href="claim-death-claim-form.jsp"><i class="fa fa-caret-right"></i> Death Claim</a></li>
            <li><a href="claim-critical-illness-form.jsp"><i class="fa fa-caret-right"></i> Critical Illness</a></li>
            <li><a href="claim-accident-form.jsp"><i class="fa fa-caret-right"></i> Accident Claim</a></li>
          </ul>
        </li>
        <li><a href="claim-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
		<li><a href="claim-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Claim Evaluation</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Claim</span></a>
          <ul class="children">
            <li><a href="claim-approved-claim-view.jsp"><i class="fa fa-caret-right"></i> Issued Claim</a></li>
            <li><a href="claim-declined-claim-view.jsp"><i class="fa fa-caret-right"></i> Declined Claim</a></li>
          </ul>
        </li>
        <li><a href="claim-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
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
      <h2><i class="fa fa-pencil"></i> Claimant Statement <span>Death Claim</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Claiming Department</a></li>
          <li><a href="#">Claim Form</a></li>
          <li class="active">Death Claim</li>
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
            </div>
            
            <div class="col-md-4" align="right">
                  <button class="btn btn-primary mybutton1" id="btnDeathClaimSave" style="margin-right:10px;"> Save</button>
                </div>
            </div>
</div>

            <div class="panel-body panel-body-nopadding">

              <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard">

                <ul class="nav nav-pills nav-justified">
                  <li class="active"><a href="#basicinfo" data-toggle="tab"> Claiming Information</a></li>
                  <li><a href="#death" data-toggle="tab"> Death Details</a></li>
                  <li><a href="#hospitalization" data-toggle="tab"> Hospitalization Details</a></li>
                </ul>

        <div class="tab-content">
        <div class="tab-pane" id="death">
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Death Details</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            
                <div class="form-group col-md-6 myfg">
				 <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Cause of Death</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_deathcause" id="DCHD_deathcause" class="form-control mytextbox" />
                  </div>
					</div>
					
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Place of Death</label>
						  <div class="col-sm-8">
							<input type="text" name="DCHD_deathplace" id="DCHD_deathplace" class="form-control mytextbox" />
						  </div>
						</div>
                </div>
			<div class="form-group col-md-6 myfg">
				  
					<div class="form-group myfg" style="margin-bottom:0px;">
					  <label class="col-sm-4 control-label mylabel" align="right">Date and Time of Death</label>
					  <div class="col-md-8">
					  <div class="col-md-12" style="padding:0px; margin-bottom:5px;">
					  	<div class="input-group">
							<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="DCHD_datedeath">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
					  </div>
					  <div class="col-md-12" style="padding:0px;">
					  <div class="input-group mb15">
		                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
		                <div class="bootstrap-timepicker"><input id="timepicker" type="text" class="form-control" id="DCHD_timedeath"/></div>
		              </div>
					  </div>
					  </div>
				  
					</div>
                </div>

			
          </div><hr>
		  <div class="row">
		  <div class="col-md-6">
		  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Doctor Certifying Death</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_doctorname" id="DCHD_doctorname" class="form-control mytextbox" />
                  </div>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Contact Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_doctornumber" id="DCHD_doctornumber" class="form-control mytextbox" />
                  </div>
                </div>
                <div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Address</label>
              <div class="col-sm-8">
                <textarea name="DCHD_doctoraddress" id="DCHD_doctoraddress" class="form-control" rows="4"></textarea>
              </div>
            </div>
		  </div>
		  <div class="col-md-6">
		   <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Medical Attendant During Last Illness</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_medattendantname" id="DCHD_medattendantname" class="form-control mytextbox" />
                  </div>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Contact Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_medattendantnumber" id="DCHD_medattendantnumber" class="form-control mytextbox" />
                  </div>
                </div>
                <div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Address</label>
              <div class="col-sm-8">
                <textarea name="DCHD_medattendantaddress" id="DCHD_medattendantaddress" class="form-control" rows="4"></textarea>
              </div>
            </div>
		  </div>
		  </div>
            
			<hr>
		 <div class="row">
						<div class="col-md-2"></div>
					<label class="col-sm-4 control-label mylabel" >Was the deceased buried? or cremated?</label>
					<div class="rdio rdio-default col-md-2">
								<input type="radio" id="yes" value="Buried" name="HDquestionone" onclick="BoYes('Yes');"/>
								<label for="yes" style="font-size:90%;">Buried</label>
							  </div>
					<div class="rdio rdio-default col-md-2">
								<input type="radio" value="Cremated" id="no" name="HDquestionone" onclick="BoYes('No');"/>
								<label for="no" style="font-size:90%;">Cremated</label>
							  </div>

						</div>
</div>
                  </div>
        </div>
            <div class="tab-pane active" id="basicinfo">
				<div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
				<div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
				<div class="panel-btns">
					<a href="" class="minimize">&minus;</a>
				</div>
					<h4 class="panel-title" style="font-size:90%;">Policy Information</h4>
				</div>

		<div class="panel-body">
		  <div class="row">
          <div class="col-md-1"></div>

          <div class="col-md-8">
           <div class="form-group myfg">
                <label class="col-sm-4 control-label mylabel" align="right">Policy Number</label>
                  <div class="col-sm-8">
                    <select class="select2 mytextbox col-sm-12" style="font-size:85%;padding-left:7px;padding-top:7px;"  id="policyid" name="policyid" >
                  <option value="" selected>Choose here ...</option>
				  <%
			try{ 
				String query4 = "select * from t_policy_details";
				Statement stmt4 = conn.createStatement();
				ResultSet rs4 = stmt4.executeQuery(query4);
				while(rs4.next())
				{
			%>
                  <option value="<%out.print(rs4.getInt("pol_id")); %>">0000<%out.print(rs4.getInt("pol_id")); %></option>
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
          </div>
        </div><!-- panel-body -->
        </div>

			<div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
			<div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
			<div class="panel-btns">
				<a href="" class="minimize">&minus;</a>
			</div>
				<h4 class="panel-title" style="font-size:90%;">Claimants' Information</h4>
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
                <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCPI_decname" id="DCPI_decname" class="form-control mytextbox" />
                  </div>
           </div>
           
		   <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Birthdate</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="DCPI_birthdate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
		   <div class="form-group myfg">
                <label class="col-sm-4 control-label mylabel" align="right">Place of Birth</label>
                  <div class="col-sm-8">
                    <textarea name="DCPI_placeofbirth" id="DCPI_placeofbirth" class="form-control" rows="4"></textarea>
                  </div>
           </div>

       </div>
		 <div class="col-md-4">
           <div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Gender</label>
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="DCPImale" value="Male" name="DCPI_gender">
                            <label for="DCPImale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="DCPIfemale" name="DCPI_gender">
                            <label for="DCPIfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group myfg">
                        <label class="col-sm-4 mylabel" align="right">Civil Status</label>
                        <div class="col-sm-8">
                          <select class="select1 col-sm-12" id="DCPI_civilstatus" name="DCPI_civilstatus" onchange="li_csother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Other">Others</option>
                          </select>
                        </div>
                      </div>
					<div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Relationship to the Policyowner</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCPI_relation" id="DCPI_relation" class="form-control mytextbox" />
                  </div>
                </div>
					
					

						</div>
			<div class="col-md-4">
			
             
                      <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Citizenship</label>
					  <div class="col-sm-8">
						<input type="text" name="DCPI_citizenship" id="DCPI_citizenship" class="form-control mytextbox" />
					  </div>
					</div>
			
					  <div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Address</label>
              <div class="col-sm-8">
                <textarea name="DCPI_piaddress" id="DCPI_piaddress" class="form-control" rows="4"></textarea>
              </div>
            </div>

                  <div class="form-group myfg">
                  <label class="col-sm-4 control-label mylabel" align="right">Country</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCPI_country" id="DCPI_conutry" class="form-control mytextbox" />
                  </div>
                </div>

                </div>
                </div>
          </div>

        

                </div>
				</div>


    <div class="tab-pane" id="hospitalization">


	   <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading"  style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Hospitalization Details</h4>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="form-group col-md-4 myfg">
				  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Hospital Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="DCHD_hospitalname" id="DCHD_hospitalname" class="form-control mytextbox" />
                  </div>
					</div><br>
          <div class="form-group myfg">
              <label class="col-sm-4 control-label mylabel" align="right">Hospital Address</label>
              <div class="col-sm-8">
                <textarea name="DCHD_hospitaladdress" id="DCHD_hospitaladdress" class="form-control" rows="4"></textarea>
              </div>
            </div>

                </div>
			<div class="form-group col-md-4 myfg">
              <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Date of Admission</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="DCHD_admissiondate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
          <div class="form-group myfg">
          <label class="col-sm-4 control-label mylabel" align="right">Admission Number</label>
          <div class="col-sm-8">
            <input type="text" name="DCHD_admissionnum" id="DCHD_admissionnum" class="form-control mytextbox" />
          </div>
        </div>
        <div class="form-group myfg">
        <label class="col-sm-4 control-label mylabel" align="right">Days of Confinement</label>
        <div class="col-sm-8">
          <input type="text" name="DCHD_daysconfine" id="DCHD_daysconfine" class="form-control mytextbox" />
        </div>
      </div>

                </div>

			<div class="form-group col-md-4 myfg">
                  <div class="form-group myfg">
					  <label class="col-sm-4 control-label mylabel" align="right">Date of Discharge</label>
					  <div class="input-group" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="DCHD_dischargedate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
					</div>
						<div class="form-group myfg">
						  <label class="col-sm-4 control-label mylabel" align="right">Ward/Room Number</label>
						  <div class="col-sm-8">
							<input type="text" name="DCHD_wardnum" id="DCHD_wardnum" class="form-control mytextbox" />
						  </div>
						</div>
            <div class="form-group myfg">
            <label class="col-sm-4 control-label mylabel" align="right">Final Diagnosis</label>
            <div class="col-sm-8">
              <input type="text" name="DCHD_diagnosis" id="DCHD_diagnosis" class="form-control mytextbox" />
            </div>
          </div>

                </div>
          </div>
        </div>
      </div>
		
	</div>
                <div class="tab-pane" id="beneficiaryclaimant">
                    <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top:5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Mode of Release Option</h4>
        </div>

      </div><!-- panel -->



                </div><!-- tab-content -->

                <ul class="pager wizard">
                    <li class="previous"><a href="javascript:void(0)">Previous</a></li>
                    <li class="next"><a href="javascript:void(0)">Next</a></li>
                  </ul>

              </div><!-- #basicWizard -->

            </div><!-- panel-body -->
          </div><!-- panel -->
 </div><!-- panel -->
  </div>
   </div>
    </div>
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
        </div><!-- main panel -->

  
</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>


<script src="js/bootstrap-timepicker.min.js"></script>
<script src="js/jquery.datatables.min.js"></script>
<script src="js/select2.min.js"></script>

<script src="js/custom.js"></script>
<script>
  jQuery(document).ready(function() {
    
    "use strict";
    
    jQuery('#table1').dataTable();
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
    });
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
  
    // Select1
  jQuery(".select1").select2({
    width: '100%',
    minimumResultsForSearch: -1
  });
    
    jQuery('select').removeClass('form-control');
    
    jQuery('#DCPI_birthdate').datepicker();
    jQuery('#DCHD_admissiondate').datepicker();
    jQuery('#DCHD_dischargedate').datepicker();
    jQuery('#DCHD_datedeath').datepicker();
    jQuery('#DCH_firstconsultation').datepicker();
    jQuery('#DCH_firstcomplaint').datepicker();
    
    // Delete row in a table
    jQuery('.delete-row').click(function(){
      var c = confirm("Continue delete?");
      if(c)
        jQuery(this).closest('tr').fadeOut(function(){
          jQuery(this).remove();
        });
        
        return false;
    });
    
    // Show aciton upon row hover
    jQuery('.table-hidaction tbody tr').hover(function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
    },function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
    });
  
      // Time Picker
  jQuery('#timepicker').timepicker({defaultTIme: false});
  jQuery('#timepicker2').timepicker({showMeridian: false});
  jQuery('#timepicker3').timepicker({minuteStep: 15});
  
  });
</script>
<script>
$(document).ready(function (){
		
			$("#btnDeathClaimSave").click(function() {
			
			var sud_id = $('#sud_id').val();
			var policyid = $('#policyid').val();
			var DCHD_deathcause = $('#DCHD_deathcause').val();
			var DCHD_datedeath = $('#DCHD_datedeath').val();
			var DCHD_timedeath = $('#DCHD_timedeath').val();
			var DCHD_deathplace = $('#DCHD_deathplace').val();
			var DCHD_doctorname = $('#DCHD_doctorname').val();
			var DCHD_doctornumber = $('#DCHD_doctornumber').val();
			var DCHD_doctoraddress = $('#DCHD_doctoraddress').val();
			var DCHD_medattendantname = $('#DCHD_medattendantname').val();
			var DCHD_medattendantnumber = $('#DCHD_medattendantnumber').val();
			var DCHD_medattendantaddress = $('#DCHD_medattendantaddress').val();
			
			var DCHD_hospitalname = $('#DCHD_hospitalname').val();
			var DCHD_hospitaladdress = $('#DCHD_hospitaladdress').val();
			var DCHD_admissiondate = $('#DCHD_admissiondate').val();
			var DCHD_admissionnum = $('#DCHD_admissionnum').val();
			var DCHD_daysconfine = $('#DCHD_daysconfine').val();
			var DCHD_dischargedate = $('#DCHD_dischargedate').val();
			var DCHD_wardnum = $('#DCHD_wardnum').val();
			var DCHD_diagnosis = $('#DCHD_diagnosis').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					policyid:policyid,
					DCHD_deathcause:DCHD_deathcause,
					DCHD_datedeath:DCHD_datedeath,
					DCHD_timedeath:DCHD_timedeath,
					DCHD_deathplace:DCHD_deathplace,
					DCHD_doctorname:DCHD_doctorname,
					DCHD_doctornumber:DCHD_doctornumber,
					DCHD_medattendantname:DCHD_medattendantname,
					DCHD_medattendantnumber:DCHD_medattendantnumber,
					DCHD_medattendantaddress:DCHD_medattendantaddress,
					
					DCHD_hospitalname:DCHD_hospitalname,
					DCHD_hospitaladdress:DCHD_hospitaladdress,
					DCHD_admissiondate:DCHD_admissiondate,
					DCHD_admissionnum:DCHD_admissionnum,
					DCHD_daysconfine:DCHD_daysconfine,
					DCHD_dischargedate:DCHD_dischargedate,
					DCHD_wardnum:DCHD_wardnum,
					DCHD_diagnosis:DCHD_diagnosis
					
				},
				url:'deathclaiminsert',
				success: function(result){
					
					swal("Success!", "Claim Form Inserted!", "success");
					setTimeout(location.reload.bind(location), 2000);
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
