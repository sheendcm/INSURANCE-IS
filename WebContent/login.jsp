<%@page import="java.sql.*"%>
<%@page import="db.Conn" %>
<%@page import="java.sql.DriverManager" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/lavienew.png" type="image/png">

  <title>La Vie Insurance - Login</title>

  <link href="css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="signin" style="background-color:white;">
<% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();

%>
<section>
  
    <div class="signinpanel">
        
        <div class="row">
            <div class="col-md-3" ></div>
            <div class="col-md-6" >
                
                <form method="post" action="LoginServlet">
                <div class="row" align="center">
                <img alt="" src="images/lavienew.png" class="media-object" style="width:170px;">
                </div><br>
                	
                    <input type="text" name="username" id="username" class="form-control uname" placeholder="Username" />
                    <input type="password" name="password" id="password" class="form-control pword" placeholder="Password" /><br>
                    <input type="hidden" class="form-control" placeholder="error" name="error" value="Username or password incorrect!">

    					<p style="color: red"><%=request.getAttribute("Message")%></p>
                    <button class="btn btn-block" name="btnLogin" type="submit" id="btnLogin" style="background-color:#3F729B; border-color:#3F729B; color:white;">Login</button>
                    
                </form>
            </div><!-- col-sm-5 -->
            <div class="col-md-3" ></div>
        </div><!-- row -->
        
        <div class="signup-footer">
            <div class="pull-center">
            </div>
            
        </div>
        
    </div><!-- signin -->
  
</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/jquery.cookies.js"></script>

<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>

<script src="js/custom.js"></script>

<script>
    jQuery(document).ready(function(){
        
        // Please do not use the code below
        // This is for demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
            jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if(c && c == 'dodgerblue') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
    });
</script>
<script>
			$(document).ready(function (){
				
				var p = document.getElementsByTagName("p");
					for (var i = 0; i < p.length; i++) {
					    if (p[i].innerHTML == "null") {
					        p[i].style.display = "none";
					    }
					}
							});
									
			</script>
</body>
</html>
    