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
  <script src = "jquery/jquery.min.js"></script>
      <script src = "highcharts/highcharts.js"></script>

  <title>La Vie Insurance - Login</title>

  <link href="css/style.default.css" rel="stylesheet">

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

      <p>sample</p>
 
         <div id = "container" style = "width: 550px; height: 400px;"></div>

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

<!--  -->
<hr>
<!-- 
 <div id = "container2" style = "width: 550px; height: 400px;"></div>
<script type="text/javascript">

   $(document).ready(function() {
    var options = {
        chart: {
            renderTo: 'container2',
            type: 'spline'
        },
        series: [{}]
    };
    
    $.getJSON('data.php',  function(data) {
        options.series[0].data = data;
        var chart = new Highcharts.Chart(options);
    });
});
</script>
 -->
<!--  -->


         <div id="container1" style="width:100%; height:400px;"></div>

   <script language = "JavaScript">
      $(function () { 
    var myChart = Highcharts.chart('container1', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Jane',
            data: [<%
					try{ 
						String query1 = " SELECT COUNT(*) FROM (SELECT * FROM benefit_details) as Countme";
						Statement stmt1 = conn.createStatement();
						ResultSet rs1 = stmt1.executeQuery(query1);
						while(rs1.next())
						{
						out.print(rs1.getInt("COUNT(*)")); 
						}
						rs1.close();
		            stmt1.close();
					}
					catch(Exception e)
					{
					e.printStackTrace();
					}
				%>
			, 2, 4]
        }, {
            name: 'John',
            data: [5, 7, 3]
        }, {
            name: 'Remmel',
            data: [1,4,3]
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
   

   <!-- my sample -->

   
   </body>
</html>
    