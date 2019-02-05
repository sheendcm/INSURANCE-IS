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

  <title>Lavie Insurance</title>

  <link href="css/style.default.css" rel="stylesheet">
  <link href="css/jquery.datatables.css" rel="stylesheet">
  
   <link href="./SweetAlert for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
    <link href="./SweetAlert for Bootstrap_files/font-awesome.min.css" rel="stylesheet">
    <script id="twitter-wjs" src="./SweetAlert for Bootstrap_files/widgets.js.download"></script><script async="" src="./SweetAlert for Bootstrap_files/analytics.js.download"></script><script src="./SweetAlert for Bootstrap_files/jquery-2.1.1.js.download"></script>
    <link href="./SweetAlert for Bootstrap_files/docs.css" rel="stylesheet">

    <!-- Debug -->
    <script src="https://localhost:32123/livereload.js"></script>

    <!-- This is what you need -->
    <script src="./SweetAlert for Bootstrap_files/sweetalert.js.download"></script>
    <link rel="stylesheet" href="./SweetAlert for Bootstrap_files/sweetalert.css">
    <!--.......................-->

    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-42119746-3', 'auto');
      ga('send', 'pageview');
    </script>
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
<%	
      
         	String cid =request.getParameter("id");
			try{ 
				String query = "SELECT * FROM client_details cd LEFT JOIN application_progress_details apd on apd.ap_ref_c_id=cd.c_id LEFT JOIN application_status_details asd ON asd.as_ref_c_id=cd.c_id LEFT JOIN application_requirements_details ard ON ard.ar_ref_c_id=cd.c_id LEFT JOIN medical_status_details msd ON msd.ms_ref_c_id=cd.c_id LEFT JOIN application_form_details afd on cd.c_ref_af_id=afd.af_id LEFT JOIN beneficial_owner_details bod on cd.c_ref_bo_id=bod.bo_id LEFT JOIN policy_information_details pid on cd.c_ref_pi_id=pid.pi_id LEFT JOIN benefit_details bd ON bd.benefit_ref_pi_id=pid.pi_id LEFT JOIN life_insured_details lid ON cd.c_ref_li_id=lid.li_id LEFT JOIN non_medical_information_details nmid ON cd.c_ref_nmid_id=nmid.nmid_id LEFT JOIN policyowner_details pd on cd.c_ref_p_id=pd.p_id LEFT JOIN primary_beneficiary_details pbd ON cd.c_ref_pb_id=pbd.pb_id LEFT JOIN system_user_details sud on cd.c_ref_ai_id=sud.sud_id LEFT JOIN system_user_personal_details supd on sud.sud_ref_supd_id=supd.supd_id LEFT JOIN file_details fd on fd.f_ref_c_id=cd.c_id LEFT JOIN plan_details plan on pid.pi_ref_plan_id=plan.plan_id LEFT JOIN client_login_details cld on cd.c_id=cld.cl_ref_c_id where cd.c_id = "+cid+" GROUP by cd.c_id ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					
				
			%>
<section>
  
  <div class="leftpanel">
    
    <div class="logopanel" style="margin-bottom:50px;">
       <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       
      <ul class="nav nav-pills nav-stacked nav-bracket">
        
		<li><a href="client-statement-of-account-view.jsp?id=<%out.print(rs.getInt("c_id")); %>"><i class="fa fa-plus"></i> <span>Statement of Account</span></a></li>
        <li class="active"><a href="client-policy-details-view.jsp?id=<%out.print(rs.getInt("c_id")); %>"><i class="fa fa-check-square-o"></i> <span>Policy Details</span></a></li>
        <li><a href="client-plan-and-benefits-view.jsp?id=<%out.print(rs.getInt("c_id")); %>"><i class="fa fa-check-square-o"></i> <span>Plan and Benefits</span></a></li>
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
                <%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                <li><a href="login.jsp"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>
          <li>
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-plus"></i>Policy Details </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li class="active">Policy Details</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      
		<style>
		td
		{
			padding:5px !important;
			padding-left: 20px !important;
		}
		</style>
         <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Life Insured</h4>
        </div>
        <div class="panel-body">
         
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
              <tr>
                <td>Name</td>
                <td><%out.print(rs.getString("li_givenname")); %><%out.print(rs.getString("li_middlename")); %><%out.print(rs.getString("li_surname")); %></td>
              </tr>
              <tr>
                <td>Gender</td>
                <td><%out.print(rs.getString("li_gender")); %></td>
              </tr>
              <tr>
                <td>Civii Status</td>
                <td><%out.print(rs.getString("li_civilstatus")); %></td>
              </tr>
              <tr>
                <td>Birthdate</td>
                <td><%out.print(rs.getString("li_birthdate")); %></td>
              </tr>
              <tr>
                <td>Place of Birth</td>
                <td><%out.print(rs.getString("li_placeofbirth")); %></td>
              </tr>
              <tr>
                <td>Nationality</td>
                <td><%out.print(rs.getString("li_nationality")); %></td>
              </tr>
              <tr>
                <td>Mobile Number</td>
                <td><%out.print(rs.getString("li_mobilenumber")); %></td>
              </tr>
              <tr>
                <td>Telephone Number</td>
                <td><%out.print(rs.getString("li_telephonenumber")); %></td>
              </tr>
              <tr>
                <td>Email Address</td>
                <td><%out.print(rs.getString("li_emailaddress")); %></td>
              </tr>
              <tr>
                <td>Home Address</td>
                <td><%out.print(rs.getString("li_presentaddress")); %> <%out.print(rs.getString("li_presentzipcode")); %> <%out.print(rs.getString("li_presentcountry")); %></td>
              </tr>
            </tbody>
          </table>
          </div>
         
        </div><!-- panel-body -->
        </div>
        
          </div><!-- table-responsive -->
          <div class="col-sm-2"></div>
        
        </div>
        </div>


    
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
    jQuery('select').select2({
        minimumResultsForSearch: -1
    });
    
    jQuery('select').removeClass('form-control');
    
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
  
  
  });
</script>
 <script type="text/javascript">
	$(document).ready(function (){

		
	
		
		$("#btnSubmitPlan").click(function() {
		
			var plan_name = $('#Plan_Name').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					plan_name:plan_name
					
				},
				url:'addnewplan',
				success: function(result){
					
					swal("Success!", "You added "+plan_name+" !", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		$("#btnUpdatePlan").click(function() {
		
			var Plan_Name_Edit = $('#Plan_Name_Edit').val();Plan_Id_Edit
			var Plan_Id_Edit = $('#Plan_Id_Edit').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					Plan_Name_Edit:Plan_Name_Edit,
					Plan_Id_Edit:Plan_Id_Edit
					
				},
				url:'updateplan',
				success: function(result){
					
					swal("Success!", "Plan is updated!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
	});
</script>
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
</body>
</html>
