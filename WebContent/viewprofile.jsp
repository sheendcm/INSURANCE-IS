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
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>PruLife UK - Profile</title>

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
        <h1><span>[</span> PruLife UK <span>]</span></h1>
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li class="active"><a href="underwriting-progress-view.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
		<li><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li><a href="underwriting-pending-application-view.jsp"><span class="pull-right badge badge-success" style="background-color:#ff4444; color:white;"><%out.print(rs1.getInt("COUNT(*)")); %></span><i class="fa fa-pencil"></i> <span>Pending Application</span></a></li>
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
                John Doe
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
      <h2><i class="glyphicon glyphicon-signal"></i>Profile </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">Prulife UK</a></li>
          <li class="active">Profile</li>
        </ol>
      </div>
    </div>
    
<div class="contentpanel">
      <%	
      
         	String cid =request.getParameter("id");
			try{ 
				String query = " SELECT * FROM application_requirements_details ar LEFT JOIN client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN application_progress_details ap ON ap.ap_ref_c_id = c.c_id LEFT JOIN application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id  LEFT JOIN policy_information_details pi ON c.c_ref_pi_id=pi.pi_id LEFT JOIN form_completion_details fc ON fc.fc_ref_c_id=c.c_id LEFT JOIN plan_details plan ON plan.plan_id=pi.pi_ref_plan_id LEFT JOIN medical_status_details ms ON ms.ms_ref_c_id=c.c_id where c.c_id = "+cid+" group by c.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
			%>
      <div class="row">
        <div class="col-sm-3">
          <img src="images/photos/profile-1.png" class="thumbnail img-responsive" alt="" />
          
          <div class="mb30"></div>
          
          <h5 class="subtitle">About</h5>
          <p class="mb30">********* About <a href="">Show More</a></p>
          
          
          <div class="mb30"></div>
          
          <h5 class="subtitle">Address</h5>
          <address>
            Address Here<br>
            Address Here<br>
            <abbr title="Phone">P:</abbr> Phone Number
          </address>
          
        </div><!-- col-sm-3 -->
        <div class="col-sm-9">
          
          <div class="profile-header">
            <h2 class="profile-name"><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></h2>
            <div class="profile-location"><i class="fa fa-envelope-o"></i> Email Address here</div>
            
            <div class="mb20"></div>
            
            <button class="btn btn-success mr5" href="#modalUpload" data-toggle="modal"><i class="fa fa-arrow-circle-up"></i> Upload File</button>
            <button class="btn btn-white"><i class="fa fa-envelope-o"></i> Message</button>
          </div><!-- profile-header -->
          
          <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified nav-profile">
          <li class="active"><a href="#activities" data-toggle="tab"><strong>Basic Info</strong></a></li>
          <li><a href="#followers" data-toggle="tab"><strong>Beneficiaries</strong></a></li>
          <li><a href="#following" data-toggle="tab"><strong>Policy Info</strong></a></li>
          <li><a href="#events" data-toggle="tab"><strong>Files</strong></a></li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane active" id="activities">
            
          </div>
          <div class="tab-pane" id="followers">
            
          </div>
          <div class="tab-pane" id="following">
            
           
            
          </div>
          <div class="tab-pane" id="events">
         <div class="table-responsive">
          <table class="table table-striped mb30">
            <thead>
              <tr>
                <th>#</th>
                <th>File Name</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query3 = "select * from file_details where f_ref_c_id="+cid+" ";
				Statement stmt3 = conn.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				while(rs3.next())
				{
			%>
              <tr>
                <td></td>
                <td><%out.print(rs3.getString("f_name")); %></td>
                <td></td>
                <%
				}
				%>
              </tr>
            </tbody>
          </table>
            <%
            rs3.close();
            stmt3.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
          </div><!-- table-responsive -->
          </div>
        </div><!-- tab-content -->
          
        </div><!-- col-sm-9 -->
      </div><!-- row -->
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
				
				<!-- Modal -->
					<div class="modal fade" id="modalUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Upload</h4>
					        
					      </div>
					      <form action="uploadServlet" method="post" enctype="multipart/form-data">
					      <div class="modal-body"><br>
					      <input type="text" class="form-control mytextbox"  id="c_id"  name="c_id" value="<%out.print(cid); %>"  style="display:none;" />
					                <hr>
								<div class="form-group myfg">
								<label class="control-label col-sm-4 mylabel myleftlabel" align="left">File</label>
								<div class="col-sm-6">
				                   <input type="file" class="form-control"  id="requirementfile"  name="requirementfile" />
				                   <input type="text" class="form-control"  id="filereqname"  name="filereqname" style="display:none;"/>
				                  </div>
					                </div>
								
					                
					      </div><br>
					      <div class="modal-footer myfooter">
					        <button type="button" class="btn btn-default mymodalbtn" data-dismiss="modal">Close</button>
					        <button type="submit"  class="btn btn-primary mymodalbtn" id="btnUpload">Upload</button>
					        <style>
							.mymodalbtn
							{
								padding:5px 10px;
								font-size: 90%;
								
							}
							.myleftlabel
							{
								margin-left:30px;
								margin-right:10px;
								margin-bottom:0px important;
								margin-top:0px important;
								padding:4px;
							}
							.myrightlabel
							{
								padding-top:5px;
							}
							</style>
					      </div>
					      </form>
					    </div><!-- modal-content -->
					  </div><!-- modal-dialog -->
					</div><!-- modal -->   
				
				
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
<script>
$("#btnUpload").click(function() {
		
			var filename = $('#requirementfile').val();
			document.getElementById('filereqname').value=filename;
		});
</script>
<script>
$(document).ready(function (){
		
			$("#btnSendMessage").click(function() {
		
			var email = $('#email').val();
			var subject = $('#subject').val();
			var content = $('#content').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					email:email,
					subject:subject,
					content:content
					
				},
				url:'EmailSendingServlet',
				success: function(result){
					
					swal("Success!", "Email Sent!", "success");
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
