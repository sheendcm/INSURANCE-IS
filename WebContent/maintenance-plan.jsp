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
      <li><a href="maintenance-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-user"></i> <span>User Management</span></a>
        <ul class="children">
            <li><a href="maintenance-user-management-admin.jsp"><i class="fa fa-caret-right"></i> Admin</a></li>
            <li><a href="maintenance-user-management-agent.jsp"><i class="fa fa-caret-right"></i> Agent</a></li>
            <li><a href="maintenance-user-management-cashier.jsp"><i class="fa fa-caret-right"></i> Cashier</a></li>
            <li><a href="maintenance-user-management-claiming.jsp"><i class="fa fa-caret-right"></i> Claiming</a></li>
            <li><a href="maintenance-user-management-legal.jsp"><i class="fa fa-caret-right"></i> Legal</a></li>
            <li><a href="maintenance-user-management-medical.jsp"><i class="fa fa-caret-right"></i> Medical</a></li>
            <li><a href="maintenance-user-management-underwriting.jsp"><i class="fa fa-caret-right"></i> Underwriting</a></li>
          </ul>
        </li>
		<li class="active"><a href="maintenance-plan.jsp"><i class="glyphicon glyphicon-list-alt"></i> <span>Plan</span></a></li>
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
      <h2><i class="glyphicon glyphicon-list-alt"></i> Plan</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Maintenance</a></li>
          <li class="active">Plan</li>
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
			  	<button class="btn btn-primary mybutton1" href="#modalAddNewPlan" data-toggle="modal" > Add new plan</button>
                </div>
            </div>
</div>
        <div class="panel-body">
          <div class="table-responsive">
            <table class="table" id="table1" style="font-size:90%;">
            <col width="10%">
            <col width="15%">
            <col width="15%">
            <col width="10%">
  			<col width="12%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Date Added</th>
                 	<th>Plan Name</th>
                 	<th>Description</th>
                 	<th>Period/Duration</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM r_plan_details ORDER BY plan_dateadded DESC ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				String dateindb = rs.getString("plan_dateadded");
    			String modifieddate = dateindb.substring(0, 10);
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("plan_id")); %></td>
                    <td><%out.print(modifieddate); %></td>
                    <td><%out.print(rs.getString("plan_name")); %></td>
                    <td><%out.print(rs.getString("plan_description")); %></td>
                    <td><%out.print(rs.getInt("plan_period")); %> year/s</td>
                    <td>
					<a class ="btn btn-warning mybtn tooltips btnEditPlan" data-placement="top" data-toggle="modal" title="Edit" href="#modalEditPlan" ><i class="glyphicon glyphicon-pencil"></i></a>
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
<!-- MODAL ADD NEW PLAN -->
            <div class="modal fade" id="modalAddNewPlan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#3F729B; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Add new plan</h4>
      </div>
      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8">
            <input type="text" name="Added_By" id="Added_By" value="<%out.print(rs1.getString("supd_name")); %>" style="display:none;" />    
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Plan Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="Plan_Name" id="Plan_Name" class="form-control mytextbox" />
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Plan Description</label>
                  <div class="col-sm-8">
                    <textarea name="Plan_Description" id="Plan_Description" class="form-control mytextbox" rows="3"></textarea>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Period/Year</label>
                  <div class="col-sm-8">
                    <input type="number" name="Plan_Period" id="Plan_Period" class="form-control mytextbox" />
                  </div>
          </div>      
                </div>
            
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnSubmitPlan">Add</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->



<!-- MODAL EDIT PLAN -->
            <div class="modal fade" id="modalEditPlan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Edit Plan</h4>
			        <input id="plan_id" type="text" class="form-control" name="plan_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8">  
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Plan Name</label>
                  <div class="col-sm-8">
                    <input type="text" name="Plan_Name_Edit" id="Plan_Name_Edit" class="form-control mytextbox"/>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Plan Description</label>
                  <div class="col-sm-8">
                    <textarea name="Plan_Description_Edit" id="Plan_Description_Edit" class="form-control mytextbox" rows="3"></textarea>
                  </div>
          </div>
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-4 control-label mylabel" align="right">Period/Year</label>
                  <div class="col-sm-8">
                    <input type="number" name="Plan_Period_Edit" id="Plan_Period_Edit" class="form-control mytextbox" />
                  </div>
          </div>      
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnEditPlan">Update changes</button>
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
$('.btnEditPlan').click( function() {
	document.getElementById('plan_id').value = "";
	document.getElementById('Plan_Name_Edit').value = "";
	document.getElementById('Plan_Description_Edit').innerHTML = "";
	document.getElementById('Plan_Period_Edit').value = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[5].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
    	  	var plan_id = document.getElementById('table1').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('plan_id').value = plan_id;
	        
	        var Plan_Name_Edit = document.getElementById('table1').rows[indexedituser].cells.item(2).innerHTML
	        document.getElementById('Plan_Name_Edit').value = Plan_Name_Edit;
	        
    	  	var Plan_Description_Edit = document.getElementById('table1').rows[indexedituser].cells.item(3).innerHTML
	        document.getElementById('Plan_Description_Edit').innerHTML = Plan_Description_Edit;
	        
    	  	var Plan_Period_Edit = document.getElementById('table1').rows[indexedituser].cells.item(4).innerHTML
    	  	Plan_Period_Edit = Plan_Period_Edit.slice(0, -7); 
	        document.getElementById('Plan_Period_Edit').value = Plan_Period_Edit;
	       
      };
      
    }
    
  });   

</script>

<script type="text/javascript">
	$(document).ready(function (){
		
		
		
	
		
		$("#btnSubmitPlan").click(function() {
		
			var Plan_Name = $('#Plan_Name').val();    
			var Plan_Description = $('#Plan_Description').val();
			var Plan_Period = $('#Plan_Period').val();
			
			var Added_By = $('#Added_By').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					Plan_Name:Plan_Name,
					Plan_Description:Plan_Description,
					Plan_Period:Plan_Period,
					Added_By:Added_By
					
				},
				url:'addnewplan',
				success: function(result){
					
					swal("Success!", "You added new plan!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		
		
		$("#btnEditPlan").click(function() {
		
			var plan_id = $('#plan_id').val();
			var Plan_Name_Edit = $('#Plan_Name_Edit').val();
			var Plan_Description_Edit = $('#Plan_Description_Edit').val();
			var Plan_Period_Edit = $('#Plan_Period_Edit').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					plan_id:plan_id,
					Plan_Name_Edit:Plan_Name_Edit,
					Plan_Description_Edit:Plan_Description_Edit,
					Plan_Period_Edit:Plan_Period_Edit
					
				},
				url:'editplan',
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
