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
  <link rel="shortcut icon" href="images/prulifelogo.png" type="image/png">
 <title>Profile</title>

  <link href="css/style.default.css" rel="stylesheet">
  <link rel="stylesheet" href="css/dropzone.css" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>
<% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();

%>

<section>
  
  <div class="leftpanel">
    
    <div class="logopanel" style="padding=0;">
    <img src="images/prulife.png" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding-top:30px;">
      
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="application-form.jsp"><i class="fa fa-edit"></i> <span>Application Form</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children">
            <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i> Pending Application</a></li>
            <li><a href="issued-application.jsp"><i class="fa fa-caret-right"></i> Issued</a></li>
            <li><a href="declined-application.jsp"><i class="fa fa-caret-right"></i> Declined</a></li>
          </ul>
        </li>
        <li class="active"><a href="upload-requirements.jsp" style="background-color: #DB241E;"><i class="fa fa-edit"></i> <span>Profile</span></a></li>

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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">PROFILE</h4>
            </div>
			<div class="panel-body">
			
              <% 	
					String ss =request.getParameter("id");
					try{ 
				String query = "SELECT * FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id = c.c_id LEFT JOIN r_application_status_details astat ON astat.as_ref_c_id =  c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id = af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id = ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id = li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id = p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id = bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id = pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id = sb.sb_id LEFT JOIN r_policy_information_details PI ON c.c_ref_pi_id = PI.pi_id WHERE c.c_id="+ss+"";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				%>
				
      
      <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
          <div class="row">
          <div class="col-sm-2">
          <img src="images/photos/noprofile.png" style="width:150px;" class="thumbnail img-responsive" alt="" />
          </div>
          <div class="col-sm-10">
          
          <div class="profile-header">
            <h2 class="profile-name" style="font-size:20px;"><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></h2>
            <div class="profile-location"><i class="fa fa-envelope-o"></i> <%out.print(rs.getString("p_emailaddress")); %></div>
            <div class="profile-position"><i class="fa fa-phone"></i> <%out.print(rs.getString("p_mobilenumber")); %></div>
            
            <div class="mb20"></div>
            
            <a class="btn btn-warning mr5" href="" data-target="#modalUpload" data-toggle="modal" style="font-size:12px; padding: 5px 10px;"><i class="fa fa-arrow-up"></i> Upload File</a>
            <a class="btn btn-white" data-target="#modalSendMsg" data-toggle="modal"  style="font-size:12px; padding: 5px 10px;"><i class="fa fa-envelope-o"></i> Message</a>
          </div><!-- profile-header -->
          </div>
          </div>
          
          <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified nav-profile">
          <li class="active"><a href="#lifeinsured" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Life Insured</a></li>
          <li><a href="#policyowner" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Policyowner</a></li>
          <li><a href="#beneficialowner" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Beneficial Owner</a></li>
          <li><a href="#beneficiary" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Beneficiary</a></li>
          <li><a href="#policyinformation" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Policy Information</a></li>
          <li><a href="#personalhistory" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Personal History</a></li>
          <li><a href="#questionairre" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:2px;padding-top:10px;">Non-Medical Information</a></li>
          <li><a href="#files" data-toggle="tab" style="font-size:13px; padding:0px; padding-bottom:20px;padding-top:10px;">Files</a></li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
          <div class="tab-pane active" id="lifeinsured">
           <style>
			.labelforprofile {
			    font-size:85%;
			    border-style: solid; 
			    border-width: 1px; 
			    border-color: #EAECEF;
			    margin-bottom:0px !important;
			    display:block;
			    padding-left:15px;
			} 
			</style>
			<br>
          <div class="col-sm-1"></div>
          <div class="col-sm-10">
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Other Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_alias")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gender</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_gender")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Civil Status</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_civilstatus")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Date of Birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_birthdate")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Age</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_age")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nationality</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_nationality")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Place of Birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_placeofbirth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>TIN/SSS/GSIS</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_tinsssgsis")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Occupation</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_occupation")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nature of work</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_natureofwork")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Employer</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_employer")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nature of employer</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_natureofemployer")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gross Annual Income</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_annualincome")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Net Worth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_networth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Source of funds</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_sourceoffunds")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Mobile Number</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_mobilenumber")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Telephone Number</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_telephonenumber")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Email Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_emailaddress")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Present Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_presentaddress")); %> <%out.print(rs.getString("li_presentzipcode")); %> <%out.print(rs.getString("li_presentcountry")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Permanent Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_permanentaddress")); %> <%out.print(rs.getString("li_permanentzipcode")); %> <%out.print(rs.getString("li_permanentcountry")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Business Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("li_businessaddress")); %> <%out.print(rs.getString("li_businesszipcode")); %> <%out.print(rs.getString("li_businesscountry")); %></label>
            	 </div>  	 
          </div>
          
          </div>
           <div class="col-sm-1"></div> 
          </div>
          <div class="tab-pane" id="policyowner">
			<div class="col-sm-1"></div>
          <div class="col-sm-10">
          <div class="row"><br>
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Other Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_alias")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gender</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_gender")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Civil Status</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_civilstatus")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Date of Birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_birthdate")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Age</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_age")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nationality</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_nationality")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Place of Birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_placeofbirth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>TIN/SSS/GSIS</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_tinsssgsis")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Occupation</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_occupation")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nature of work</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_natureofwork")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Employer</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_employer")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nature of employer</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_natureofemployer")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gross Annual Income</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_annualincome")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Net Worth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_networth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Source of funds</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_sourceoffunds")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Mobile Number</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_mobilenumber")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Telephone Number</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_telephonenumber")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Email Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_emailaddress")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Present Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_presentaddress")); %> <%out.print(rs.getString("p_presentzipcode")); %> <%out.print(rs.getString("p_presentcountry")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Permanent Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_permanentaddress")); %> <%out.print(rs.getString("p_permanentzipcode")); %> <%out.print(rs.getString("p_permanentcountry")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Business Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("p_businessaddress")); %> <%out.print(rs.getString("p_businesszipcode")); %> <%out.print(rs.getString("p_businesscountry")); %></label>
            	 </div>  	 
          </div>
          
          </div>
           <div class="col-sm-1"></div>
          </div>
          <div class="tab-pane" id="beneficialowner">
            <br>
             <div class="col-sm-1"></div>
          <div class="col-sm-10">
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("bo_name")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Contact Number</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("bo_contactnumber")); %></label>
            	 </div>	 
          </div>
          </div>
           <div class="col-sm-1"></div> <br> 
            </div>
            <div class="tab-pane" id="beneficiary">
            <br>
             <div class="col-sm-1"></div>
          <div class="col-sm-10">
          <div class="row">
          <div class="col-sm-12" style="padding-right:10px;">
            	 <label class="col-sm-12 control-label labelforprofile" style="background-color:#eaecef;"><strong>PRIMARY BENEFICIARY</strong></label>
            	 </div>	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_name")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Date of birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_birthdate")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gender</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_gender")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Place of birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_placeofbirth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nationality</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_nationality")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Relationship to Insured</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_reltoinsured")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>% Share</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_share")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Type of beneficiary</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_typeofbeneficiary")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Beneficiary Designation</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_beneficiarydesignation")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("pb_presentaddress")); %> <%out.print(rs.getString("pb_zipcode")); %> <%out.print(rs.getString("pb_country")); %></label>
            	 </div>  	 
          </div><br>
          <div class="row">
          <div class="col-sm-12" style="padding-right:10px;">
            	 <label class="col-sm-12 control-label labelforprofile" style="background-color:#eaecef;"><strong>SECONDARY BENEFICIARY</strong></label>
            	 </div>	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Name</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_name")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Date of birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_birthdate")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Gender</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_gender")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Place of birth</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_placeofbirth")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Nationality</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_nationality")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Relationship to Insured</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_reltoinsured")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>% Share</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_share")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Type of beneficiary</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_typeofbeneficiary")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Beneficiary Designation</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_beneficiarydesignation")); %></label>
            	 </div>  	 
          </div>
          <div class="row">
          <div class="col-sm-4" style="padding-right:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><b>Address</b></label>
            	 </div>
          <div class="col-sm-8" style="padding-left:0px;">
            	 <label class="col-sm-12 control-label labelforprofile"><%out.print(rs.getString("sb_presentaddress")); %> <%out.print(rs.getString("sb_zipcode")); %> <%out.print(rs.getString("sb_country")); %></label>
            	 </div>  	 
          </div>
          </div>
           <div class="col-sm-1"></div><br>
           
            </div>
            <div class="tab-pane" id="policyinformation">
            
            </div>
            <div class="tab-pane" id="personalhistory">
            
            </div>
            <div class="tab-pane" id="questionairre">
            
            </div>
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
          <div class="tab-pane" id="files">
          <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-sm-10">
          
          <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:30px; padding-top:5px;padding-bottom:20px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">FILES</h4>
              <input id="f_id" type="text" class="form-control" name="f_id"
				            style="color: black; width: 560px;display:none;" maxlength="50"/>
            </div>
			<div class="panel-body" style="border-style: solid; border-width: 1px; border-color: #EAECEF;">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30" id="filestable">
          <col width="120">
  			<col width="80">
  			<col width="30">
  			<col width="30">
  			<col width="80">
            <thead>
              <tr>
                <th>File</th>
                <th>Download</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query1 = "Select * from r_file_details where f_ref_c_id = "+ss+"";
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				while(rs1.next())
				{
			%>
              
              <tr>
                <td style="display:none;"><%out.print(rs1.getInt("f_id")); %></td>
                <td><%out.print(rs1.getString("f_name")); %></td>
                <td>
                <a  title="Download File" class="btn btn-warning" id="btnDownload" href="" type="submit" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-save"></i>
                    </a>
                </td>	
                <%
				}
				%>
              </tr>
            </tbody>
          </table>
           <%
            rs1.close();
            stmt1.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
          </div><!-- table-responsive -->
			  </div>
            </div>
            <div class="panel-body panel-body-nopadding">
              
              
              
            </div><!-- panel-body -->
          </div><!-- panel -->
         
          </div>
          <div class="col-sm-1"></div>
          </div>
            
            </div>
        </div><!-- tab-content -->
          
        </div><!-- col-sm-9 -->
        <div class="col-sm-1"></div>
      </div><!-- row -->
      
            </div>
            <div class="panel-body panel-body-nopadding">
              
              
            </div><!-- panel-body -->
          </div><!-- panel -->

      </div><!-- row -->
 <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalUpload" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style=" width:500px; height:50px;">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" style="margin:0px" class="close" type="button">&times;</button>
				            <h4 class="modal-title" style="font-size:15px;color:white;">Upload File</h4>
							
				        </div>
				        <form method="post" action="uploadServlet" enctype="multipart/form-data">
				        <div class="modal-body" style="background-color:white;">
				        
				         <div class="row">
				         <div class="col-sm-2"></div>
				         <div class="col-sm-8">
				         <br><br>
				         
				         <input id="c_id" type="text" class="form-control" name="c_id" value="<%out.println(ss); %>"
				            style="color: black; width: 560px;display:none;" maxlength="50"/>
				         <input name="requirementfile" type="file" class="form-control" onchange="setfilename(this.value);"  multiple/>
				         <input type="text"  id="filereq"  name="filereqname" style="display:none"/><br>
				         
				           <script>
							   function setfilename(val)
							  {
							    var fileName = val.substr(val.lastIndexOf("\\")+1, val.length);
							   document.getElementById("filereq").value = fileName;
							  }
							</script>
				         </div>
				         <div class="col-sm-2"></div>
				        </div>
				        
				    </div>
				    <div class="modal-footer" style="background-color:white;">
				        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
				        <button type="submit" class="btn btn-primary" id="btnUpdateReqStatus" style ="font-size:11px">Upload</button>
				      </div>
				    </form>
		</div>
		</div>
		</div>
		 <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalSendMsg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style=" width:500px;">
				        <div class="modal-header" style="background-color:#db241e; height:50px;">
				            <button aria-hidden="true" data-dismiss="modal" style="margin:0px"  class="close" type="button">&times;</button>
				            <h4 class="modal-title" style="font-size:15px;color:white;">Send Message</h4>
							
				        </div>
				        <form action="EmailSendingServlet" method="post">
				        <div class="modal-body">
				        	
				        	<div class="row">
				        	<div class="col-md-1"></div>
				        	<div class="col-md-10">
				        	<div class="form-group"> <br> 
                        <label class="col-sm-4 control-label" style="font-size:85%;">Email</label>
                        <div class="col-sm-8">
                          <input type="text"  name="email" id="email" class="form-control input-sm mb15" />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Subject</label>
                        <div class="col-sm-8">
                          <input type="text" name="subject" id="subject" class="form-control input-sm mb15"  />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Message</label>
                        <div class="col-sm-8">
                        <textarea class="form-control input-sm mb15" name="content" id="content" rows="5"></textarea>
                        </div>
                      </div>
				        	</div>
				        	<div class="col-md-1"></div>
				        	</div>
							
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
				        <button type="submit" class="btn btn-primary" id="btnUpdateReqStatus" style ="font-size:11px">Send</button>
				      </div>
				    </form>
		</div>
		</div>
		</div>
		<!-- MODALS-->   
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
<script src="js/dropzone.min.js"></script>

<script src="js/bootstrap-wizard.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.min.js"></script>

<script src="js/custom.js"></script>
<script>

</script>
<script>
var indexedituser = '';
$('.btnDownload').click( function() {
    var table2 = document.getElementById('filestable'); 
    for(var i = 1; i < table2.rows.length; i++)
    {
      table2.rows[i].cells[2].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var f_id = document.getElementById('filestable').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('f_id').value = f_id;
    	  	indexedituser = this.parentElement.rowIndex;
	       
      };
      
    }
    
  }); 
  

</script>						
</body>
</html>