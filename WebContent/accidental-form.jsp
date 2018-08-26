<%@page import="java.sql.*"%>
<%@page import="db.Conn" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous">
</script>
<meta charset="ISO-8859-1">
  <link rel="shortcut icon" href="images/prulifelogo.png" type="image/png">
<title>Pru Life UK - Accidental</title>

<link href="css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>
<%-- <% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failed");
	else
		out.print("success");
%> --%>

<section>
  
  <div class="leftpanel" >
  
    <div class="logopanel" >
    	<img src="images/prulife.png" alt="" />
  	</div><!-- logopanel -->
    
  <div class="leftpanelinner" style="padding-top:30px; ">     
      
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="death-claim-form.jsp"><i class="fa fa-edit"></i> <span>Death Claim</span></a></li>
        <li><a href="critical-illness-form.jsp"><i class="fa fa-edit"></i> <span>Critical Illness</span></a></li>
        <li class="active"><a href="accidental-form.jsp" style="background-color: #DB241E;"><i class="fa fa-edit"></i> <span>Accidental ..</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list-alt"></i> <span>List of Claim</span></a>
          <ul class="children">
            <li><a href="death-claim-view.jsp"><i class="fa fa-caret-right"></i> Death Claim</a></li>
            <li><a href="critical-illness-view.jsp"><i class="fa fa-caret-right"></i> Critical Illness</a></li>
            <li><a href="accidental-view.jsp"><i class="fa fa-caret-right"></i> Accidental ..</a></li>
          </ul>
        </li>
      </ul>

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
                John Doe
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>
        </ul>
        
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
    
    <div class="contentpanel">
      
      <div class="row">
          
          <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:60px; padding:20px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">ACCIDENTAL ..</h4>
            </div>
			
			<div class="panel-body">
            </div>
            
            <div class="panel-body panel-body-nopadding">
              
              <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard">
                
                <ul class="nav nav-pills nav-justified">
                  <li><a href="#agentinformation" data-toggle="tab" style="font-size:85%;">Agent Information</a></li>
                  <li><a href="#lifeinsured" data-toggle="tab" style="font-size:85%;">Policy Information</a></li>
				  <li><a href="#beneficialowner" data-toggle="tab" style="font-size:85%;">Insured Information</a></li>
				  <li><a href="#beneficiaries" data-toggle="tab" style="font-size:85%;">Hospitalization Details</a></li>
				  <li><a href="#policyinfo" data-toggle="tab" style="font-size:85%;">Health HIstory</a></li>
				  <li><a href="#questionnaire" data-toggle="tab" style="font-size:85%;">Mode of Release</a></li>
				  <li><a href="#save" data-toggle="tab" style="font-size:85%;"><span>Submit</span></a></li>
                </ul>
                
                <form class="form" id="">  
                
                <div class="tab-content">
                  <div class="tab-pane" id="save">
                  <div class="row">
                  <div class="col-md-3"></div>
                  <div class="col-md-6">
                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">SAVE</h4>
            </div>
			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
					<div class="col-md-2"></div>
				<div class="col-md-8" style="padding:0;">
				<div class="ckbox ckbox-default" style="margin-left:20px;">
                        <input type="checkbox" value="1" id="PI_agreepolicy" required/>
                            <label for="PI_agreepolicy" style="font-size:85%;">The form is completed and signed.</label>
                 </div><br>
                 		<div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;padding-right:0px;">Date form is signed</label>
                        <div class="col-sm-7" style="padding-left:0px">
                          <div class="input-group ">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="AF_dateapplied" required>
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div><br><br>
                 <a class="btn btn-primary" id="btnSubmitAF" style="font-size:12px; background-color:#db241e; border-color:#db241e; padding:0px,10px; margin-left:120px;">Save</a><br><br>
                 </div>
                 <div class="col-md-2"></div>
			 </div>
			 </div>
                  </div>
                  <div class="col-md-3"></div>
                  </div>
                  

                  </div>
                  <div class="tab-pane active" id="agentinformation">
				  <div class="row"><br>
				  <div class="col-md-3"></div>
				  <div class="col-md-5">
				  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">AGENT INFORMATION</h4>
            </div>
			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
							
                      <div class="form-group"> <br> 
                        <label class="col-sm-4 control-label" style="font-size:85%;">Agent Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_name" id="AI_name" class="form-control input-sm mb15" style=""/>
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Mobile Number</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_code" id="AI_code" class="form-control input-sm mb15" />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Email Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_branch" id="AI_branch" class="form-control input-sm mb15"/>
                        </div>
                      </div>
			 </div>
			 </div>
					  </div>
					 <div class="col-md-4"></div>
					 </div><br>
                  </div>
                  <div class="tab-pane" id="lifeinsured">
                  <div class="row"><br>
                  <div class="col-md-1"></div>
                  <div class="col-md-10">
                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">POLICY INFORMATION</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <br>
            <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Policy Number</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_surname" id="LI_surname" class="form-control input-sm mb15"  required/>
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Name of Policyowner</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_givenname" id="LI_givenname" class="form-control input-sm mb15"  required />
                        </div>
                      </div>
					  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 
				
			
						
			 </div>
			 </div>

                  </div>
                  <div class="col-md-1"></div>
                  </div>
                <div class="row">
                
               
                </div>

                  </div>
                  
                  
                  <div class="tab-pane" id="beneficialowner">
				  <div class="row"><br>
				  <div class="col-md-1">
				  </div>
				  <div class="col-md-10">
				                    <div class="panel panel-default">
           <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">INSURED INFORMATION</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <br>
					  <div class="row">
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Name of Insured</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_surname" id="LI_surname" class="form-control input-sm mb15"  required/>
                        </div>
                      </div>
				  </div>
				  <div class="col-md-5" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Relationship to the Policyowner</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_givenname" id="LI_givenname" class="form-control input-sm mb15"  required />
                        </div>
                      </div>
					  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date of Birth</label>
                        <div class="col-sm-8">
                          <div class="input-group ">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="LI_birthdate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div>
				  </div>
				  <div class="col-md-2" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Age</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_age" id="LI_age" class="form-control input-sm mb15"/>
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Gender</label>
                        <div class="col-sm-7">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="LImale" value="Male" name="LI_gender" required/>
                      <label for="LImale" style="font-size:85%;">Male</label>
                    </div><!-- rdio -->
                       <div class="rdio rdio-primary">
                      <input type="radio" value="Female" id="LIfemale" name="LI_gender" required/>
                      <label for="LIfemale" style="font-size:85%;">Female</label>
                    </div><!-- rdio -->
                    <label class="error" for="LI_gender"></label>
                        </div>
                      </div>
				  </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				 <div class="row">
				 <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 0px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Civil Status</label>
					  <div class="col-sm-7">
					  <select class="form-control input-sm mb15" id="LI_civilstatus" name="LI_civilstatus" onchange="LICivilStatus(this.value);" required>
		                  <option selected></option>
		                  <option value="Single">Single</option>
		                  <option value="Married">Married</option>
		                  <option value="Others">Others</option>
		                </select>
                      </div>
				  </div>
				  <div class="form-group"  id="LIcivilstatusothers" style="display:none;">
				         <label class="col-sm-5 control-label" style="font-size:85%;"></label>
					  <div class="col-sm-7">
                          <input type="text" name="LI_civilstatusother" id="LI_civilstatusother" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Birth</label>
                        <div class="col-sm-9">
                          <input type="text" name="LI_placeofbirth" id="LI_placeofbirth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Citizenship</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_tinsssgsis" id="LI_tinsssgsis" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
                      
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-2 control-label" style="font-size:85%;">Present Address</label>
                        <div class="col-sm-10">
                          <input type="text" name="LI_presentaddress" id="LI_presentaddress" class="form-control input-sm mb15" />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_presentcountry" id="LI_presentcountry" class="form-control input-sm mb15" />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_presentzipcode" id="LI_presentzipcode" class="form-control input-sm mb15" />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Employer</label>
                        <div class="col-sm-9">
                          <input type="text" name="LI_occupation" id="LI_occupation" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Employers' Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_natureofwork" id="LI_natureofwork" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div>
				  <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Phone Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_employer" id="LI_employer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Occupation/Position</label>
                        <div class="col-sm-6">
                          <input type="text" name="LI_natureofemployer" id="LI_natureofemployer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
                  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date Last Attended Work</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_natureofemployer" id="LI_natureofemployer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				<div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Do you have any existing insurance policy with Pru Life UK or another company?</label>
                        <div class="col-sm-2">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-2">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
                      </div>
                  </div>
            <div class="row" id="BeneficialOwnerYes" style="display:none;"><br>
				<div class="col-md-4">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Company</label>
                        <div class="col-sm-8">
                          <input type="text" name="BO_name" id="BO_name" class="form-control input-sm mb15" />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Policy Details</label>
                        <div class="col-sm-8">
                          <input type="text" name="BO_contactnumber" id="BO_contactnumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-4">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date Issued</label>
                        <div class="col-sm-8">
                          <input type="text" name="BO_contactnumber" id="BO_contactnumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
                  </div>
                  <script type="text/javascript">
				function BoYes(val){
				 var element=document.getElementById('BeneficialOwnerYes');
				 if(val=='Yes')
					 element.style.display='block';
				 else  
					 element.style.display='none';
					 document.getElementById('BO_name').value = "";
					 document.getElementById('BO_contactnumber').value = "";
				}
				</script>				
			 </div>
			 </div>
			 </div>
			 <div class="col-md-1">
				  </div>
					 </div><hr>
				
                  </div>
                <div class="tab-pane" id="beneficiaries">
                <div class="row"><br>
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
					  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">HOSPITALIZATION DETAILS</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">

				  <div class="row"><br>
					  <div class="col-md-5" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Hospital Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-7" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Hospital Address</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
					  <div class="col-md-5" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Name of Doctor Certifying Death</label>
                        <div class="col-sm-6">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Address</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Contact Number</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
					  <div class="col-md-5" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Name of Medical Attendant during Last Illness</label>
                        <div class="col-sm-6">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Address</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Contact Number</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Cause of Death</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Death</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date and Time of Death</label>
                        <div class="col-sm-8">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
				<div class="col-md-8" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Birth</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_placeofbirth" id="PB_placeofbirth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Nationality</label>
                        <div class="col-sm-8">
                          <input type="text" name="PB_nationality" id="PB_nationality" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
                  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
                  <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">Was the Deceased buried?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_b" value="Yes" name="Q1p_Yes_b"/>
                      <label for="q1p_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_b" name="Q1p_Yes_b">
                      <label for="q1p_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesb" id="q1_yesb" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">Was the Deceased cremated?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_c" value="Yes" name="Q1p_Yes_c"/>
                      <label for="q1p_yes_c" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_c" name="Q1p_Yes_c">
                      <label for="q1p_no_c" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesc" id="q1_yesc" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
                  </div>  
			</div>
			</div>
			<div class="col-md-1">
                </div>
				</div>
				
			</div>
				<div class="tab-pane" id="policyinfo">
				<div class="row"><br>
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
				<div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">HEALTH HISTORY</h4>
            </div>	
            <div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row"><br>
           
				<div class="col-md-12"style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Date Deceased first complained of or gave indication of his/her last illness</label>
                        <div class="col-sm-6">
                          <input type="text" name="PI_planname" id="PI_planname" class="form-control input-sm mb15" required />
                        </div>
                      </div>
					  </div>
                  </div>
              <div class="row"><br>
           
				<div class="col-md-12"style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Date Deceased first consulted a Physician</label>
                        <div class="col-sm-6">
                          <input type="text" name="PI_planname" id="PI_planname" class="form-control input-sm mb15" required />
                        </div>
                      </div>
					  </div>
                  </div>
			 </div>
			 </div>
			
			 
			 
			 
				</div>
				<div class="col-md-1">
				</div>
				</div>
				
				
				
				
				</div>  				  
                <div class="tab-pane" id="personalhistory">
            
				</div>
				<div class="tab-pane" id="questionnaire">
				
				</div>
				
				</div><!-- tab-content -->
                </form>
                
                <ul class="pager wizard">
                    <li class="previous"><a href="javascript:void(0)" style="background-color: #DB241E;border-color: #DB241E;">Previous</a></li>
                    <li class="next"><a href="javascript:void(0)" style="background-color: #DB241E;border-color: #DB241E;">Next</a></li>
                  </ul>
                
              </div><!-- #validationWizard -->
              
            </div><!-- panel-body -->
          </div><!-- panel -->
      </div><!-- row -->
    </div><!-- contentpanel -->
    <!-- Modal -->
