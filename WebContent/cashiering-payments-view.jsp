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
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> CASHIER</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="cashiering-policyowner-view.jsp"><i class="fa fa-user"></i> <span>Policyowners</span></a></li>
        <li><a href="cashiering-add-payment.jsp"><i class="fa fa-plus"></i> <span>Add Payments</span></a></li>
        <li class="active"><a href="cashiering-payments-view.jsp"><i class="fa fa-money"></i> <span>Payments</span></a></li>
         <li><a href="cashiering-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit-Trail</span></a></li>
      </ul>
    </div><!-- leftpanelinner -->
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
      <h2><i class="fa  fa-money"></i> Payments</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Cashier</a></li>
          <li class="active">Payments</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
							            
      <div class="panel panel-default">
       <label class="col-sm-4 control-label mylabel" align="right" id="alertUpload" style="display:none;"><%=request.getAttribute("Message")%></label>
       <script>
       var uploadalert = document.getElementById('alertUpload').innerHTML;
       if(uploadalert=='File uploaded!')
       {	
       		swal("Success!", "Successfully uploaded file!", "success")
       		document.getElementById('alertUpload').innerHTML="";
       }
       		
       </script>
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
            <col width="14%">
            <col width="12%">
            <col width="16%">
            <col width="16%">
            <col width="15%">
  			<col width="12%">
  			<col width="12%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Payment Number</th>
                 	<th>Payment Date</th>
                 	<th>Policyowner</th>
                 	<th>Amount</th>
                 	<th>Method</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "select * FROM t_payment_details pay LEFT JOIN t_policy_details pd ON pd.pol_id=pay.payment_ref_pol_id LEFT JOIN r_policyowner_details p ON p.p_id=pd.pol_ref_p_id where payment_status='Paid' ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("payment_id")); %></td>
                    <td>0000-<%out.print(rs.getInt("payment_id")); %></td>
                    <td><%out.print(rs.getString("payment_date_of_payment")); %></td>
                    <td><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></td>
                    <td><%out.print(rs.getString("payment_amount")); %></td>
                    <td><%out.print(rs.getString("payment_method")); %></td>
                    <td>
					<a class ="btn btn-info mybtn tooltips" data-placement="top" data-toggle="modal" title="View Payment Info" href="#" ><i class="glyphicon glyphicon-eye-open"></i></a>
					</td>
					
					
					
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
    jQuery('#table2').dataTable();
    
  
    
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

</body>
</html>
