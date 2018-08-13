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
<!--  <script type="text/javascript" src="js/jquery-1.10.0.min.js"></script> -->
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	
	Conn db = new Conn();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	else
		out.print("success");
%>

	<script type="text/javascript">
		$(document).ready(function (){
			$('#btnSubmit').click(function(){
			
				var TxtDesc = $('#TxtDesc').val();
				$.ajax({
					type:'POST',
					data:{TxtDesc: TxtDesc},
					url:'sample/insert',
					success: function(result){
						alert(result);
						
					}
				});
			});
		});
	</script>
	<input type="text" id="TxtDesc" placeholder="Input your Description">
	<input type="button" id="btnSubmit" value="Submit" >
</body>
</html>