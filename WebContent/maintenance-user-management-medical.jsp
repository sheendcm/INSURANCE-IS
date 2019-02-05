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
    
    <div class="logopanel" style="margin-bottom:20px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       <h5 class="sidebartitle" style="padding-left: 15px;"> MAINTENANCE</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
      <li><a href="maintenance-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>s
        <li class="nav-parent nav-active active""><a href=""><i class="fa fa-user"></i> <span>User Management</span></a>
        <ul class="children" style="display: block">
            <li><a href="maintenance-user-management-admin.jsp"><i class="fa fa-caret-right"></i> Admin</a></li>
            <li><a href="maintenance-user-management-agent.jsp"><i class="fa fa-caret-right"></i> Agent</a></li>
            <li><a href="maintenance-user-management-cashier.jsp"><i class="fa fa-caret-right"></i> Cashier</a></li>
            <li><a href="maintenance-user-management-claiming.jsp"><i class="fa fa-caret-right"></i> Claiming</a></li>
            <li><a href="maintenance-user-management-legal.jsp"><i class="fa fa-caret-right"></i> Legal</a></li>
            <li class="active"><a href="maintenance-user-management-medical.jsp"><i class="fa fa-caret-right"></i> Medical</a></li>
            <li><a href="maintenance-user-management-underwriting.jsp"><i class="fa fa-caret-right"></i> Underwriting</a></li>
          </ul>
        </li>
		<li><a href="maintenance-plan.jsp"><i class="glyphicon glyphicon-list-alt"></i> <span>Plan</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-user"></i> <span>Requirements</span></a>
        <ul class="children">
            <li><a href="maintenance-requirements.jsp"><i class="fa fa-caret-right"></i>For Application Approval</a></li>
            <li><a href="maintenance-claiming-requirements.jsp"><i class="fa fa-caret-right"></i> For Claiming Approval</a></li>
          </ul>
        </li>
         <li><a href="maintenance-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
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
      <h2><i class="fa fa-user"></i> Medical Department</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Maintenance</a></li>
          <li><a href="#">Users</a></li>
          <li class="active">Medical Department</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      
      <div class="panel panel-default">
      <div class="panel-heading">
            
            <div class="row">
            
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
            <div class="col-md-12" align="right">
			  	<button class="btn btn-primary mybutton1" href="#modalAddNewUser" data-toggle="modal" > Add new user</button>
                </div>
            </div>
</div>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="table1" style="font-size:90%;">
            <col width="15%">
            <col width="15%">
            <col width="13%">
            <col width="20%">
            <col width="18%">
  			<col width="12%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Appointment Date</th>
                 	<th>Employee Number</th>
                 	<th>Type</th>
                 	<th>Name</th>
                 	<th>Email</th>
                 	<th style="display:none;"></th>
                    <th style="display:none;"></th>
                    <th style="display:none;"></th>
                    <th style="display:none;"></th>
                    <th style="display:none;"></th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM r_system_user_details sud LEFT JOIN r_system_user_personal_details supd ON supd.supd_id=sud.sud_ref_supd_id WHERE sud.sud_department='Medical' ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("sud_id")); %></td>
                    <td><%out.print(rs.getString("supd_appointmentdate")); %></td>
                    <td><%out.print(rs.getString("supd_employeenumber")); %></td>
                    <td><%out.print(rs.getString("sud_usertype")); %></td>
                    <td><%out.print(rs.getString("supd_name")); %></td>
                    <td><%out.print(rs.getString("supd_emailaddress")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("supd_gender")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("supd_civilstatus")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("supd_address")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("supd_telephonenumber")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("supd_mobilenumber")); %></td>
                    <td>
					<a class ="btn btn-warning mybtn tooltips btnEditUser" data-placement="top" data-toggle="modal" title="Edit" href="#modalEditUser" ><i class="glyphicon glyphicon-pencil"></i></a>
					<a class ="btn btn-danger mybtn tooltips" data-placement="top" data-toggle="modal" title="Remove" href="#"><i class="glyphicon glyphicon-trash" ></i></a>
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
<!-- MODAL ADD NEW USER -->
            <div class="modal fade" id="modalAddNewUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#3F729B; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Add new user</h4>
      </div>
      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8">
            <input type="text" name="Added_By" id="Added_By" value="<%out.print(rs1.getString("supd_name")); %>" style="display:none;" />    
           <div class="row">
           <label class="col-sm-4 control-label mylabel" align="right">User Type</label>
                  <div class="col-sm-8" style="padding:0px;">
                    <select class="select1 col-sm-12 mytextbox" id="User_Type" name="User_Type">
                    <option value="" selected>Choose here ...</option>
                            <option value="Manager">Manager</option>
                            <option value="Medical Staff">Medical Staff</option>
                          </select>
                  </div>
          </div>
          <div class="row">
           <label class="col-sm-4 control-label mylabel" align="right">Employee Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_EmployeeNumber" id="User_EmployeeNumber" class="form-control mytextbox" />
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_Name" id="User_Name" class="form-control mytextbox" />
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Appointment Date</label>
                     <div class="input-group col-sm-8" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control datepicker dateselector" placeholder="yyyy-mm-dd" id="User_AppointmentDate">
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Gender</label>
                  <div class="col-sm-8">
                     <div class="form-group myfg">
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="LImale" value="Male" name="User_Gender">
                            <label for="LImale" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="LIfemale" name="User_Gender">
                            <label for="LIfemale" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
                  </div>
          </div>
          <div class="row">
           <label class="col-sm-4 control-label mylabel" align="right">Civil Status</label>
                  <div class="col-sm-8" style="padding:0px;">
                    <select class="select1 col-sm-12 mytextbox" id="User_CivilStatus" name="User_CivilStatus" onchange="li_csother(this)">
                            <option value="" selected>Choose here ...</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                          </select>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Address</label>
                  <div class="col-sm-8">
                    <textarea name="User_Address" id="User_Address" class="form-control mytextbox" rows="3"></textarea>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Email Address</label>
                  <div class="col-sm-8">
                    <input type="email" name="User_EmailAddress" id="User_EmailAddress" class="form-control mytextbox" />
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Telephone Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_TelephoneNumber" id="User_TelephoneNumber" class="form-control mytextbox" />
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Mobile Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_MobileNumber" id="User_MobileNumber" class="form-control mytextbox" />
                  </div>
          </div>      
                </div>
            
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnSubmitUser">Add</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->

