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
				String query = "SELECT c.c_id AS cid, f.f_name AS Files, af.af_applicationnumber ApplicationNumber, af.af_dateapplied AS DATE, CONCAT( p.p_givenname, ' ', p.p_middlename,' ', p.p_surname ) AS NAME, PI.pi_planname AS PlanName, astat.as_status AS Status_, CONCAT( li.li_givenname, ' ', li.li_middlename, ' ', li.li_surname ) AS li_name, li.li_alias, li.li_gender, li.li_civilstatus, li.li_salutation, li.li_birthdate, li.li_age, li.li_nationality, li.li_placeofbirth, li.li_tinsssgsis, li.li_tinsssgsis, li.li_occupation, li.li_natureofwork, li.li_employer, li.li_natureofemployer, li.li_annualincome, li.li_networth, li.li_sourceoffunds, li.li_mobilenumber, li.li_telephonenumber, li.li_emailaddress, li.li_presentaddress, li.li_presentcountry, li.li_presentzipcode, li.li_permanentaddress, li.li_permanentcountry, li.li_permanentzipcode, li.li_businessaddress, li.li_businesscountry, li.li_businesszipcode, p.p_alias, p.p_gender,  p.p_civilstatus, p.p_salutation, p.p_birthdate, p.p_age, p.p_nationality, p.p_placeofbirth, p.p_tinsssgsis, p.p_occupation, p.p_natureofwork, p.p_employer, p.p_natureofemployer, p.p_annualincome, p.p_networth, p.p_sourceoffunds, p.p_mobilenumber, p.p_telephonenumber, p.p_emailaddress, p.p_presentaddress, p.p_presentcountry, p.p_presentzipcode, p.p_permanentaddress,  p.p_permanentcountry, p.p_permanentzipcode, p.p_businessaddress, p.p_businesscountry, p.p_businesszipcode, p.p_reltolifeinsured, bo.bo_name, bo.bo_contactnumber, pb.pb_name, pb.pb_birthdate,  pb.pb_gender, pb.pb_reltoinsured, pb.pb_share, pb.pb_typeofbeneficiary, pb.pb_beneficiarydesignation, pb.pb_placeofbirth, pb.pb_nationality, pb.pb_presentaddress, pb.pb_country, pb.pb_zipcode, sb.sb_name, sb.sb_birthdate, sb.sb_gender, sb.sb_reltoinsured, sb.sb_share, sb.sb_typeofbeneficiary, sb.sb_beneficiarydesignation, sb.sb_placeofbirth, sb.sb_nationality, sb.sb_presentaddress, sb.sb_country, sb.sb_zipcode FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id = c.c_id LEFT JOIN r_application_status_details astat ON astat.as_ref_c_id =  c.c_id LEFT JOIN r_file_details f ON f.f_ref_c_id = c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id = af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id = ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id = li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id = p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id = bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id = pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id = sb.sb_id LEFT JOIN r_policy_information_details PI ON c.c_ref_pi_id = PI.pi_id WHERE astat.as_status != 'Declined' group by c.c_id";
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
				            style="color: black; width: 560px;display:none;" maxlength="50"/>
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
				        	<span class="label label-default" style="margin-right:10px">Pending</span><span class="label label-warning">0/5</span>
				        	</div>
				        	</div><hr style="margin-top: 0px; margin-bottom: 30px;">
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label" >Medical</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-default" style="margin-right:10px">Pending</span><span class="label label-default">Pending</span>
				        	</div>
				        	</div><hr style="margin-top: 0px; margin-bottom: 30px;">
				        	<div class="row">
				        	<div class="col-md-6">
				        	<label class="control-label">Approval</label>
				        	</div>
				        	<div class="col-md-6">
				        	<span class="label label-default" style="margin-right:10px">Pending</span><span class="label label-default" style="margin-right:10px">Pending</span>
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
      table2.rows[i].cells[4].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var profile_id = document.getElementById('profiletable').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('stat_id').value = profile_id;
    	  	indexedituser = this.parentElement.rowIndex;
      };
      
    }
    
  }); 
  

</script>			
			
</body>
</html>