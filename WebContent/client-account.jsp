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
<%    int userid=0;
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
       <h5 class="sidebartitle" style="padding-left: 15px;"> POLICYOWNER</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="client-life-insured-view.jsp"><i class="fa fa-home"></i> <span>Plans</span></a></li>
       <li class="active"><a href="client-account.jsp"><i class="glyphicon glyphicon-user"></i> <span>Account</span></a></li>
        <li><a href="about-lavie.jsp"><i class="glyphicon glyphicon-book"></i> <span>About</span></a></li>
        <li><a href="faq-lavie.jsp"><i class="glyphicon glyphicon-question-sign"></i> <span>FAQ</span></a></li>
          </ul>
      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <%
      try{ 
        String query1 = " SELECT * FROM r_policyowner_details where p_id="+userid+" ";
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
                Welcome! <%out.print(rs1.getString("p_givenname")); %> <%out.print(rs1.getString("p_middlename")); %> <%out.print(rs1.getString("p_surname")); %>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a>
                </li>
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
      <h2><i class="glyphicon glyphicon-user"></i> Account</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li class="active">Account</li>
        </ol>
      </div>
    </div>
    <div class="contenpanel">
    
    </div>
   <div class="contentpanel">
      
        <%
      try{ 
        String query2 = " SELECT * FROM r_policyowner_details pd INNER JOIN r_policy_information_details pld ON pd.p_id = pld.pi_id INNER JOIN r_policyowner_login_details plld ON pd.p_id=plld.pl_id where p_id="+userid+" ";
        Statement stmt2 = conn.createStatement();
        ResultSet rs2 = stmt1.executeQuery(query2);
        while(rs2.next())
        {
        
      %>
              <div class="panel-body" style="background-color: white" >
                <h3 style="padding-bottom: 5%;">Change Password</h3>
                <div class="form-group">
                  <label class="col-sm-2 control-label">Current Password:</label>
                  <div class="col-sm-6">
                    <input type="text" name="curPass" class="form-control" value=" <%out.print(rs2.getString("pl_password")); %>">

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">New Password:</label>
                  <div class="col-sm-6">
                    <input type="text" name="newPass" class="form-control" value="" id="newPass">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label">Confirm Password:</label>
                  <div class="col-sm-6">
                    <input type="text" name="conPass" class="form-control" id="conPass">
                  </div>
                </div>
                <div class="form-group" >
                  <button type="submit" class="btn btn-primary" id="changePassword">Save</button>
                </div>
                    </div><!-- cntentpanel -->
  </div>
    <% }
            rs2.close();
            stmt2.close();
      }
      catch(Exception e)
      {
      e.printStackTrace();
      }
           %>
  
     <% }
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

<script type="text/javascript">
  $(document).ready(function (){
    
    $("#changePassword").click(function() {
      
      
      var userid = userid;
      var newPass = document.getElementByID("newPass").innerHTML();

      $.ajax({
        type:'POST',
        data:
        { 
          userid:userid,
          newPass:newPass
        },
        url:'ChangePass',
        success: function(result){
          
          swal("Success!", "Password Changed", "success");
          setTimeout(location.reload.bind(location), 3000);
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