<div class="modal fade modalSuccess" id="modalSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        Content goes here...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->
  </div><!-- mainpanel -->
</section>

<script src="js/jquery.gritter.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>

<script src="js/bootstrap-wizard.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.min.js"></script>

<script src="js/custom.js"></script>

<script>
jQuery(document).ready(function(){

  
  // With Form Validation Wizard
  var $validator = jQuery("#firstForm").validate({
    highlight: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-error');
    }
  });
  
  jQuery('#validationWizard').bootstrapWizard({
    tabClass: 'nav nav-pills nav-justified nav-disabled-click',
    onTabClick: function(tab, navigation, index) {
      return false;
    },
    onNext: function(tab, navigation, index) {
      var $valid = jQuery('#firstForm').valid();
      if(!$valid) {
        
        $validator.focusInvalid();
        return false;
      }
    }
  });
  
  jQuery(".select2").select2({
    width: '100%',
    minimumResultsForSearch: -1
  });
  
  
  
});
// Date Picker
jQuery('#LI_birthdate').datepicker();
jQuery('#P_birthdate').datepicker();
jQuery('#PB_birthdate').datepicker();
jQuery('#SB_birthdate').datepicker();
jQuery('#AF_dateapplied').datepicker();

jQuery('#datepicker-inline').datepicker();

