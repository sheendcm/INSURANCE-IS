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
        <li><a href="upload-requirements.jsp" style="color:#db241e;"><i class="fa fa-caret-right"></i>Upload Requirements</a></li>
        <li><a href="update-application.jsp"><i class="fa fa-caret-right"></i>Update Application</a></li>
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">UPLOAD REQUIREMENTS</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30">
          <col width="120">
  			<col width="80">
  			<col width="30">
  			<col width="30">
  			<col width="80">
            <thead>
              <tr>
                <th>Policyowner</th>
                <th>Plan Name</th>
                <th>Status</th>
                <th>Upload</th>
                <th>Files</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query = "SELECT applicationID, CONCAT(af.P_givenname,' ', af.P_middlename,' ',af.P_surname) AS Name, F.file_name as FName, af.PI_planname AS PlanName, ast.application_status as Status FROM application_status AS AST INNER JOIN application_form AS AF ON af.applicationID = AST.ref_applicationID LEFT JOIN r_file AS F ON AF.applicationID = F.ref_applicationID";
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
                <span class="glyphicon glyphicon-arrow-up"></span></a>
                
                </td>
                <td><%out.print(rs.getString("FName")); %></td>
      <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalUpload<%out.print(rs.getInt("applicationID")); %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				        <div class="modal-header" style="background-color:#db241e;">
				            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				            <h4 class="modal-title">Upload Requirements</h4>

				        </div>
				        <div class="modal-body">
				        
				         <div class="row">
				         <div class="col-sm-2"></div>
				         <div class="col-sm-8">
				         <br><br>
				         <form method="post" action="uploadServlet" enctype="multipart/form-data">
				<input id="puname<%out.print(rs.getInt("applicationID")); %>" type="text" class="form-control" name="selected_applicationid"
				style="color: black; width: 560px; display:none;" value="<%out.print(rs.getString("applicationID")); %>" maxlength="50"/>
				         <input name="requirementfile" type="file" class="form-control" onchange="setfilename(this.value);"  multiple/>
				         <input type="text"  id="filereq" style="display:none;" name="filereqname"/>
				         <br>
				         <input type="submit" value="Save" class="btn btn-primary" style="margin-left:300px; margin-top:30px; margin-bottom:30px;">
				         
				         </form>
				           <script>
							   function setfilename(val)
							  {
							    var fileName = val.substr(val.lastIndexOf("\\")+1, val.length);
							   document.getElementById("filereq").value = fileName;
							  }
							</script>
				         </div>
				         <div class="col-sm-2"></div>
				        </div>
				        
				    </div>
		</div>
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