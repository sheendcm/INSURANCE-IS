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
    <%
			try{ 
				String query5 = " SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id LEFT JOIN r_approval_status_details asd ON asd.as_id=psd.ps_ref_as_id where ms_completion='Completed' and as_completion='Pending'";
				Statement stmt5 = conn.createStatement();
				ResultSet rs5 = stmt5.executeQuery(query5);
				while(rs5.next())
				{
				
			%>
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> UNDERWRITING DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="underwriting-progress-view.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
		<li><a href="underwriting-new-application-form.jsp"><i class="fa fa-plus"></i> <span>Application Form</span></a></li>
        <li class="active"><a href="underwriting-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
        <li><a href="underwriting-policy-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Policy Evaluation</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Policy</span></a>
          <ul class="children">
            <li><a href="underwriting-issued-policy-view.jsp"><i class="fa fa-caret-right"></i> Issued Policy</a></li>
            <li><a href="underwriting-declined-policy-view.jsp"><i class="fa fa-caret-right"></i> Declined Policy</a></li>
          </ul>
        </li>
        <li><a href="underwriting-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
      </ul>

      
    </div><!-- leftpanelinner -->
    <%	}
            rs5.close();
            stmt5.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
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
      <h2><i class="fa fa-check-square-o"></i> With Pending Requirements</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Underwriting Department</a></li>
          <li class="active">With Pending Requirements</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      <div class="panel panel-default">
       <label class="col-sm-4 control-label mylabel" align="right" id="alertUpload" style="display:none;"><%=request.getAttribute("Message")%></label>
       <script>
       var uploadalert = document.getElementById('alertUpload').innerHTML;
       if(uploadalert=='File uploaded!')
       {	
       		swal("Success!", "Successfully uploaded file!", "success")
       		document.getElementById('alertUpload').innerHTML="";
       }
       		
       </script>
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
					.datepicker{ z-index:99999 !important; }
					</style>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="table1" style="font-size:85%;">
            <col width="14%">
            <col width="12%">
            <col width="16%">
            <col width="16%">
            <col width="15%">
  			<col width="12%">
  			<col width="12%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Application Number</th>
                 	<th>Applied Date</th>
                 	<th>Insured</th>
                 	<th>Policyowner</th>
                 	<th>Plan</th>
                 	<th>Status</th>
                 	<th style="display:none;"></th>
                 	<th style="display:none;"></th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_policyowner_details pod on pod.p_id=pd.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_requirements_status_details rsd ON rsd.rs_id=psd.ps_ref_rs_id LEFT JOIN r_requirements_checklist_details rcd ON rcd.rc_ref_rs_id=rsd.rs_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id where ms_completion='Pending' GROUP BY pd.pol_id ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				int rsid= rs.getInt("rs_id");
				int allcountreq=0;
				int countreq=0;
				
				String query2 = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_policyowner_details pod on pod.p_id=pd.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_requirements_status_details rsd ON rsd.rs_id=psd.ps_ref_rs_id LEFT JOIN r_requirements_checklist_details rcd ON rcd.rc_ref_rs_id=rsd.rs_id where rcd.rc_ref_rs_id="+rsid+" ";
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery(query2);
				while(rs2.next())
				{
					allcountreq = rs2.getRow();
				}
				rs2.close();
	            stmt2.close();
	            
	            String query3 = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_policyowner_details pod on pod.p_id=pd.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_requirements_status_details rsd ON rsd.rs_id=psd.ps_ref_rs_id LEFT JOIN r_requirements_checklist_details rcd ON rcd.rc_ref_rs_id=rsd.rs_id where rcd.rc_ref_rs_id="+rsid+" and rcd.rc_status='checked' ";
				Statement stmt3 = conn.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				while(rs3.next())
				{
					countreq = rs3.getRow();
				}
				rs3.close();
	            stmt3.close();
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(rs.getString("af_applicationnumber")); %></td>
                    <td><%out.print(rs.getString("af_dateapplied")); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                    <td><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></td>
                    <td><%out.print(rs.getString("plan_name")); %></td>
                    <td><span class="label label-default myspan"><%out.print(countreq); %>/<%out.print(allcountreq); %></span></td>
                    
                    <td style="display:none;"><%out.print(rs.getInt("ms_id")); %></td>
                    <td style="display:none;"><span class="label label-default myspan"><%out.print(rs.getString("rs_completion")); %></span></td>
                    <td>
					<a class ="btn btn-warning mybtn tooltips" data-placement="top" data-toggle="modal" title="Check Requirements" href="#modalCheckReq<%out.print(rs.getInt("pol_id")); %>" ><i class="glyphicon glyphicon-check"></i></a>
					<a class ="btn btn-info mybtn tooltips" data-placement="top" data-toggle="modal" title="Upload File" href="#modalUpload<%out.print(rs.getInt("pol_id")); %>"><i class="glyphicon glyphicon-arrow-up" ></i></a>
					<a class ="btn btn-success mybtn tooltips btnProceedToMedical" data-placement="top" data-toggle="modal" title="Proceed to Medical" href="#modalProceedToMedical"><i class="fa fa-medkit" ></i></a>
					</td>
					
					<!-- MODAL EDIT REQUIREMENTS -->
            <div class="modal fade" id="modalCheckReq<%out.print(rs.getInt("pol_id")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Check Requirements</h4>
			        
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          <input id="req_id" type="text" class="form-control" name="req_id" value="<%out.print(rsid); %>"
							            style="color: black; display:none; "/>
          <div class="col-md-3"></div>
          <div class="form-group myfg col-md-7"> 
          <% String query4 = "select * from  r_requirements_checklist_details WHERE rc_ref_rs_id ="+rsid+"  ";
				Statement stmt4 = conn.createStatement();
				ResultSet rs4 = stmt4.executeQuery(query4);
				while(rs4.next())
				{
				%>
				<div class="row" style="padding-top:10px;">
		           <div class="ckbox ckbox-default">
			                        <input type="checkbox" value="<%out.print(rsid); %>-<%out.print(rs4.getInt("rc_id")); %>" id="chkreq<%out.print(rs4.getInt("rc_id")); %>" name="chkRequirements" <%out.print(rs4.getString("rc_status")); %> />
			                            <label for="chkreq<%out.print(rs4.getInt("rc_id")); %>" style="font-size:85%; display:inline;"><%out.print(rs4.getString("rc_req")); %></label>
			                          </div>
		          </div>
				<%
				}
				rs4.close();
	            stmt4.close();
	            %>
          
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btnUpdateRequirements" id="<%out.print(rsid); %>">Update changes</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal --> 
			  
			<div class="modal fade" id="modalUpload<%out.print(rs.getInt("pol_id")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			    <form id="upload-form" action="uploadServlet" method="post" enctype="multipart/form-data">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Upload File</h4>
			                    							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-1"></div>
          <div class="form-group myfg col-md-10"> 
          <input id="pol_id" type="text" class="form-control" name="pol_id" value="<%out.print(rs.getInt("pol_id")); %>"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right"><strong>Application Number</strong></label>
                  <div class="col-sm-8">
                    <label class="col-sm-12 control-label mylabel"  align="left"><%out.print(rs.getString("af_applicationnumber")); %></label>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-8">
                    <label class="col-sm-12 control-label mylabel"  align="left"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right"><strong>File to be upload</strong></label>
                  <div class="col-sm-8">
                    <input class="form-control" type="file" name="requirementfile" id="requirementfile" onchange="showname()"/>
                     <input type="text" class="form-control"  id="filereqname"  name="filereqname" style="display:none;"/>
                  </div>
          </div>
           <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right"><strong>File Description</strong></label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control"  id="filedesc"  name="filedesc"/>
                     <input type="text" class="form-control"  id="filetype"  name="filetype" value="Medical" style="display:none;"/>
                  </div>
          </div>
          <script>
					      function showname () {
					          var name = document.getElementById('requirementfile'); 
					          document.getElementById('filereqname').value= name.files.item(0).name;
					        };
					      </script>   
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary" id="btnUploadFile">Upload File</button>
			      </div>
			      </form>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->   
					
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
        
          
        </div><!-- panel-body -->
      </div><!-- panel -->
      
    </div><!-- contentpanel -->
    
     <%	}
            rs1.close();
            stmt1.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
           