jQuery('#datepicker-multiple').datepicker({
  numberOfMonths: 3,
  showButtonPanel: true
});
</script>
 <script type="text/javascript">
$(document).ready(function () {

function checkradiobox(){
    var Q1LiYesa = $("input[name='Q1li_Yes_a']:checked").val();
    var Q1LiYesb = $("input[name='Q1li_Yes_b']:checked").val();
    var Q1LiYesc = $("input[name='Q1li_Yes_c']:checked").val();
    var Q1LiYesd = $("input[name='Q1li_Yes_d']:checked").val();
    var Q1LiYese = $("input[name='Q1li_Yes_e']:checked").val();
    var Q1LiYesf = $("input[name='Q1li_Yes_f']:checked").val();
    var Q1LiYesg = $("input[name='Q1li_Yes_g']:checked").val();
    var Q1LiYesh = $("input[name='Q1li_Yes_h']:checked").val();
    var Q1LiYesi = $("input[name='Q1li_Yes_i']:checked").val();
    var Q1LiYesi_i = $("input[name='Q1li_Yes_i_i']:checked").val();
    var Q1LiYesi_ii = $("input[name='Q1li_Yes_i_ii']:checked").val();
    var Q1LiYesj = $("input[name='Q1li_Yes_j']:checked").val();
    var Q1PYesa = $("input[name='Q1p_Yes_a']:checked").val();
    var Q1PYesb = $("input[name='Q1p_Yes_b']:checked").val();
    var Q1PYesc = $("input[name='Q1p_Yes_c']:checked").val();
    var Q1PYesd = $("input[name='Q1p_Yes_d']:checked").val();
    var Q1PYese = $("input[name='Q1p_Yes_e']:checked").val();
    var Q1PYesf = $("input[name='Q1p_Yes_f']:checked").val();
    var Q1PYesg = $("input[name='Q1p_Yes_g']:checked").val();
    var Q1PYesh = $("input[name='Q1p_Yes_h']:checked").val();
    var Q1PYesi = $("input[name='Q1p_Yes_i']:checked").val();
    var Q1PYesi_i = $("input[name='Q1p_Yes_i_i']:checked").val();
    var Q1PYesi_ii = $("input[name='Q1p_Yes_i_ii']:checked").val();
    var Q1PYesj = $("input[name='Q1p_Yes_j']:checked").val();
    var Q2LiYesa = $("input[name='Q2li_Yes_a']:checked").val();
    var Q2LiYesb = $("input[name='Q2li_Yes_b']:checked").val();
    var Q2LiYesc = $("input[name='Q2li_Yes_c']:checked").val();
    var Q2LiYesd = $("input[name='Q2li_Yes_d']:checked").val();
    var Q2LiYese = $("input[name='Q2li_Yes_e']:checked").val();
    var Q2LiYesf = $("input[name='Q2li_Yes_f']:checked").val();
    var Q2LiYesg = $("input[name='Q2li_Yes_g']:checked").val();
    var Q2LiYesh = $("input[name='Q2li_Yes_h']:checked").val();
    var Q2LiYesi = $("input[name='Q2li_Yes_i']:checked").val();
    var Q2LiYesj = $("input[name='Q2li_Yes_j']:checked").val();
    var Q2LiYesk = $("input[name='Q2li_Yes_k']:checked").val();
    var Q2PYesa = $("input[name='Q2p_Yes_a']:checked").val();
    var Q2PYesb = $("input[name='Q2p_Yes_b']:checked").val();
    var Q2PYesc = $("input[name='Q2p_Yes_c']:checked").val();
    var Q2PYesd = $("input[name='Q2p_Yes_d']:checked").val();
    var Q2PYese = $("input[name='Q2p_Yes_e']:checked").val();
    var Q2PYesf = $("input[name='Q2p_Yes_f']:checked").val();
    var Q2PYesg = $("input[name='Q2p_Yes_g']:checked").val();
    var Q2PYesh = $("input[name='Q2p_Yes_h']:checked").val();
    var Q2PYesi = $("input[name='Q2p_Yes_i']:checked").val();
    var Q2PYesj = $("input[name='Q2p_Yes_j']:checked").val();
    var Q2PYesk = $("input[name='Q2p_Yes_k']:checked").val();
    var Q3LiYesa = $("input[name='Q3li_Yes_a']:checked").val();
    var Q3LiYesb = $("input[name='Q3li_Yes_b']:checked").val();
    var Q3PYesa = $("input[name='Q3p_Yes_a']:checked").val();
    var Q3PYesb = $("input[name='Q3p_Yes_b']:checked").val();
    
    if(Q1LiYesa == "Yes" || Q1PYesa == "Yes"){ $('#q1_yesa').attr('disabled',false);}
    else if(Q1LiYesa == "No" || Q1PYesa == "No"){$('#q1_yesa').attr('disabled',true);}
    if(Q1LiYesb == "Yes" || Q1PYesb == "Yes"){ $('#q1_yesb').attr('disabled',false);}
    else if(Q1LiYesb == "No" || Q1PYesb == "No"){$('#q1_yesb').attr('disabled',true);}
    if(Q1LiYesc == "Yes" || Q1PYesc == "Yes"){ $('#q1_yesc').attr('disabled',false);}
    else if(Q1LiYesc == "No" || Q1PYesc == "No"){$('#q1_yesc').attr('disabled',true);}
    if(Q1LiYesd == "Yes" || Q1PYesd == "Yes"){ $('#q1_yesd').attr('disabled',false);}
    else if(Q1LiYesd == "No" || Q1PYesd == "No"){$('#q1_yesd').attr('disabled',true);}
    if(Q1LiYese == "Yes" || Q1PYese == "Yes"){ $('#q1_yese').attr('disabled',false);}
    else if(Q1LiYese == "No" || Q1PYese == "No"){$('#q1_yese').attr('disabled',true);}
    if(Q1LiYesf == "Yes" || Q1PYesf == "Yes"){ $('#q1_yesf').attr('disabled',false);}
    else if(Q1LiYesf == "No" || Q1PYesf == "No"){$('#q1_yesf').attr('disabled',true);}
    if(Q1LiYesg == "Yes" || Q1PYesg == "Yes"){ $('#q1_yesg').attr('disabled',false);}
    else if(Q1LiYesg == "No" || Q1PYesg == "No"){$('#q1_yesg').attr('disabled',true);}
    if(Q1LiYesh == "Yes" || Q1PYesh == "Yes"){ $('#q1_yesh').attr('disabled',false);}
    else if(Q1LiYesh == "No" || Q1PYesh == "No"){$('#q1_yesh').attr('disabled',true);}
    if(Q1LiYesi == "Yes" || Q1PYesi == "Yes"){ $('#q1_yesi').attr('disabled',false);}
    else if(Q1LiYesi == "No" || Q1PYesi == "No"){$('#q1_yesi').attr('disabled',true);}
    if(Q1LiYesi_i == "Yes" || Q1PYesi_i == "Yes"){ $('#q1_yesi_i').attr('disabled',false);}
    else if(Q1LiYesi_i == "No" || Q1PYesi_i == "No"){$('#q1_yesi_i').attr('disabled',true);}
    if(Q1LiYesi_ii == "Yes" || Q1PYesi_ii == "Yes"){ $('#q1_yesi_ii').attr('disabled',false);}
    else if(Q1LiYesi_ii == "No" || Q1PYesi_ii == "No"){$('#q1_yesi_ii').attr('disabled',true);}
    if(Q1LiYesj == "Yes" || Q1PYesj == "Yes"){ $('#q1_yesj').attr('disabled',false);}
    else if(Q1LiYesj == "No" || Q1PYesj == "No"){$('#q1_yesj').attr('disabled',true);}
    if(Q2LiYesa == "Yes" || Q2PYesa == "Yes"){ $('#q2_yesa').attr('disabled',false);}
    else if(Q2LiYesa == "No" || Q2PYesa == "No"){$('#q2_yesa').attr('disabled',true);}
    if(Q2LiYesb == "Yes" || Q2PYesb == "Yes"){ $('#q2_yesb').attr('disabled',false);}
    else if(Q2LiYesb == "No" || Q2PYesb == "No"){$('#q2_yesb').attr('disabled',true);}
    if(Q2LiYesc == "Yes" || Q2PYesc == "Yes"){ $('#q2_yesc').attr('disabled',false);}
    else if(Q2LiYesc == "No" || Q2PYesc == "No"){$('#q2_yesc').attr('disabled',true);}
    if(Q2LiYesd == "Yes" || Q2PYesd == "Yes"){ $('#q2_yesd').attr('disabled',false);}
    else if(Q2LiYesd == "No" || Q2PYesd == "No"){$('#q2_yesd').attr('disabled',true);}
    if(Q2LiYese == "Yes" || Q2PYese == "Yes"){ $('#q2_yese').attr('disabled',false);}
    else if(Q2LiYese == "No" || Q2PYese == "No"){$('#q2_yese').attr('disabled',true);}
    if(Q2LiYesf == "Yes" || Q2PYesf == "Yes"){ $('#q2_yesf').attr('disabled',false);}
    else if(Q2LiYesf == "No" || Q2PYesf == "No"){$('#q2_yesf').attr('disabled',true);}
    if(Q2LiYesg == "Yes" || Q2PYesg == "Yes"){ $('#q2_yesg').attr('disabled',false);}
    else if(Q2LiYesg == "No" || Q2PYesg == "No"){$('#q2_yesg').attr('disabled',true);}
    if(Q2LiYesh == "Yes" || Q2PYesh == "Yes"){ $('#q2_yesh').attr('disabled',false);}
    else if(Q2LiYesh == "No" || Q2PYesh == "No"){$('#q2_yesh').attr('disabled',true);}
    if(Q2LiYesi == "Yes" || Q2PYesi == "Yes"){ $('#q2_yesi').attr('disabled',false);}
    else if(Q2LiYesi == "No" || Q2PYesi == "No"){$('#q2_yesi').attr('disabled',true);}
	if(Q2LiYesj == "Yes" || Q2PYesj == "Yes"){ $('#q2_yesj').attr('disabled',false);}
    else if(Q2LiYesj == "No" || Q2PYesj == "No"){$('#q2_yesj').attr('disabled',true);}
    if(Q3LiYesa == "Yes" || Q3PYesa == "Yes"){ $('#q3_yesa').attr('disabled',false);}
    else if(Q3LiYesa == "No" || Q3PYesa == "No"){$('#q3_yesa').attr('disabled',true);}
    if(Q3LiYesb == "Yes" || Q3PYesb == "Yes"){ $('#q3_yesb').attr('disabled',false);}
    else if(Q3LiYesb == "No" || Q3PYesb == "No"){$('#q3_yesb').attr('disabled',true);}
    
}

$("#q1li_yes_a,#q1li_yes_b,#q1li_yes_c,#q1li_yes_d,#q1li_yes_e,#q1li_yes_f,#q1li_yes_g,#q1li_yes_h,#q1li_yes_i,#q1li_yes_i_i,#q1li_yes_i_ii,"
		+"#q1li_no_a,#q1li_no_b,#q1li_no_c,#q1li_no_d,#q1li_no_e,#q1li_no_f,#q1li_no_g,#q1li_no_h,#q1li_no_i,#q1li_no_i_i,#q1li_no_i_ii,"
		+"#q1p_yes_a,#q1p_yes_b,#q1p_yes_c,#q1p_yes_d,#q1p_yes_e,#q1p_yes_f,#q1p_yes_g,#q1p_yes_h,#q1p_yes_i,#q1p_yes_i_i,#q1p_yes_i_ii,"
		+"#q1p_no_a,#q1p_no_b,#q1p_no_c,#q1p_no_d,#q1p_no_e,#q1p_no_f,#q1p_no_g,#q1p_no_h,#q1p_no_i,#q1p_no_i_i,#q1p_no_i_ii,"
		+"#phlino3,#phpyes3,#phpno3,#phliyes4,#phlino4,#phpyes4,#phpno4,#phliyes5,#phlino5,"
		+"#q2li_yes_a,#q2li_yes_b,#q2li_yes_c,#q2li_yes_d,#q2li_yes_e,#q2li_yes_f,#q2li_yes_g,#q2li_yes_h,#q2li_yes_i,#q2li_yes_j,"
		+"#q2li_no_a,#q2li_no_b,#q2li_no_c,#q2li_no_d,#q2li_no_e,#q2li_no_f,#q2li_no_g,#q2li_no_h,#q2li_no_i,#q2li_no_j,"
		+"#q2p_yes_a,#q2p_yes_b,#q2p_yes_c,#q2p_yes_d,#q2p_yes_e,#q2p_yes_f,#q2p_yes_g,#q2p_yes_h,#q2p_yes_i,#q2p_yes_j,"
		+"#q2p_no_a,#q2p_no_b,#q2p_no_c,#q2p_no_d,#q2p_no_e,#q2p_no_f,#q2p_no_g,#q2p_no_h,#q2p_no_i,#q2p_no_j,"
		+"#q3li_yes_a,#q3p_yes_a,#q3li_no_a,#q3p_no_a,#q3li_yes_b,#q3p_yes_b,#q3li_no_b,#q3p_no_b").change(function () {
    checkradiobox();
});

checkradiobox();

});   
</script>
 <script type="text/javascript">
