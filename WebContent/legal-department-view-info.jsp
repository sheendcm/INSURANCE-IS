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
       <h5 class="sidebartitle" style="padding-left: 15px;"> LEGAL DEPARTMENT</h5><br>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="legal-department-dashboard.jsp"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li class="active"><a href="legal-department.jsp"><span class="pull-right badge badge-danger" style="background-color:#d9534f; color:white;">new</span><i class="fa fa-edit"></i> <span>Legal Evaluation</span></a></li>
        
        <li class="nav-parent"><a href=""><i class="fa fa-list"></i> <span>List of Completed Legal</span></a>
          <ul class="children">
            <li><a href="legal-department-approved.jsp"><i class="fa fa-caret-right"></i> Approved in Legal</a></li>
            <li><a href="legal-department-declined.jsp"><i class="fa fa-caret-right"></i> Declined in Legal</a></li>
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
      <h2><i class="fa fa-edit"></i> Legal Evaluation</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="#">La Vie Insurance</a></li>
           <li><a href="#">Legal Department</a></li>
          <li class="active">Legal Evaluation</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
    <input id="sud_id" type="text" class="form-control" name="sud_id" value="<%out.print(rs1.getInt("sud_id")); %>"
							            style="color: black; display:none; "/>
    
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
					</style>
    <%	
      
         	String polid =request.getParameter("id");
			try{ 
				String query = "SELECT * FROM t_claiming_details c LEFT JOIN r_death_claim_details dc ON dc.dc_id-c.c_ref_dc_id LEFT JOIN r_critical_illness_details ci ON ci.ci_id=c.c_ref_ci_id LEFT JOIN r_accident_details a ON a.a_id=c.c_ref_a_id LEFT JOIN r_hospitalization_details h ON h.h_id=dc.dc_ref_h_id or h.h_id=ci.ci_ref_h_id or h.h_id=a.a_ref_h_id LEFT JOIN r_death_details d ON d.d_id=dc.dc_ref_d_id LEFT JOIN r_health_details hl ON hl.hl_id=ci.ci_ref_hl_id LEFT JOIN r_accident_info_details ai ON ai.ai_id=a.a_ref_ai_id LEFT JOIN t_policy_details p ON p.pol_id=dc.dc_ref_pol_id OR p.pol_id=ci.ci_ref_pol_id OR p.pol_id=a.a_ref_pol_id LEFT JOIN r_life_insured_details lid ON lid.lid_id=p.pol_ref_li_id LEFT JOIN r_life_insured_personal_details lipd ON lipd.li_id=lid.lid_id LEFT JOIN r_non_medical_information_details nmi ON nmi.nmid_id=lid.lid_ref_nmid_id LEFT JOIN t_claim_status_details cs ON cs.cs_ref_c_id=c.c_id LEFT JOIN r_claim_legal_status_details cls ON cls.cls_id=cs.cs_ref_cls_id  where  c.c_id="+polid+" GROUP BY c.c_id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					
				
			%>  
			<style>
			td{
				font-size:90%;
			}
			.mybtn1
			{
				padding:5px 7px;
				font-size:90%;
			}
			.myfg
			{
				margin:0px;
			}
			</style>
			
     <div class="panel panel-default">
        <div class="panel-body"><br>
          <div class="row">
        <div class="col-sm-3">
          <div class="profile-header">
            <h2 class="profile-name"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></h2>
            <hr style="margin-top:0px;">
            <input type="text" class="form-control mytextbox"  id="cls_id"  name="cls_id" value="<%out.print(rs.getInt("cls_id")); %>"  style="display:none;" />
            <input type="text" class="form-control mytextbox"  id="typeofclaim"  name=typeofclaim value="<%out.print(rs.getString("c_typeofclaim")); %>"  style="display:none;" />
            <div class="row" align="left" style="margin-right:1px; margin-left:1px;">
            <div class="table-responsive">
          <table class="table table-bordered mb30">
            <col width="40%">
            <col width="60%">
            <tbody>
              <tr>
                <td style="padding:5px;"><strong>Gender</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_gender")); %></td>
              </tr>
              <tr>
               <td style="padding:5px;"><strong>Birthdate</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_birthdate")); %></td>
              </tr>
              <tr>
                <td style="padding:5px;"><strong>Email Address</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_emailaddress")); %></td>
              </tr>
              <tr>
                <td style="padding:5px;"><strong>Address</strong></td>
                <td style="padding:5px;"><%out.print(rs.getString("li_presentaddress")); %></td>
              </tr>
            </tbody>
          </table>
          </div>
            
            </div>
            <hr style="margin:0px; margin-bottom:10px;">
            <div class="profile-location"><strong><i class="fa fa-edit" style="font-size:20px;"></i> Remarks</strong></div>
            <textarea name="remarks" id="remarks" class="form-control" rows="9"><%out.print(rs.getString("cls_remarks")); %></textarea>
            <div class="row" align="right" style="margin-right:5px; margin-top:5px;">
            
            </div>
            <hr style="margin-top:5px; margin-bottom:10px;">
            
            <div class="row" align="right" style="margin-right:1px;">
            
            <a class="btn btn-white mybtn1 btnGetRemarks" id="btnDecline" href="#modalDeclineMedical" data-toggle="modal" ><i class="fa fa-times"></i> Decline</a>
            
            <a class="btn btn-primary mybtn1 mr5 btnGetRemarks" id="btnApprove" href="#modalApproveMedical" data-toggle="modal"><i class="fa fa-check"></i> Approve</a>
            </div>
          </div><!-- profile-header -->
          
        </div><!-- col-sm-3 -->
          <!-- BASIC WIZARD -->
              <div id="basicWizard" class="basic-wizard col-sm-9"  style="border-style: solid; border-width: 1px; padding:0px; border-color:#D3D3D3;">
                
                <ul class="nav nav-pills nav-justified ">
                  <li class="active"><a href="#tab1" data-toggle="tab"> Claiming Information</a></li>
                  <li><a href="#tab2" data-toggle="tab"> Files</a></li>
                </ul>
                
                <div class="tab-content">
                  <div class="tab-pane active" id="tab1">
                  <div id="deathdetails" class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea; display:none;">
        <div id="deathdetails" class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Death Details</h4>
        </div>
        <div class="panel-body">
        <div class="row">
        <div class="col-sm-6">
        <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Cause of Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_causeofdeath")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Place of Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_placeofdeath")); %></label>
                </div> 
        </div>
          <div class="col-sm-6">
          
          
           <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date of Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_dateofdeath")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Time of Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_timeofdeath")); %></label>
                </div>
                
          </div>
          </div>
          <hr>
          <div class="row">
           <div class="col-sm-6">
        <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Doctor Certifying Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_doctorcertifyingdeath")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Contact Number</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_doctorcontactnumber")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Address</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_doctoraddress")); %></label>
                </div> 
        </div>
         <div class="col-sm-6">
        <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Medical Attendant Certifying Death</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_assistantcertifyingdeath")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Contact Number</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_assistantcontactnumber")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Address</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("d_assistantaddress")); %></label>
                </div> 
        </div>
        </div>
        </div><!-- panel-body -->
        </div>  
        
        <div id="healthdetails" class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea; display:none;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Health Details</h4>
        </div>
        <div class="panel-body">
          <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-sm-8">
        <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Details of Illness</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("hl_detailsofillness")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date of first consultation</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("hl_firstconsultation")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Symptoms Experienced</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("hl_symptomsexperienced")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date Symptoms Begin</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("hl_symptomsbegin")); %></label>
                </div>  
        </div>
            
          </div>
        </div><!-- panel-body -->
        </div> 
        
        <div id="accidentdetails" class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea; display:none;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Accident Details</h4>
        </div>
        <div class="panel-body">
          <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-sm-8">
        <div class="form-group myfg">
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Cause of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidentcause")); %></label>
                </div> 
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidentdate")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Time of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidenttime")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Place of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidentplace")); %></label>
                </div> 
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Extent of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidentextent")); %></label>
                </div>  
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Details of Accident</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("ai_accidentdetails")); %></label>
                </div>  
        </div>
            
          </div>
        </div><!-- panel-body -->
        </div> 
        
        
        
        <div id="hospitalizationdetails" class="panel panel-default" style="border-width:1px; border-style:solid; border-color:#e4e7ea;">
        <div class="panel-heading" style="background-color:#bdbdbd; padding-top: 5px;padding-bottom: 5px;">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title" style="font-size:90%;">Hospitalization Details</h4>
        </div>
        <div class="panel-body">
         <div class="row">
          <div class="col-sm-1"></div>
          <div class="col-sm-8">
        <div class="form-group myfg">
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Hospital Name</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_hospitalname")); %></label>
                </div> 
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Hospital Address</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_hospitaladdress")); %></label>
                </div>
                <hr>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date of Admission</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_dateofadmission")); %></label>
                </div>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Admission Number</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_admissionnumber")); %></label>
                </div> 
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Days of confinement</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_daysofconfinement")); %></label>
                </div>  
                <hr>
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Date of Discharge</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_dateofdischarge")); %></label>
                </div>  
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Ward/Room Number</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_roomnumber")); %></label>
                </div>  
                <div class="form-group myfg">
                  <label class="col-sm-5 control-label mylabel" align="right"><strong>Final Diagnosis</strong></label>
                  <label class="col-sm-7 control-label mylabel" align="left"><%out.print(rs.getString("h_finaldiagnosis")); %></label>
                </div>  
        </div>
            
          </div>
        </div><!-- panel-body -->
        </div> 
        
                  </div>
                  <div class="tab-pane" id="tab2">
                    <div class="table-responsive">
                <table class="table table-dark mb30" style="border-style:solid; border-width:1px;">
                <col width="5%">
	  			<col width="25%">
	  			<col width="25%">
	  			<col width="20%">
	  			<col width="10%">
                    <thead>
                      <tr>
                        <th style="background-color:#757575;">#</th>
                        <th style="background-color:#757575;">File Name</th>
                        <th style="background-color:#757575;">File Description</th>
                        <th style="background-color:#757575;">Upload Date</th>
                        <th style="background-color:#757575;">Download</th>
                      </tr>
                    </thead>
                    <tbody><%
			try{ 
				String query3 = "select * from r_file_details where f_ref_pol_id="+polid+" and f_type='Legal' ";
				Statement stmt3 = conn.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				while(rs3.next())
				{
			%>
                      <tr>
                        <td style="display:none;"><%out.print(rs3.getInt("f_id")); %></td>
                        <td></td>
                        <td><%out.print(rs3.getString("f_name")); %></td>
                        <td><%out.print(rs3.getString("f_description")); %></td>
                        <td><%String dateindb = rs3.getString("f_dateuploaded");
		            			String modifieddate = dateindb.substring(0, 10);
		            			out.print(modifieddate); %></td>
                        <td><a class="btn btn-primary mybtn" href="downloadServlet?id=<%out.print(rs3.getInt("f_id")); %>" title="Download" data-toggle="modal"><i class="glyphicon glyphicon-download-alt myi"></i></a></td>
                      <%
				}
				%>
                      </tr>
                      
                    </tbody>
                </table>
                <%
            rs3.close();
            stmt3.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
           %>
            </div><!-- table-responsive -->
                  </div>
                 
                  
                  
                </div><!-- tab-content -->
                
                
              </div><!-- #basicWizard -->
          
         
          
      </div><!-- row -->
          
        </div><!-- panel-body -->
        
      </div><!-- panel -->
      
      
      <!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalApproveMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Legal Department</h4>
			        <input id="ms_id" type="text" class="form-control" name="ms_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Remarks</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="remarksmodal" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnMedicalApprove">Mark as Approved</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->  
			
			
        <!-- MODAL PROCEED TO MEDICAL -->
            <div class="modal fade" id="modalDeclineMedical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width:500px;">
			      <div class="modal-header" style="background-color:#3F729B; height:50px;">
			        <button type="button" class="close" data-dismiss="modal" style="margin:0px" aria-hidden="true">&times;</button>
			        <h4 class="modal-title" id="myModalLabel" style="color:white;font-size:100%;"> Legal Department</h4>
			        <input id="ms_id" type="text" class="form-control" name="ms_id"
							            style="color: black; width: 560px; display:none;" maxlength="50"/>
							            
							            							            		            
			      </div>
			      <div class="modal-body">
      
      <div class="row" style="padding-top:20px;">
          
          <div class="col-md-2"></div>
          <div class="form-group myfg col-md-8"> 
          
          
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Name of Insured</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="nameofinsured" align="left"><%out.print(rs.getString("li_givenname")); %> <%out.print(rs.getString("li_middlename")); %> <%out.print(rs.getString("li_surname")); %></label>
                  </div>
          </div>
          <div class="row" style="padding-top:10px;">
           <label class="col-sm-5 control-label mylabel" align="right"><strong>Remarks</strong></label>
                  <div class="col-sm-7">
                    <label class="col-sm-12 control-label mylabel" id="remarksmodal1" align="left"></label>
                  </div>
          </div>
              
                </div>
            
          </div>
      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="btnMedicalDecline">Mark as Declined</button>
			      </div>
			    </div><!-- modal-content -->
			  </div><!-- modal-dialog -->
			</div><!-- modal -->     
      <%
				}
				rs.close();
            stmt.close();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
				%>  
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
			var claimtype = document.getElementById('typeofclaim').value;
			if (claimtype == "Death Claim")
			{
				document.getElementById('deathdetails').style.display= "block";
				document.getElementById('healthdetails').style.display= "none";
				document.getElementById('accidentdetails').style.display= "none";
			}
			if (claimtype == "Critical Illness")
			{
				document.getElementById('deathdetails').style.display= "none";
				document.getElementById('healthdetails').style.display= "block";
				document.getElementById('accidentdetails').style.display= "none";
			}
			if (claimtype == "Accident")
			{
				document.getElementById('deathdetails').style.display= "none";
				document.getElementById('healthdetails').style.display= "none";
				document.getElementById('accidentdetails').style.display= "block";
			}
			
			</script>
