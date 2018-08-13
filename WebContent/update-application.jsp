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
 <title>Upload Requirements</title>

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
    
    <div class="leftpanelinner">
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>John Doe</h4>
                    <span>"Life is so..."</span>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">Account</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="profile.html"><i class="fa fa-user"></i> <span>Profile</span></a></li>
              <li><a href=""><i class="fa fa-cog"></i> <span>Account Settings</span></a></li>
              <li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
              <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
            </ul>
        </div>
      
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="application-form.jsp" ><i class="fa fa-caret-right"></i>Application Form</a></li>
        <li><a href="upload-requirements.jsp"><i class="fa fa-caret-right"></i>Upload Requirements</a></li>
        <li><a href="update-application.jsp" style="color:#db241e;"><i class="fa fa-caret-right"></i>Update Application</a></li>
        <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i>Issued Applicants</a></li>

        
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">UPDATE APPLICATION</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30">
          <col width="130">
  			<col width=100">
  			<col width="50">
  			<col width="80">
            <thead>
              <tr>
                <th>Policyowner</th>
                <th>Plan Name</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query = "SELECT applicationID, CONCAT(af.P_givenname,' ', af.P_middlename,' ',af.P_surname) AS Name, af.PI_planname AS PlanName, ast.application_status as Status FROM application_status AS AST INNER JOIN application_form AS AF ON af.applicationID = AST.ref_applicationID";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
              
              <tr>
                <td style="display:none;"><%out.print(rs.getInt("applicationID")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td><%out.print(rs.getString("Status")); %></td>
                <td>
                <a class="btn btn-primary" style="padding: 3px 7px; margin-right:10px; margin-left:10px;" data-toggle="modal" data-target="#modalUpload<%out.print(rs.getInt("applicationID")); %>">
                <span class="glyphicon glyphicon-eye-open"></span></a>
                <a class="btn btn-warning" style="padding: 3px 7px; margin-right:10px; " data-toggle="modal" data-target="#modalChecklist<%out.print(rs.getInt("applicationID")); %>">
                <span class="glyphicon  glyphicon-pencil"></span></a>
                <a class="btn btn-success" style="padding: 3px 7px; margin-right:10px; " data-toggle="modal" data-target="#modalIssued<%out.print(rs.getInt("applicationID")); %>">
                <span class="glyphicon glyphicon-ok"></span></a>
                <a class="btn btn-danger" style="padding: 3px 7px; margin-right:10px; " data-toggle="modal" data-target="#modalDecline<%out.print(rs.getInt("applicationID")); %>">
                <span class="glyphicon glyphicon-remove"></span></a>
                </td>
      <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalUpload<%out.print(rs.getInt("applicationID")); %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				            <h4 class="modal-title">Requirements</h4>
				            <form action="update-application.jsp" method="POST">
						<input id="select_id" type="text" class="form-control" name="select_id"
				style="color: black; width: 560px; display:none; " value="<%out.print(rs.getString("applicationID")); %>" maxlength="50"/></form>
				        </div>
				        <div class="modal-body">
              			<br><br><br><br><br><br><br>
				    </div>
		</div></div>
		</div>
		<!-- MODALS-->
		      <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalChecklist<%out.print(rs.getInt("applicationID")); %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				            <h4 class="modal-title">Requirements</h4>
				            <form action="update-application.jsp" method="POST">
						<input id="select_id" type="text" class="form-control" name="select_id"
				style="color: black; width: 560px; display:none; " value="<%out.print(rs.getString("applicationID")); %>" maxlength="50"/></form>
				        </div>
				        <div class="modal-body">
              			<div class="row" style="padding-left:20px"><br>
              			<div class="col-md-1"></div>
				<div class="col-md-5" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="checkboxPrimary1" />
                            <label for="checkboxPrimary1" style="font-size:85%;">Medical Exam</label>
                 </div></div>
                 <div class="col-md-5" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="checkboxPrimary2"  />
                            <label for="checkboxPrimary2" style="font-size:85%;">Physical Exam</label>
                 </div></div>
                	<div class="col-md-1"></div>
					 </div>
					 <div class="row" style="padding-left:20px"><br>
              			<div class="col-md-1"></div>
				<div class="col-md-5" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="checkboxPrimary3"  />
                            <label for="checkboxPrimary3" style="font-size:85%;">Urinary Test</label>
                 </div></div>
                 <div class="col-md-5" style="padding:0;">
				<div class="ckbox ckbox-primary">
                        <input type="checkbox" value="1" id="checkboxPrimary4"  />
                            <label for="checkboxPrimary4" style="font-size:85%;">Physical Exam</label>
                 </div></div>
                	<div class="col-md-1"></div>
					 </div><br><br>
					 <div class="row" style="padding-left:20px"><br>
              			<div class="col-md-8"></div>
                	<div class="col-md-2">
                	<a class="btn btn-primary">Save</a>
                	<div class="col-md-2"></div>
                	</div>
					 </div><br><br>
				    </div>
		</div></div>
		</div>
		<!-- MODALS-->
				      <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalIssued<%out.print(rs.getInt("applicationID")); %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				            <h4 class="modal-title">Application</h4>
				            <form action="update-application.jsp" method="POST">
						<input id="select_id" type="text" class="form-control" name="select_id"
				style="color: black; width: 560px; display:none; " value="<%out.print(rs.getString("applicationID")); %>" maxlength="50"/></form>
				        </div>
				        <div class="modal-body">
              			<br><br><br><br><br><br><br>
				    </div>
		</div></div>
		</div>
		<!-- MODALS-->
				      <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalDecline<%out.print(rs.getInt("applicationID")); %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				            <h4 class="modal-title">Application</h4>
				            <form action="update-application.jsp" method="POST">
						<input id="select_id" type="text" class="form-control" name="select_id"
				style="color: black; width: 560px; display:none; " value="<%out.print(rs.getString("applicationID")); %>" maxlength="50"/></form>
				        </div>
				        <div class="modal-body">
              			<br><br><br><br><br><br><br>
				    </div>
		</div></div>
		</div>
		<!-- MODALS-->
                
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
			  </div>
            </div>
            <div class="panel-body panel-body-nopadding">
              
              
              
            </div><!-- panel-body -->
          </div><!-- panel -->
      </div><!-- row -->

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


			
</body>
</html>