$(document).ready(function () {

function checkradiobox(){
    var PhLiYes1 = $("input[name='PhLi_Yes1']:checked").val();
    var PhLiYes2 = $("input[name='PhLi_Yes2']:checked").val();
    var PhLiYes3 = $("input[name='PhLi_Yes3']:checked").val();
    var PhLiYes4 = $("input[name='PhLi_Yes4']:checked").val();
    var PhLiYes5 = $("input[name='PhLi_Yes5']:checked").val();
    var PhLiYes6 = $("input[name='PhLi_Yes6']:checked").val();
    var PhPYes1 = $("input[name='PhP_Yes1']:checked").val();
    var PhPYes2 = $("input[name='PhP_Yes2']:checked").val();
    var PhPYes3 = $("input[name='PhP_Yes3']:checked").val();
    var PhPYes4 = $("input[name='PhP_Yes4']:checked").val();
    var PhPYes5 = $("input[name='PhP_Yes5']:checked").val();
    var PhPYes6 = $("input[name='PhP_Yes6']:checked").val();
    
    if(PhLiYes1 == "Yes" || PhPYes1 == "Yes"){ $('#PH_yes1').attr('disabled',false);}
    else if(PhLiYes1 == "No" || PhPYes1 == "No"){$('#PH_yes1').attr('disabled',true);}
    if(PhLiYes2 == "Yes" || PhPYes2 == "Yes"){ $('#PH_yes2').attr('disabled',false);}
    else if(PhLiYes2 == "No" || PhPYes2 == "No"){$('#PH_yes2').attr('disabled',true);}
    if(PhLiYes3 == "Yes" || PhPYes3 == "Yes"){ $('#PH_yes3').attr('disabled',false);}
    else if(PhLiYes3 == "No" || PhPYes3 == "No"){$('#PH_yes3').attr('disabled',true);}
    if(PhLiYes4 == "Yes" || PhPYes4 == "Yes"){ $('#PH_yes4').attr('disabled',false);}
    else if(PhLiYes4 == "No" || PhPYes4 == "No"){$('#PH_yes4').attr('disabled',true);}
    if(PhLiYes5 == "Yes" || PhPYes5 == "Yes"){ $('#PH_yes5').attr('disabled',false);}
    else if(PhLiYes5 == "No" || PhPYes5 == "No"){$('#PH_yes5').attr('disabled',true);}
    if(PhLiYes6 == "Yes" || PhPYes6 == "Yes"){ $('#PH_yes6').attr('disabled',false);}
    else if(PhLiYes6 == "No" || PhPYes6 == "No"){$('#PH_yes6').attr('disabled',true);}
    
}

$("#phliyes1,#phlino1,#phpyes1,#phpno1,#phliyes2,#phlino2,#phpyes2,#phpno2,#phliyes3,#phlino3,#phpyes3,#phpno3,#phliyes4,#phlino4,#phpyes4,#phpno4,#phliyes5,#phlino5,#phpyes5,#phpno5,#phliyes6,#phlino6,#phpyes6,#phpno6").change(function () {
    checkradiobox();
});

checkradiobox();

});   
</script>
  <script type="text/javascript">
