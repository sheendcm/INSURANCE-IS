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
      <h2><i class="fa fa-pencil"></i>Pending Application </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">Prulife UK</a></li>
          <li class="active">Pending Application</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">

      <style>
      				.mylabel
					{
						font-size:90%;
						padding:0px;
					}
					.mybtn
					{
						padding: 3px 7px;
						background-color:#007E33;
						border-color:#007E33;
					}
					.mybtn:hover
					{
						padding: 3px 7px;
						background-color:#005c25;
						border-color:#005c25;
					}
					.mybtn1
					{
						padding: 3px 7px;
						background-color:#FF8800;
						border-color:#FF8800;
					}
					.mybtn1:hover
					{
						padding: 3px 7px;
						background-color:#dd7600;
						border-color:#dd7600;
					}
					.myspan
					{
						background-color:#757575;
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
					.mydiv1
					{
						padding-top:20px;
						padding-bottom:50px;
						padding-right:5px;
						padding-left:20px;
					}
					.mydiv2
					{
						padding-bottom:150px;
					}
					.myfg
					{
						margin-bottom:7px;
					}
			
					</style>
      <div class="panel panel-default">
      <div class="panel-heading mydiv1">
          <div class="col-md-12" align="right">
                  <a class="btn btn-primary mybutton1" href="new-application-form.jsp" style="margin-right:10px;"> Add New</a>
                </div>
                </div>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="tablePendingApplication">
            <col width="8%">
  			<col width="10%">
  			<col width="20%">
  			<col width="20%">
  			<col width="20%">
  			<col width="13%">
  			<col width="17%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Date Applied</th>
                    <th>Application Number</th>
                    <th>Policyowner</th>
                    <th>Life Insured</th>
                    <th>Plan Name</th>
                    <th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              
					
              <%
			try{ 
				String query = "SELECT c.c_id as cid, af.af_applicationnumber as ApplicationNumber,af.af_dateapplied as Date, CONCAT (li.li_givenname,' ',li.li_middlename,' ',li.li_surname) as Name1, CONCAT (p.p_givenname,' ',p.p_middlename,' ',p.p_surname) as Name, plan.plan_name as PlanName, fc.fc_status as Status FROM application_requirements_details ar LEFT JOIN client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN application_progress_details ap ON ap.ap_ref_c_id = c.c_id LEFT JOIN application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id  LEFT JOIN policy_information_details pi ON c.c_ref_pi_id=pi.pi_id LEFT JOIN form_completion_details fc ON fc.fc_ref_c_id=c.c_id LEFT JOIN plan_details plan ON plan.plan_id=pi.pi_ref_plan_id where ap.ap_form='Pending' group by c.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                    <td><%out.print(rs.getString("Date")); %></td>
                    <td><%out.print(rs.getString("ApplicationNumber")); %></td>
                    <td><%out.print(rs.getString("Name")); %></td>
                    <td><%out.print(rs.getString("Name1")); %></td>
                    <td><%out.print(rs.getString("PlanName")); %></td>
                    <td><span class="label label-default myspan"><%out.print(rs.getString("Status")); %></span></td>
                    <td>
					
					<a class="btn btn-warning mybtn1" title="Update" href="underwriting-update-application-form.jsp?id=<%out.print(rs.getInt("cid")); %>"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-success mybtn" id="post" href="#modalPosting<%out.print(rs.getInt("cid")); %>" data-toggle="modal" title="Post"><i class="glyphicon glyphicon-ok" ></i></a>
					</td>
					
					<!-- Modal -->
					<div class="modal fade" id="modalPosting<%out.print(rs.getInt("cid")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content" style="width:80%;">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Post Application</h4>
					        <input type="text" class="form-control mytextbox"  id="clientid"  name="clientid" value="<%out.print(rs.getInt("cid")); %>" style="display:none;" />
					      </div>
					      <div class="modal-body"><br>
					          <div class="form-group myfg ">
					                  <label class="control-label col-sm-4 mylabel myleftlabel" align="left">Application Number </label>
					                  <label class="control-label col-sm-5 mylabel myrightlabel" align="left" id="application_number"><%out.print(rs.getString("ApplicationNumber")); %></label>
					                </div>
								<div class="form-group myfg">
					                  <label class="control-label col-sm-4 mylabel myleftlabel" align="left">Name </label>
					                  <label class="control-label col-sm-5 mylabel myrightlabel" align="left" id="name"><%out.print(rs.getString("Name")); %></label>
					                </div>
								<div class="form-group myfg">
					                  <label class="control-label col-sm-4 mylabel myleftlabel" align="left">Status </label>
					                  <span class="label label-default myspan myrightlabel"><%out.print(rs.getString("Status")); %></span>
					                </div>
					      </div><br>
					      <div class="modal-footer myfooter">
					        <button type="button" class="btn btn-default mymodalbtn" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary mymodalbtn" id="btnPost">Post</button>
					        <style>
							.mymodalbtn
							{
								padding:5px 10px;
								font-size: 90%;
								
							}
							.myleftlabel
							{
								margin-left:50px;
								margin-right:30px;
								margin-bottom:0px important;
								margin-top:0px important;
								padding:5px;
							}
							.myrightlabel
							{
								margin-top:15px;
							}
							</style>
					      </div>
					    </div><!-- modal-content -->
					  </div><!-- modal-dialog -->
					</div><!-- modal -->    
					<%
				}
				%>
                 </tr>
                
              </tbody>
           </table>
           <%
            rs.close();
            stmt.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
          </div><!-- table-responsive -->
        
          
        </div><!-- panel-body -->
      </div><!-- panel -->
        
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
    
    jQuery('#tablePendingApplication').dataTable();
    
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
					$(document).ready(function (){
						
						var cells = document.getElementsByTagName("span");
							for (var i = 0; i < cells.length; i++) {
							    if (cells[i].innerHTML == "Completed") {
							        cells[i].style.backgroundColor = "#007E33";
							    }
							    }
									});
											
					</script>
<script>
$(document).ready(function (){
		
			$("#btnPost").click(function() {
		
			var clientid = $('#clientid').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					clientid:clientid
					
				},
				url:'updateprogressformcompleted',
				success: function(result){
					
					swal("Success!", "Application is Posted!", "success");
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
