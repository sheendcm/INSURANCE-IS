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
  <link rel="shortcut icon" href="images/prulifelogo.png" type="image/png">
 <title>Application for Life Insurance</title>

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
    
    <div class="leftpanelinner" style="padding-top:30px;">

      
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="application-form.jsp"><i class="fa fa-edit"></i> <span>Application Form</span></a></li>
        <li class="nav-parent nav-active active"><a href="" style="background-color: #DB241E;"><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children" style="display: block">
            <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i> Pending Application</a></li>
            <li class="active"><a href="issued-application.jsp" style="color: #DB241E;"><i class="fa fa-caret-right"></i> Issued</a></li>
            <li><a href="declined-application.jsp"><i class="fa fa-caret-right"></i> Declined</a></li>
          </ul>
        </li>
        <li><a href="upload-requirements.jsp"><i class="fa fa-edit"></i> <span>Profile</span></a></li>
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">ISSUED</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30" id="IssuedApplication">
          
  			<col width="80">
  			<col width="100">
  			<col width="200">
  			<col width="200">
  			<col width="100">
            <thead>
              <tr>
              	<th style="display:none;"></th>
                <th>Application Number</th>
                <th>Date Applied</th>
                <th>Name</th>
                <th>Plan Name</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query = "SELECT c.c_id as cid, af.af_applicationnumber ApplicationNumber,af.af_dateapplied as Date, CONCAT (p.p_givenname,' ',p.p_middlename,' ',p.p_surname) as Name, p.p_emailaddress as Email, pi.pi_planname as PlanName, ar_req1+ar_req2+ar_req3+ar_req4+ar_req5 as sum, ar.ar_req1 as Req1, ar.ar_req2 as Req2, ar.ar_req3 as Req3, ar.ar_req4 as Req4, ar.ar_req5 as Req5 FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN r_application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN r_application_progress_details ap ON ap.ap_ref_c_id=c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id=sb.sb_id LEFT JOIN r_policy_information_details pi ON c.c_ref_pi_id=pi.pi_id where astat.as_status='Issued' and ap.ap_status='Completed'";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
 
              <tr>
                <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                <td><%out.print(rs.getString("ApplicationNumber")); %></td>
                <td><%out.print(rs.getString("Date")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Email")); %></td>
                <td>
                <a title="Send Message" class="btn btn-warning btnSendMsg" href="#modalSendMsg" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-envelope"></i>
                    </a>
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
			  </div>
            </div>
          </div><!-- panel -->  
     
      </div><!-- row -->
 <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalSendMsg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style=" width:500px;">
				        <div class="modal-header" style="background-color:#db241e; height:50px;">
				            <button aria-hidden="true" data-dismiss="modal" style="margin:0px" class="close" type="button">&times;</button>
				            <h4 class="modal-title" style="font-size:15px;color:white;">Send Message</h4>
							
				        </div>
				        <form action="EmailSendingServlet" method="post">
				        <div class="modal-body">
				        	
				        	<div class="row">
				        	<div class="col-md-1"></div>
				        	<div class="col-md-10">
				        	<div class="form-group"> <br> 
                        <label class="col-sm-4 control-label" style="font-size:85%;">Email</label>
                        <div class="col-sm-8">
                          <input type="text"  name="email" id="email" class="form-control input-sm mb15" style="" />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Subject</label>
                        <div class="col-sm-8">
                          <input type="text" name="subject" id="subject" class="form-control input-sm mb15"  />
                        </div>
                        <label class="col-sm-4 control-label" style="font-size:85%;">Message</label>
                        <div class="col-sm-8">
                        <textarea class="form-control input-sm mb15" name="content" id="content" rows="5"></textarea>
                        </div>
                      </div>
				        	</div>
				        	<div class="col-md-1"></div>
				        	</div>
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
				        <button type="submit" class="btn btn-primary" id="btnUpdateReqStatus" style ="font-size:11px">Send</button>
				      </div>
				      </form>
		</div>
		</div>
		</div>
		<!-- MODALS-->
    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
</section>
<script>
var indexedituser = '';
$('.btnSendMsg').click( function() {
    var table2 = document.getElementById('IssuedApplication'); 
    for(var i = 1; i < table2.rows.length; i++)
    {
      table2.rows[i].cells[6].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
	        var email = document.getElementById('IssuedApplication').rows[indexedituser].cells.item(5).innerHTML
	        document.getElementById('email').value = email;
	        document.getElementById('subject').value = "Prulife UK Life Insurance Application";
	        document.getElementById('content').value = "Congratulations! Your application is approved!";
    	  	indexedituser = this.parentElement.rowIndex;
	       
      };
      
    }
    
  }); 
  

</script>
			

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