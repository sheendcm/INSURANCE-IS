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

  <title>La Vie - Insurance</title>

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
<section>
  
  <div class="leftpanel">
    
    <div class="logopanel" style="margin-bottom:50px;">
        <img src="images/lavie-logo.png" class="width100p" alt="" />
    </div><!-- logopanel -->
    
    <div class="leftpanelinner" style="padding: 0px 0px;">
       
      <ul class="nav nav-pills nav-stacked nav-bracket">
       
        <li class="active"><a href="cash-disbursement-dashboard.jsp"><i class="fa fa-plus"></i> <span>Dashboard</span></a></li>
		<li><a href="cash-disbursement-new.jsp"><i class="fa fa-plus"></i> <span>New Claim</span></a></li>
        <li><a href="cash-disbursement-release.jsp"><i class="fa fa-check-square-o"></i> <span>Released Claim</span></a></li>
        <li><a href="cash-disbursement-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a></li>
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
                John Rey Diesta
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
      <h2><i class="fa fa-plus"></i>Dashboard </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Cash Disbursement</a></li>
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      

      <style>
					.mybtn
					{
						padding: 3px 7px;
						background-color:#33b5e5;
						border-color:#33b5e5;
					}
					.mybtn:hover
					{
						padding: 3px 7px;
						background-color:#0099CC;
						border-color:#0099CC;
					}
					.mybtn1
					{
						padding: 2px 6px;
					}
					.mybtn1:hover
					{
						padding: 2px 6px;
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
					.myfg
					{
						padding:0px;
						margin:0px;
						border-style:solid;
						border-width:1px;
						margin-bottom:2px;
					}
					</style>

      
      <div class="panel panel-default">
        <div class="panel-body"><br>
          <div class="table-responsive">
            <table class="table" id="table1">
  			<col width="17%">
  			<col width="20%">
  			<col width="20%">
  			<col width="13%">
  			<col width="13%">
              <thead>
                 <tr>
                 <th style="display:none;"></th>
                    <th>Policy Number</th>
                    <th>Policyowner</th>
                    <th>Type of Claim</th>
                    <th>Send Message</th>
                 </tr>
              </thead>
              <tbody>
                 <%
			try{ 
				String query = "select cf_id, cf_typeofclaim, dcf.dcf_policynumber, cif.cif_policynumber, crd.cr_req1+crd.cr_req2+crd.cr_req3+crd.cr_req4+crd.cr_req5 as claimreq , crd.cr_req1, crd.cr_req2, crd.cr_req3, crd.cr_req4, crd.cr_req5, caf.caf_policynumber, dcf.dcf_policyowner_name, cif.cif_policyowner_name, caf.caf_policyowner_name from claim_form cf left join death_claim_form dcf ON dcf.dcf_id=cf.cf_ref_dcf_id LEFT JOIN critical_illness_form cif ON cif.cif_id=cf.cf_ref_cif_id LEFT JOIN claim_accidental_form caf ON caf.caf_id=cf.cf_ref_caf_id LEFT JOIN claim_requirements_details crd ON crd.cr_ref_cf_id=cf.cf_id LEFT JOIN claim_progress_details cpd on cpd.cp_ref_cf_id=cf.cf_id LEFT JOIN claim_status_details csd ON csd.cs_ref_cf_id = cf.cf_id where cpd.cp_requirements='Completed' AND csd.cs_status='Approved'";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				String policynumber = rs.getString("dcf_policynumber")+rs.getString("cif_policynumber")+rs.getString("caf_policynumber");
				String policynumber1 = policynumber.replaceAll("null","");
				
				String policyowner = rs.getString("dcf_policyowner_name")+rs.getString("cif_policyowner_name")+rs.getString("caf_policyowner_name");
				String policyowner1 = policyowner.replaceAll("null","");
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("cf_id")); %></td>
                    <td><%out.print(policynumber1); %></td>
                    <td><%out.print(policyowner1); %></td>
                    <td><%out.print(rs.getString("cf_typeofclaim")); %></td>
                    <td>
					<a class="btn btn-success mybtn" href="#" title="View Claim Info" data-toggle="modal"><i class="glyphicon  glyphicon-eye-open myi"></i></a>
					
					<a class="btn btn-warning mybtn1" title="Print Official Receipt" href="official-receipt.pdf"><i class="glyphicon glyphicon-print"></i></a>
					</td>
					
					
					<!-- Modal -->
					<div class="modal fade" id="modalSendMessage<%out.print(rs.getInt("cf_id")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Message</h4>
					        <input type="text" class="form-control mytextbox"  id="clientid"  name="clientid" value="<%out.print(rs.getInt("cf_id")); %>" style="display:none;" />
					      </div>
					      <div class="modal-body"><br>
					          <div class="form-group" style="margin-bottom:0px;">
					                  <label class="control-label col-sm-2 mylabel myleftlabel" align="left">Application #</label>
					                  <label class="control-label col-sm-2 mylabel myrightlabel" align="left" id="application_number"><%out.print(rs.getString("dcf_policynumber")); %></label>
					                  
					                  <label class="control-label col-sm-1 mylabel myleftlabel" align="left">Name </label>
					                  <label class="control-label col-sm-5 mylabel myrightlabel" align="left" id="name"><%out.print(rs.getString("dcf_policyowner_name")); %></label>
					                </div>
								<div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Email Address</label>
								<div class="col-sm-8">
				                    <input type="text" name="email" id="email" class="form-control mytextbox" />
				                  </div>
					                </div>
								<div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Subject</label>
								<div class="col-sm-8">
				                    <input type="text" name="subject" id="subject" class="form-control mytextbox" />
				                  </div>
					                </div>
					           <div class="form-group myfg">
								<label class="control-label col-sm-2 mylabel myleftlabel" align="left">Subject</label>
								<div class="col-sm-8">
									<textarea name="content" id="content" class="form-control" rows="7">Congratulation <%out.print(rs.getString("dcf_policyowner_name")); %>! Your application for life insurance is approved. Kindly wait for the further messages on how to pay your bills. You can track your transaction by opening your account using your client number and the password that will be send to your email.</textarea>
								  </div>
					                </div>
					                
					      </div><br>
					      <div class="modal-footer myfooter">
					        <button type="button" class="btn btn-default mymodalbtn" data-dismiss="modal">Close</button>
					        <button type="button"  class="btn btn-primary mymodalbtn" id="btnSendMessage">Send</button>
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
					    </div><!-- modal-content -->
					  </div><!-- modal-dialog -->
					</div><!-- modal -->    
					
					<script>
					$(document).ready(function (){
						
						var cells = document.getElementsByTagName("span");
						var btns = document.getElementsByClassName("btnPostApplication");
							for (var i = 0; i < cells.length; i++) {
							    if (cells[i].innerHTML == "Completed") {
							        cells[i].style.backgroundColor = "#007E33";
							    }
							    }
									});
											
					</script> 
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
 <script type="text/javascript">
	$(document).ready(function (){

		
	
		
		$("#btnSubmitPlan").click(function() {
		
			var plan_name = $('#Plan_Name').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					plan_name:plan_name
					
				},
				url:'addnewplan',
				success: function(result){
					
					swal("Success!", "You added "+plan_name+" !", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		$("#btnUpdatePlan").click(function() {
		
			var Plan_Name_Edit = $('#Plan_Name_Edit').val();Plan_Id_Edit
			var Plan_Id_Edit = $('#Plan_Id_Edit').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					Plan_Name_Edit:Plan_Name_Edit,
					Plan_Id_Edit:Plan_Id_Edit
					
				},
				url:'updateplan',
				success: function(result){
					
					swal("Success!", "Plan is updated!", "success");
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
