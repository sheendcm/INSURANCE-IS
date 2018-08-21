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
 <title>Application with Pending Requirement</title>

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
        <li class="nav-parent nav-active active"><a href="" style="background-color: #DB241E;"><i class="fa fa-list-alt"></i> <span>List of Application</span></a>
          <ul class="children" style="display: block">
            <li class="active"><a href="application-form-view.jsp" style="color: #DB241E;"><i class="fa fa-caret-right"></i> Pending Application</a></li>
            <li><a href="issued-application.jsp"><i class="fa fa-caret-right"></i> Issued</a></li>
            <li><a href="declined-application.jsp"><i class="fa fa-caret-right"></i> Declined</a></li>
          </ul>
        </li>
        <li><a href="upload-requirements.jsp"><i class="fa fa-edit"></i> <span>Profile</span></a></li>
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
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">WITH PENDING REQUIREMENTS</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30" id="pendingapplication">
           <col width="80">
  			<col width="100">
  			<col width="200">
  			<col width="200">
  			<col width="80">
  			<col width="100">
            <thead>
              <tr>
              	<th style="display:none;"></th>
                <th>Application Number</th>
                <th>Date Applied</th>
                <th>Name</th>
                <th>Plan Name</th>
                <th>Status</th>
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
				String query = "SELECT c.c_id as cid, af.af_applicationnumber ApplicationNumber,af.af_dateapplied as Date, CONCAT (p.p_givenname,' ',p.p_middlename,' ',p.p_surname) as Name, pi.pi_planname as PlanName, ar_req1+ar_req2+ar_req3+ar_req4+ar_req5 as sum, ar.ar_req1 as Req1, ar.ar_req2 as Req2, ar.ar_req3 as Req3, ar.ar_req4 as Req4, ar.ar_req5 as Req5 FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN r_application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id=sb.sb_id LEFT JOIN r_policy_information_details pi ON c.c_ref_pi_id=pi.pi_id where astat.as_status='Pending'";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>
			<script>
			$(document).ready(function (){
				<%-- var req= <%out.print(rs.getString("sum")); %>;
				if (req==5)
				$('#btnCompleted').attr('disabled',false);
				else $('#btnCompleted').attr('disabled',true); --%>
				
				var cells = document.getElementsByTagName("td");
					for (var i = 0; i < cells.length; i++) {
					    if (cells[i].innerHTML == "5/5") {
					        cells[i].style.color = "green";
					    }
					}
							});
			</script>
 
              <tr>
                <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                <td><%out.print(rs.getString("ApplicationNumber")); %></td>
                <td><%out.print(rs.getString("Date")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td id="reqstat" style="color:#db241e"><%out.print(rs.getString("sum")); %>/5</td>
                <td style="display:none;"><%out.print(rs.getString("Req1")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Req2")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Req3")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Req4")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Req5")); %></td>
                <td>
                <a title="Requirements Checklist" class="btn btn-warning btnCheckStatus" href="#modalCheckStatus" data-toggle="modal" style="padding: 4px 7px;">
                        <i class="glyphicon glyphicon-pencil"></i>
                    </a>
                <button title="Proceed in Medical Department" class="btn btn-success btnCheckStatus" href="#modalCompleted" data-toggle="modal" style="padding: 4px 7px;" id="btnCompleted">
                        <i class="glyphicon glyphicon-ok"></i>
                    </button>
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
          </div><!-- panel -->  
     <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#db241e; height:60px; padding:20px;">
              <h4 class="panel-title" align="center" style="font-size:90%; color:white;">IN MEDICAL DEPARTMENT</h4>
            </div>
			<div class="panel-body">
			<div class="row" style="padding-right:20px; padding-left:20px; padding-top:25px;">
              <div class="table-responsive">
          <table class="table table-bordered mb30" id="medicalcompleted">
          <col width="100">
  			<col width="200">
  			<col width="150">
  			<col width="100">
  			<col width="120">
            <thead>
              <tr>
              	<th style="display:none;"></th>
                <th>Application Number</th>
                <th>Name</th>
                <th>Plan Name</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
			try{ 
				String query = "SELECT c.c_id as cid, af.af_applicationnumber ApplicationNumber, CONCAT (p.p_givenname,' ',p.p_middlename,' ',p.p_surname) as Name, pi.pi_planname as PlanName, ms.ms_status as Status, ms.ms_remarks as Remarks FROM r_application_requirements_details ar LEFT JOIN r_client_details c ON ar.ar_ref_c_id=c.c_id LEFT JOIN r_application_status_details astat on astat.as_ref_c_id=c.c_id LEFT JOIN r_medical_status_details ms ON ms.ms_ref_c_id= c.c_id LEFT JOIN r_application_form_details af ON c.c_ref_af_id=af.af_id LEFT JOIN r_agent_information_details ai ON c.c_ref_ai_id=ai.ai_id LEFT JOIN r_life_insured_details li ON c.c_ref_li_id=li.li_id LEFT JOIN r_policyowner_details p ON c.c_ref_p_id=p.p_id LEFT JOIN r_beneficial_owner_details bo ON c.c_ref_bo_id=bo.bo_id LEFT JOIN r_primary_beneficiary_details pb ON c.c_ref_pb_id=pb.pb_id LEFT JOIN r_secondary_beneficiary_details sb ON c.c_ref_sb_id=sb.sb_id LEFT JOIN r_policy_information_details pi ON c.c_ref_pi_id=pi.pi_id where astat.as_status='Medical Completed' or astat.as_status='In Medical Department'";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
			%>

              <tr>
                <td style="display:none;"><%out.print(rs.getInt("cid")); %></td>
                <td><%out.print(rs.getString("ApplicationNumber")); %></td>
                <td><%out.print(rs.getString("Name")); %></td>
                <td><%out.print(rs.getString("PlanName")); %></td>
                <td id="reqstat" style="color:"><%out.print(rs.getString("Status")); %></td>
                <td style="display:none;"><%out.print(rs.getString("Remarks")); %></td>
                <td>
                <button title="View Remarks" class="btn btn-info btnChangeStatus" href="#modalRemarks" data-toggle="modal" style="padding: 4px 7px;"  >
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </button>
                    <button title="Approve Application" class="btn btn-success btnChangeStatus" href="#modalIssue" data-toggle="modal" style="padding: 4px 7px;"  >
                        <i class="glyphicon glyphicon-ok"></i>
                    </button>
                <button title="Decline Application" class="btn btn-danger btnChangeStatus" href="#modalDecline" data-toggle="modal" style="padding: 4px 7px;" >
                        <i class="glyphicon glyphicon-remove"></i>
                    </button>
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
          </div><!-- panel -->        
      </div><!-- row -->

    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
</section>
<!-- MODALS-->
       <div class="modal fade bs-example-modal-static" id="modalCheckStatus" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" style=" width:500px;">
				        <div class="modal-header" style="background-color:#db241e; height:50px;">
				            <button aria-hidden="true" data-dismiss="modal" style="margin:0px" class="close" type="button">&times;</button>
				            <h4 class="modal-title" style="font-size:15px;color:white;">Requirements Checklist</h4>
				            <input id="reqstatus_id" type="text" class="form-control" name="reqstatus_id"
				            style="color: black; width: 560px; display:none" maxlength="50"/>
				        </div>
				        <div class="modal-body">
				         <div class="row">
				         <div class="col-sm-3"></div>
				         <div class="col-sm-6">
				         <br><br>
				         <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="0" id="req_1"/>
                            <label for="req_1" style="font-size:85%;">Requirement 1</label>
                 		</div>
                 		 <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="0" id="req_2"/>
                            <label for="req_2" style="font-size:85%;">Requirement 2</label>
                 		</div>
                 		 <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="0" id="req_3"/>
                            <label for="req_3" style="font-size:85%;">Requirement 3</label>
                 		</div>
                 		 <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="0" id="req_4"/>
                            <label for="req_4" style="font-size:85%;">Requirement 4</label>
                 		</div>
                 		 <div class="ckbox ckbox-primary">
                        <input type="checkbox" value="0" id="req_5"/>
                            <label for="req_5" style="font-size:85%;">Requirement 5</label>
                 		</div>
				        
				         </div>
				         <div class="col-sm-3"></div>
				          
				        
				        </div>
				    </div>
				    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
        <button type="button" class="btn btn-primary" id="btnUpdateReqStatus" style ="font-size:11px">Save changes</button>
      </div>
		</div>
		</div>
		</div><!--eND MODALS COMPLETED REQUIEREMENTS-->
		<!-- MODALS COMPLETED REQUIEREMENTS-->
            <div class="modal fade" id="modalCompleted" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style=" width:500px;">
      <div class="modal-header" style="background-color:#db241e; height:50px;">
        <button type="button" class="close" data-dismiss="modal"  style="margin:0px" aria-hidden="true">&times;</button>
        <input id="reqstatus_id1" type="text" class="form-control" name="reqstatus_id1"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
      </div>
      <div class="modal-body">
      <div class="row"><br><br>
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
      <label for="req_5" style="font-size:105%;">Proceed in Medical Department</label>
      </div>
      <div class="col-sm-2"></div><br>
      </div><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
        <button type="button" class="btn btn-primary" id="btnStatusInMed" style ="font-size:11px">Save changes</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->
<!-- MODALS CHANGE STATUS -->
            <div class="modal fade" id="modalRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style=" width:500px;">
      <div class="modal-header" style="background-color:#db241e; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="font-size:15px;color:white;">Remarks</h4>
        <input id="remark_id" type="text" class="form-control" name="remark_id"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
      </div>
      <div class="modal-body">
      <div class="row"><br><br>
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
      <label style="font-size:105%;" id=remarks_1>Proceed in Medical Department</label>
      </div>
      <div class="col-sm-2"></div><br>
      </div><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->
<!-- MODALS CHANGE STATUS -->
            <div class="modal fade" id="modalIssue" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style=" width:500px;">
      <div class="modal-header" style="background-color:#db241e; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px"  aria-hidden="true">&times;</button>
        <input id="issue_id" type="text" class="form-control" name="issue_id"
				            style="color: black; width: 560px; display:none; " maxlength="50"/>
      </div>
      <div class="modal-body">
      <div class="row"><br><br>
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
      <label style="font-size:105%;">Approve Application</label>
      </div>
      <div class="col-sm-2"></div><br>
      </div><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
        <button type="button" class="btn btn-primary" id="btnIssue" style ="font-size:11px">Save changes</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->

<!-- MODALS CHANGE STATUS -->
            <div class="modal fade" id="modalDecline" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style=" width:500px;">
      <div class="modal-header" style="background-color:#db241e; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
        <input id="decline_id" type="text" class="form-control" name="decline_id"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
      </div>
      <div class="modal-body">
      <div class="row"><br><br>
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
      <label style="font-size:105%;">Decline Application</label>
      </div>
      <div class="col-sm-2"></div><br>
      </div><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style ="font-size:11px">Close</button>
        <button type="button" class="btn btn-primary" id="btnDecline" style ="font-size:11px">Save changes</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->
<script>
var indexedituser = '';
$('.btnCheckStatus').click( function() {
	document.getElementById("req_1").checked = false;
	document.getElementById("req_2").checked = false;
	document.getElementById("req_3").checked = false;
	document.getElementById("req_4").checked = false;
	document.getElementById("req_5").checked = false;
	
    var table = document.getElementById('pendingapplication'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[11].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var reqstatusid = document.getElementById('pendingapplication').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('reqstatus_id').value = reqstatusid;
	        var reqstatusid1 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('reqstatus_id1').value = reqstatusid1;
	        var req1 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(6).innerHTML
	        if (req1==1)
	        document.getElementById("req_1").checked = true;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var req2 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(7).innerHTML
	        if (req2==1)
	        document.getElementById("req_2").checked = true;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var req3 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(8).innerHTML
	        if (req3==1)
	        document.getElementById("req_3").checked = true;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var req4 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(9).innerHTML
	        if (req4==1)
	        document.getElementById("req_4").checked = true;
    	  	indexedituser = this.parentElement.rowIndex;
    	  	var req5 = document.getElementById('pendingapplication').rows[indexedituser].cells.item(10).innerHTML
	        if (req5==1)
	        document.getElementById("req_5").checked = true;
    	  	indexedituser = this.parentElement.rowIndex;
	       
      };
      
    }
    
  }); 
  

