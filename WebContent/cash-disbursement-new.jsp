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
       <h5 class="sidebartitle" style="padding-left: 15px;"> CASH DISBURSEMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="#"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="cash-disbursement-new.jsp"><span class="pull-right badge badge-danger" style="background-color:#d9534f; color:white;">new</span><i class="fa fa-money"></i> <span>New Claim</span></a></li>
        <li class="active"><a href="cash-disbursement-release.jsp"><i class="fa fa-check"></i> <span>Released Claim</span></a></li>
        <li><a href="cash-disbursement-release.jsp"><i class="glyphicon glyphicon-file"></i> <span>Reports</span></a></li>
        <li><a href="cash-disbursement-audit-trail.jsp"><i class="glyphicon glyphicon-list"></i> <span>Audit Trail</span></a>
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
        
    <div class="pageheader" id="printthis">
      <h2><i class="fa  fa-check"></i> Releases Claim</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Cash Disbursement</a></li>
          <li class="active">Released Claim</li>
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
            <table class="table" id="table1" style="font-size:85%;">
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
              <thead>
                 <tr>
                 	<th style="display:none;"></th>
                 	<th>Policy Number</th>
                 	<th>Date Released</th>
                 	<th>Insured</th>
                 	<th>Type of Claim</th>
                 	<th style="display:none;"></th>
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
              <%
			try{ 
				String query = "SELECT * FROM t_claiming_details c LEFT JOIN r_death_claim_details dc ON dc.dc_id=c.c_ref_dc_id LEFT JOIN r_critical_illness_details ci ON ci.ci_id=c.c_ref_ci_id LEFT JOIN r_accident_details a ON a.a_id=c.c_ref_a_id LEFT JOIN t_policy_details p ON p.pol_id=dc.dc_ref_pol_id or p.pol_id=ci.ci_ref_pol_id or p.pol_id=a.a_ref_pol_id LEFT JOIN t_claim_status_details cs  ON cs.cs_ref_c_id=c.c_id LEFT JOIN r_claim_legal_status_details cls  ON cls.cls_id=cs.cs_ref_cls_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=p.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_ref_li_id LEFT JOIN r_claim_approval_status_details cas ON cas.cas_id=cs.cs_ref_cas_id LEFT JOIN r_policyowner_details pd ON pd.p_id=p.pol_ref_p_id LEFT JOIN r_policy_information_details pid ON pid.pi_id=p.pol_ref_pi_id WHERE cas.cas_status='Approved' GROUP BY c.c_id ";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
				
				String dateindb = rs.getString("cas_datecompleted");
    			String modifieddate = dateindb.substring(0, 10);
    			String modifiedtime = dateindb.substring(10, 16);
				
			%>
                 <tr>
                    <td style="display:none;"><%out.print(rs.getInt("pol_id")); %></td>
                    <td>0000<%out.print(rs.getInt("pol_id")); %></td>
                    <td><%out.print(modifieddate); %>&nbsp;&nbsp;&nbsp;<%out.print(modifiedtime); %></td>
                    <td><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></td>
                    <td><%out.print(rs.getString("c_typeofclaim")); %></td>
                    <td style="display:none;"><%out.print(rs.getString("pi_sumassured")); %></td>
                    <td>
					<a class ="btn btn-success mybtn tooltips" data-placement="top" data-toggle="modal" title="Mark as Released" href="#" ><i class="glyphicon glyphicon-ok"></i></a>
					</td>
					
					
			  		 
			<style>
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
							.mytextbox
							{
								font-size: 85%;
							}
							</style>
					
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
<script>
var indexedituser = '';
$('.btnViewDetails').click( function() {

	document.getElementById('nameofinsured').innerHTML = "";
	document.getElementById('modifieddate').innerHTML = "";
	document.getElementById('msremarks').innerHTML = "";
	document.getElementById('msstatus').innerHTML = "";
	
    var table = document.getElementById('table1'); 
    for(var i = 1; i < table.rows.length; i++)
    {
      table.rows[i].cells[5].onclick = function()
      {

    	  	indexedituser = this.parentElement.rowIndex;
    	  	
	        
	        var modifieddate = document.getElementById('table1').rows[indexedituser].cells.item(1).innerHTML
	        document.getElementById('modifieddate').innerHTML = modifieddate;
	        
    	  	var nameofinsured = document.getElementById('table1').rows[indexedituser].cells.item(2).innerHTML
	        document.getElementById('nameofinsured').innerHTML = nameofinsured;
	        
	        var msstatus = document.getElementById('table1').rows[indexedituser].cells.item(3).innerHTML
	        document.getElementById('msstatus').innerHTML = msstatus;
	        
    	  	var msremarks = document.getElementById('table1').rows[indexedituser].cells.item(4).innerHTML
	        document.getElementById('msremarks').innerHTML = msremarks;
	       
      };
      
    }
    
  });   

</script>
<script>
$(document).ready(function (){
		
		
	
		
		
		
	});
</script>
</body>
</html>
