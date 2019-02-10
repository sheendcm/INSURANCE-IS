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
       <h5 class="sidebartitle" style="padding-left: 15px;"> POLICYOWNER</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="active"><a href="client-life-insured-view.jsp"><i class="fa fa-home"></i> <span>Plans</span></a>
        </li>
        <li><a href="client-account.jsp"><i class="glyphicon glyphicon-user"></i> <span>Account</span></a></li>
        <li><a href="about-lavie.jsp"><i class="glyphicon glyphicon-book"></i> <span>About</span></a></li>
        <li><a href="faq-lavie.jsp"><i class="glyphicon glyphicon-question-sign"></i> <span>FAQ</span></a></li>
          </ul>
        </li>
      </ul>

      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <%
			try{ 
				String query1 = " SELECT * FROM r_policyowner_details where p_id="+userid+" ";
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				while(rs1.next())
				{
				
			%>
    <%		
				String polid = request.getParameter("id");
    			try{ 
				String query = "SELECT * FROM t_policy_details pd LEFT JOIN r_life_insured_details lid ON lid.lid_id=pd.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_beneficiary_details bd ON bd.b_ref_lid_id=lid.lid_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_plan_details plan ON plan.plan_id=pid.pi_ref_plan_id where pol_id = "+polid+" GROUP by pol_id ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
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
                Welcome! <%out.print(rs1.getString("p_givenname")); %> <%out.print(rs1.getString("p_middlename")); %> <%out.print(rs1.getString("p_surname")); %>
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
      <h2><i class="fa fa-user"></i> Profile</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
          <li><a href="#">Profile</a></li>
          <li class="active"> <%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></li>
        </ol>
      </div>
    </div>
    <div class="contenpanel">
    
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
        <div class="panel-body" style="padding-left:0px; padding-right:0px; padding-top:0px;">
          <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard"  style="border-style: solid; border-width: 1px; padding:0px; border-color:#D3D3D3;">
                
                <ul class="nav nav-pills nav-justified ">
                  <li class="active"><a href="#tab1" data-toggle="tab"> Statement of Account</a></li>
                  <li><a href="#tab2" data-toggle="tab"> Policy Details</a></li>
                  <li><a href="#tab3" data-toggle="tab"> Plan and Benefit</a></li>
                </ul>
                
                <div class="tab-content">
                  <div class="tab-pane active" id="tab1">
                   <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
          </div>
          <h4 class="panel-title" style="font-size:90%;"><br></h4>
        </div>
        <div class="panel-body">
        <%
			try{ 
				String query2 = "SELECT * from t_payment_details where payment_ref_pol_id ="+polid+"  and payment_status='Pending' LIMIT 1";
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery(query2);
				while(rs2.next())
				{
			%>
          <!--   <div class="row" align="right">
        <button class="btn btn-primary" href="#modalAddPayment<%out.print(rs2.getInt("payment_id")); %>" data-toggle="modal" style="margin-right:10px; margin-bottom:10px;"> Add Payment</button>
        </div>-->
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
            
              
              
              <tr>
              
                <td>Amount to pay</td>
                <td><%out.print(rs2.getString("payment_amount")); %>.00</td>
              </tr>
              <tr>
                <td>Due Date</td>
                <td><%out.print(rs2.getString("payment_due_date")); %></td>
              </tr>
              <tr>
                <td>Total</td>
                <td><%out.print(rs2.getString("payment_amount")); %>.00</td>
              </tr>
            <div class="modal fade" id="modalAddPayment<%out.print(rs2.getInt("payment_id")); %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#3F729B; color:white; height:50px;">
        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
        <input id="decline_id" type="text" class="form-control" name="decline_id"
				            style="color: black; width: 560px; display:none;" maxlength="50"/>
				            Add Payment
      </div>
      <div class="modal-body">
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-1"></div>
          <div class="form-group myfg col-md-8">
                  <label class="col-sm-4 control-label mylabel" align="right">Amount</label>
                  <div class="col-sm-8">
                    <input type="text" name="amount" id="amount" value="<%out.print(rs2.getString("payment_amount")); %>.00" class="form-control mytextbox" disabled/>
                     <input type="text" name="paymentid" id="paymentid" value="<%out.print(rs2.getInt("payment_id")); %>" class="form-control mytextbox" style="display:none;" />
                  </div>
                </div>
            
          </div>
          <div class="row" style="padding-top:20px;">
          
          <div class="col-md-1"></div>
          <div class="form-group myfg col-md-8">
                  <label class="col-sm-4 control-label mylabel" align="right">Method of Payment</label>
                  <div class="col-sm-8">
                    <select class="select1 col-sm-12" name="methodofpayment" id="methodofpayment" onchange="li_sfother(this)">
                            <option value="" selected>Choose...</option>
                            <option value="Paypal">Paypal</option>
                            <option value="MasterCard">MasterCard</option>
                          </select>
                  </div>
                </div>
            
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnAddPayment">Add</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->
              
            </tbody>
          </table>
          </div>
         <%
				}
            rs2.close();
            stmt2.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
        </div><!-- panel-body -->
        
        </div>
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
          </div>
          <h4 class="panel-title" style="font-size:90%;">History of Payment</h4>
        </div>
        <div class="panel-body">
         
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
             <%
			try{ 
				String query2 = "SELECT * from t_payment_details where payment_ref_pol_id = "+polid+" and payment_status='Paid'";
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery(query2);
				while(rs2.next())
				{
			%>
            <tbody>
            
             
              <tr>
              
                <td>Paid Amount</td>
                <td><%out.print(rs2.getString("payment_amount")); %>.00</td>
              </tr>
              <tr>
                <td>Date of Payment</td>
                <td><%out.print(rs2.getString("payment_date_of_payment")); %></td>
              </tr>
              <tr>
              
                <td>Method of Payment</td>
                <td><%out.print(rs2.getString("payment_method")); %></td>
              </tr>
            </tbody>
            <%
				}
            rs2.close();
            stmt2.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
          </table>
          </div>
         
        </div><!-- panel-body -->
        </div>
          </div><!-- table-responsive -->
          <div class="col-sm-2"></div>
        
        </div>
        </div>
                  </div>
                  <div class="tab-pane" id="tab2">
                   <style>
		td
		{
			padding:5px !important;
			padding-left: 20px !important;
		}
		</style>
         <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
          </div>
          <h4 class="panel-title" style="font-size:90%;">Life Insured</h4>
        </div>
        <div class="panel-body">
         
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
              <tr>
                <td>Name</td>
                <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
              </tr>
              <tr>
                <td>Gender</td>
                <td><%out.print(rs.getString("li_gender")); %></td>
              </tr>
              <tr>
                <td>Civil Status</td>
                <td><%out.print(rs.getString("li_civilstatus")); %></td>
              </tr>
              <tr>
                <td>Birthdate</td>
                <td><%out.print(rs.getString("li_birthdate")); %></td>
              </tr>
              <tr>
                <td>Place of Birth</td>
                <td><%out.print(rs.getString("li_placeofbirth")); %></td>
              </tr>
              <tr>
                <td>Nationality</td>
                <td><%out.print(rs.getString("li_nationality")); %></td>
              </tr>
              <tr>
                <td>Mobile Number</td>
                <td><%out.print(rs.getString("li_mobilenumber")); %></td>
              </tr>
              <tr>
                <td>Telephone Number</td>
                <td><%out.print(rs.getString("li_telephonenumber")); %></td>
              </tr>
              <tr>
                <td>Email Address</td>
                <td><%out.print(rs.getString("li_emailaddress")); %></td>
              </tr>
              <tr>
                <td>Home Address</td>
                <td><%out.print(rs.getString("li_presentaddress")); %> <%out.print(rs.getString("li_presentzipcode")); %> <%out.print(rs.getString("li_presentcountry")); %></td>
              </tr>
            </tbody>
          </table>
          </div>
         
        </div><!-- panel-body -->
        </div>
        
          </div><!-- table-responsive -->
          <div class="col-sm-2"></div>
        
        </div>
        </div>
                  </div>
                  <div class="tab-pane" id="tab3">
                   <style>
		td
		{
			padding:5px !important;
			padding-left: 20px !important;
		}
		th
		{
			padding:5px !important;
			padding-left: 20px !important;
		}
		</style>
         <div class="panel panel-default">
        <div class="panel-body">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
        
        <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
          </div>
          <h4 class="panel-title" style="font-size:90%;">Plan</h4>
        </div>
        <div class="panel-body">
         
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
              <tr>
                <td>Plan</td>
                <td><%out.print(rs.getString("plan_name")); %></td>
              </tr>
              <tr>
                <td>Sum Assured</td>
                <td><%out.print(rs.getString("pi_sumassured")); %></td>
              </tr>
              <tr>
                <td>Annualized Premium</td>
                <td><%out.print(rs.getString("pi_annualizedpremium")); %></td>
              </tr>
              <tr>
                <td>Mode of Payment</td>
                <td><%out.print(rs.getString("pi_modeofpayment")); %></td>
              </tr>
            </tbody>
          </table>
          </div>
         
        </div><!-- panel-body -->
        </div>
        
         <div class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
          </div>
          <h4 class="panel-title" style="font-size:90%;">Benefits</h4>
        </div>
        <div class="panel-body">
         
         <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <thead>
              <tr>
                <th>Rider</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody>
             <%
			try{ 
				String query6 = "select * from t_policy_details pd INNER JOIN r_policy_information_details pid on pid.pi_id=pd.pol_ref_pi_id LEFT JOIN r_benefit_details bd ON bd.benefit_ref_pi_id=pid.pi_id where pol_id="+polid+" ";
				Statement stmt6 = conn.createStatement();
				ResultSet rs6 = stmt6.executeQuery(query6);
				while(rs6.next())
				{
					
			%>
              <tr>
                <td><%out.print(rs6.getString("benefit_name")); %></td>
                <td><%out.print(rs6.getString("benefit_amount")); %></td>
              </tr>
              <%
				}
				%>
            </tbody>
          </table>
          
          <%
            rs6.close();
            stmt6.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
          
          </div>
         
        </div><!-- panel-body -->
        </div>
        
        
          </div><!-- table-responsive -->
          <div class="col-sm-2"></div>
        
        </div>
        </div>
                  </div>
                 
                  
                  
                </div><!-- tab-content -->
                
                
              </div><!-- #basicWizard -->
          
        </div><!-- panel-body -->
      </div><!-- panel -->
      
    </div><!-- contentpanel -->
    <%	}
            rs.close();
            stmt.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
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
    jQuery('#table2').dataTable();
    
  
    
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
<script type="text/javascript">
	$(document).ready(function (){

		
	
		
		$("#btnAddPayment").click(function() {
		
			var payment_id = $('#paymentid').val();
			var methodofpayment = $('#methodofpayment').val();
			var amount = $('#amount').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					
					payment_id:payment_id,
					methodofpayment:methodofpayment,
					amount:amount
					
				},
				url:'addpayment',
				success: function(result){
					
					swal("Success!", "You paid a total of", "success");
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
