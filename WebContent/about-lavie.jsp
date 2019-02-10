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
        <li class="active"><a href="about-lavie.jsp"><i class="glyphicon glyphicon-book"></i> <span>About</span></a></li>
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
      <h2><i class="glyphicon glyphicon-book"></i>About</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li class="active">About</li>
        </ol>
      </div>
    </div>
    <div class="contenpanel">
    
    </div>
   <div class="contentpanel">
       <div class="contentpanel">
         <div class="panel-body" style="background-color: white" >

            <img src="images/lavie-logo.png" style="margin-left: 25%; object-position: center; height: 30%; width: 50%" />
          <h2>What is life insurance?</h2>

          <p>
        Life insurance can protect the financial security of the people you love by giving them a tax-free payment after you die. The amount and type of coverage you choose will depend on your circumstances and needs. The cost of life insurance you buy as an individual depends on your age, gender, health, medical history and lifestyle.</p>
       

        <div class="panel-heading">
                <h5 class="panel-title" style="text-align: center;">Types of life insurance:</h5>
            </div>
            <div class="panel-body">
                <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item active">
                        <div class="media">
                            <a href="#" class="pull-left">
                              <img alt="80x60" src="images/lavie-logo.png" style="width:50% height: 40%;">
                            </a>
                            <div class="media-body">
                              <h3 class="media-heading">Term life insurance</h2>
                              <small class="media-desc"><ul>
<li>Term life insurance is simple and affordable , providing a fixed amount of insurance for a specific period of time</li>

<li>In the event of your death, the policy pays a tax-free benefit, to your beneficiaries</li>

<li>Term life provides temporary protection you can customize to meet your changing needs</li>
</ul></small>
                            </div>
                        </div><!-- media -->
                      </div><!-- item -->
                      <div class="item">
                        <div class="media">
                            <a href="#" class="pull-left">
                              <img alt="80x60" src="images/lavie-logo.png": style="width: 50%; height: 40%;">
                            </a>
                            <div class="media-body">
                              <h3 class="media-heading">Permanent life insurance</h3>
                              <small class="media-desc"><ul>
<li>Permanent life insurance is often called whole life insurance because it covers you for your whole life – and some types can build cash value over time.</li>

<li>Permanent insurance costs are usually guaranteed not to increase from the time you first buy the policy.</li>

<li>Some permanent insurance plans let you pay for a limited time and and then you don't have to pay any more.</li>
</ul></small>
                            </div>
                        </div>
                      </div>
                      
                      <div class="item">
                        <div class="media">
                            <a href="#" class="pull-left">
                              <img alt="80x60" src="images/lavie-logo.png"AOA0kQJAAGP8NaSYqyzWYrR8AAAAASUVORK5CYII=" class="media-object" data-src="holder.js/80x60/#777:#fff" style="width: 50%; height: 40%;">
                            </a>
                            <div class="media-body">
                              <h3 class="media-heading">Participating life insurance</h3>
                              <small class="media-desc"><ul>
<li>Participating life insurance is a type of permanent whole life insurance coverage that can be eligible to receive dividends.</li>

<li>The amount of coverage you choose and your premiums are guaranteed for life.</li>

<li>You can use the dividends to buy more coverage, reduce your annual premium cost or earn interest inside the plan. Or you can take them in cash. Dividends are not guaranteed.</li>
</ul></small>
                            </div>
                        </div>
                      </div>
                      
                    </div><!-- carousel-inner -->

                    <!-- Indicators -->
                    <ol class="carousel-indicators" style="color: black;">
                      <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                      <li data-target="#carousel-example-generic2" data-slide-to="1" class=""></li>
                      <li data-target="#carousel-example-generic2" data-slide-to="2" class=""></li>
                    </ol>
                    
                </div><!-- carousel -->

            </div>

        </div><!-- cntentpanel -->


  </div>
    </div><!-- contentpanel -->
    
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