<!-- MODAL EDIT USER -->
            <div class="modal fade" id="modalEditUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Edit User</h4>
			        <input id="user_id" type="text" class="form-control" name="user_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
			      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8">
          <div class="row">
           <label class="col-sm-4 control-label mylabel" align="right">User Type</label>
                  <div class="col-sm-8">
                  <input type="text" name="User_Type_Edit" id="User_Type_Edit" class="form-control mytextbox" disabled/>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Employee Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_EmployeeNumber_Edit" id="User_EmployeeNumber_Edit" class="form-control mytextbox" disabled/>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_Name_Edit" id="User_Name_Edit" class="form-control mytextbox" disabled/>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Appointment Date</label>
                     <div class="input-group col-sm-8" style="padding-left: 10px; padding-right: 10px;">
					<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="User_AppointmentDate_Edit" disabled>
					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Gender</label>
                  <div class="col-sm-8">
                     <div class="form-group myfg">
                        <div class="col-sm-8">
                          <div class="rdio rdio-default">
                            <input type="radio" id="LImale_Edit" value="Male" name="User_Gender_Edit" disabled />
                            <label for="LImale_Edit" class="mylabel">Male</label>
                          </div>
                          <div class="rdio rdio-default">
                            <input type="radio" value="Female" id="LIfemale_Edit" name="User_Gender_Edit" disabled />
                            <label for="LIfemale_Edit" class="mylabel">Female</label>
                          </div>
                        </div>
                      </div>
                  </div>
          </div>
					                
          <div class="row">
           <label class="col-sm-4 control-label mylabel" align="right">Civil Status</label>
                  <div class="col-sm-8" style="padding:0px;">
                    <select class="select1 col-sm-12 " id="User_CivilStatus_Edit" name="User_CivilStatus_Edit" onchange="li_csother(this)">
                            <option value="" selected>Choose here ...</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                          </select>
                  </div>
          </div>
          
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Email Address</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_EmailAddress_Edit" id="User_EmailAddress_Edit" class="form-control mytextbox" />
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Address</label>
                  <div class="col-sm-8">
                    <textarea name="User_Address_Edit" id="User_Address_Edit" class="form-control" rows="3" ></textarea>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Telephone Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_TelephoneNumber_Edit" id="User_TelephoneNumber_Edit" class="form-control mytextbox" />
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Mobile Number</label>
                  <div class="col-sm-8">
                    <input type="text" name="User_MobileNumber_Edit" id="User_MobileNumber_Edit" class="form-control mytextbox" />
                  </div>
          </div>      
                </div>
            
          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnEditUser">Update changes</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->    
					      
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
  </div><!-- mainpanel -->
  
  
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
var indexedituser = '';
$('.btnEditUser').click( function() {
	document.getElementById('user_id').value = "";
	document.getElementById('User_EmployeeNumber_Edit').value = "";
	document.getElementById('User_Name_Edit').value = "";
	document.getElementById('User_AppointmentDate_Edit').value = "";
	document.getElementById('LImale_Edit').checked = false;
	document.getElementById('LIfemale_Edit').checked = false;
	document.getElementById('User_Address_Edit').value = "";
	document.getElementById('User_EmailAddress_Edit').value = "";
	document.getElementById('User_TelephoneNumber_Edit').value = "";
	document.getElementById('User_MobileNumber_Edit').value = "";
	document.getElementById('User_Type_Edit').value = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[11].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
    	  	var user_id = document.getElementById('table1').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('user_id').value = user_id;
	        
	        var User_AppointmentDate_Edit = document.getElementById('table1').rows[indexedituser].cells.item(1).innerHTML
	        document.getElementById('User_AppointmentDate_Edit').value = User_AppointmentDate_Edit;
	        
	        var User_EmployeeNumber_Edit = document.getElementById('table1').rows[indexedituser].cells.item(2).innerHTML
	        document.getElementById('User_EmployeeNumber_Edit').value = User_EmployeeNumber_Edit;
	        
	        var User_Type_Edit = document.getElementById('table1').rows[indexedituser].cells.item(3).innerHTML
	        document.getElementById('User_Type_Edit').value = User_Type_Edit;
	        
    	  	var User_Name_Edit = document.getElementById('table1').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('User_Name_Edit').value = User_Name_Edit;
	        
	        var User_EmailAddress_Edit = document.getElementById('table1').rows[indexedituser].cells.item(5).innerHTML
	        document.getElementById('User_EmailAddress_Edit').value = User_EmailAddress_Edit;
	        
	        var User_Gender_Edit = document.getElementById('table1').rows[indexedituser].cells.item(6).innerHTML
	        if(User_Gender_Edit=="Male")document.getElementById('LImale_Edit').checked = true;
	        if(User_Gender_Edit=="Female")document.getElementById('LIfemale_Edit').checked = true;
	        
	        var User_CivilStatus_Edit = document.getElementById('table1').rows[indexedituser].cells.item(7).innerHTML
	        $('#User_CivilStatus_Edit').val(User_CivilStatus_Edit);
	        
    	  	var User_Address_Edit = document.getElementById('table1').rows[indexedituser].cells.item(8).innerHTML
	        $('#User_Address_Edit').val(User_Address_Edit);
	        
	        var User_TelephoneNumber_Edit = document.getElementById('table1').rows[indexedituser].cells.item(9).innerHTML
	        document.getElementById('User_TelephoneNumber_Edit').value = User_TelephoneNumber_Edit;
	        
	        var User_MobileNumber_Edit = document.getElementById('table1').rows[indexedituser].cells.item(10).innerHTML
	        document.getElementById('User_MobileNumber_Edit').value = User_MobileNumber_Edit;
	        
	        
	       
      };
      
    }
    
  });   

