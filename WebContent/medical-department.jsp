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
            <table class="table" id="table1" style="font-size:90%;">
            <col width="25%">
            <col width="25%">
            <col width="25%">
            <col width="25%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Date Proceeded in Medical</th>
                 	<th>Insured</th>
                 	<th>Status</th>
                 	<th style="display:none;"></th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "select * from t_policy_details pd LEFT JOIN t_application_form_details afd on afd.af_ref_pol_id=pd.pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN t_policy_status_details psd ON psd.ps_ref_pol_id=pd.pol_id LEFT JOIN r_medical_status_details msd ON msd.ms_id=psd.ps_ref_ms_id where ms_completion='In Medical Department' GROUP BY pd.pol_id  ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
				String dateindb = rs.getString("ms_dateproceededinmedical");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(10, 16);
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(modifieddate); %>&nbsp;&nbsp;&nbsp;<%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                    <td><span class="label label-default myspan"><%out.print(rs.getString("ms_status")); %></span></td>
                    <td style="display:none;"><%out.print(rs.getInt("ms_id")); %></td>
                    <td>
					<a class ="btn btn-info mybtn tooltips" data-placement="top" data-toggle="modal" title="View Medical Info" href="medical-department-view-info.jsp?id=<%out.print(rs.getInt("pol_id")); %>" ><i class="glyphicon glyphicon-eye-open"></i></a>
					<a class ="btn btn-success mybtn tooltips btnCompleteMedical" data-placement="top" data-toggle="modal" title="Mark as Completed" href="#modalCompleteMedical"><i class="fa fa-check" ></i></a>
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
            <div class="modal fade" id="modalCompleteMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
           <label class="col-sm-6 control-label mylabel" align="right"><strong>Date and Time Proceeded in Medical</strong></label>
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
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <a type="button" class="btn btn-primary" id="btnMedicalCompleted">Mark as Completed</a>
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
					    if (cells[i].innerHTML == "In good health") {
					        cells[i].style.backgroundColor = "#1caf9a";
					    }
					    if (cells[i].innerHTML == "In poor health") {
					        cells[i].style.backgroundColor = "#d9534f";
					    }
					}
							});
									
			</script> 
<script>
var indexedituser = '';
$('.btnCompleteMedical').click( function() {

	document.getElementById('nameofinsured').innerHTML = "";
	document.getElementById('modifieddate').innerHTML = "";
	document.getElementById('msstatus').innerHTML = "";
	document.getElementById('ms_id').value = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[5].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
    	  	var ms_id = document.getElementById('table1').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('ms_id').value = ms_id;
	        
	        var modifieddate = document.getElementById('table1').rows[indexedituser].cells.item(1).innerHTML
	        document.getElementById('modifieddate').innerHTML = modifieddate;
	        
    	  	var nameofinsured = document.getElementById('table1').rows[indexedituser].cells.item(2).innerHTML
	        document.getElementById('nameofinsured').innerHTML = nameofinsured;
	        
    	  	var msstatus = document.getElementById('table1').rows[indexedituser].cells.item(3).innerHTML
	        document.getElementById('msstatus').innerHTML = msstatus;
	       
      };
      
    }
    
  });   

</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		$("#btnMedicalCompleted").click(function() {
		
			var ms_id = $('#ms_id').val();
			var sud_id = $('#sud_id').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					ms_id:ms_id
					
				},
				url:'medicalcomplete',
				success: function(result){
					
					swal("Success!", "Successfully mark as Completed!", "success");
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
