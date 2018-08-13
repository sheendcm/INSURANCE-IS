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
  crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
 <title>Application for Life Insurance</title>

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
  
  <div class="leftpanel">
    
    <div class="logopanel" style="padding=0;">
    <img src="images/prulife.png" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner">
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>John Doe</h4>
                    <span>"Life is so..."</span>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">Account</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="profile.html"><i class="fa fa-user"></i> <span>Profile</span></a></li>
              <li><a href=""><i class="fa fa-cog"></i> <span>Account Settings</span></a></li>
              <li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
              <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
            </ul>
        </div>
      
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="application-form.jsp"><i class="fa fa-edit"></i> <span>Application Form</span></a></li>
        <li><a href="upload-requirements.jsp"><i class="fa fa-caret-right"></i>Upload Requirements</a></li>
        <li><a href="update-application.jsp"><i class="fa fa-caret-right"></i>Update Application</a></li>
        <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i>Issued Applicants</a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children">
            <li><a href="general-forms.html"><i class="fa fa-caret-right"></i> General Forms</a></li>
            <li><a href="form-layouts.html"><i class="fa fa-caret-right"></i> Form Layouts</a></li>
            <li><a href="form-validation.html"><i class="fa fa-caret-right"></i> Form Validation</a></li>
            <li><a href="form-wizards.html"><i class="fa fa-caret-right"></i> Form Wizards</a></li>
            <li><a href="wysiwyg.html"><i class="fa fa-caret-right"></i> Text Editor</a></li>
            <li><a href="code-editor.html"><i class="fa fa-caret-right"></i> Code Editor</a></li>
                                <li><a href="x-editable.html"><i class="fa fa-caret-right"></i> X-Editable</a></li>
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
                <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">APPLICATION FOR LIFE INSURANCE</h4>
            </div>
			<div class="panel-body">
			<div class="row">
              <div class="col-md-5">
			  </div>
			  <div class="col-md-3">
			  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:90%;">Client Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="AF_clientnumber" id="AF_clientnumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
			  </div>
			  <div class="col-md-4">
			  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:90%;">Application Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="AF_applicationnumber" id="AF_applicationnumber" class="form-control input-sm mb15"/>
                        </div>
                      </div>
			  </div>
			  </div>
            </div>
            <div class="panel-body panel-body-nopadding">
              
              <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard">
                
                <ul class="nav nav-pills nav-justified">
                  <li><a href="#agentinformation" data-toggle="tab" style="font-size:85%;"><span>Step 1:</span></a></li>
                  <li><a href="#lifeinsured" data-toggle="tab" style="font-size:85%;"><span>Step 2:</span></a></li>
				  <li><a href="#beneficialowner" data-toggle="tab" style="font-size:85%;"><span>Step 3:</span></a></li>
				  <li><a href="#beneficiaries" data-toggle="tab" style="font-size:85%;"><span>Step 4:</span></a></li>
				  <li><a href="#policyinfo" data-toggle="tab" style="font-size:85%;"><span>Step 5:</span></a></li>
				  <li><a href="#personalhistory" data-toggle="tab" style="font-size:85%;"><span>Step 6:</span></a></li>
				  <li><a href="#questionnaire" data-toggle="tab" style="font-size:85%;"><span>Step 7:</span></a></li>
				  <li><a href="#save" data-toggle="tab" style="font-size:85%;"><span>Save</span></a></li>
				  
                </ul>
                <form class="form" id="firstForm">  
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
				<div class="ckbox ckbox-primary" style="margin-left:20px;">
                        <input type="checkbox" value="1" id="PI_agreepolicy" required/>
                            <label for="PI_agreepolicy" style="font-size:85%;">The application form is completed and signed.</label>
                 </div><br>
                 		<div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;padding-right:0px;">Application Date</label>
                        <div class="col-sm-7" style="padding-left:0px">
                          <div class="input-group ">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="AF_dateapplied">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div><br><br>
                 <a class="btn btn-primary" id="btnSubmitAF" name="btnSubmitAF" style="font-size:12px; padding:0px,10px; margin-left:120px;">Save</a><br><br>
                 </div>
                 <div class="col-md-2"></div>
			 </div>
			 </div>
                  </div>
                  <div class="col-md-3"></div>
                  </div>
                  

                  </div>
                  <div class="tab-pane" id="agentinformation">
				  <div class="row"><br>
				  <div class="col-md-3"></div>
				  <div class="col-md-5">
				  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">AGENT INFORMATION</h4>
            </div>
			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
							
                      <div class="form-group"> <br> 
                        <label class="col-sm-4 control-label" style="font-size:85%;">Surname, Given Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_name" id="AI_name" class="form-control input-sm mb15"  />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Agent Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_code" id="AI_code" class="form-control input-sm mb15"  />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Branch</label>
                        <div class="col-sm-8">
                          <input type="text" name="AI_branch" id="AI_branch" class="form-control input-sm mb15"  />
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
                  <div class="col-md-6">
                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">DETAILS OF LIFE INSURED</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <br>
            <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Surname</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_surname" id="LI_surname" class="form-control input-sm mb15" />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Given Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_givenname" id="LI_givenname" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					 <div class="col-md-4" style="padding:0;">
					 <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Middle Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_middlename" id="LI_middlename" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					 </div>
					 </div>
				<div class="row">
				  <div class="col-md-8" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Other Legal Name or Alias</label>
                        <div class="col-sm-6">
                          <input type="text" name="LI_alias" id="LI_alias" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Gender</label>
                        <div class="col-sm-7">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="LImale" value="Male" name="LI_gender"/>
                      <label for="LImale" style="font-size:85%;">Male</label>
                    </div><!-- rdio -->
                       <div class="rdio rdio-primary">
                      <input type="radio" value="Female" id="LIfemale" name="LI_gender"/>
                      <label for="LIfemale" style="font-size:85%;">Female</label>
                    </div><!-- rdio -->
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 0px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Civil Status</label>
					  <div class="col-sm-7">
					  <select class="form-control input-sm mb15" id="LI_civilstatus" name="LI_civilstatus" onchange="LICivilStatus(this.value);">
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
				  <script type="text/javascript">
				function LICivilStatus(val){
				 var element=document.getElementById('LIcivilstatusothers');
				 if(val=='Others')
					 element.style.display='block';
				 else  
					 element.style.display='none';
				}
				</script> 
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Salutation</label>
                        <div class="col-sm-6">
                          <input type="text" name="LI_salutation" id="LI_salutation" class="form-control input-sm mb15"  />
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
                          <input type="text" name="LI_age" id="LI_age" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nationality</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_nationality" id="LI_nationality"  class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				 <div class="row">
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Birth</label>
                        <div class="col-sm-9">
                          <input type="text" name="LI_placeofbirth" id="LI_placeofbirth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">TIN/SSS/GSIS</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_tinsssgsis" id="LI_tinsssgsis" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Occupation</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_occupation" id="LI_occupation" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nature of Work or Nature of Business</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_natureofwork" id="LI_natureofwork" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Employer</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_employer" id="LI_employer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nature of Business of Employer</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_natureofemployer" id="LI_natureofemployer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Gross Annual Income</label>
                        <div class="col-sm-6">
                          <input type="text" name="LI_annualincome" id="LI_annualincome" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4">
				  <div class="form-group" style="padding:0; margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Net Worth</label>
                        <div class="col-sm-6">
                          <input type="text" name="LI_networth" id="LI_networth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 0px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Sources of Funds</label>
					  <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="LI_sourceoffunds" id="LI_sourceoffunds" onchange="LISourcesOfFundsother(this.value);">
		                  <option selected></option>
		                  <option value="Salary">Salary</option>
		                  <option value="Business">Business</option>
		                  <option value="Others">Others</option>
		                </select>
                      </div>
				  </div>
				  <div class="form-group" id="LIsourcesoffundsothers" style="display:none;">
				         <label class="col-sm-5 control-label" style="font-size:85%;"></label>
					  <div class="col-sm-7">
                          <input type="text" name="LI_sourceoffundsother" id="LI_sourceoffundsother" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				  </div>
				   <script type="text/javascript">
					function LISourcesOfFundsother(val){
					 var element=document.getElementById('LIsourcesoffundsothers');
					 if(val=='Others')
						 element.style.display='block';
					 else  
						 element.style.display='none';
					}
					</script> 
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-8" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-12 control-label" style="font-size:85%;">Do you currently file a tax return in the United States of America?</label>
                  </div>
				  </div>
				  <div class="col-sm-2" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="LItaxreturnyes" value="Yes" name="LI_taxreturnfiling"/>
                      <label for="LItaxreturnyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-2" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="LItaxreturnno" name="LI_taxreturnfiling">
                      <label for="LItaxreturnno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				   <div class="row">
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Mobile Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_mobilenumber" id="LI_mobilenumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Telephone Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="LI_telephonenumber" id="LI_telephonenumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-8" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Email Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_emailaddress" id="LI_emailaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-2 control-label" style="font-size:85%;">Present Address</label>
                        <div class="col-sm-10">
                          <input type="text" name="LI_presentaddress" id="LI_presentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_presentcountry" id="LI_presentcountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_presentzipcode" id="LI_presentzipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-2 control-label" style="font-size:85%;">Permanent Address</label>
                        <div class="col-sm-10">
                          <input type="text" name="LI_permanentaddress" id="LI_permanentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_permanentcountry" id="LI_permanentcountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_permanentzipcode" id="LI_permanentzipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Business or Employer Address</label>
                        <div class="col-sm-9">
                          <input type="text" name="LI_businessaddress" id="LI_businessaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_businesscountry" id="LI_businesscountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="LI_businesszipcode" id="LI_businesszipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <label class="col-md-12 control-label" style="font-size:85%;">In the next 12 months, do you expect to change your:</label>
				  </div></div><br>
				  <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-6 control-label" style="font-size:85%;">Occupation?</label>
						<div class="col-md-6">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="LIoccupationchangeyes" value="Yes" name="LI_occupationchange"/>
                      <label for="LIoccupationchangeyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="LIoccupationchangeno" name="LI_occupationchange">
                      <label for="LIoccupationchangeno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
                  </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-9 control-label" style="font-size:85%;">Country/province/city/municipality of residence?</label>
						<div class="col-md-3">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="LIaddresschangeyes" value="Yes" name="LI_addresschange"/>
                      <label for="LIaddresschangeyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="LIaddresschangeno" name="LI_addresschange">
                      <label for="LIaddresschangeno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
                  </div>
				  </div>
				  </div>
			 </div>
			 </div>

                  </div>
                  <div class="col-md-6">
                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">DETAILS OF POLICYOWNER</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <br>
            <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Surname</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_surname" id="P_surname" class="form-control input-sm mb15" />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Given Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_givenname" id="P_givenname" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					 <div class="col-md-4" style="padding:0;">
					 <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Middle Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_middlename" id="P_middlename" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					 </div>
					 </div>
				<div class="row">
				  <div class="col-md-8" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Other Legal Name or Alias</label>
                        <div class="col-sm-6">
                          <input type="text" name="P_alias" id="P_alias" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Gender</label>
                        <div class="col-sm-7">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="Pmale" value="Male" name="P_gender"/>
                      <label for="Pmale" style="font-size:85%;">Male</label>
                    </div><!-- rdio -->
                       <div class="rdio rdio-primary">
                      <input type="radio" value="Female" id="Pfemale" name="P_gender"/>
                      <label for="Pfemale" style="font-size:85%;">Female</label>
                    </div><!-- rdio -->
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 0px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Civil Status</label>
					  <div class="col-sm-7">
					  <select class="form-control input-sm mb15" id="P_civilstatus" name="P_civilstatus" onchange="PCivilStatus(this.value);">
		                  <option selected></option>
		                  <option value="Single">Single</option>
		                  <option value="Married">Married</option>
		                  <option value="Others">Others</option>
		                </select>
                      </div>
				  </div>
				  <div class="form-group"  id="Pcivilstatusothers" style="display:none;">
				         <label class="col-sm-5 control-label" style="font-size:85%;"></label>
					  <div class="col-sm-7">
                          <input type="text" name="P_civilstatusother" id="P_civilstatusother" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				  </div>
				  <script type="text/javascript">
				function PCivilStatus(val){
				 var element=document.getElementById('Pcivilstatusothers');
				 if(val=='Others')
					 element.style.display='block';
				 else  
					 element.style.display='none';
				}
				</script> 
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Salutation</label>
                        <div class="col-sm-6">
                          <input type="text" name="P_salutation" id="P_salutation" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date of Birth</label>
                        <div class="col-sm-8">
                          <div class="input-group">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="P_birthdate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div>
				  </div>
				  <div class="col-md-2" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Age</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_age" id="P_age" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nationality</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_nationality" id="P_nationality"  class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				 <div class="row">
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Birth</label>
                        <div class="col-sm-9">
                          <input type="text" name="P_placeofbirth" id="P_placeofbirth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">TIN/SSS/GSIS</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_tinsssgsis" id="P_tinsssgsis" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Occupation</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_occupation" id="P_occupation" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nature of Work or Nature of Business</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_natureofwork" id="P_natureofwork" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-5" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Employer</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_employer" id="P_employer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Nature of Business of Employer</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_natureofemployer" id="P_natureofemployer" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Gross Annual Income</label>
                        <div class="col-sm-6">
                          <input type="text" name="P_annualincome" id="P_annualincome" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-4">
				  <div class="form-group" style="padding:0; margin-bottom: 15px;">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Net Worth</label>
                        <div class="col-sm-6">
                          <input type="text" name="P_networth" id="P_networth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					  <div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 0px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Sources of Funds</label>
					  <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="P_sourceoffunds" id="P_sourceoffunds" onchange="PSourcesOfFundsother(this.value);">
		                  <option selected></option>
		                  <option value="Salary">Salary</option>
		                  <option value="Business">Business</option>
		                  <option value="Others">Others</option>
		                </select>
                      </div>
				  </div>
				  <div class="form-group" id="Psourcesoffundsothers" style="display:none;">
				         <label class="col-sm-5 control-label" style="font-size:85%;"></label>
					  <div class="col-sm-7">
                          <input type="text" name="P_sourceoffundsother" id="P_sourceoffundsother" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				  </div>
				   <script type="text/javascript">
					function PSourcesOfFundsother(val){
					 var element=document.getElementById('Psourcesoffundsothers');
					 if(val=='Others')
						 element.style.display='block';
					 else  
						 element.style.display='none';
					}
					</script> 
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-8" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-12 control-label" style="font-size:85%;">Do you currently file a tax return in the United States of America?</label>
                  </div>
				  </div>
				  <div class="col-sm-2" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="Ptaxreturnyes" value="Yes" name="P_taxreturnfiling"/>
                      <label for="Ptaxreturnyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-2" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="Ptaxreturnno" name="P_taxreturnfiling">
                      <label for="Ptaxreturnno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				   <div class="row">
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Mobile Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_mobilenumber" id="P_mobilenumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Telephone Number</label>
                        <div class="col-sm-7">
                          <input type="text" name="P_telephonenumber" id="P_telephonenumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-8" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Email Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_emailaddress" id="P_emailaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-2 control-label" style="font-size:85%;">Present Address</label>
                        <div class="col-sm-10">
                          <input type="text" name="P_presentaddress" id="P_presentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_presentcountry" id="P_presentcountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_presentzipcode" id="P_presentzipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-2 control-label" style="font-size:85%;">Permanent Address</label>
                        <div class="col-sm-10">
                          <input type="text" name="P_permanentaddress" id="P_permanentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_permanentcountry" id="P_permanentcountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_permanentzipcode" id="P_permanentzipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Business or Employer Address</label>
                        <div class="col-sm-9">
                          <input type="text" name="P_businessaddress" id="P_businessaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				  </div>
				  <div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_businesscountry" id="P_businesscountry" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
					<div class="col-md-6" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="P_businesszipcode" id="P_businesszipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
				  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				  <div class="col-md-12" style="padding:0;">
				  <label class="col-md-12 control-label" style="font-size:85%;">In the next 12 months, do you expect to change your:</label>
				  </div></div><br>
				  <div class="row">
				  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-6 control-label" style="font-size:85%;">Occupation?</label>
						<div class="col-md-6">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="Poccupationchangeyes" value="Yes" name="P_occupationchange"/>
                      <label for="Poccupationchangeyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="Poccupationchangeno" name="P_occupationchange">
                      <label for="Poccupationchangeno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
                  </div>
				  </div>
				  <div class="col-md-7" style="padding:0;">
				  <div class="form-group">
                        <label class="col-md-9 control-label" style="font-size:85%;">Country/province/city/municipality of residence?</label>
						<div class="col-md-3">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="Paddresschangeyes" value="Yes" name="P_addresschange"/>
                      <label for="Paddresschangeyes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="Paddresschangeno" name="P_addresschange">
                      <label for="Paddresschangeno" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
                  </div>
				  </div>
				  </div>
			 </div>
			 </div>
                  </div>
                  </div>
                <div class="row">
                
                <div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF; margin-left:10px; margin-right:10px;">
                <div class="row">
                <div class="col-md-1">
                </div>
				  <div class="col-md-5">
                     <div class="form-group">
                        <label class="col-md-8 control-label" style="font-size:85%;">Preferred Policyowner's Address for Correspondences</label>
						<div class="col-sm-4">
					  <select class="form-control input-sm mb15" name="P_preferredaddress" id="P_preferredaddress">
		                  <option selected></option>
		                  <option value="Present">Present</option>
		                  <option value="Permanent">Permanent</option>
		                  <option value="Business">Business</option>
		                </select>
                      </div>
                  </div>
                  </div>
				  <div class="col-md-5">
				  <div class="form-group">
                        <label class="col-sm-7 control-label" style="font-size:85%;">Relationship of Policy Owner to Life Insured</label>
                        <div class="col-sm-4">
                          <input type="text" name="P_reltolifeinsured" id="P_reltolifeinsured" class="form-control input-sm mb15"  />
                        </div>
                      </div>
                      </div>
                   <div class="col-md-1">
                </div>
				  </div>
                </div>
                </div>

                  </div>
                  
                  
                  <div class="tab-pane" id="beneficialowner">
				  <div class="row"><br>
				  <div class="col-md-2">
				  </div>
				  <div class="col-md-8">
				                    <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">DETAILS OF BENEFICIAL OWNER</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row"><br>
            <div class="col-md-2">
				  </div>
				<div class="col-md-6">
				<div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Do you have a Beneficial Owner?</label>
                        <div class="col-sm-3">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-3">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
                      </div>
					  </div>
					  <div class="col-md-2">
				  </div>
                  </div>
            <div class="row" id="BeneficialOwnerYes" style="display:none;"><br>
            <div class="col-md-1">
				  </div>
				<div class="col-md-6">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Name of Beneficial Owner</label>
                        <div class="col-sm-8">
                          <input type="text" name="BO_name" id="BO_name" class="form-control input-sm mb15" />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Contact Number</label>
                        <div class="col-sm-8">
                          <input type="text" name="BO_contactnumber" id="BO_contactnumber" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-1">
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
			 <div class="col-md-2">
				  </div>
					 </div><hr>
				
                  </div>
                <div class="tab-pane" id="beneficiaries">
                <div class="row"><br>
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
					  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">DEATAILS OF PRIMARY BENEFICIARY</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">

				  <div class="row"><br>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="PB_name" id="PB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-5" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date of Birth</label>
                        <div class="col-sm-8">
                          <div class="input-group">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="PB_birthdate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div>
					  </div>
						<div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Gender</label>
                        <div class="col-md-8">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="PBmale" value="Male" name="PB_gender"/>
                      <label for="PBmale" style="font-size:85%;">Male</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="Female" id="PBfemale" name="PB_gender">
                      <label for="PBfemale" style="font-size:85%;">Female</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
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
				<div class="col-md-3" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Relationship to Insured</label>
                        <div class="col-sm-6">
                          <input type="text" name="PB_reltoinsured" id="PB_reltoinsured" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-2" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">% Share</label>
                        <div class="col-sm-6">
                          <input type="text" name="PB_share" id="PB_share" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Type of Beneficiary</label>
                        <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="PB_typeofbeneficiary" id="PB_typeofbeneficiary">
		                  <option selected></option>
		                  <option value="Primary">Primary</option>
		                  <option value="Secondary">Secondary</option>
		                </select>
                      </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Beneficiary Designation</label>
                        <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="PB_beneficiarydesignation" id="PB_beneficiarydesignation">
		                  <option selected></option>
		                  <option value="Revocable">Revocable</option>
		                  <option value="Irrevocable">Irrevocable</option>
		                </select>
                      </div>
                      </div>
					  </div>
                  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				<div class="col-md-6" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Present Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="PB_presentaddress" id="PB_presentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="PB_country" id="PB_country" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="PB_zipcode" id="PB_zipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
                  </div>
                  </div>  
			</div>
			</div>
			<div class="col-md-2">
                </div>
				</div>
				<div class="row">
				<div class="col-md-2">
                </div>
                <div class="col-md-8">
                <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">DEATAILS OF SECONDARY BENEFICIARY</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">

				  <div class="row"><br>
					  <div class="col-md-4" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="SB_name" id="SB_name" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-5" style="padding:0;">
						<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Date of Birth</label>
                        <div class="col-sm-8">
                          <div class="input-group">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="SB_birthdate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div>
                        </div>
                      </div>
					  </div>
						<div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Gender</label>
                        <div class="col-md-8">
				  <div class="col-sm-12" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="SBmale" value="Male" name="SB_gender"/>
                      <label for="SBmale" style="font-size:85%;">Male</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-12" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="Female" id="SBfemale" name="SB_gender">
                      <label for="SBfemale" style="font-size:85%;">Female</label>
                    </div><!-- rdio -->
                        </div>
					  </div>
                      </div>
                      </div>
                  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				<div class="row">
				<div class="col-md-8" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Place of Birth</label>
                        <div class="col-sm-9">
                          <input type="text" name="SB_placeofbirth" id="SB_placeofbirth" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Nationality</label>
                        <div class="col-sm-8">
                          <input type="text" name="SB_nationality" id="SB_nationality" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
                  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				<div class="col-md-3" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">Relationship to Insured</label>
                        <div class="col-sm-6">
                          <input type="text" name="SB_reltoinsured" id="SB_reltoinsured" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-2" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-6 control-label" style="font-size:85%;">% Share</label>
                        <div class="col-sm-6">
                          <input type="text" name="SB_share" id="SB_share" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Type of Beneficiary</label>
                        <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="SB_typeofbeneficiary" id="SB_typeofbeneficiary">
		                  <option selected></option>
		                  <option value="Primary">Primary</option>
		                  <option value="Secondary">Secondary</option>
		                </select>
                      </div>
                      </div>
					  </div>
					  <div class="col-md-4" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Beneficiary Designation</label>
                        <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="SB_beneficiarydesignation" id="SB_beneficiarydesignation">
		                  <option selected></option>
		                  <option value="Revocable">Revocable</option>
		                  <option value="Irrevocable">Irrevocable</option>
		                </select>
                      </div>
                      </div>
					  </div>
                  </div><hr style="margin-top: 0px; margin-bottom: 30px;">
				  <div class="row">
				<div class="col-md-6" style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Present Address</label>
                        <div class="col-sm-8">
                          <input type="text" name="SB_presentaddress" id="SB_presentaddress" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Country</label>
                        <div class="col-sm-8">
                          <input type="text" name="SB_country" id="SB_country" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
					  <div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Zip Code</label>
                        <div class="col-sm-8">
                          <input type="text" name="SB_zipcode" id="SB_zipcode" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
                  </div>
                  </div>  
			</div>
                </div>
                <div class="col-md-2">
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">POLICY INFORMATION</h4>
            </div>	
            <div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row"><br>
            <div class="col-md-1">
				</div>
				<div class="col-md-3"style="padding:0;">
                      <div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Plan Name</label>
                        <div class="col-sm-8">
                          <input type="text" name="PI_planname" id="PI_planname" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-3" style="padding:0;">
				  <div class="form-group">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Sum Assured</label>
                        <div class="col-sm-7">
                          <input type="text" name="PI_sumassured" id="PI_sumassured" class="form-control input-sm mb15"  />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4" style="padding:0;">
				   <div class="form-group">
                        <label class="col-sm-3 control-label" style="font-size:85%;">Currency</label>
                        <div class="col-sm-4" style="padding:0;">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="PI_currencyphp" value="Php" name="PI_currency">
                      <label for="PI_currencyphp" style="font-size:85%;">PhP</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-3" style="padding:0;">
                       <div class="rdio rdio-primary">
                      <input type="radio" value="USD" id="PI_currencyusd" name="PI_currency">
                      <label for="PI_currencyusd" style="font-size:85%;">USD</label>
                    </div><!-- rdio -->
                        </div>
                      </div>
					  </div>
					  <div class="col-md-1">
				</div>
                  </div>
			 </div>
			 </div>
			 <div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Benefits and Amount</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row"><br>
				<div class="col-md-4" style="padding:0;">
                      <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                          <input type="checkbox" value="1" id="PI_benefits1" onclick="PiBenefit1(this.checked, 'textBox')"/>
                          <label for="PI_benefits1" style="font-size:85%; display:inline;">Accelerated Total and Permanent Disability (TPD)</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" id="PI_benefit1" name="PI_benefit1" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>

					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits2" onclick="PiBenefit2(this.checked, 'textBox')"/>
                            <label for="PI_benefits2" style="font-size:85%; display:inline;">Accidental Death and Disablement Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit2" id="PI_benefit2" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits3" onclick="PiBenefit3(this.checked, 'textBox')"/>
                            <label for="PI_benefits3" style="font-size:85%; display:inline;">Accelerated Life Care Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit3" id="PI_benefit3" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits4" onclick="PiBenefit4(this.checked, 'textBox')"/>
                            <label for="PI_benefits4" style="font-size:85%; display:inline;">Additional Term Rider</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit4" id="PI_benefit4" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits5" onclick="PiBenefit5(this.checked, 'textBox')"/>
                            <label for="PI_benefits5" style="font-size:85%; display:inline;">Crisis Cover Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit5" id="PI_benefit5" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits6" onclick="PiBenefit6(this.checked, 'textBox')"/>
                            <label for="PI_benefits6" style="font-size:85%; display:inline;">Crisis Cover Plus Benefit for Term</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit6" id="PI_benefit6" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits7" onclick="PiBenefit7(this.checked, 'textBox')"/>
                            <label for="PI_benefits7" style="font-size:85%; display:inline;">Crisis Cover Waiver</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text"name="PI_benefit7" id="PI_benefit7" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits8" onclick="PiBenefit8(this.checked, 'textBox')"/>
                            <label for="PI_benefits8" style="font-size:85%; display:inline;">Life Care Advance Plus</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit8" id="PI_benefit8" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits9" onclick="PiBenefit9(this.checked, 'textBox')"/>
                            <label for="PI_benefits9" style="font-size:85%; display:inline;">Life Care Plus</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit9" id="PI_benefit9" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits10" onclick="PiBenefit10(this.checked, 'textBox')"/>
                            <label for="PI_benefits10" style="font-size:85%; display:inline;">Life Care Waiver</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit10" id="PI_benefit10" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits11" onclick="PiBenefit11(this.checked, 'textBox')"/>
                            <label for="PI_benefits11" style="font-size:85%; display:inline;">Multiple Life Care Plus</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit11" id="PI_benefit11" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits12" onclick="PiBenefit12(this.checked, 'textBox')"/>
                            <label for="PI_benefits12" style="font-size:85%; display:inline;">Non-accelerated Total and Permanent Disability Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit12" id="PI_benefit12" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  </div>
				<div class="col-md-4" style="padding:0;">
				  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits13" onclick="PiBenefit13(this.checked, 'textBox')"/>
                            <label for="PI_benefits13" style="font-size:85%; display:inline;">Payor Term Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit13" id="PI_benefit13" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits14" onclick="PiBenefit14(this.checked, 'textBox')"/>
                            <label for="PI_benefits14" style="font-size:85%; display:inline;">Payor Waiver of Regular Premium</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit14" id="PI_benefit14" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits15" onclick="PiBenefit15(this.checked, 'textBox')"/>
                            <label for="PI_benefits15" style="font-size:85%; display:inline;">Renewable Convertible Level Term Assurance Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit15" id="PI_benefit15" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits16" onclick="PiBenefit16(this.checked, 'textBox')"/>
                            <label for="PI_benefits16" style="font-size:85%; display:inline;">Waiver of Premium on TPD</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_benefit16" id="PI_benefit16" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_benefits17" onclick="PiBenefit17(this.checked, 'textBox')"/>
                            <label for="PI_benefits17" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                        </div>
                      </div>
                  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-1">
                        </div>
						<div class="col-sm-7">
                          <input style="margin-top:0px;" type="text" name="PI_benefitother" id="PI_benefitother" class="form-control input-sm mb15" disabled />
                        </div>
						<div class="col-sm-4">
                          <input style="margin-top:0px;" type="text" name="PI_benefit17" id="PI_benefit17" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>

					  </div>
                  </div>
			 </div>
			 </div>
			  <div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Variable Life and Amount</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_variables1" onclick="PiVariable1(this.checked, 'textBox')"/>
                            <label for="PI_variables1" style="font-size:85%; display:inline;">Variable Life Rider (One-off Premium)</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_variable1" id="PI_variable1" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_variables2" onclick="PiVariable2(this.checked, 'textBox')"/>
                            <label for="PI_variables2" style="font-size:85%; display:inline;">Variable Life Rider (Regular Premium)</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_variable2" id="PI_variable2" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
						<div class="col-sm-6">
                            <label for="male4" style="font-size:85%;">No. of years to be billed</label>
                        </div>
						<div class="col-sm-6">
                          <input type="text" name="PI_variable3" id="PI_variable3" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				</div>
					 </div>
			 </div>
			 </div>
			  <div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Hospital Income Benefits and Amount</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_hospitals1" onclick="PiHospital1(this.checked, 'textBox')" />
                            <label for="PI_hospitals1" style="font-size:85%; display:inline;">Daily Hospital Income Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_hospital1" id="PI_hospital1" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_hospitals2" onclick="PiHospital2(this.checked, 'textBox')"  />
                            <label for="PI_hospitals2" style="font-size:85%; display:inline;">Intensive Care Unit Benef</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_hospital2" id="PI_hospital2" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_hospitals3" onclick="PiHospital3(this.checked, 'textBox')"  />
                            <label for="PI_hospitals3" style="font-size:85%; display:inline;">Surgical Expense Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_hospital3" id="PI_hospital3" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_hospitals4" onclick="PiHospital4(this.checked, 'textBox')" />
                            <label for="PI_hospitals4" style="font-size:85%; display:inline;">Long-term Hospitalization Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_hospital4" id="PI_hospital4" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_hospitals5" onclick="PiHospital5(this.checked, 'textBox')"  />
                            <label for="PI_hospitals5" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                        </div>
                      </div>
                 <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-1">
                        </div>
						<div class="col-sm-7">
                          <input style="margin-top:0px;" type="text" name="PI_hospitalother" id="PI_hospitalother" class="form-control input-sm mb15" disabled />
                        </div>
						<div class="col-sm-4">
                          <input style="margin-top:0px;" type="text" name="PI_hospital5" id="PI_hospital5" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				</div>
					 </div>
			 </div>
			 </div>
			  <div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Personal Accident Benefits and Amount</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals1" onclick="PiPersonal1(this.checked, 'textBox')"/>
                            <label for="PI_personals1" style="font-size:85%; display:inline;">Accidental Death and Disablement Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text"  name="PI_personal1" id="PI_personal1" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals2" onclick="PiPersonal2(this.checked, 'textBox')"  />
                            <label for="PI_personals2" style="font-size:85%; display:inline;">Dangerous Sports Coverage</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal2" id="PI_personal2" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals3" onclick="PiPersonal3(this.checked, 'textBox')" />
                            <label for="PI_personals3" style="font-size:85%; display:inline;">Double Indemnity Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal3" id="PI_personal3" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals4" onclick="PiPersonal4(this.checked, 'textBox')" />
                            <label for="PI_personals4" style="font-size:85%; display:inline;">Field Trip Coverage</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal4" id="PI_personal4" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals5" onclick="PiPersonal5(this.checked, 'textBox')"/>
                            <label for="PI_personals5" style="font-size:85%; display:inline;">Medical Reimbursement Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal5" id="PI_personal5" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals6" onclick="PiPersonal6(this.checked, 'textBox')" />
                            <label for="PI_personals6" style="font-size:85%; display:inline;">Murder and Assault Benefit</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal6" id="PI_personal6" class="form-control input-sm mb15" disabled  />
                        </div>
                      </div>
				</div>
				<div class="col-md-4" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals7" onclick="PiPersonal7(this.checked, 'textBox')" />
                            <label for="PI_personals7" style="font-size:85%; display:inline;">Total and Permanent Disability</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                          <input type="text" name="PI_personal7" id="PI_personal7" class="form-control input-sm mb15"  disabled />
                        </div>
                      </div>
					  <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-8">
                          <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_personals8" onclick="PiPersonal8(this.checked, 'textBox')" />
                            <label for="PI_personals8" style="font-size:85%; display:inline;">Others</label>
                          </div>
                        </div>
						<div class="col-sm-4">
                        </div>
                      </div>
                      <div class="form-group" style="margin-bottom: 5px;">
                        <div class="col-sm-1">
                        </div>
						<div class="col-sm-7">
                          <input style="margin-top:0px;" type="text" name="PI_personalother" id="PI_personalother" class="form-control input-sm mb15" disabled />
                        </div>
						<div class="col-sm-4">
                          <input style="margin-top:0px;" type="text" name="PI_personal8" id="PI_personal8" class="form-control input-sm mb15" disabled />
                        </div>
                      </div>
				</div>
					 </div>
			 </div>
			 </div>
			  <div class="panel panel-default" style="margin-bottom: 5px;">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Premium Information</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				<div class="col-md-3" style="padding:0;">
				<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Annualized Premium</label>
                        <div class="col-sm-8">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				</div>
				<div class="col-md-3" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Initial Premium Paid</label>
                        <div class="col-sm-8">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
                      </div>
				</div>
				<div class="col-md-3" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Mode of Payment</label>
                        <div class="col-sm-8">
					  <select class="form-control input-sm mb15" name="color">
		                  <option selected></option>
		                  <option value="Annual" >Annual</option>
		                  <option value="Semi-annual">Semi-annual</option>
		                  <option value="Quarterly">Quarterly</option>
		                  <option value="MOnthly">Monthly</option>
		                </select>
                      </div>
				</div>
				</div>
				<div class="col-sm-3" style="padding:0;">
				<div class="form-group" style="margin-bottom: 5px;">
                        <label class="col-sm-5 control-label" style="font-size:85%;">Method of Payment</label>
                        <div class="col-sm-7">
					  <select class="form-control input-sm mb15" name="color" onchange="PIMethodOfPayment(this.value);">
		                  <option selected></option>
		                  <option value="Cash">Cash</option>
		                  <option value="Check">Check</option>
		                  <option value="Post-dated check">Post-dated check</option>
		                  <option value="Credit Card">Credit Card</option>
		                  <option value="Auto-debit arrangement">Auto-debit arrangement</option>
		                  <option value="Others">Others</option>
		                </select>
                      </div>
					  </div>
				</div>
					 </div>
			 </div>
			 </div>
			 <div class="col-md-6" style="padding:0;" style="margin-bottom: 5px;">
			 <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Non-Forfeiture Options</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row" style="padding-left:20px">
				<div class="col-md-6" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_nonforfeiture1"  />
                            <label for="PI_nonforfeiture1" style="font-size:85%;">Premium Loan Option</label>
                 </div></div>
                 <div class="col-md-6" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_nonforfeiture2"  />
                            <label for="PI_nonforfeiture2" style="font-size:85%;">Cash Surrender Value</label>
                 </div></div>
                
					 </div>
			<div class="row" style="padding-left:20px">
			 <div class="col-md-6" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_nonforfeiture3"  />
                            <label for="PI_nonforfeiture3" style="font-size:85%;">Extended Term Insurance</label>
                 </div></div>
			</div>
			 </div>
			 </div>
				</div>
				<div class="col-md-6" style="padding:0;" style="margin-bottom: 5px;">
				<div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Dividend Options</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row" style="padding-left:20px">
				<div class="col-md-5" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_dividend1" />
                            <label for="PI_dividend1" style="font-size:85%;">Paid in Cash</label>
                 </div></div>
                 <div class="col-md-7" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_dividend2" />
                            <label for="PI_dividend2" style="font-size:85%;">Used to buy Paid-up Insurance</label>
                 </div></div>
                
					 </div>
			<div class="row" style="padding-left:20px">
			 <div class="col-md-7" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_dividend3"/>
                            <label for="PI_dividend3" style="font-size:85%;">Used to Pay a Portion of Premium </label>
                 </div></div>
			</div>
			 </div>
			 
			 </div>
				</div>
				<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
				<div class="col-md-2"></div>
				<div class="col-md-10" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="PI_agreepolicy" />
                            <label for="PI_agreepolicy" style="font-size:85%;">I agree to use any dividend accumulation of the Policy towards any non-forfeiture option in effect</label>
                 </div></div>
			 </div>
				</div>
				<div class="col-md-1">
				</div>
				</div>
				
				
				
				
				</div>  				  
                <div class="tab-pane" id="personalhistory">
            
            <div class="row"><br>
            <div class="col-md-1"></div>
            <div class="col-md-10">
            <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">PERSONAL HISTORY</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">Have you:</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Life Insured</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Policy Owner</label>
				  </div>
				<div class="col-md-2" style="background-color:#e4e7ea">
				<label class="control-label" style="font-size:85%;">Details of "YES" answer</label>
				</div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
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
			<div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. flown in an aircraft other than as a passenger?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes1" value="Yes" name="PhLi_Yes1"/>
                      <label for="phliyes1" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino1" name="PhLi_Yes1">
                      <label for="phlino1" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes1" value="Yes" name="PhP_Yes1"/>
                      <label for="phpyes1" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno1" name="PhP_Yes1">
                      <label for="phpno1" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes1" id="PH_yes1" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. driven a motorcycle or engaged in scuba diving, bungee umping, or other hazardous sports?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">c. been active in politics as a candidate or in any other capacity during last five (5) years?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes3" value="Yes" name="PhLi_Yes3"/>
                      <label for="phliyes3" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino3" name="PhLi_Yes3">
                      <label for="phlino3" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes3" value="Yes" name="PhP_Yes3"/>
                      <label for="phpyes3" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno3" name="PhP_Yes3">
                      <label for="phpno3" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes3" id="PH_yes3" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">d. ever made an application for life insurance or reinstatement thereof which was declined, postponed, cancelled, or modified in kind, amount, or rate?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes4" value="Yes" name="PhLi_Yes4"/>
                      <label for="phliyes4" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino4" name="PhLi_Yes4">
                      <label for="phlino4" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes4" value="Yes" name="PhP_Yes4"/>
                      <label for="phpyes4" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno4" name="PhP_Yes4">
                      <label for="phpno4" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes4" id="PH_yes4" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">e. received any threat in your life, person, or safety?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes5" value="Yes" name="PhLi_Yes5"/>
                      <label for="phliyes5" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino5" name="PhLi_Yes5">
                      <label for="phlino5" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes5" value="Yes" name="PhP_Yes5"/>
                      <label for="phpyes5" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno5" name="PhP_Yes5"/>
                      <label for="phpno5" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes5" id="PH_yes5" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">f. do you have any pending application with other insurance companies?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes6" value="Yes" name="PhLi_Yes6"/>
                      <label for="phliyes6" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino6" name="PhLi_Yes6">
                      <label for="phlino6" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes6" value="Yes" name="PhP_Yes6"/>
                      <label for="phpyes6" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno6" name="PhP_Yes6">
                      <label for="phpno6" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes6" id="PH_yes6" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
			<div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">What insuarnce(s) is/are now in force on the life of Life Insured?</label>
				  </div>
				  <div class="col-md-2">
				  <label class="col-md-12 control-label" style="font-size:85%;">Company</label>
				  <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				  <div class="col-md-2">
				  <label class="col-md-12 control-label" style="font-size:85%; padding-right:0px">Amount of coverage</label>
				  <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
				  </div>
				<div class="col-md-2">
				<label class="col-md-12 control-label" style="font-size:85%; padding-right:0px">Rider(s)/Year Issued</label>
				<div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
				</div>
					 </div><hr>
			<div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">Has there been or will there be any charge in any existing insurance in force?</label>
				  </div>
				  <div class="col-md-1">
				  <div class="rdio rdio-primary">
                            <input type="radio" id="male4" value="m" name="gender" />
                            <label for="male4" style="font-size:85%;">Yes</label>
                          </div>
				  </div>
				  <div class="col-md-1">
                          <div class="rdio rdio-primary">
                            <input type="radio" value="f" id="female4" name="gender"/>
                            <label for="female4" style="font-size:85%;">No</label>
                          </div>
				  </div>
				<div class="col-md-4">
				</div>
					 </div><hr>
			<div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">Will premiums for the insurance applied for be paid by a policy loan from any existing policy?</label>
				  </div>
				  <div class="col-md-1">
				  <div class="rdio rdio-primary">
                            <input type="radio" id="male4" value="m" name="gender" />
                            <label for="male4" style="font-size:85%;">Yes</label>
                          </div>
				  </div>
				  <div class="col-md-1">
				                   <div class="rdio rdio-primary">
                            <input type="radio" value="f" id="female4" name="gender"/>
                            <label for="female4" style="font-size:85%;">No</label>
                          </div>
				  </div>
				<div class="col-md-4">
				</div>
					 </div>
			 </div>
			 </div>
			                   <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Family Details</h4>
            </div>			<div class="panel-body" style="border-style: solid; padding:5px; border-width: 1px; border-color: #EAECEF;">
            <div class="row"><br>
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%; padding-left:10px;">Has any of your family members suffered from: tuberculosis, diabetes, cancer, high blood pressure, heart or kidney disease, sickle cell disease, or mental illness?</label>
				  </div>
				  <div class="col-md-1">
				  <div class="rdio rdio-primary">
                            <input type="radio" id="male4" value="m" name="gender" />
                            <label for="male4" style="font-size:85%;">Yes</label>
                          </div>
				  </div>
				  <div class="col-md-1">
                          <div class="rdio rdio-primary">
                            <input type="radio" value="f" id="female4" name="gender"/>
                            <label for="female4" style="font-size:85%;">No</label>
                          </div>
				  </div>
				<div class="col-md-4">
				</div>
					 </div><hr style="margin-top: 0px; margin-bottom: 10px;">
			<div class="row">
			<div class="col-md-6" style="padding-left: 10px;padding-right: 5px;">
			                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Life Insured</h4>
            </div>			<div class="panel-body" style="border-style: solid; padding:5px; border-width: 1px; border-color: #EAECEF;">
            <div class="table-responsive">
          <table class="table mb30">
		   <col width="80">
			<col width="80">
			<col width="50">
			<col width="80">
			<col width="50">
            <thead>
              <tr>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Family Members</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Condition/Illness</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Age at onset</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Cause of death</label></th>
				<th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Age at death</label></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Father</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Mother</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Spouse</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;">Siblings</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>			 
              <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;">Children</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
            </tbody>
          </table>
          </div><!-- table-responsive -->
			 </div>
			 </div>
			
				</div>
			<div class="col-md-6" style="padding-left: 5px;padding-right: 10px;">
			                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Policyowner</h4>
            </div>			<div class="panel-body" style="border-style: solid; padding:5px; border-width: 1px; border-color: #EAECEF;">
            <div class="table-responsive">
          <table class="table mb30">
		   <col width="80">
			<col width="80">
			<col width="50">
			<col width="80">
			<col width="50">
            <thead>
              <tr>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Family Members</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Condition/Illness</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Age at onset</label></th>
                <th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Cause of death</label></th>
				<th style="padding:5px"><label style="font-size:85%; font-weight:bold;">Age at death</label></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Father</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Mother</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
              <tr>
                <td style="padding:5px"><label style="font-size:85%;">Spouse</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;">Siblings</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>			 
              <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;">Children</label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
			  <tr>
                <td style="padding:5px"><label style="font-size:85%;"></label></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;" /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
                <td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
				<td style="padding:5px"><input type="text" name="LIage" class="form-control input-sm mb15" style="margin-bottom:3px;"  /></td>
              </tr>
            </tbody>
          </table>
          </div><!-- table-responsive -->
			 </div>
			 </div>
			
				</div>
			</div>
            
            <div class="col-md-1"></div>
            </div>
            
			</div>
			<div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Height and Weight</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; padding-left:25px; border-color: #EAECEF;"><div class="row">

			<div class="row">
			
			<div class="col-md-6" style="padding-left: 5px;padding-right: 10px;">
			                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Life Insured</h4>
            </div>			<div class="panel-body" style="border-style: solid; padding:5px; border-width: 1px; border-color: #EAECEF;">
            			<div class="row">
			<div class="col-md-6">
             <div class="col-md-6">
                    <label class="col-sm-12 control-label" style="font-size:85%;">Height</label>
                        <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
       
            </div>
			<div class="col-md-6">
                 <label class="col-sm-12 control-label"style="font-size:85%;">Weight</label>
                        <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>       
            </div>			
            </div>
			<div class="col-md-6">
			<div class="row">
            	<label class="control-label" style="font-size:85%; margin-right:10px;">Have you lost weight during the past 12 months?</label>
				</div>	
			<div class="row">
				<div class="col-sm-4">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-4">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
            </div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-12">
			<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Reason and amount (lbs) of weight loss</label>
                        <div class="col-sm-8">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
                      </div>
			</div>
			</div>
			 </div>
			 </div>
			
				</div>
			<div class="col-md-6" style="padding-left: 5px;padding-right: 10px;">
			                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#eaecef; height:30px; padding:5px;">
              <h4 class="panel-title" style="font-size:85%; color:#4a535e; padding-left:10px;">Policyowner</h4>
            </div>			<div class="panel-body" style="border-style: solid; padding:5px; border-width: 1px; border-color: #EAECEF;">
            			<div class="row">
			<div class="col-md-6">
             <div class="col-md-6">
                    <label class="col-sm-12 control-label" style="font-size:85%;">Height</label>
                        <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
       
            </div>
			<div class="col-md-6">
                 <label class="col-sm-12 control-label" style="font-size:85%;">Weight</label>
                        <div class="col-sm-12">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>       
            </div>			
            </div>
			<div class="col-md-6">
			<div class="row">
            	<label class="control-label" style="font-size:85%; margin-right:10px;">Have you lost weight during the past 12 months?</label>
				</div>	
			<div class="row">
				<div class="col-sm-4">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-4">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
            </div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-12">
			<div class="form-group">
                        <label class="col-sm-4 control-label" style="font-size:85%;">Reason and amount (lbs) of weight loss</label>
                        <div class="col-sm-8">
                          <input type="text" name="LIage" class="form-control input-sm mb15"  />
                        </div>
                      </div>
			</div>
			</div>
			 </div>
			 </div>
			
				</div>
			</div>

			 </div>
			 </div>
            </div>	
			</div>	
			</div>
				</div>
				<div class="tab-pane" id="questionnaire">
				<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
				                  <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">Non-medical Questionnaire for Adults (Ages 18 and Above)</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">HAVE YOU</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Life Insured</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Policy Owner</label>
				  </div>
				<div class="col-md-2" style="background-color:#e4e7ea">
				<label class="control-label" style="font-size:85%;">Details of "YES" answer</label>
				</div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
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
			<div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. within the past five years, consulted or been treated or examined by any physician or medical practitioners?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_a" value="Yes" name="Q1li_Yes_a"/>
                      <label for="q1li_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_a" name="Q1li_Yes_a">
                      <label for="q1li_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_a" value="Yes" name="Q1p_Yes_a"/>
                      <label for="q1p_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_a" name="Q1p_Yes_a">
                      <label for="q1p_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesa" id="q1_yesa" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. ever had x-ray, electrocardiogram, blood studies or other diagnostic test?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_b" value="Yes" name="Q1li_Yes_b"/>
                      <label for="q1li_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_b" name="Q1li_Yes_b">
                      <label for="q1li_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
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
				  <label class="control-label" style="font-size:85%;">c. ever been in a hospital, clinic, sanitarium, or institute for observation, diagnosis, operation, or treatment?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_c" value="Yes" name="Q1li_Yes_c"/>
                      <label for="q1li_yes_c" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_c" name="Q1li_Yes_c">
                      <label for="q1li_no_c" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
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
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">d. had or been told you had acquired immune deficiency syndrome (AIDS), AIDS-related complications or AIDS-related cnditions?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_d" value="Yes" name="Q1li_Yes_d"/>
                      <label for="q1li_yes_d" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_d" name="Q1li_Yes_d">
                      <label for="q1li_no_d" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_d" value="Yes" name="Q1p_Yes_d"/>
                      <label for="q1p_yes_d" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_d" name="Q1p_Yes_d">
                      <label for="q1p_no_d" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesd" id="q1_yesd" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">e. had any form of sexually transmitted disease (STD)? Is there anything in your lifestyle which could expose you to risk of AIDS?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_e" value="Yes" name="Q1li_Yes_e"/>
                      <label for="q1li_yes_e" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_e" name="Q1li_Yes_e">
                      <label for="q1li_no_e" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_e" value="Yes" name="Q1p_Yes_e"/>
                      <label for="q1p_yes_e" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_e" name="Q1p_Yes_e"/>
                      <label for="q1p_no_e" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yese" id="q1_yese" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">f. been tested positive for antibodies to the AIDS virus?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_f" value="Yes" name="Q1li_Yes_f"/>
                      <label for="q1li_yes_f" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_f" name="Q1li_Yes_f">
                      <label for="q1li_no_f" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_f" value="Yes" name="Q1p_Yes_f"/>
                      <label for="q1p_yes_f" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_f" name="Q1p_Yes_f">
                      <label for="q1p_no_f" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesf" id="q1_yesf" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">g. had any abnormally, deformity, disease, or disorder?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_g" value="Yes" name="Q1li_Yes_g"/>
                      <label for="q1li_yes_g" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_g" name="Q1li_Yes_g">
                      <label for="q1li_no_g" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_g" value="Yes" name="Q1p_Yes_g"/>
                      <label for="q1p_yes_g" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_g" name="Q1p_Yes_g">
                      <label for="q1p_no_g" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text"name="q1_yesg" id="q1_yesg" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">h. had and/or presently receiving treatment or taking medication of any kind?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_h" value="Yes" name="Q1li_Yes_h"/>
                      <label for="q1li_yes_h" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_h" name="Q1li_Yes_h">
                      <label for="q1li_no_h" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_h" value="Yes" name="Q1p_Yes_h"/>
                      <label for="q1p_yes_h" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_h" name="Q1p_Yes_h">
                      <label for="q1p_no_h" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesh" id="q1_yesh" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">i. ever drank alcoholic beverages, taken habit-forming drugs or sought advice or treatment for alcoholism, drug habit or other addiction</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_i" value="Yes" name="Q1li_Yes_i"/>
                      <label for="q1li_yes_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_i" name="Q1li_Yes_i">
                      <label for="q1li_no_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_i" value="Yes" name="Q1p_Yes_i"/>
                      <label for="q1p_yes_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_i" name="Q1p_Yes_i">
                      <label for="q1p_no_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesi" id="q1_yesi" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i) Drugs</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_i_i" value="Yes" name="Q1li_Yes_i_i"/>
                      <label for="q1li_yes_i_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_i_i" name="Q1li_Yes_i_i">
                      <label for="q1li_no_i_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_i_i" value="Yes" name="Q1p_Yes_i_i"/>
                      <label for="q1p_yes_i_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_i_i" name="Q1p_Yes_i_i">
                      <label for="q1p_no_i_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesi_i" id="q1_yesi_i" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii) Alcohol intake per week</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_i_ii" value="Yes" name="Q1li_Yes_i_ii"/>
                      <label for="q1li_yes_i_ii" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_i_ii" name="Q1li_Yes_i_ii">
                      <label for="q1li_no_i_ii" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_i_ii" value="Yes" name="Q1p_Yes_i_ii"/>
                      <label for="q1p_yes_i_ii" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_i_ii" name="Q1p_Yes_i_ii">
                      <label for="q1p_no_i_ii" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesi_ii" id="q1_yesi_ii" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- wine (number of glasses)</label>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1li_yeswine" id="q1li_yeswine" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1p_yeswine" id="q1p_yeswine" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yeswine" id="q1_yeswine" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- beer (number of 350 mL glasses)</label>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1li_yesbeer" id="q1li_yesbeer" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1p_yesbeer" id="q1p_yesbeer" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesbeer" id="q1_yesbeer" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- hard liquor (number of shots)</label>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1li_yeshard" id="q1li_yeshard" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1p_yeshard" id="q1p_yeshard" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yeshard" id="q1_yeshard" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">j. smoked cigarettes/tobacco within the past year?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1li_yes_j" value="Yes" name="Q1li_Yes_j"/>
                      <label for="q1li_yes_j" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1li_no_j" name="Q1li_Yes_j">
                      <label for="q1li_no_j" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q1p_yes_j" value="Yes" name="Q1p_Yes_j"/>
                      <label for="q1p_yes_j" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q1p_no_j" name="Q1p_Yes_j">
                      <label for="q1p_no_j" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesj" id="q1_yesj" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i) How many years have you smoked/been smoking cigarettes and/or tobacco?</label>
				  </div>
				  <div class="col-md-2">
				  <input type="text"name="q1li_yesj_i" id="q1li_yesj_i" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1p_yesj_i" id="q1p_yesj_i" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesj_i" id="q1_yesj_i" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii) What is the average number of sticks you smoke daily?</label>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1li_yesj_ii" id="q1li_yesj_ii" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				  <div class="col-md-2">
				  <input type="text" name="q1p_yesj_ii" id="q1p_yesj_ii" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q1_yesj_ii" id="q1_yesj_ii" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">HAVE YOU EVER HAD OR BEEN TOLD THAT YOU HAD OR SOUGHT ADVICE FOR:</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Life Insured</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Policy Owner</label>
				  </div>
				<div class="col-md-2" style="background-color:#e4e7ea">
				<label class="control-label" style="font-size:85%;">Details of "YES" answer</label>
				</div> 
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. diziness, faintingspells, epilepsy, nervous breakdown, severe headaches, or any disease or disorder of the brain or nervous system</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_a" value="Yes" name="Q2li_Yes_a"/>
                      <label for="q2li_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_a" name="Q2li_Yes_a">
                      <label for="q2li_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_a" value="Yes" name="Q2p_Yes_a"/>
                      <label for="q2p_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_a" name="Q2p_Yes_a">
                      <label for="q2p_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesa" id="q2_yesa" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. asthma, hay fever, chronic cough, spitting of blood, tuberculosis, or any disease or disorder of the lungs or respiratory system</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_b" value="Yes" name="Q2li_Yes_b"/>
                      <label for="q2li_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_b" name="Q2li_Yes_b">
                      <label for="q2li_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_b" value="Yes" name="Q2p_Yes_b"/>
                      <label for="q2p_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_b" name="Q2p_Yes_b">
                      <label for="q2p_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesb" id="q2_yesb" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">c. high blood pressure, chest pain, shortness of breathe, heart murmur, or any other disease of the heart or circulatory system</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_c" value="Yes" name="Q2li_Yes_c"/>
                      <label for="q2li_yes_c" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_c" name="Q2li_Yes_c">
                      <label for="q2li_no_c" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_c" value="Yes" name="Q2p_Yes_c"/>
                      <label for="q2p_yes_c" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_c" name="Q2p_Yes_c">
                      <label for="q2p_no_c" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesc" id="q2_yesc" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">d. any disease or disorderof the stomach, intestines, bowel, rectum, appendix, liver or gallbladder?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_d" value="Yes" name="Q2li_Yes_d"/>
                      <label for="q2li_yes_d" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_d" name="Q2li_Yes_d">
                      <label for="q2li_no_d" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_d" value="Yes" name="Q2p_Yes_d"/>
                      <label for="q2p_yes_d" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_d" name="Q2p_Yes_d">
                      <label for="q2p_no_d" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesd" id="q2_yesd" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">e. nephritis, kidney stone, or any disease or disorderof the kidney, bladder or prostate?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_e" value="Yes" name="Q2li_Yes_e"/>
                      <label for="q2li_yes_e" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_e" name="Q2li_Yes_e">
                      <label for="q2li_no_e" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_e" value="Yes" name="Q2p_Yes_e"/>
                      <label for="q2p_yes_e" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_e" name="Q2p_Yes_e">
                      <label for="q2p_no_e" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yese" id="q2_yese" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">f. diabetes, thyroid, or other endocrine disorder?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_f" value="Yes" name="Q2li_Yes_f"/>
                      <label for="q2li_yes_f" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_f" name="Q2li_Yes_f">
                      <label for="q2li_no_f" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_f" value="Yes" name="Q2p_Yes_f"/>
                      <label for="q2p_yes_f" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_f" name="Q2p_Yes_f">
                      <label for="q2p_no_f" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesf" id="q2_yesf" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">g. arthiritis, rheumatism, or any other disease ro disorder of the back, spines, bones, joints, or muscles?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_g" value="Yes" name="Q2li_Yes_g"/>
                      <label for="q2li_yes_g" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_g" name="Q2li_Yes_g">
                      <label for="q2li_no_g" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_g" value="Yes" name="Q2p_Yes_g"/>
                      <label for="q2p_yes_g" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_g" name="Q2p_Yes_g">
                      <label for="q2p_no_g" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesg" id="q2_yesg" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">h. cancer (including carcinoma in situ) or a tumor or ulcer of any kind or any abnormal tissue growth?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_h" value="Yes" name="Q2li_Yes_h"/>
                      <label for="q2li_yes_h" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_h" name="Q2li_Yes_h">
                      <label for="q2li_no_h" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_h" value="Yes" name="Q2p_Yes_h"/>
                      <label for="q2p_yes_h" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_h" name="Q2p_Yes_h">
                      <label for="q2p_no_h" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesh" id="q2_yesh" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">i. varicose veins, varicose ulcers, phlebitis, or hernia of any kind?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_i" value="Yes" name="Q2li_Yes_i"/>
                      <label for="q2li_yes_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_i" name="Q2li_Yes_i">
                      <label for="q2li_no_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_i" value="Yes" name="Q2p_Yes_i"/>
                      <label for="q2p_yes_i" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_i" name="Q2p_Yes_i">
                      <label for="q2p_no_i" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesi" id="q2_yesi" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">j. any disease or disorder of the eyes, ears, nose or throat?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_j" value="Yes" name="Q2li_Yes_j"/>
                      <label for="q2li_yes_j" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_j" name="Q2li_Yes_j">
                      <label for="q2li_no_j" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_j" value="Yes" name="Q2p_Yes_j"/>
                      <label for="q2p_yes_j" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_j" name="Q2p_Yes_j">
                      <label for="q2p_no_j" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesj" id="q2_yesj" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">k. any other serious illness, disease, injury, or surgery not mention above?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2li_yes_k" value="Yes" name="Q2li_Yes_k"/>
                      <label for="q2li_yes_k" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2li_no_k" name="Q2li_Yes_k">
                      <label for="q2li_no_k" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q2p_yes_k" value="Yes" name="Q2p_Yes_k"/>
                      <label for="q2p_yes_k" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q2p_no_k" name="Q2p_Yes_k">
                      <label for="q2p_no_k" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q2_yesk" id="q2_yesk" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">FOR WOMEN ONLY</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Life Insured</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Policy Owner</label>
				  </div>
				<div class="col-md-2" style="background-color:#e4e7ea">
				<label class="control-label" style="font-size:85%;">Details of "YES" answer</label>
				</div> 
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. Are you pregnant?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q3li_yes_a" value="Yes" name="Q3li_Yes_a"/>
                      <label for="q3li_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q3li_no_a" name="Q3li_Yes_a">
                      <label for="q3li_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q3p_yes_a" value="Yes" name="Q3p_Yes_a"/>
                      <label for="q3p_yes_a" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q3p_no_a" name="Q3p_Yes_a">
                      <label for="q3p_no_a" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q3_yesa" id="q3_yesa" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. Any abnormality in menstruation, pregnancy, or of the breast or reproductive organs?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q3li_yes_b" value="Yes" name="Q3li_Yes_b"/>
                      <label for="q3li_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q3li_no_b" name="Q3li_Yes_b">
                      <label for="q3li_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="q3p_yes_b" value="Yes" name="Q3p_Yes_b"/>
                      <label for="q3p_yes_b" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="q3p_no_b" name="Q3p_Yes_b">
                      <label for="q3p_no_b" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="q3_yesb" id="q3_yesb" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
			</div>
			 </div>
			 <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding:5px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">Non-medical Questionnaire for Adults (Ages 18 and Above)</h4>
            </div>			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
            <div class="row">
				  <div class="col-md-6">
				  <label class="control-label" style="font-size:85%;"></label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Life Insured</label>
				  </div>
				  <div class="col-md-2" style="background-color:#e4e7ea">
				  <label class="control-label" style="font-size:85%;">Policy Owner</label>
				  </div>
				<div class="col-md-2" style="background-color:#e4e7ea">
				<label class="control-label" style="font-size:85%;">Details of "YES" answer</label>
				</div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
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
			<div class="row">
				<div class="col-md-6">
				  <label class="col-sm-12 control-label" style="font-size:85%;">Was the child's birth anbormal or premature?</label>
				  <div class="row">
				  <div class="col-md-5">
				  	         <label class="col-sm-8 control-label" style="font-size:75%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Weight at birth</label>
	                        <div class="col-sm-4">
	                          <input type="text" name="clientnumber" id="clientnumber" class="form-control input-sm mb15"  />
	                        </div>
				  </div>
				  <div class="col-md-7">
				  	         <label class="col-sm-9 control-label" style="font-size:75%;">Number of months premature</label>
	                        <div class="col-sm-3">
	                          <input type="text" name="clientnumber" id="clientnumber" class="form-control input-sm mb15"  />
	                        </div>
				  </div>    
				  </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes1" value="Yes" name="PhLi_Yes1"/>
                      <label for="phliyes1" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino1" name="PhLi_Yes1">
                      <label for="phlino1" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes1" value="Yes" name="PhP_Yes1"/>
                      <label for="phpyes1" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno1" name="PhP_Yes1">
                      <label for="phpno1" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes1" id="PH_yes1" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-10">
				  <label class="control-label" style="font-size:85%;">HAS THE CHILD EVER BEEN TREATED FOR, OR EVER HAD ANY INDICATION OF:</label>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. disorder of eyes, ears, nose, mouth, or throat; or slow physical or mental development?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. epilepsy, febrile fits, or any other disorder of the brain or nervous system?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">c. asthma, bronchitis, tuberculosis, or respiratory disorder?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">d. rheumatic fever, heart defects, anaemia, or disorder of the blood, and other disease of the heart or blood vessels?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">e. diabetes, disorder of the stomach, intestines, kidney, bladder, reproductive organs, liver, gallbladder, or pancreas?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">f. severe skin infections, enlarged glands, growth, cyst, tumor/cancer?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">g. disorder of the muscles or bones, spine, back or joints, deformity, lameness or amputation?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">HAS THE CHILD:</label>
				  </div>
				  <div class="col-md-2">
				  </div>
				  <div class="col-md-2">
				  </div>
				<div class="col-md-2"></div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">a. ever had any illness or injury lasting or requiring treatment for more than seven (7) days, or been admitted to a hospital or medical facility?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">b. ever been referred to any specialist or hospital?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">c. had or been advised to have any electrocardiogram (ECG), x-ray, blood or urine test, biopsy, AIDS test, or other diagnostic test?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-6">
				  <label class="control-label" style="font-size:85%;">d. Is the child currently receiving medical treatment or under medical care of any kind?</label>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phliyes2" value="Yes" name="PhLi_Yes2"/>
                      <label for="phliyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phlino2" name="PhLi_Yes2">
                      <label for="phlino2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				  <div class="col-md-2">
				  <div class="col-sm-6" style="padding:0px">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="phpyes2" value="Yes" name="PhP_Yes2"/>
                      <label for="phpyes2" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-6" style="padding:0px">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="phpno2" name="PhP_Yes2">
                      <label for="phpno2" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  </div>
				<div class="col-md-2">
				<input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px" disabled/>
				</div>  
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-4">
				  <label class="control-label" style="font-size:85%;">Please provide the name, address, and other details of the child's usual doctos(s). If none, provide details of the last doctor consulted.</label>
				  </div>
				  <div class="col-md-4">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Name of Doctor</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
				  <div class="col-md-4">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Address and other details</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-4">
				  <label class="control-label" style="font-size:85%;">How long has he/she known the child?</label>
				  </div>
				  <div class="col-md-3">
				  <div class="col-md-6">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				   <label class="col-sm-6control-label" style="font-size:85%;">Number of years</label>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-4">
				  <label class="control-label" style="font-size:85%;">When and for what reason did the child last consult him/her</label>
				  </div>
				  <div class="col-md-4">
				  <div class="row" style=" margin-left:0px; margin-right:0px">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Reason for consultation</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
				  <div class="row" style=" margin-left:0px; margin-right:0px">
				  <label class="control-label" style="font-size:85%; margin-left:10px">Date of consultation</label>
				  <div class="col-md-12">
				  <div class="input-group">
							<input type="text" class="form-control input-sm mb15"  style="margin-top: 0;" placeholder="mm/dd/yyyy" id="P_birthdate">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						  </div></div></div>
				  </div>
				  <div class="col-md-4">
				  <div class="row" style=" margin-left:0px; margin-right:0px">
				   <label class="control-label" style="font-size:85%; padding-left:10px; padding-right:10px">Result of consultation</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
				  <div class="row" style=" margin-left:0px; margin-right:0px">
				  <label class="control-label" style="font-size:85%; margin-left:10px">Nature and duration of treatment</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div></div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-5">
				  <label class="control-label" style="font-size:85%;">Has any proposal for life or health insurance on the child's life, or for insurance against accident or critical illness ever been made to Pru Life UK and/or any other insurance company?</label>
				  </div>
				  <div class="col-sm-1">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-1">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  <div class="col-md-2">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Name of Company</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
					 <div class="row">
				<div class="col-md-5">
				  <label class="control-label" style="font-size:85%;">Has any such proposal ever been declined, deferred, or accepted at special rates?</label>
				  </div>
				   <div class="col-sm-1">
                          <div class="rdio rdio-primary">
                      <input type="radio" id="yes" value="Yes" name="beneficialowner" onclick="BoYes('Yes');"/>
                      <label for="yes" style="font-size:85%;">Yes</label>
                    </div><!-- rdio -->
                        </div>
                        <div class="col-sm-1">
                           <div class="rdio rdio-primary">
                      <input type="radio" value="No" id="no" name="beneficialowner" onclick="BoYes('No');">
                      <label for="no" style="font-size:85%;">No</label>
                    </div><!-- rdio -->
                        </div>
				  <div class="col-md-2">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Name of Company</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
				  <div class="col-md-3">
				   <label class="control-label" style="font-size:85%; margin-left:10px">Reason</label>
				  <div class="col-md-12">
				  <input type="text" name="PH_yes2" id="PH_yes2" class="form-control input-sm mb15" style="margin-top:0px; margin-bottom:10px"/>
				  </div>
				  </div>
					 </div><hr style="margin-top: 0px; margin-bottom: 30px;">
			</div>
			 </div>
			 </div>
				</div>
				<div class="col-md-1"></div>
				</div>
				
				</div><!-- tab-content -->
                </form>
                
                <ul class="pager wizard">
                    <li class="previous"><a href="javascript:void(0)">Previous</a></li>
                    <li class="next"><a href="javascript:void(0)">Next</a></li>
                  </ul>
                
              </div><!-- #validationWizard -->
              
            </div><!-- panel-body -->
          </div><!-- panel -->
      </div><!-- row -->
    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
</section>


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
    
    "use strict";
  // Basic Wizard
  jQuery('#basicWizard').bootstrapWizard();
  
  // Progress Wizard
  $('#progressWizard').bootstrapWizard({
    'nextSelector': '.next',
    'previousSelector': '.previous',
    onNext: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    },
    onPrevious: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    },
    onTabShow: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      jQuery('#progressWizard').find('.progress-bar').css('width', $percent+'%');
    }
  });
  
  // Disabled Tab Click Wizard
  jQuery('#disabledTabWizard').bootstrapWizard({
    tabClass: 'nav nav-pills nav-justified nav-disabled-click',
    onTabClick: function(tab, navigation, index) {
      return false;
    }
  });
  
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
					
				}
			});
		});
		
		
	});
</script>				
</body>
</html>