<!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalProceedToMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Proceed to Medical Department</h4>
			        <input id="ms_id" type="text" class="form-control" name="ms_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Application Number</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="applicationnumber" align="left"></label>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Requirements Status</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="reqstatus" align="left"></label>
                    <label class="col-sm-12 control-label mylabel" id="rs_completion" align="left" style="display:none;"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnProceedToMedical">Proceed to Medical Department</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->      
    
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
			$(document).ready(function (){
				
				var cells = document.getElementsByTagName("span");
					for (var i = 0; i < cells.length; i++) {
					    if (cells[i].innerHTML == "3/3") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "4/4") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "5/5") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "6/6") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "Completed") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					}
							});
									
			</script> 

<script>
var indexedituser = '';
$('.btnProceedToMedical').click( function() {
	document.getElementById('ms_id').value = "";
	document.getElementById('applicationnumber').innerHTML = "";
	document.getElementById('nameofinsured').innerHTML = "";
	document.getElementById('reqstatus').innerHTML = "";
	document.getElementById('rs_completion').innerHTML = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[9].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
    	  	var ms_id = document.getElementById('table1').rows[indexedituser].cells.item(7).innerHTML
	        document.getElementById('ms_id').value = ms_id;
	        
	        var rs_completion = document.getElementById('table1').rows[indexedituser].cells.item(8).innerHTML
	        document.getElementById('rs_completion').innerHTML = rs_completion;
	        
	        var applicationnumber = document.getElementById('table1').rows[indexedituser].cells.item(1).innerHTML
	        document.getElementById('applicationnumber').innerHTML = applicationnumber;
	        
    	  	var nameofinsured = document.getElementById('table1').rows[indexedituser].cells.item(3).innerHTML
	        document.getElementById('nameofinsured').innerHTML = nameofinsured;
	        
    	  	var reqstatus = document.getElementById('table1').rows[indexedituser].cells.item(6).innerHTML
	        document.getElementById('reqstatus').innerHTML = reqstatus;
	       
      };
      
    }
    
  });   

</script>

<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		
		$('.btnUpdateRequirements').click(function() {
			
			var sud_id = $('#sud_id').val();
			var rsid = this.id;
			var checks = document.getElementsByName('chkRequirements');
			var checkslength = document.getElementsByName('chkRequirements').length;
	
			var chkRequirements='';
			for(i=0; i<checkslength; i++)
			{
				if(checks[i].checked===true){
					var chk1 =checks[i].value;
					var chk2 = chk1.toString().split("-")[0];
					var chk3 = chk1.toString().split("-")[1];
					if(rsid==chk2) 
					{
						chkRequirements+= chk3+":";
					}
				}
			}
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					chkRequirements:chkRequirements,
					rsid:rsid
					
				},
				url:'updatereq',
				success: function(result){
					
					swal("Success!", "Successfully Updated!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
			
		});
		
		$("#btnProceedToMedical").click(function() {
			
			var sud_id = $('#sud_id').val();
			var ms_id = $('#ms_id').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					ms_id:ms_id
					
				},
				url:'proceedtomedical',
				success: function(result){
					
					swal("Success!", "Successfully proceeded in medical!", "success");
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
