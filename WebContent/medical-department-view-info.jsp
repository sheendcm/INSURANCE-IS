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
<%		int userid=0;
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
       <h5 class="sidebartitle" style="padding-left: 15px;"> MEDICAL DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="medical-department-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="active"><a href="medical-department.jsp"><span class="pull-right badge badge-danger" style="background-color:#d9534f; color:white;">new</span><i class="fa fa-edit"></i> <span>Medical Evaluation</span></a></li>
        
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Completed Medical</span></a>
          <ul class="children">
            <li><a href="medical-department-approved.jsp"><i class="fa fa-caret-right"></i> Approved in Medical</a></li>
            <li><a href="medical-department-declined.jsp"><i class="fa fa-caret-right"></i> Declined in Medical</a></li>
          </ul>
        </li>
      </ul>

      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <%
			try{ 
				String query1 = " SELECT * FROM r_system_user_details sud INNER JOIN r_system_user_personal_details supd on supd.supd_id=sud.sud_ref_supd_id INNER JOIN r_system_user_login_details suld ON suld.suld_id=sud.sud_ref_suld_id where sud.sud_id="+userid+" ";
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
                <%out.print(rs1.getString("supd_name")); %>
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
      <h2><i class="fa fa-edit"></i> Medical Evaluation</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Medical Department</a></li>
          <li class="active">Medical Evaluation</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     <style>
					
					.mylabel
					{
						font-size:90%;
					}
					.mytextbox
					{
						font-size:90%;
						padding:7px 10px;
					}
					.mybtn
					{
						padding:3px 7px;
						font-size:85%;
					}
					</style>
    <%	
      
         	String polid =request.getParameter("id");
			try{ 
				String query = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_non_medical_information_details nmid ON nmid.nmid_id=lid.lid_ref_nmid_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id where ms_completion='In Medical Department' and pd.pol_id="+polid+" GROUP BY pd.pol_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					
				
			%>  
			<style>
			td{
				font-size:90%;
			}
			.mybtn1
			{
				padding:5px 7px;
				font-size:90%;
			}
			</style>
     <div class="panel panel-default">
        <div class="panel-body"><br>
          <div class="row">
        <div class="col-sm-3">
          <div class="profile-header">
            <h2 class="profile-name"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></h2>
            <hr style="margin-top:0px;">
            <input type="text" class="form-control mytextbox"  id="ms_id"  name="ms_id" value="<%out.print(rs.getInt("ms_id")); %>"  style="display:none;" />
            <div class="row" align="left" style="margin-right:1px; margin-left:1px;">
            <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
              <tr>
                <td style="padding:5px;"><strong>Gender</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_gender")); %></td>
              </tr>
              <tr>
               <td style="padding:5px;"><strong>Birthdate</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_birthdate")); %></td>
              </tr>
              <tr>
                <td style="padding:5px;"><strong>Height</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("nmid_height")); %> cm.</td>
              </tr>
              <tr>
                <td style="padding:5px;"><strong>Weight</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("nmid_weight")); %> lbs.</td>
              </tr>
            </tbody>
          </table>
          </div>
            
            </div>
            <hr style="margin:0px; margin-bottom:10px;">
            <div class="profile-location"><strong><i class="fa fa-edit" style="font-size:20px;"></i> Remarks</strong></div>
            <textarea name="remarks" id="remarks" class="form-control" rows="9"><%out.print(rs.getString("ms_remarks")); %></textarea>
            <div class="row" align="right" style="margin-right:5px; margin-top:5px;">
            
            </div>
            <hr style="margin-top:5px; margin-bottom:10px;">
            
            <div class="row" align="right" style="margin-right:1px;">
            
            <a class="btn btn-white mybtn1 btnGetRemarks" id="btnDecline" href="#modalDeclineMedical" data-toggle="modal" ><i class="fa fa-times"></i> Decline</a>
            <!-- medical-department.jsp -->
            
            <a class="btn btn-primary mybtn1 mr5 btnGetRemarks" id="btnApprove" href="#modalApproveMedical" data-toggle="modal"><i class="fa fa-check"></i> Approve</a>
            </div>
          </div><!-- profile-header -->
          
        </div><!-- col-sm-3 -->
          <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard col-sm-9"  style="border-style: solid; border-width: 1px; padding:0px; border-color:#D3D3D3;">
                
                <ul class="nav nav-pills nav-justified ">
                  <li class="active"><a href="#tab1" data-toggle="tab"> Non-Medical Information</a></li>
                  <li><a href="#tab2" data-toggle="tab"> Medical Files</a></li>
                </ul>
                
                <div class="tab-content">
                  <div class="tab-pane active" id="tab1">
                    <div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px; border-color:#D3D3D3;">
                <col width="5%">
	  			<col width="45%">
	  			<col width="20%">
	  			<col width="30%">
                    <thead>
                      <tr>
                        <th style="background-color:#757575;">#</th>
                        <th style="background-color:#757575;">Have the following</th>
                        <th style="background-color:#757575;"></th>
                        <th style="background-color:#757575;">Details</th>
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
                  <div class="tab-pane" id="tab2">
                    <div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px;">
                <col width="5%">
	  			<col width="25%">
	  			<col width="25%">
	  			<col width="20%">
	  			<col width="10%">
                    <thead>
                      <tr>
                        <th style="background-color:#757575;">#</th>
                        <th style="background-color:#757575;">File Name</th>
                        <th style="background-color:#757575;">File Description</th>
                        <th style="background-color:#757575;">Upload Date</th>
                        <th style="background-color:#757575;">Download</th>
                      </tr>
                    </thead>
                    <tbody><%
			try{ 
				String query3 = "select * from r_file_details where f_ref_pol_id="+polid+" and f_type='Medical' ";
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
                        <td><%String dateindb = rs3.getString("f_dateuploaded");
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
                
                
              </div><!-- #basicWizard -->
          
         
          
      </div><!-- row -->
          
        </div><!-- panel-body -->
        
      </div><!-- panel -->
      
      
      <!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalApproveMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Medical Department</h4>
			        <input id="ms_id" type="text" class="form-control" name="ms_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Remarks</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="remarksmodal" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
               <div class="row">
               <div class="col-sm-10">
               <form action="medical-department.jsp" method="post" onsubmit="">
  			        <button type="submit" class="btn btn-primary" id="btnMedicalApprove">Mark as Approved</button>
              </form> 
              </div>
              <div class="col-sm-2">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
             </div>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->  
			
			
        <!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalDeclineMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Medical Department</h4>
			        <input id="ms_id" type="text" class="form-control" name="ms_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Remarks</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="remarksmodal1" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			         <div class="row">
			         <div class="col-sm-10">
               <form action="medical-department.jsp" method="post" onsubmit="">
                <button type="submit" class="btn btn-primary" id="btnMedicalDecline">Mark as Declined</button>
              </form>
                </div>
                <div class="col-sm-2">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
             </div>
			       </div>
            </div>
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
    </div><!-- contentpanel -->cc
    
     <%	}
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
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
    });
    
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
<script>
$('.btnGetRemarks').click( function() {

	document.getElementById('remarksmodal').innerHTML="";
	document.getElementById('remarksmodal1').innerHTML="";
	var remarks = document.getElementById('remarks').value;
	document.getElementById('remarksmodal').innerHTML= remarks;
	document.getElementById('remarksmodal1').innerHTML= remarks;
	
   
    
  });   

</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		$("#btnMedicalApprove").click(function() {
			
			var sud_id = $('#sud_id').val();
			var ms_id = $('#ms_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					ms_id:ms_id,
					remarks:remarks
					
				},
				url:'medicalapprove',
				success: function(result){
					
					swal("Success!", "Successfully mark as Approved!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		$("#btnMedicalDecline").click(function() {
			
			var sud_id = $('#sud_id').val();
			var ms_id = $('#ms_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					ms_id:ms_id,
					remarks:remarks
					
				},
				url:'medicaldecline',
				success: function(result){
					
					swal("Success!", "Successfully mark as Declined!", "success");
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