</script>

<script type="text/javascript">
	$(document).ready(function (){
		
		
		
	
		
		$("#btnSubmitUser").click(function() {
		
			var User_EmployeeNumber = $('#User_EmployeeNumber').val();    
			var User_Name = $('#User_Name').val();
			var User_Gender = $('input[name=User_Gender]:checked').val();
			var User_CivilStatus = $('#User_CivilStatus').val();
			var User_EmailAddress = $('#User_EmailAddress').val();
			var User_Address = $('#User_Address').val();
			var User_TelephoneNumber = $('#User_TelephoneNumber').val();
			var User_MobileNumber = $('#User_MobileNumber').val();
			
			var User_AppointmentDate = $('#User_AppointmentDate').datepicker("option", "dateFormat", "yy-mm-dd" ).val();
			
			var Added_By = $('#Added_By').val();
			var User_Type = $('#User_Type').val();
			var Department = "Medical";
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					User_EmployeeNumber:User_EmployeeNumber,
					User_Name:User_Name,
					User_AppointmentDate:User_AppointmentDate,
					User_Gender:User_Gender,
					User_CivilStatus:User_CivilStatus,
					User_EmailAddress:User_EmailAddress,
					User_Address:User_Address,
					User_TelephoneNumber:User_TelephoneNumber,
					User_MobileNumber:User_MobileNumber,
					Added_By:Added_By,
					User_Type:User_Type,
					Department:Department
					
				},
				url:'addnewuser',
				success: function(result){
					
					swal("Success!", "You added new user!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		
		
		$("#btnEditUser").click(function() {
		
			var user_id = $('#user_id').val();
			var User_CivilStatus = $('#User_CivilStatus_Edit').val();
			var User_EmailAddress = $('#User_EmailAddress_Edit').val();
			var User_Address = $('#User_Address_Edit').val();
			var User_TelephoneNumber = $('#User_TelephoneNumber_Edit').val();
			var User_MobileNumber = $('#User_MobileNumber_Edit').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					user_id:user_id,
					User_CivilStatus:User_CivilStatus,
					User_EmailAddress:User_EmailAddress,
					User_Address:User_Address,
					User_TelephoneNumber:User_TelephoneNumber,
					User_MobileNumber:User_MobileNumber
					
				},
				url:'edituser',
				success: function(result){
					
					swal("Success!", "Successfully Updated!", "success");
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