<script>
$('.btnGetRemarks').click( function() {

	document.getElementById('remarksmodal').innerHTML="";
	document.getElementById('remarksmodal1').innerHTML="";
	var remarks = document.getElementById('remarks').value;
	document.getElementById('remarksmodal').innerHTML= remarks;
	document.getElementById('remarksmodal1').innerHTML= remarks;
	
   
    
  });   

</script>
<script type="text/javascript">
	$(document).ready(function (){
		
		
		
		
		$("#btnMedicalApprove").click(function() {
			
			
			var sud_id = $('#sud_id').val();
			var cls_id = $('#cls_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					cls_id:cls_id,
					remarks:remarks
					
				},
				url:'legalapprove',
				success: function(result){
					
					swal("Success!", "Successfully mark as Approved!", "success");
					setTimeout(location.reload.bind(location), 3000);
						},
						error:function(result)
						{
						
						}
			});
		});
		
		$("#btnMedicalDecline").click(function() {
			
			var sud_id = $('#sud_id').val();
			var cls_id = $('#cls_id').val();
			var remarks = $('#remarks').val();
			
			$.ajax({
				type:'POST',
				data:
				{	
					sud_id:sud_id,
					cls_id:cls_id,
					remarks:remarks
					
				},
				url:'legaldecline',
				success: function(result){
					
					swal("Success!", "Successfully mark as Declined!", "success");
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
