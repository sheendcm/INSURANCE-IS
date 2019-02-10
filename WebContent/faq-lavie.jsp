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
       <li><a href="client-account.jsp"><i class="glyphicon glyphicon-user"></i> <span>Account</span></a></li>
        <li><a href="about-lavie.jsp"><i class="glyphicon glyphicon-book"></i> <span>About</span></a></li>
        <li class="active"><a href="faq-lavie.jsp"><i class="glyphicon glyphicon-question-sign"></i> <span>FAQ</span></a></li>
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
      <h2><i class="glyphicon glyphicon-question-sign"></i> FAQs</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li class="active">FAQs</li>
        </ol>
      </div>
    </div>
    <div class="contenpanel">
    
    </div>
   <div class="contentpanel">
      <div class="panel-body" style="background-color: white" >

            <img src="images/lavie-logo.png" style="margin-left: 25%; object-position: center; height: 30%; width: 50%" />
    
          <h2>What is life insurance?</h2>

          <p>
        Life insurance can protect the financial security of the people you love by giving them a tax-free payment after you die. The amount and type of coverage you choose will depend on your circumstances and needs. The cost of life insurance you buy as an individual depends on your age, gender, health, medical history and lifestyle.</p>
        

<div class="panel-group panel-group-dark" id="accordion2">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2" class="collapsed">
                    What is underwriting?
                  </a>
                </h4>
              </div>
              <div id="collapseOne2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                 Underwriting is the process of assessing the risk people applying for insurance present, to determine the coverage they are eligible for and ensure their premium cost reflects their level of risk. In short, your risk level ultimately decides your premium.

The underwriting process can be used for various types of insurance, such as life insurance, health insurance, mortgage protection insurance and property and casualty insurance.

After you or your advisor completes your application, it goes to the insurance company's underwriters, who are experts in assessing risk. Underwriters use manuals that provide guidelines to evaluate your risk level based on your medical, health, and lifestyle risk factors.
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" class="" data-parent="#accordion2" href="#collapseTwo2">
                    Change beneficiaries?
                  </a>
                </h4>
              </div>
              <div id="collapseTwo2" class="panel-collapse collapse in" style="">
                <div class="panel-body">
                    Most common beneficiaries are emmidiate family members, decendants, heirs, employers, business and charities of the insured.
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseThree2">
                    Submitting claims?
                  </a>
                </h4>
              </div>
              <div id="collapseThree2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                 <div class="content">
<p><strong>If you haven't yet signed up for direct deposit or online claims,</strong> please take a few minutes to <a href="https://www.sunnet.sunlife.com/mysunlife/signin/register/bregister.asp" target="_blank">register now.</a> You will need your contract number and member ID number, which you will find on your coverage card, your claim statement or your new plan member welcome letter.</p>
<h4>If you are already registered:</h4>
<ol>
<li>Sign in to <a data-target="#signin-widget-modal" data-toggle="modal" href="javascript:void(0)">lavie.ca</a>.</li>
<li>Under <strong>my health and well-being</strong>, click my claims.</li>
<li>If the header <strong>Submit a claim</strong> appears, you can submit a claim online.</li>
<li>Choose the appropriate claim type (e.g., paramedical, vision) and follow the steps to submit.</li>
</ol>
<p>If the <strong>Submit a claim</strong> header does not appear, you can’t submit a claim online. Return to the previous screen and select <strong>I want to submit a paper claim.</strong></p>
<p>If you have more questions about submitting a claim online, contact your plan administrator or call us at 1-345-678-9101 Monday to Friday, 8am to 8pm ET, or sign in to <a data-target="#signin-widget-modal" data-toggle="modal" href="javascript:void(0)">levie.ca</a> to send us a secure message.</p>
</div>
              </div>
            </div>
          </div>
        </div><!-- cntentpanel -->

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

</body>
</html>
