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

<body style="background-color:#1C2331;">
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
				String query5 = " SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id LEFT JOIN r_approval_status_details asd ON asd.as_id=psd.ps_ref_as_id where ms_completion='Completed' and as_completion='Pending'";
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
		<li><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li><a href="underwriting-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
        <li><a href="underwriting-policy-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Policy Evaluation</span></a></li>
        <li class="nav-parent nav-active active"><a href=""><i class="fa fa-list"></i> <span>List of Policy</span></a>
          <ul class="children" style="display: block">
            <li class="active"><a href="underwriting-issued-policy-view.jsp"><i class="fa fa-caret-right"></i> Issued Policy</a></li>
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
      <h2><i class="fa fa-check"></i> Approved Policy</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Underwriting Department</a></li>
          <li class="active">Approved Policy</li>
        </ol>
      </div>
    </div>
    
   <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      <div class="panel panel-default">
       <style>
					
					.mylabel
					{
						font-size:90%;
					}
					.mytextbox
					{
						font-size:90%;
						padding:7px 10px;
					}
					.mybtn
					{
						padding:3px 7px;
						font-size:85%;
					}
					.datepicker{ z-index:99999 !important; }
					</style>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="table1" style="font-size:85%;">
            <col width="13%">
            <col width="15%">
            <col width="15%">
            <col width="15%">
            <col width="17%">
            <col width="15%">
            <col width="25%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Policy Number</th>
                 	<th>Date Approved</th>
                 	<th>Insured</th>
                 	<th>Policyowner</th>
                 	<th>Plan</th>
                 	<th>Status</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id LEFT JOIN r_policyowner_details p ON p.p_id=pd.pol_ref_p_id LEFT JOIN r_policyowner_login_details pld ON pld.pl_ref_p_id=p.p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN r_approval_status_details asd ON asd.as_id=psd.ps_ref_as_id where as_completion='Completed' and as_status='Issued' GROUP BY pd.pol_id  ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
				String dateindb = rs.getString("as_datecompleted");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(10, 16);
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("pol_id")); %></td>
                    <td>0000<%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(modifieddate); %>&nbsp;&nbsp;&nbsp;<%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                    <td><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></td>
                    <td><%out.print(rs.getString("plan_name")); %></td>
                    <td><span class="label label-default myspan"><%out.print(rs.getString("as_messagestatus")); %></span></td>
                    <td>
					<a class ="btn btn-danger mybtn tooltips btnViewRemarks" data-placement="top" data-toggle="modal" title="Message" href="#modalSendMessage<%out.print(rs.getInt("pol_id")); %>" ><i class="fa fa-envelope-o"></i></a>
					</td>
					
					
			  		 <div class="modal fade" id="modalSendMessage<%out.print(rs.getInt("pol_id")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:110%;"> Message</h4>
			        <input type="text" class="form-control mytextbox"  id="clientid"  name="clientid" value="<%out.print(rs.getInt("pol_id")); %>" style="display:none;" />
					        <input type="text" class="form-control mytextbox"  id="pid"  name="pid" value="<%out.print(rs.getString("p_id")); %>" style="display:none;" />
					        <input type="text" class="form-control mytextbox"  id="clientpass"  name="clientpass" value="<%out.print(rs.getString("pl_password")); %>" style="display:none;" />
							<input type="text" class="form-control mytextbox"  id="asid"  name="asid" value="<%out.print(rs.getInt("as_id")); %>" style="display:none;" />            
							            							            		            
			      </div>
			      <div class="modal-body">
			      
					                <div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Policyowner</label>
								<div class="col-sm-8">
				                    <input type="text" name="policyowner" id="policyowner" class="form-control mytextbox" value="<%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %>" />
				                  </div>
					                </div>
								<div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Email Address</label>
								<div class="col-sm-8">
				                    <input type="text" name="email" id="email" class="form-control mytextbox" value="<%out.print(rs.getString("p_emailaddress")); %>" />
				                  </div>
					                </div>
								<div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Subject</label>
								<div class="col-sm-8">
				                    <input type="text" name="subject" id="subject" class="form-control mytextbox" value="La Vie Insurance Company" />
				                  </div>
					                </div>
					           <div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Content</label>
								<div class="col-sm-8">
									<textarea name="content" id="content" class="form-control mytextbox" rows="23" >Dear <%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %>, &#13;&#10;&#13;&#10;Greetings from LaVie Insurance! &#13;&#10;&#13;&#10;Based on the necessary information that you provided and from the requirements you have submitted that are subject to thorough inspection, we are pleased to inform you that your application for life insurance for <%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %> with Policy Number 0000<%out.print(rs.getInt("pol_id")); %> was approved. &#13;&#10;&#13;&#10;Kindly wait for our further messages regarding on how to pay your bills for your policy premium. You can track your transaction by logging in on your account using your client number and the password that will be send to your email.&#13;&#10;&#13;&#10;Should you have any questions, please call our Customer Support Team at telephone numbers (632) 887 5434 for Metro Manila and 1 800 10 7785465 for domestic toll-free. You may also email us at lavieiis2018@gmail.com.&#13;&#10;&#13;&#10;Sincerely,&#13;&#10;LAVIE INSURANCE COMPANY.
									 </textarea>
								  </div>
					                </div>
					                
					      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnSendMessage">Send</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->
			<style>
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
							.mytextbox
							{
								font-size: 85%;
							}
							</style>
					
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
<script src="js/jquery.datatables.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.min.js"></script>

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
    
        // Date Picker
  jQuery('#User_AppointmentDate').datepicker();
  jQuery('#datepicker-inline').datepicker();
  
  jQuery('#datepicker-multiple').datepicker({
    numberOfMonths: 3,
    showButtonPanel: true
  });
	
  $( ".dateselector" ).datepicker({ dateFormat: 'yy-mm-dd' });
    
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
					    if (cells[i].innerHTML == "Message sent!") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					}
							});
									
			</script> 
<script>
$(document).ready(function (){
		
			$("#btnSendMessage").click(function() {
		
			var email = $('#email').val();
			var asid = $('#asid').val();
			var subject = $('#subject').val();
			var content = $('#content').val();
			var clientpass = $('#clientpass').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					email:email,
					subject:subject,
					content:content,
					clientpass:clientpass
					
					
				},
				url:'EmailSendingServletFirst',
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
