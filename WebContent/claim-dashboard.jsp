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
  <script src = "jquery/jquery.min.js"></script>
	<script src = "highcharts/highcharts.js"></script>

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
        <li class="active"><a href="claim-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-pencil"></i> <span>Claim Form</span></a>
          <ul class="children">
            <li><a href="claim-death-claim-form.jsp"><i class="fa fa-caret-right"></i> Death Claim</a></li>
            <li><a href="claim-critical-illness-form.jsp"><i class="fa fa-caret-right"></i> Critical Illness</a></li>
            <li><a href="claim-accident-form.jsp"><i class="fa fa-caret-right"></i> Accident Claim</a></li>
          </ul>
        </li>
		<li><a href="claim-with-pending-requirements-view.jsp"><i class="fa fa-check-square-o"></i> <span>With Pending Requirements</span></a></li>
		<li><a href="claim-evaluation.jsp"><span class="pull-right badge badge-success" style="background-color:#d1423e; color:white;"><%out.print(rs5.getInt("countme")); %></span><i class="fa fa-file-text-o"></i> <span>Claim Evaluation</span></a></li>
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
      <h2><i class="fa fa-home"></i> Dashboard</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Claiming Department</a></li>
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
      
      <script type="text/JavaScript">
            $(document).ready(function(){
               var options ={
                  chart: {
                     renderTo: 'container',
                     type: 'bar'
                  },
                  series: [{}]
               };

               $.getJSON('data.php', function(data){
                  options.series[0].data = data;
                  var chart = new Hightcharts.Chart(options);
               });

            });
         </script>
         
         

   <script language = "JavaScript">
      $(function () { 
    var myChart = Highcharts.chart('container1', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Claiming Report'
        },
        xAxis: {
            categories: ['Death Claim', 'Critical Illness', 'Accidental']
        },
        yAxis: {
            title: {
                text: 'Claims'
            }
        },
        series: [{
            name: '# of claim',
            data: [ <%
			try{ 
				String query7 = "SELECT COUNT(c_id) as countme FROM t_claiming_details where c_typeofclaim ='Death Claim' ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%>, <%
			try{ 
				String query7 = "SELECT COUNT(c_id) as countme FROM t_claiming_details where c_typeofclaim ='Critical Illness' ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%>, <%
			try{ 
				String query7 = "SELECT COUNT(c_id) as countme FROM t_claiming_details where c_typeofclaim ='Accident' ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%>]
        }]
    });
});

      var chart1; // globally available
$(function() {
       chart1 = Highcharts.stockChart('container1', {
         rangeSelector: {
            selected: 1
         },
         series: [{
            name: 'USD to EUR',
            data: usdtoeur // predefined JavaScript array
         }]
      });
   });
   </script> 
   <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-sm-3">
       <div class="panel panel-success panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-user.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">Approved Application</small>
                    <h1><%
			try{ 
				String query7 = "SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details ps  ON ps.ps_ref_pol_id=pd.pol_id LEFT JOIN r_approval_status_details asd ON asd.as_id=ps.ps_ref_as_id where asd.as_status='Issued' ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <div class="row">
                  <div class="col-xs-6">
                  </div>

                  <div class="col-xs-6">
                    <small class="stat-label">% Percentage</small>
                    <h4>-%</h4>
                  </div>
                </div><!-- row -->
              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
          <div class="panel panel-danger panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-user.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">Declined Application</small>
                    <h1><%
			try{ 
				String query7 = "SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details ps  ON ps.ps_ref_pol_id=pd.pol_id LEFT JOIN r_approval_status_details asd ON asd.as_id=ps.ps_ref_as_id where asd.as_status='Declined' ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <div class="row">
                  <div class="col-xs-6">
                  </div>

                  <div class="col-xs-6">
                    <small class="stat-label">% Percentage</small>
                    <h4>-%</h4>
                  </div>
                </div><!-- row -->
              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
          <div class="panel panel-primary panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label"># of all application</small>
                    <h1><%
			try{ 
				String query7 = "SELECT COUNT(pol_id) as countme FROM t_policy_details pd LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id LEFT JOIN t_policy_status_details ps  ON ps.ps_ref_pol_id=pd.pol_id LEFT JOIN r_approval_status_details asd ON asd.as_id=ps.ps_ref_as_id ";
				Statement stmt7 = conn.createStatement();
				ResultSet rs7 = stmt7.executeQuery(query7);
				while(rs7.next())
				{
					out.print(rs7.getInt("countme"));
				}
            rs7.close();
            stmt7.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				
			%></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                <small class="stat-label">% Percentage</small>
                <h4>-%</h4>

              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div>  
        <div class="col-sm-9">
        <div id="container1" style="width:100%; height:400px;"></div></div>  
          
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
