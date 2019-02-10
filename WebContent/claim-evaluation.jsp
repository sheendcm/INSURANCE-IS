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
  <link rel="stylesheet" href="css/bootstrap-timepicker.min.css" />
  

    <!-- Debug -->
    <script src="https://localhost:32123/livereload.js"></script>

    <!-- This is what you need -->
    <script src="./SweetAlert for Bootstrap_files/sweetalert.js.download"></script>
    <link rel="stylesheet" href="./SweetAlert for Bootstrap_files/sweetalert.css">
    
</head>

<body>
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
				String query5 = "SELECT COUNT(cs_id) as countme FROM t_claim_status_details cs LEFT JOIN r_claim_legal_status_details cls ON cls.cls_id=cs.cs_ref_cls_id LEFT JOIN r_claim_approval_status_details cas ON cas.cas_id=cs.cs_ref_cas_id WHERE cls.cls_completion='Completed' AND cas.cas_completion='Pending' ";
				Statement stmt5 = conn.createStatement();
				ResultSet rs5 = stmt5.executeQuery(query5);
				while(rs5.next())
				{
				
			%>
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> CLAIMING DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="claim-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-pencil"></i> <span>Claim Form</span></a>
          <ul class="children">
            <li><a href="claim-death-claim-form.jsp"><i class="fa fa-caret-right"></i> Death Claim</a></li>
            <li><a href="claim-critical-illness-form.jsp"><i class="fa fa-caret-right"></i> Critical Illness</a></li>
            <li><a href="claim-accident-form.jsp"><i class="fa fa-caret-right"></i> Accident Claim</a></li>
          </ul>
        </li>
		<li><a href="claim-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
		<li class="active"><a href="claim-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Claim Evaluation</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Claim</span></a>
          <ul class="children">
            <li><a href="claim-approved-claim-view.jsp"><i class="fa fa-caret-right"></i> Issued Claim</a></li>
            <li><a href="claim-declined-claim-view.jsp"><i class="fa fa-caret-right"></i> Declined Claim</a></li>
          </ul>
        </li>
        <li><a href="claim-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
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
      <h2><i class="fa fa-file-text-o"></i> Claim Evaluation</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Claiming Department</a></li>
          <li class="active">Claim Evaluation</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      
      <div class="panel panel-default">
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
            <table class="table" id="table2" style="font-size:85%;">
            <col width="15%">
            <col width="20%">
            <col width="17%">
            <col width="17%">
            <col width="17%">
            <col width="15%">
            <col width="25%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Policy Number</th>
                 	<th>Date Proceeded to Legal</th>
                 	<th>Insured</th>
                 	<th>Type of Claim</th>
                 	<th>Status</th>
                 	<th style="display:none;"></th>
                 	<th style="display:none;"></th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM t_claiming_details c LEFT JOIN r_death_claim_details dc ON dc.dc_id=c.c_ref_dc_id LEFT JOIN r_critical_illness_details ci ON ci.ci_id=c.c_ref_ci_id LEFT JOIN r_accident_details a ON a.a_id=c.c_ref_a_id LEFT JOIN t_policy_details p ON p.pol_id=dc.dc_ref_pol_id or p.pol_id=ci.ci_ref_pol_id or p.pol_id=a.a_ref_pol_id LEFT JOIN t_claim_status_details cs  ON cs.cs_ref_c_id=c.c_id LEFT JOIN r_claim_legal_status_details cls  ON cls.cls_id=cs.cs_ref_cls_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=p.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_claim_approval_status_details cas ON cas.cas_id=cs.cs_ref_cas_id WHERE cls.cls_completion='In Legal Department' GROUP BY p.pol_id  ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
				String dateindb = rs.getString("cls_dateproceededinlegal");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(10, 16);
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("c_id")); %></td>
                    <td>0000<%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(modifieddate); %>&nbsp;&nbsp;&nbsp;<%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                   <td><%out.print(rs.getString("c_typeofclaim")); %></td>
                   <td><span class="label label-default myspan"><%out.print(rs.getString("cls_completion")); %></span></td>
                    <td style="display:none;"><%out.print(rs.getString("cls_remarks")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("cas_id")); %></td>
                    
					
					
			  
			
					
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
      
      <div class="panel panel-default">
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
            <col width="15%">
            <col width="20%">
            <col width="17%">
            <col width="17%">
            <col width="17%">
            <col width="15%">
            <col width="25%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Policy Number</th>
                 	<th>Date Completed Legal</th>
                 	<th>Insured</th>
                 	<th>Type of Claim</th>
                 	<th>Status</th>
                 	<th style="display:none;"></th>
                 	<th style="display:none;"></th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM t_claiming_details c LEFT JOIN r_death_claim_details dc ON dc.dc_id=c.c_ref_dc_id LEFT JOIN r_critical_illness_details ci ON ci.ci_id=c.c_ref_ci_id LEFT JOIN r_accident_details a ON a.a_id=c.c_ref_a_id LEFT JOIN t_policy_details p ON p.pol_id=dc.dc_ref_pol_id or p.pol_id=ci.ci_ref_pol_id or p.pol_id=a.a_ref_pol_id LEFT JOIN t_claim_status_details cs  ON cs.cs_ref_c_id=c.c_id LEFT JOIN r_claim_legal_status_details cls  ON cls.cls_id=cs.cs_ref_cls_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=p.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_claim_approval_status_details cas ON cas.cas_id=cs.cs_ref_cas_id WHERE cls.cls_completion='Completed' GROUP BY p.pol_id  ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
				String dateindb = rs.getString("cls_datecompleted");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(10, 16);
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("c_id")); %></td>
                    <td>0000<%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(modifieddate); %>&nbsp;&nbsp;&nbsp;<%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                   <td><%out.print(rs.getString("c_typeofclaim")); %></td>
                   <td><span class="label label-default myspan"><%out.print(rs.getString("cls_status")); %></span></td>
                    <td style="display:none;"><%out.print(rs.getString("cls_remarks")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("cas_id")); %></td>
                    <td>
                       <a class ="btn btn-info mybtn tooltips btnViewRemarks" data-placement="top" data-toggle="modal" title="View Remarks" href="#modalViewRemarks" ><i class="glyphicon glyphicon-eye-open"></i></a>
					<a class ="btn btn-success mybtn tooltips btnViewRemarks" data-placement="top" data-toggle="modal" title="Approve" href="#modalApprovePolicy" ><i class="glyphicon glyphicon-ok"></i></a>
					<a class ="btn btn-danger mybtn tooltips btnViewRemarks" data-placement="top" data-toggle="modal" title="Decline" href="#modalDeclinePolicy" ><i class="glyphicon glyphicon-remove"></i></a>
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
        
          
        </div><!-- panel-body -->
      </div><!-- panel -->
      
      
      
    </div><!-- contentpanel -->
      <%
                  }
            rs1.close();
            stmt1.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
