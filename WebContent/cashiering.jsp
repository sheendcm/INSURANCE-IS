<%@page import="java.sql.*"%>
<%@page import="db.Conn" %>
<%@page import="java.sql.DriverManager" %>
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
    <div class="headerbar">
       
      
      <div class="header-right">
        <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
                Raven Labayen
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
      <h2><i class="fa fa-medkit"></i>Cashiering </h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li class="active">Cashiering</li>
        </ol>
      </div>
    </div>
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
  			<col width="16%">
  			<col width="10%">
              <thead>
                 <tr>
                 <th style="display:none;"></th>
                    <th>Date of Payment</th>
                    <th>Policyowner</th>
                    <th>Amount</th>
                    <th>Method of Payment</th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
                 <%
			try{ 
				String query = "SELECT * from payment_details p LEFT JOIN client_details c on p.payment_ref_c_id=c.c_id LEFT JOIN policyowner_details po on c.c_ref_p_id=po.p_id where payment_status='Paid' order by payment_date_of_payment desc ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					String dateindb = rs.getString("payment_date_of_payment");
	    			String modifieddate = dateindb.substring(0, 16);
				%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("payment_id")); %></td>
                    <td><%out.print(modifieddate); %></td>
                    <td><%out.print(rs.getString("p_givenname")); %> <%out.print(rs.getString("p_middlename")); %> <%out.print(rs.getString("p_surname")); %></td>
                    <td><%out.print(rs.getString("payment_amount")); %></td>
                    <td><%out.print(rs.getString("payment_method")); %></td>
                    <td>
					<a class="btn btn-success mybtn" href="#" title="View Payment Info" data-toggle="modal"><i class="glyphicon  glyphicon-eye-open myi"></i></a>
					</td>
					
					
					<!-- Modal -->
					<div class="modal fade" id="modalSendMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Message</h4>
					        <input type="text" class="form-control mytextbox"  id="clientid"  name="clientid" value="" style="display:none;" />
					      </div>
					      <div class="modal-body"><br>
					          <div class="form-group" style="margin-bottom:0px;">
					                  <label class="control-label col-sm-2 mylabel myleftlabel" align="left">Application #</label>
					                  <label class="control-label col-sm-2 mylabel myrightlabel" align="left" id="application_number"></label>
					                  
					                  <label class="control-label col-sm-1 mylabel myleftlabel" align="left">Name </label>
					                  <label class="control-label col-sm-5 mylabel myrightlabel" align="left" id="name"></label>
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
									<textarea name="content" id="content" class="form-control" rows="7">Congratulation! Your application for life insurance is approved. Kindly wait for the further messages on how to pay your bills. You can track your transaction by opening your account using your client number and the password that will be send to your email.</textarea>
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

					

</div>

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

<script>
			$(document).ready(function (){
				
				var cells = document.getElementsByTagName("span");
					for (var i = 0; i < cells.length; i++) {
					    if (cells[i].innerHTML == "Completed Medical") {
					        cells[i].style.backgroundColor = "#007E33";
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

<script type="text/javascript">
	$(document).ready(function (){
		

		$("#btnMedicalcompleted").click(function() {
			
			var c_id = $('#client_id').val();
			
			
			$.ajax({
				type:'POST',
				data:
				{	
					c_id:c_id
					
				},
				url:'updatemedcompleted',
				success: function(result){
					swal("Success!", "Mark as Completed!", "success");
					setTimeout(location.reload.bind(location), 3000);
					
				}
			});
		});
		
	});
</script>
</body>
</html>