</script>
<script>
var indexedituser = '';
$('.btnChangeStatus').click( function() {
    var table2 = document.getElementById('medicalcompleted'); 
    for(var i = 1; i < table2.rows.length; i++)
    {
      table2.rows[i].cells[6].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	var issue_id = document.getElementById('medicalcompleted').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('issue_id').value = issue_id;
	        var decline_id = document.getElementById('medicalcompleted').rows[indexedituser].cells.item(0).innerHTML
	        document.getElementById('decline_id').value = decline_id;
	        var remarks = document.getElementById('medicalcompleted').rows[indexedituser].cells.item(5).innerHTML
	        document.getElementById('remarks_1').innerHTML = "Remarks: "+remarks;
    	  	indexedituser = this.parentElement.rowIndex;
	       
      };
      
    }
    
  }); 
  

</script>
 		
              <script type="text/javascript">
					var stat = out.print(rs.getString("sum"));
					if (stat ==5)
					document.getElementById("btnCompleted").disabled = false;
					</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		$("#btnUpdateReqStatus").click(function() {
			
			var reqstatus_id = $('#reqstatus_id').val();
			
			if($('#req_1').is(':checked'))
			var req_1 = 1
			else var req_1 = 0
			if($('#req_2').is(':checked'))
			var req_2 = 1
			else var req_2 = 0
			if($('#req_3').is(':checked'))
			var req_3 = 1
			else var req_3 = 0
			if($('#req_4').is(':checked'))
			var req_4 = 1
			else var req_4 = 0
			if($('#req_5').is(':checked'))
			var req_5 = 1
			else var req_5 = 0
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					reqstatus_id:reqstatus_id,
					req_1:req_1,
					req_2:req_2,
					req_3:req_3,
					req_4:req_4,
					req_5:req_5
					
				},
				url:'updatereqstatus',
				success: function(result){
					setTimeout(location.reload.bind(location), 1000);
					
				}
			});
		});
		
				$("#btnStatusInMed").click(function() {
			
			var reqstatus_id = $('#reqstatus_id').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					reqstatus_id:reqstatus_id
					
				},
				url:'updatestatusinmed',
				success: function(result){
					setTimeout(location.reload.bind(location), 1000);
					
				}
			});
		});
		$("#btnIssue").click(function() {
			
			var issue_id = $('#issue_id').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					issue_id:issue_id
					
				},
				url:'updatestatusissued',
				success: function(result){
					setTimeout(location.reload.bind(location), 1000);
					
				}
			});
		});
		$("#btnDecline").click(function() {
			
			var decline_id = $('#decline_id').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					decline_id:decline_id
					
				},
				url:'updatestatusdeclined',
				success: function(result){
					setTimeout(location.reload.bind(location), 1000);
					
				}
			});
		});
		
	});
</script>			

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
<script src="js/jquery.gritter.min.js"></script>

			
</body>
</html>