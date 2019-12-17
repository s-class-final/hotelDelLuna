<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
	width: 800px;
	height:800px;
	margin-top : 100px;
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

<div id="outer">

<div id="Barchart" style="width: 900px; height: 500px;"></div>
   
  <div style="background-color: white;">
  	
  </div>
  </div>
</body>
</html>