$(document).ready(function () {

function checkradiobox(){
    var PhLiYes1 = $("input[name='PhLi_Yes1']:checked").val();
    var PhLiYes2 = $("input[name='PhLi_Yes2']:checked").val();
    var PhLiYes3 = $("input[name='PhLi_Yes3']:checked").val();
    var PhLiYes4 = $("input[name='PhLi_Yes4']:checked").val();
    var PhLiYes5 = $("input[name='PhLi_Yes5']:checked").val();
    var PhLiYes6 = $("input[name='PhLi_Yes6']:checked").val();
    var PhPYes1 = $("input[name='PhP_Yes1']:checked").val();
    var PhPYes2 = $("input[name='PhP_Yes2']:checked").val();
    var PhPYes3 = $("input[name='PhP_Yes3']:checked").val();
    var PhPYes4 = $("input[name='PhP_Yes4']:checked").val();
    var PhPYes5 = $("input[name='PhP_Yes5']:checked").val();
    var PhPYes6 = $("input[name='PhP_Yes6']:checked").val();
    
    if(PhLiYes1 == "Yes" || PhPYes1 == "Yes"){ $('#PH_yes1').attr('disabled',false);}
    else if(PhLiYes1 == "No" || PhPYes1 == "No"){$('#PH_yes1').attr('disabled',true);}
    if(PhLiYes2 == "Yes" || PhPYes2 == "Yes"){ $('#PH_yes2').attr('disabled',false);}
    else if(PhLiYes2 == "No" || PhPYes2 == "No"){$('#PH_yes2').attr('disabled',true);}
    if(PhLiYes3 == "Yes" || PhPYes3 == "Yes"){ $('#PH_yes3').attr('disabled',false);}
    else if(PhLiYes3 == "No" || PhPYes3 == "No"){$('#PH_yes3').attr('disabled',true);}
    if(PhLiYes4 == "Yes" || PhPYes4 == "Yes"){ $('#PH_yes4').attr('disabled',false);}
    else if(PhLiYes4 == "No" || PhPYes4 == "No"){$('#PH_yes4').attr('disabled',true);}
    if(PhLiYes5 == "Yes" || PhPYes5 == "Yes"){ $('#PH_yes5').attr('disabled',false);}
    else if(PhLiYes5 == "No" || PhPYes5 == "No"){$('#PH_yes5').attr('disabled',true);}
    if(PhLiYes6 == "Yes" || PhPYes6 == "Yes"){ $('#PH_yes6').attr('disabled',false);}
    else if(PhLiYes6 == "No" || PhPYes6 == "No"){$('#PH_yes6').attr('disabled',true);}
    
}

$("#phliyes1,#phlino1,#phpyes1,#phpno1,#phliyes2,#phlino2,#phpyes2,#phpno2,#phliyes3,"
		+"#phlino3,#phpyes3,#phpno3,#phliyes4,#phlino4,#phpyes4,#phpno4,#phliyes5,#phlino5,"
		+"#phpyes5,#phpno5,#phliyes6,#phlino6,#phpyes6,#phpno6").change(function () {
    checkradiobox();
});

checkradiobox();

});   
</script>
<script>
function PiBenefit1(bEnable, textBoxID){document.getElementById('PI_benefit1').disabled = !bEnable;
document.getElementById('PI_benefit1').value = "";}
function PiBenefit2(bEnable, textBoxID){document.getElementById('PI_benefit2').disabled = !bEnable;
document.getElementById('PI_benefit2').value = "";}
function PiBenefit3(bEnable, textBoxID){document.getElementById('PI_benefit3').disabled = !bEnable;
document.getElementById('PI_benefit3').value = "";}
function PiBenefit4(bEnable, textBoxID){document.getElementById('PI_benefit4').disabled = !bEnable;
document.getElementById('PI_benefit4').value = "";}
function PiBenefit5(bEnable, textBoxID){document.getElementById('PI_benefit5').disabled = !bEnable;
document.getElementById('PI_benefit5').value = "";}
function PiBenefit6(bEnable, textBoxID){document.getElementById('PI_benefit6').disabled = !bEnable;
document.getElementById('PI_benefit6').value = "";}
function PiBenefit7(bEnable, textBoxID){document.getElementById('PI_benefit7').disabled = !bEnable;
document.getElementById('PI_benefit7').value = "";}
function PiBenefit8(bEnable, textBoxID){document.getElementById('PI_benefit8').disabled = !bEnable;
document.getElementById('PI_benefit8').value = "";}
function PiBenefit9(bEnable, textBoxID){document.getElementById('PI_benefit9').disabled = !bEnable;
document.getElementById('PI_benefit9').value = "";}
function PiBenefit10(bEnable, textBoxID){document.getElementById('PI_benefit10').disabled = !bEnable;
document.getElementById('PI_benefit10').value = "";}
function PiBenefit11(bEnable, textBoxID){document.getElementById('PI_benefit11').disabled = !bEnable;
document.getElementById('PI_benefit11').value = "";}
function PiBenefit12(bEnable, textBoxID){document.getElementById('PI_benefit12').disabled = !bEnable;
document.getElementById('PI_benefit12').value = "";}
function PiBenefit13(bEnable, textBoxID){document.getElementById('PI_benefit13').disabled = !bEnable;
document.getElementById('PI_benefit13').value = "";}
function PiBenefit14(bEnable, textBoxID){document.getElementById('PI_benefit14').disabled = !bEnable;
document.getElementById('PI_benefit14').value = "";}
function PiBenefit15(bEnable, textBoxID){document.getElementById('PI_benefit15').disabled = !bEnable;
document.getElementById('PI_benefit15').value = "";}
function PiBenefit16(bEnable, textBoxID){document.getElementById('PI_benefit16').disabled = !bEnable;
document.getElementById('PI_benefit16').value = "";}
function PiBenefit17(bEnable, textBoxID){document.getElementById('PI_benefit17').disabled = !bEnable;
document.getElementById('PI_benefitother').disabled = !bEnable;
document.getElementById('PI_benefit17').value = ""; document.getElementById('PI_benefitother').value = "";}

