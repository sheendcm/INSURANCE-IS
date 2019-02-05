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
    <script src = "jquery/jquery.min.js"></script>
	<script src = "highcharts/highcharts.js"></script>
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
       <h5 class="sidebartitle" style="padding-left: 15px;"> UNDERWRITING DEPARTMENT </h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
      
        <li><a href="underwriting-progress-view.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
		<li><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li><a href="underwriting-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
        <li><a href="underwriting-policy-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Policy Evaluation</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Policy</span></a>
          <ul class="children">
            <li><a href="underwriting-issued-policy-view.jsp"><i class="fa fa-caret-right"></i> Issued Policy</a></li>
            <li><a href="underwriting-declined-policy-view.jsp"><i class="fa fa-caret-right"></i> Declined Policy</a></li>
          </ul>
        </li>
        <li class="active"><a href="underwriting-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
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
      <h2><i class="glyphicon glyphicon-list-alt"></i> Audit Trail</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Underwriting Department</a></li>
          <li class="active">Audit Trail</li>
        </ol>
      </div>
    </div>
    
   <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      <div class="panel panel-default">
      <div class="panel-heading">
            
            <div class="row">
            
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
</div>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="table1" style="font-size:90%;">
            <col width="15%">
            <col width="12%">
            <col width="17%">
            <col width="20%">
  			<col width="36%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Date</th>
                 	<th>Time</th>
                 	<th>User</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM r_audit_trail_details atd LEFT JOIN r_system_user_details sud ON sud.sud_id=atd.at_ref_sud_id LEFT JOIN r_system_user_personal_details supd ON supd.supd_id=sud.sud_ref_supd_id WHERE sud.sud_department='Underwriting' ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				String dateindb = rs.getString("at_datetime");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(11, 19);
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("at_id")); %></td>
                    <td><%out.print(modifieddate); %></td>
                    <td><%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("supd_name")); %></td>
                    <td><%out.print(rs.getString("at_activity")); %></td>
					
					
					
			  
			
					
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
					    if (cells[i].innerHTML == "Completed") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "Issued") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "In good health") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "3/3") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "4/4") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "5/5") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "6/6") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "In poor health") {
					        cells[i].style.backgroundColor = "#d1423e";
					    }
					    if (cells[i].innerHTML == "Declined") {
					        cells[i].style.backgroundColor = "#d1423e";
					    }
					}
							});
									
			</script> 

</body>
</html>
