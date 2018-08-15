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
        <li><a href="application-form.jsp"><i class="fa fa-edit"></i> <span>Application Form</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children">
            <li><a href="application-form-view.jsp"><i class="fa fa-caret-right"></i> Pending Application</a></li>
            <li><a href="issued-application.jsp"><i class="fa fa-caret-right"></i> Issued</a></li>
            <li><a href="declined-application.jsp"><i class="fa fa-caret-right"></i> Declined</a></li>
          </ul>
        </li>
        <li class="active"><a href="upload-requirements.jsp"><i class="fa fa-edit"></i> <span>Profile</span></a></li>

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
				String query = "SELECT c.c_id as cid, f.f_name  AS Files, af.af_applicationnumber ApplicationNumber,af.af_dateapplied as Date, CONCAT (p.p_givenname,' ',p.p_middlename,' ',p.p_surname) as Name, pi.pi_planname as PlanName, astat.as_status as Status FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN r_application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN r_file_details f ON f.f_ref_c_id=c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id=sb.sb_id LEFT JOIN r_policy_information_details pi ON c.c_ref_pi_id=pi.pi_id where astat.as_status!='Declined' GROUP BY c.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
              
              <tr>
                <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td><%out.print(rs.getString("Status")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Files")); %></td>
                <td>
                <a class="btn btn-primary btnUploadFile" href="#modalUpload" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-upload"></i>
                    </a>
                <a class="btn btn-info btnUploadFile" href="#modalViewFile" type="submit" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-eye-open"></i>
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
    
  </div><!-- mainpanel -->
</section>
 <!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalUpload" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
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
				         <input id="c_id" type="text" class="form-control" name="c_id"
				            style="color: black; width: 560px;display:none;" maxlength="50"/>
				<input id="c_id" type="text" class="form-control" name="c_id"
				style="color: black; width: 560px; display:none;" value="" maxlength="50"/>
				         <input name="requirementfile" type="file" class="form-control" onchange="setfilename(this.value);"  multiple/>
				         <input type="text"  id="filereq"  name="filereqname" style="display:none"/>
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
		</div>
		<!-- MODALS-->
          <!-- MODALS view file -->
            <div class="modal fade" id="modalViewFile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
        <input id="f_id" type="text" class="form-control" name="f_id"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
      </div>
      <div class="modal-body">
       <div class="table-responsive">
          <table class="table table-bordered mb30" id="profiletable">
          <col width="120">
  			<col width="80">
  			<col width="30">
  			<col width="30">
  			<col width="80">
            <thead>
              <tr>
                <th style="display:none;">Policyowner</th>
                <th>File Name</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="display:none;"></td>
                <td id="file_name" name="file_name"></td>
                <td>
                <a class="btn btn-warning" id="btnDownload" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon  glyphicon-download"></i>
                    </a>
                </td>
     
              </tr>
            </tbody>
          </table>
          </div><!-- table-responsive -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnIssue">Save changes</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->		

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
$('.btnUploadFile').click( function() {
    var table2 = document.getElementById('profiletable'); 
    for(var i = 1; i < table2.rows.length; i++)
    {
      table2.rows[i].cells[5].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var profile_id = document.getElementById('profiletable').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('c_id').value = profile_id;
	        indexedituser = this.parentElement.rowIndex;
    	  	var f_id = document.getElementById('profiletable').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('f_id').value = f_id;
	        indexedituser = this.parentElement.rowIndex;
    	  	var filename = document.getElementById('profiletable').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('file_name').innerHTML = filename;
    	  	indexedituser = this.parentElement.rowIndex;
      };
      
    }
    
  }); 
  

</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		$("#btnDownload").click(function() {
			
			var f_id = $('#f_id').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					f_id:f_id
					
				},
				url:'FileDownload',
				contentType: "application/json; charset=utf-8",
				success: function(result){
					setTimeout(location.reload.bind(location), 1000);
					
				}
			});
		});
		
	});
</script>			
			
</body>
</html>