<!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalViewRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Date Completed Medical</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="modifieddate" align="left"></label>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Status</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msstatus" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Remarks</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msremarks" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div><!-- modal-content -->
        </div><!-- modal-dialog -->
      </div><!-- modal -->   

      <!-- modal remarks -->



       <div class="modal fade" id="modalApprovePolicy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Approve Policy</h4>
			        <input id="asid" type="text" class="form-control" name="asid"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
					<input id="modeofpayment" type="text" class="form-control" name="modeofpayment"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
					<input id="annualizedpremium" type="text" class="form-control" name="annualizedpremium"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>	
					<input id="polid" type="text" class="form-control" name="polid"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>		            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Date Completed Legal</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="modifieddate" align="left"></label>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Status</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msstatus" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Legal Remarks</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msremarks" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnApprovePolicy">Approve</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->                
  
  <div class="modal fade" id="modalDeclinePolicy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Decline Policy</h4>
			        <input id="asid1" type="text" class="form-control" name="asid1"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Date Completed Legal</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="modifieddate1" align="left"></label>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured1" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Status</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msstatus1" align="left"></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Legal Remarks</strong></label>
                  <div class="col-sm-6">
                    <label class="col-sm-12 control-label mylabel" id="msremarks1" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnDeclinePolicy">Decline</button>
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
					    if (cells[i].innerHTML == "Approved in Legal") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "Declined in Legal") {
					        cells[i].style.backgroundColor = "#d9534f";
					    }
					}
							});
									
			</script> 
<script>
var indexedituser = '';
$('.btnViewRemarks').click( function() {

	document.getElementById('nameofinsured').innerHTML = "";
	document.getElementById('modifieddate').innerHTML = "";
	document.getElementById('msremarks').innerHTML = "";
	document.getElementById('msstatus').innerHTML = "";
	document.getElementById('nameofinsured1').innerHTML = "";
	document.getElementById('modifieddate1').innerHTML = "";
	document.getElementById('msremarks1').innerHTML = "";
	document.getElementById('msstatus1').innerHTML = "";
	document.getElementById('asid').value = "";
	document.getElementById('asid1').value = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[8].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
	        
	        var modifieddate = document.getElementById('table1').rows[indexedituser].cells.item(1).innerHTML
	        document.getElementById('modifieddate').innerHTML = modifieddate;
	        document.getElementById('modifieddate1').innerHTML = modifieddate;
	        
    	  	var nameofinsured = document.getElementById('table1').rows[indexedituser].cells.item(2).innerHTML
	        document.getElementById('nameofinsured').innerHTML = nameofinsured;
	        document.getElementById('nameofinsured1').innerHTML = nameofinsured;
	        
	        var msstatus = document.getElementById('table1').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('msstatus').innerHTML = msstatus;
	        document.getElementById('msstatus1').innerHTML = msstatus;
	        
    	  	var msremarks = document.getElementById('table1').rows[indexedituser].cells.item(5).innerHTML
	        document.getElementById('msremarks').innerHTML = msremarks;
	        document.getElementById('msremarks1').innerHTML = msremarks;
	        
	        var asid = document.getElementById('table1').rows[indexedituser].cells.item(6).innerHTML
	        document.getElementById('asid').value = asid;
	        document.getElementById('asid1').value = asid;
	        
	       
      };
      
    }
    
  });   

</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		
		$("#btnApprovePolicy").click(function() {
			
			var sud_id = $('#sud_id').val();
			var asid = $('#asid').val();
			var modeofpayment = $('#modeofpayment').val();
			var annualizedpremium = $('#annualizedpremium').val();
			var polid = $('#polid').val();
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					asid:asid
					
				},
				url:'approveclaim',
				success: function(result){
					
					swal("Success!", "Successfully approved policy!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		$("#btnDeclinePolicy").click(function() {
			
			var sud_id = $('#sud_id').val();
			var asid1 = $('#asid1').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					asid1:asid1
					
				},
				url:'declineclaim',
				success: function(result){
					
					swal("Success!", "Successfully declined policy!", "success");
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