function PiVariable1(bEnable, textBoxID){document.getElementById('PI_variable1').disabled = !bEnable;
document.getElementById('PI_variable1').value = "";}
function PiVariable2(bEnable, textBoxID){document.getElementById('PI_variable2').disabled = !bEnable;
document.getElementById('PI_variable3').disabled = !bEnable;
document.getElementById('PI_variable2').value = ""; document.getElementById('PI_variable3').value = "";}

function PiHospital1(bEnable, textBoxID){document.getElementById('PI_hospital1').disabled = !bEnable;
document.getElementById('PI_hospital1').value = "";}
function PiHospital2(bEnable, textBoxID){document.getElementById('PI_hospital2').disabled = !bEnable;
document.getElementById('PI_hospital2').value = "";}
function PiHospital3(bEnable, textBoxID){document.getElementById('PI_hospital3').disabled = !bEnable;
document.getElementById('PI_hospital3').value = "";}
function PiHospital4(bEnable, textBoxID){document.getElementById('PI_hospital4').disabled = !bEnable;
document.getElementById('PI_hospital4').value = "";}
function PiHospital5(bEnable, textBoxID){document.getElementById('PI_hospital5').disabled = !bEnable;
document.getElementById('PI_hospitalother').disabled = !bEnable;
document.getElementById('PI_hospital5').value = ""; document.getElementById('PI_hospitalother').value = "";}

