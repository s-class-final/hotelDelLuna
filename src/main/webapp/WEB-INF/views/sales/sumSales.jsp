<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	
	#page-wrap {
	 width: 1000px; 			
	 margin-top: 250px; 
	 margin-left: 300px;
	 height: 500px;
	 
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     
    google.charts.load('current', {'packages':['corechart'] }  );
    //google.charts.load('current', {'packages':['bar']}); 
    
    google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable(
        	${str}	
        );

        var options = {
          title: '호텔 매출 그래프'
        };

        var chart = new google.visualization.BarChart(document.getElementById('Barchart'));

        chart.draw(data, options);
      };
    </script>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/> 

<div id="page-wrap">

<div id="Barchart" style="width: 1000px; height: 700px;"></div>
   
 <!--  <div style="background-color: white;"> -->
  	
  </div>
  </div>
</body>
</html>