<%@page import="java.sql.*"%>
<%@page import="db.Conn" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.util.Calendar" %>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration, java.util.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/lavienew.png" type="image/png">

  <title>La Vie Insurance</title>

  <link href="css/style.default.css" rel="stylesheet">
  <link href="css/jquery.datatables.css" rel="stylesheet">
  
   <link href="./SweetAlert for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
    <link href="./SweetAlert for Bootstrap_files/font-awesome.min.css" rel="stylesheet">
    <script id="twitter-wjs" src="./SweetAlert for Bootstrap_files/widgets.js.download"></script><script async="" src="./SweetAlert for Bootstrap_files/analytics.js.download"></script><script src="./SweetAlert for Bootstrap_files/jquery-2.1.1.js.download"></script>
    <link href="./SweetAlert for Bootstrap_files/docs.css" rel="stylesheet">

    <!-- Debug -->
    <script src="https://localhost:32123/livereload.js"></script>

    <!-- This is what you need -->
    <script src="./SweetAlert for Bootstrap_files/sweetalert.js.download"></script>
    <link rel="stylesheet" href="./SweetAlert for Bootstrap_files/sweetalert.css">
    <!--.......................-->

    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-42119746-3', 'auto');
      ga('send', 'pageview');
    </script>
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
	<div style="height:670px; background-color:#fcfcfc; margin-left:150px; margin-right:150px;">
	
	
      <%	
      
         	String cid =request.getParameter("id");
			try{ 
				String query = "SELECT * FROM client_details cd LEFT JOIN application_progress_details apd on apd.ap_ref_c_id=cd.c_id LEFT JOIN application_status_details asd ON asd.as_ref_c_id=cd.c_id LEFT JOIN application_requirements_details ard ON ard.ar_ref_c_id=cd.c_id LEFT JOIN medical_status_details msd ON msd.ms_ref_c_id=cd.c_id LEFT JOIN application_form_details afd on cd.c_ref_af_id=afd.af_id LEFT JOIN beneficial_owner_details bod on cd.c_ref_bo_id=bod.bo_id LEFT JOIN policy_information_details pid on cd.c_ref_pi_id=pid.pi_id LEFT JOIN benefit_details bd ON bd.benefit_ref_pi_id=pid.pi_id LEFT JOIN life_insured_details lid ON cd.c_ref_li_id=lid.li_id LEFT JOIN non_medical_information_details nmid ON cd.c_ref_nmid_id=nmid.nmid_id LEFT JOIN policyowner_details pd on cd.c_ref_p_id=pd.p_id LEFT JOIN primary_beneficiary_details pbd ON cd.c_ref_pb_id=pbd.pb_id LEFT JOIN system_user_details sud on cd.c_ref_ai_id=sud.sud_id LEFT JOIN system_user_personal_details supd on sud.sud_ref_supd_id=supd.supd_id LEFT JOIN file_details fd on fd.f_ref_c_id=cd.c_id LEFT JOIN plan_details plan on pid.pi_ref_plan_id=plan.plan_id where apd.ap_medical='In Medical Department' and cd.c_id = "+cid+" group by cd.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					
				
			%>
	
    <div class="headerbar">
       
      
      <div class="header-right">
        <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
                Malene Dizon
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>
          <li>
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->

        
    <div class="pageheader">
      <h2><i class="fa fa-medkit"></i>Medical Department </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="medical-department.jsp">Medical Department</a></li>
          <li class="active">View Profile</li>
        </ol>
      </div>
    </div>
  <style>
					.mybtn
					{
						padding: 2px 6px;
						background-color:#007E33;
						border-color:#007E33;
					}
					.mybtn:hover
					{
						padding: 2px 6px;
						background-color:#005c25;
						border-color:#005c25;
					}
					.mybtn1
					{
						padding: 5px 9px;
					}
					.mybtn1:hover
					{
						padding: 5px 9px;
					}
					.mybtn2
					{
						padding: 2px 6px;
						background-color:#CC0000;
						border-color:#CC0000;
					}
					.mybtn2:hover
					{
						padding: 2px 6px;
						background-color:#A30000;
						border-color:#A30000;
					}
					.mybtn3
					{
						padding: 2px 6px;
						background-color:#424242;
						border-color:#424242;
					}
					.mybtn3:hover
					{
						padding: 2px 6px;
						background-color:#212121;
						border-color:#212121;
					}
					.myspan
					{
						background-color:#757575;
					}
					.myi
					{
						font-size:90%;
					}
					</style>

      
      <div class="panel panel-default">
        <div class="panel-body"><br>
          <div class="row">
        <div class="col-sm-3">
          <div class="profile-header">
            <h2 class="profile-name"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></h2>
            <hr>
            <input type="text" class="form-control mytextbox"  id="client_id"  name="client_id" value="<%out.print(rs.getInt("c_id")); %>"  style="display:none;" />
            <div class="row" align="left" style="margin-left:1px;">
            
            <button class="btn btn-primary mybtn1 mr5" title="Upload File" href="#modalUpload" data-toggle="modal"><i class="fa fa-arrow-circle-up"></i> Upload File</button>
            
					                <label align="center"><%=request.getAttribute("Message")%></label>
            </div>
            <hr>
            <div class="profile-location"><strong><i class="fa fa-edit" style="font-size:20px;"></i> Remarks</strong></div>
            <textarea name="remarks" id="remarks" class="form-control" rows="9"><%out.print(rs.getString("ms_remarks")); %></textarea>
            <div class="row" align="right" style="margin-right:5px; margin-top:5px;">
            
            </div>
            <hr>
            
            <div class="row" align="center">
            
            <button class="btn btn-primary mybtn1 mr5" id="btnApprove"><i class="fa fa-check"></i> Approve</button>
            <button class="btn btn-white mybtn1" id="btnDecline"><i class="fa fa-times"></i> Decline</button>
            </div>
            <hr>
          </div><!-- profile-header -->
          
        </div><!-- col-sm-3 -->
        <div class="col-sm-9" style="border-style: solid; border-width: 1px; border-color:#D3D3D3;">
          
          
          <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified nav-profile">
          <li class="active"><a href="#activities" data-toggle="tab"><strong>Non-Medical Information</strong></a></li>
          <li><a href="#followers" data-toggle="tab"><strong>Medical Files</strong></a></li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane active" id="activities">
            <div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px;">
                <col width="25%">
	  			<col width="25%">
	  			<col width="25%">
	  			<col width="25%">
                    <thead>
                      <tr>
                        <th style="background-color:#3F729B;">Gender</th>
                        <th style="background-color:#3F729B;">Age</th>
                        <th style="background-color:#3F729B;">Height</th>
                        <th style="background-color:#3F729B;">Weight</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><%out.print(rs.getString("li_gender")); %></td>
                        <td><%out.print(rs.getString("li_birthdate")); %></td>
                        <td><%out.print(rs.getString("nmid_height")); %> cm.</td>
                        <td><%out.print(rs.getString("nmid_weight")); %> lbs.</td>
                      </tr>
                    </tbody>
                </table>
            </div><!-- table-responsive -->
<div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px;">
                <col width="5%">
	  			<col width="45%">
	  			<col width="20%">
	  			<col width="30%">
                    <thead>
                      <tr>
                        <th style="background-color:#3F729B;">#</th>
                        <th style="background-color:#3F729B;">Have the following</th>
                        <th style="background-color:#3F729B;"></th>
                        <th style="background-color:#3F729B;">Details</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>AIDS-related condition</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_1")); %></span></td>
                        <td><%out.print(rs.getString("nmid_1details")); %></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Receiving treatment or taking medication of any kind</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_2")); %></span></td>
                        <td><%out.print(rs.getString("nmid_2details")); %></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Taken habit-forming drug or other addiction</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_3")); %></span></td>
                        <td><%out.print(rs.getString("nmid_3details")); %></td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>Drinking alcoholic beverages</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_4")); %></span></td>
                        <td><%out.print(rs.getString("nmid_4details")); %></td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>Smoking or history of smoking cigarettes/tobacco</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_5")); %></span></td>
                        <td><%out.print(rs.getString("nmid_5details")); %></td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>Disorder of the brain or nervous system</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_6")); %></span></td>
                        <td><%out.print(rs.getString("nmid_6details")); %></td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>Disorder of the lungs or respiratory system</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_7")); %></span></td>
                        <td><%out.print(rs.getString("nmid_7details")); %></td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td>Disorder of the heart or circulatory system</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_8")); %></span></td>
                        <td><%out.print(rs.getString("nmid_8details")); %></td>
                      </tr>
                      <tr>
                        <td>9</td>
                        <td>Diabetes, thyroid or other endocrine disorder</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_9")); %></span></td>
                        <td><%out.print(rs.getString("nmid_9details")); %></td>
                      </tr>
                      <tr>
                        <td>10</td>
                        <td>Arthritis, rheumatism or other disorder of bones, joints or muscles</td>
                        <td align="center"><span class="label label-default myspan"><%out.print(rs.getString("nmid_10")); %></span></td>
                        <td><%out.print(rs.getString("nmid_10details")); %></td>
                      </tr>
                    </tbody>
                </table>
            </div><!-- table-responsive -->
          </div>
          <div class="tab-pane" id="followers">
          
            
            
            <div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px;">
                <col width="5%">
	  			<col width="25%">
	  			<col width="25%">
	  			<col width="20%">
	  			<col width="10%">
                    <thead>
                      <tr>
                        <th style="background-color:#3F729B;">#</th>
                        <th style="background-color:#3F729B;">File Name</th>
                        <th style="background-color:#3F729B;">File Description</th>
                        <th style="background-color:#3F729B;">Upload Date</th>
                        <th style="background-color:#3F729B;">Download</th>
                      </tr>
                    </thead>
                    <tbody><%
			try{ 
				String query3 = "select * from file_details where f_ref_c_id="+cid+" ";
				Statement stmt3 = conn.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				while(rs3.next())
				{
			%>
                      <tr>
                        <td style="display:none;"><%out.print(rs3.getInt("f_id")); %></td>
                        <td></td>
                        <td><%out.print(rs3.getString("f_name")); %></td>
                        <td><%out.print(rs3.getString("f_description")); %></td>
                        <td><%String dateindb = rs.getString("f_dateuploaded");
		            			String modifieddate = dateindb.substring(0, 10);
		            			out.print(modifieddate); %></td>
                        <td><a class="btn btn-primary mybtn" href="downloadServlet?id=<%out.print(rs3.getInt("f_id")); %>" title="Download" data-toggle="modal"><i class="glyphicon glyphicon-download-alt myi"></i></a></td>
                      <%
				}
				%>
                      </tr>
                      
                    </tbody>
                </table>
                <%
            rs3.close();
            stmt3.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
            </div><!-- table-responsive -->
            
          </div>
          
          
        </div><!-- tab-content -->
          
        </div><!-- col-sm-9 -->
      </div><!-- row -->
          
        </div><!-- panel-body -->
        
      </div><!-- panel -->
<!-- Modal -->
					<div class="modal fade" id="modalUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Upload</h4>
					        
					      </div>
					      
					      <script>
					      function showname () {
					          var name = document.getElementById('requirementfile'); 
					          document.getElementById('filereqname').value= name.files.item(0).name;
					        };
					      </script>
					      
					      <form id="upload-form" action="uploadServlet" method="post" enctype="multipart/form-data">
					      <div class="modal-body"><br>
					      <input type="text" class="form-control mytextbox"  id="c_id"  name="c_id" value="<%out.print(rs.getInt("c_id")); %>"  style="display:none;" />
								<div class="form-group myfg">
								<label class="control-label col-sm-4 mylabel myleftlabel" align="left">Choose file to upload</label>
								<div class="col-sm-6">
				                   <input type="file" class="form-control"  id="requirementfile"  name="requirementfile" onchange="showname()" />
				                   <input type="text" class="form-control"  id="filereqname"  name="filereqname" style="display:none;"/>
				                  </div>
					                </div>
								<div class="form-group myfg">
								<label class="control-label col-sm-4 mylabel myleftlabel" align="left">File Description</label>
								<div class="col-sm-6">
				                   <input type="text" class="form-control"  id="filedesc"  name="filedesc"/>
				                  </div>
					                </div>
					      </div><br>
					      <div class="modal-footer myfooter">
					        <button type="button" class="btn btn-default mymodalbtn" data-dismiss="modal">Close</button>
					        <button type="submit"  class="btn btn-primary mymodalbtn" id="btnUpload">Upload</button>
					        <style>
							.mymodalbtn
							{
								padding:5px 10px;
								font-size: 90%;
								
							}
							.myleftlabel
							{
								margin-left:30px;
								margin-right:10px;
								margin-bottom:0px important;
								margin-top:0px important;
								padding:4px;
							}
							.myrightlabel
							{
								padding-top:5px;
							}
							</style>
					      </div>
					      </form>
					    </div><!-- modal-content -->
					  </div><!-- modal-dialog -->
					</div><!-- modal -->   
					   
<%
				}
				rs.close();
            stmt.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				%>  
</div>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>
<script src="js/jquery.cookies.js"></script>

<script src="js/jquery.gritter.min.js"></script>
<script src="js/jquery.datatables.min.js"></script>
<script src="js/select2.min.js"></script>

<script src="js/custom.js"></script>
<script>
  jQuery(document).ready(function() {
    
    "use strict";
    
    jQuery('#table1').dataTable();
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
    });
    
    // Select2
    jQuery('select').select2({
        minimumResultsForSearch: -1
    });
    
    jQuery('select').removeClass('form-control');
    
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

<script>
			$(document).ready(function (){
				
				var cells = document.getElementsByTagName("span");
					for (var i = 0; i < cells.length; i++) {
					    if (cells[i].innerHTML == "Completed Medical") {
					        cells[i].style.backgroundColor = "#007E33";
					    }
					    if (cells[i].innerHTML == "Pending") {
					        cells[i].style.display = "none";
					    }
					    if (cells[i].innerHTML == "In good health") {
					        cells[i].style.backgroundColor = "#007E33";
					    }
					    if (cells[i].innerHTML == "In poor health") {
					        cells[i].style.backgroundColor = "#cc0000";
					    }
					}
							});
									
			</script>
<script>
			$(document).ready(function (){
				
				var label = document.getElementsByTagName("label");
					for (var i = 0; i < label.length; i++) {
					    if (label[i].innerHTML == "null") {
					    	label[i].style.display = "none";
					    }
					}
							});
									
			</script>
<script type="text/javascript">
	$(document).ready(function (){
		
	$("#btnUpdateRemarks").click(function() {
			
			var c_id = $('#client_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					c_id:c_id,
					remarks:remarks
					
					
				},
				url:'updateremarks',
				success: function(result){
					swal("Success!", "Remarks Updated!", "success");
					setTimeout(location.reload.bind(location), 3000);
					
				}
			});
		});
		
		$("#btnApprove").click(function() {
			
			var c_id = $('#client_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					c_id:c_id,
					remarks:remarks
					
					
				},
				url:'updatehealthy',
				success: function(result){
					swal("Success!", "Mark as Approved!", "success");
					setTimeout(location.reload.bind(location), 3000);
					
				}
			});
		});
		$("#btnDecline").click(function() {
			
			var c_id = $('#client_id').val();
			var remarks = $('#remarks').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					c_id:c_id,
					remarks:remarks
					
				},
				url:'updateunhealthy',
				success: function(result){
					swal("Success!", "Mark as Declined!", "success");
					setTimeout(location.reload.bind(location), 3000);
					
				}
			});
		});
		
	});
</script>
</body>
</html>