function PiPersonal1(bEnable, textBoxID){document.getElementById('PI_personal1').disabled = !bEnable;
document.getElementById('PI_personal1').value = "";}
function PiPersonal2(bEnable, textBoxID){document.getElementById('PI_personal2').disabled = !bEnable;
document.getElementById('PI_personal2').value = "";}
function PiPersonal3(bEnable, textBoxID){document.getElementById('PI_personal3').disabled = !bEnable;
document.getElementById('PI_personal3').value = "";}
function PiPersonal4(bEnable, textBoxID){document.getElementById('PI_personal4').disabled = !bEnable;
document.getElementById('PI_personal4').value = "";}
function PiPersonal5(bEnable, textBoxID){document.getElementById('PI_personal5').disabled = !bEnable;
document.getElementById('PI_personal5').value = "";}
function PiPersonal6(bEnable, textBoxID){document.getElementById('PI_personal6').disabled = !bEnable;
document.getElementById('PI_personal6').value = "";}
function PiPersonal7(bEnable, textBoxID){document.getElementById('PI_personal7').disabled = !bEnable;
document.getElementById('PI_personal7').value = "";}
function PiPersonal8(bEnable, textBoxID){document.getElementById('PI_personal8').disabled = !bEnable;
document.getElementById('PI_personalother').disabled = !bEnable;
document.getElementById('PI_personal8').value = ""; document.getElementById('PI_personalother').value = "";}

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
			
			var LI_surname = $('#LI_surname').val();
			var LI_givenname = $('#LI_givenname').val();
			var LI_middlename = $('#LI_middlename').val();
			var LI_alias = $('#LI_alias').val();
			var LI_civilstatus = $('#LI_civilstatus').val();
			var LI_civilstatusother = $('#LI_civilstatusother').val();
			var LI_salutation = $('#LI_salutation').val();
			var LI_age = $('#LI_age').val();
			var LI_nationality = $('#LI_nationality').val();
			var LI_placeofbirth = $('#LI_placeofbirth').val();
			var LI_tinsssgsis = $('#LI_tinsssgsis').val();
			var LI_occupation = $('#LI_occupation').val();
			var LI_natureofwork = $('#LI_natureofwork').val();
			var LI_employer = $('#LI_employer').val();
			var LI_natureofemployer = $('#LI_natureofemployer').val();
			var LI_annualincome = $('#LI_annualincome').val();
			var LI_networth = $('#LI_networth').val();
			var LI_sourceoffunds = $('#LI_sourceoffunds').val();
			var LI_sourceoffundsother = $('#LI_sourceoffundsother').val();
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
			var P_civilstatus = $('#P_civilstatus').val();
			var P_civilstatusother = $('#P_civilstatusother').val();
			var P_salutation = $('#P_salutation').val();
			var P_age = $('#P_age').val();
			var P_nationality = $('#P_nationality').val();
			var P_placeofbirth = $('#P_placeofbirth').val();
			var P_tinsssgsis = $('#P_tinsssgsis').val();
			var P_occupation = $('#P_occupation').val();
			var P_natureofwork = $('#P_natureofwork').val();
			var P_employer = $('#P_employer').val();
			var P_natureofemployer = $('#P_natureofemployer').val();
			var P_annualincome = $('#P_annualincome').val();
			var P_networth = $('#P_networth').val();
			var P_sourceoffunds = $('#P_sourceoffunds').val();
			var P_sourceoffundsother = $('#P_sourceoffundsother').val();
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
			var P_preferredaddress = $('#P_preferredaddress').val();
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
			var PI_currency = $('#PI_currency').val();
			
			var LI_gender = $('input[name=LI_gender]:checked').val();
			var LI_taxreturnfiling = $('input[name=LI_taxreturnfiling]:checked').val();
			var LI_occupationchange = $('input[name=LI_occupationchange]:checked').val();
			var LI_addresschange = $('input[name=LI_addresschange]:checked').val();
			
			var P_gender = $('input[name=P_gender]:checked').val();
			var P_taxreturnfiling = $('input[name=P_taxreturnfiling]:checked').val();
			var P_occupationchange = $('input[name=P_occupationchange]:checked').val();
			var P_addresschange = $('input[name=P_addresschange]:checked').val();
			var PB_gender = $('input[name=PB_gender]:checked').val();
			var SB_gender = $('input[name=SB_gender]:checked').val();
			
			var LI_birthdate = $('#LI_birthdate').val();
			var P_birthdate = $('#P_birthdate').val();
			var PB_birthdate = $('#PB_birthdate').val();
			var SB_birthdate = $('#SB_birthdate').val();
			

			

			
			
			

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
					
					LI_surname:LI_surname,
					LI_givenname:LI_givenname,
					LI_middlename:LI_middlename,
					LI_alias:LI_alias,
					LI_gender:LI_gender,
					LI_civilstatus:LI_civilstatus,
					LI_civilstatusother:LI_civilstatusother,
					LI_salutation:LI_salutation,
					LI_birthdate:LI_birthdate,
					LI_age:LI_age,
					LI_nationality:LI_nationality,
					LI_placeofbirth:LI_placeofbirth,
					LI_tinsssgsis:LI_tinsssgsis,
					LI_occupation:LI_occupation,
					LI_natureofwork:LI_natureofwork,
					LI_employer:LI_employer,
					LI_natureofemployer:LI_natureofemployer,
					LI_annualincome:LI_annualincome,
					LI_networth:LI_networth,
					LI_sourceoffunds:LI_sourceoffunds,
					LI_sourceoffundsother:LI_sourceoffundsother,
					LI_taxreturnfiling:LI_taxreturnfiling,
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
					LI_occupationchange:LI_occupationchange,
					LI_addresschange:LI_addresschange,
					
					P_surname:P_surname,
					P_givenname:P_givenname,
					P_middlename:P_middlename,
					P_alias:P_alias,
					P_gender:P_gender,
					P_civilstatus:P_civilstatus,
					P_civilstatusother:P_civilstatusother,
					P_salutation:P_salutation,
					P_birthdate:P_birthdate,
					P_age:P_age,
					P_nationality:P_nationality,
					P_placeofbirth:P_placeofbirth,
					P_tinsssgsis:P_tinsssgsis,
					P_occupation:P_occupation,
					P_natureofwork:P_natureofwork,
					P_employer:P_employer,
					P_natureofemployer:P_natureofemployer,
					P_annualincome:P_annualincome,
					P_networth:P_networth,
					P_sourceoffunds:P_sourceoffunds,
					P_sourceoffundsother:P_sourceoffundsother,
					P_taxreturnfiling:P_taxreturnfiling,
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
					P_occupationchange:P_occupationchange,
					P_addresschange:P_addresschange,
					P_preferredaddress:P_preferredaddress,
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
					PI_currency:PI_currency
					
				},
				url:'insert',
				success: function(result){
					
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