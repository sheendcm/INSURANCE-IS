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
 <title>Profile</title>

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
        <li class="nav-parent"><a href=""><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children">
            <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i> Pending Application</a></li>
            <li><a href="issued-application.jsp"><i class="fa fa-caret-right"></i> Issued</a></li>
            <li><a href="declined-application.jsp"><i class="fa fa-caret-right"></i> Declined</a></li>
          </ul>
        </li>
        <li class="active"><a href="upload-requirements.jsp" style="background-color: #DB241E;"><i class="fa fa-edit"></i> <span>Profile</span></a></li>

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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">PROFILE</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30" id="profiletable">
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
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query = "SELECT c.c_id AS cid, ar_req1+ar_req2+ar_req3+ar_req4+ar_req5 as sum, f.f_name AS Files, af.af_applicationnumber ApplicationNumber, af.af_dateapplied AS DATE, CONCAT( p.p_givenname, ' ', p.p_middlename,' ', p.p_surname ) AS NAME, PI.pi_planname AS PlanName, astat.as_status AS Status_, ap.ap_requirements as req, ap.ap_medical as med, ap.ap_status as stat, ar.ar_req1, ar.ar_req2, ar.ar_req3, ar.ar_req4, ar.ar_req5, ms.ms_status, astat.as_status FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id = c.c_id LEFT JOIN r_medical_status_details ms ON ms.ms_ref_c_id=c.c_id LEFT JOIN r_application_status_details astat ON astat.as_ref_c_id =  c.c_id LEFT JOIN r_file_details f ON f.f_ref_c_id = c.c_id LEFT JOIN r_application_progress_details ap ON ap.ap_ref_c_id=c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id = af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id = ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id = li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id = p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id = bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id = pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id = sb.sb_id LEFT JOIN r_policy_information_details PI ON c.c_ref_pi_id = PI.pi_id WHERE astat.as_status != 'Declined' group by c.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
              
              <tr>
                <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td><%out.print(rs.getString("Status_")); %></td>
                <td style="display:none;"><%out.print(rs.getString("req")); %></td>
                <td style="display:none;"><%out.print(rs.getString("med")); %></td>
                <td style="display:none;"><%out.print(rs.getString("stat")); %></td>
                <td style="display:none;"><%out.print(rs.getString("sum")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ar_req1")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ar_req2")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ar_req3")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ar_req4")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ar_req5")); %></td>
                <td style="display:none;"><%out.print(rs.getString("ms_status")); %></td>
                <td style="display:none;"><%out.print(rs.getString("as_status")); %></td>
                <td>
                 <a  title="View Profile" class="btn btn-info" href="view-profile.jsp?id=<%out.print(rs.getInt("cid")); %>" type="submit" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                <a  title="View Progress" class="btn btn-warning btnViewStatus" href="#modalViewStatus" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-signal"></i>
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
            <div class="panel-body panel-body-nopadding">
              
              
              
            </div><!-- panel-body -->
          </div><!-- panel -->

      </div><!-- row -->

    </div><!-- contentpanel -->
    <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalViewStatus" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style=" width:500px;">
				        <div class="modal-header" style="background-color:#db241e; height:50px;">
				            <button aria-hidden="true" data-dismiss="modal" style="margin:0px" class="close" type="button">&times;</button>
				            <h4 class="modal-title" style="font-size:15px;color:white;">Application Status</h4>
							<input id="stat_id" type="text" class="form-control" name="stat_id"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
				        </div>
				        <div class="modal-body">
				        	
				        	<div class="row">
				        	<div class="col-md-1"></div>
				        	<div class="col-md-10"><br>
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label">Application Form</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-success">Completed</span>
				        	</div>
				        	</div><hr style="margin-top: 0px; margin-bottom: 30px;">
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label" >Requirements</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-warning" style="margin-right:10px" id="reqstat">0/5</span><span class="label label-default" id="requirements">Pending</span>
				        	</div>
				        	</div><hr style="margin-top: 0px; margin-bottom: 30px;">
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label" >Medical</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-default" style="margin-right:10px" id="medstat">Pending</span><span class="label label-default" id="medical">Pending</span>
				        	</div>
				        	</div><hr style="margin-top: 0px; margin-bottom: 30px;">
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label">Approval</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-default" style="margin-right:10px" id="approvalstat">Pending</span><span class="label label-default"  id="approval">Pending</span>
				        	</div>
				        	</div><br>
				        	</div>
				        	<div class="col-md-1"></div>
				        	</div>
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
				      </div>
		</div>
		</div>
		</div>
		<!-- MODALS--> 
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
<script>
var indexedituser = '';
$('.btnViewStatus').click( function() {
    var table2 = document.getElementById('profiletable'); 
    for(var i = 1; i < table2.rows.length; i++)
    {
      table2.rows[i].cells[15].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var profile_id = document.getElementById('profiletable').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('stat_id').value = profile_id;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	
    	  	var requirements = document.getElementById('profiletable').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('requirements').innerHTML = requirements;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var reqstat = document.getElementById('profiletable').rows[indexedituser].cells.item(7).innerHTML
	        document.getElementById('reqstat').innerHTML = reqstat+"/5";
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var medical = document.getElementById('profiletable').rows[indexedituser].cells.item(5).innerHTML
	        document.getElementById('medical').innerHTML = medical;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var medstat = document.getElementById('profiletable').rows[indexedituser].cells.item(13).innerHTML
	        document.getElementById('medstat').innerHTML = medstat;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var approval = document.getElementById('profiletable').rows[indexedituser].cells.item(6).innerHTML
	        document.getElementById('approval').innerHTML = approval;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var approvalstat = document.getElementById('profiletable').rows[indexedituser].cells.item(14).innerHTML
	        document.getElementById('approvalstat').innerHTML = approvalstat;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	if (requirements=="Completed")
    	  	document.getElementById('requirements').style.backgroundColor = "#1caf9a";
    	  	else
    	  	document.getElementById('requirements').style.backgroundColor = "#777777";
    	  	if (reqstat=="5")
    	  	document.getElementById('reqstat').style.backgroundColor = "#1caf9a";
    	  	else
    	  	document.getElementById('reqstat').style.backgroundColor = "#f0ad4e";
    	  	if (medical=="Completed")
    	  	document.getElementById('medical').style.backgroundColor = "#1caf9a";
    	  	else
    	  	document.getElementById('medical').style.backgroundColor = "#777777";
    	  	if (medstat=="Healthy")
    	  	document.getElementById('medstat').style.backgroundColor = "#1caf9a";
    	  	if (medstat=="Unhealthy")
    	  	document.getElementById('medstat').style.backgroundColor = "#d9534f";
    	  	if (medstat=="Pending")
    	  	document.getElementById('medstat').style.backgroundColor = "#777777";
    	  	if (approval=="Completed")
    	  	document.getElementById('approval').style.backgroundColor = "#1caf9a";
    	  	else 
    	  	document.getElementById('approval').style.backgroundColor = "#777777";
    	  	if (approvalstat=="Issued")
    	  	document.getElementById('approvalstat').style.backgroundColor = "#1caf9a";
    	  	if (approvalstat=="Declined")
    	  	document.getElementById('approvalstat').style.backgroundColor = "#d9534f";
      };
      
    }
    
  }); 
  

</script>				
</body>
</html>