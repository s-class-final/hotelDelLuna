<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <title>FullCalendar Example</title>
 
<style TYPE="text/css">
	body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
	}
/* 
	td {font-family: "돋움"; font-size: 9pt; color:#595959;}
	th {font-family: "돋움"; font-size: 9pt; color:#000000;}
	select {font-family: "돋움"; font-size: 9pt; color:#595959;} */


	.divDotText {
	overflow:hidden;
	text-overflow:ellipsis;
	}
	
/* 	A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
	A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;} */

	.day{
		width:100px; 
		height:30px;
		font-weight: bold;
		font-size:15px;
		font-weight:bold;
		text-align: center;
	}
	.sat{
		color:#529dbc;
	}
	.sun{
		color:red;
	}
	td:hover .sun{
		color:white;
	}
	.today_button_div{
		float: right;
	}
	.today_button{
		width: 100px; 
		height:30px;
	}
	.calendar{
		width:100%;
		padding-left:20px;
		margin:auto;
	}
	.navigation{
		margin-top:70px;
		margin-bottom:30px;
		text-align: center;
		font-size: 25px;
		vertical-align: middle;
	}
	.calendar_body{
		width:100%;
		background-color: #FFFFFF;
		border:1px solid white;
		margin-bottom: 50px;
		border-collapse: collapse;
	}
	.calendar_body .today{
		border:1px solid white;
		height:120px;
		background-color:#c9c9c9;
		text-align: left;
		vertical-align: top;
	}
	.calendar_body .date{
		font-weight: bold;
		font-size: 15px;
		padding-left: 3px;
		padding-top: 3px;
	}
	.calendar_body .sat_day{
		border:1px solid white;
		height:120px;
		background-color:#EFEFEF;
		text-align:left;
		vertical-align: top;
	}
	.calendar_body .sat_day .sat{
		color: #529dbc; 
		font-weight: bold;
		font-size: 15px;
		padding-left: 3px;
		padding-top: 3px;
	}

	.calendar_body .sun_day{
		border:1px solid white;
		height:120px;
		background-color:#EFEFEF;
		text-align: left;
		vertical-align: top;
	}
	.calendar_body .sun_day .sun{
		color: red; 
		font-weight: bold;
		font-size: 15px;
		padding-left: 3px;
		padding-top: 3px;
	}
	.calendar_body .normal_day{
		border:1px solid white;
		height:120px;
		background-color:#EFEFEF;
		vertical-align: top;
		text-align: left;
	}
	.before_after_month{
		margin: 10px;
		font-weight: bold;
	}
	.before_after_year{
		font-weight: bold;
	}
	.this_month{
		margin: 10px;
	}
	
	#tableBody td:hover {
	cursor: pointer;
	background: #4E5066;
	color: #FFFFFF;
	border-top: 1px solid #22262e;
	}
	.roomInfo{
		width:100%;
		height:10px;
		background:white;
	}
	.before_date{
		border:1px solid white;
		height:120px;
		background-color:grey;
		vertical-align: top;
		text-align: left;
	}
</style>
</head>

<body>
	<div class="reservationBox">
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
	
	<div class="calendar" >
	
		<!--날짜 네비게이션  -->
		<div class="navigation">
		
		</div>
	
	<!-- <div class="today_button_div"> -->
	<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
	<!-- </div> -->
	<table class="calendar_body">
	
	<thead>
		<tr bgcolor="#CECECE">
			<td class="day sun" >
				일
			</td>
			<td class="day" >
				월
			</td>
			<td class="day" >
				화
			</td>
			<td class="day" >
				수
			</td>
			<td class="day" >
				목
			</td>
			<td class="day" >
				금
			</td>
			<td class="day sat" >
				토
			</td>
		</tr>
	</thead>

<tbody id="tableBody">
	
</tbody>
	
	</table>
	</div>
	</form>
	</div>
<script>
var search_year;
var search_month;

// 날짜 불러오기
function initDate(year,month){

	var $navigation = $(".navigation");
	var $before_year;
	var $before_month;
	var $this_month;
	var $after_month;
	var $after_year;
	var year = year;
	var month = month;
	var $innerDiv;
	var $tr = $("<tr>");
	
	$navigation.html("");
	$("#tableBody").html("");
	 $.ajax({
			url:"calendar.do",
			data:{type:false,
				  year:year,
				  month:month},
			dataType:"json",
			success:function(data){
				$before_year = $("<a class='before_after_year' onclick='initDate("+(data.search_year-1)+","+(data.search_month-1)+")'>").text(" << ");
				$before_month = $("<a class='before_after_month' onclick='initDate("+data.before_year+","+data.before_month+")'>").text(" < ");
				$this_month = $("<span class='this_month'>");
					
		 		if(data.search_month<10){
					$this_month.text(data.search_year+". 0"+data.search_month);
				}else{
					$this_month.text(data.search_year+". "+data.search_month);
				}
		 		$after_month = $("<a class='before_after_month' onclick='initDate("+data.after_year+","+data.after_month+")'>").text(" > "); 
		 		$after_year = $("<a class='before_after_year' onclick='initDate("+(data.search_year+1)+","+(data.search_month-1)+")'>").text(" >> ");
		 		
		 		
		 		$navigation.append($before_year);
		 		$navigation.append($before_month);
		 		$navigation.append($this_month);
		 		$navigation.append($after_month);
		 		$navigation.append($after_year);

		 		search_year = data.search_year;
		 		search_month = data.search_month;
			},error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
	 
	 $.ajax({
			url:"calendar.do",
			data:{type:true,
				year:year,
				month:month},
			dataType:"json",
			success:function(data){
				for(var i =0;i<data.length;i++){

					// 오늘일 때
					if(data[i].value=='today'){
						$datediv = $("<div class='date'>"+data[i].date+"</div>");
						$td = $("<td class='today'>");
						$innerDiv = $("<span class='roomInfo'>").text("남은객실 1");
						$td.append($datediv);
						$td.append($innerDiv);
						$tr.append($td);
					}
					// 토요일일 때
					else if(i%7==6){
						$datediv = $("<div class='sat'>"+data[i].date+"</div>");
						// 지나간 날짜일 때
						if(data[i].value=='before_date' || data[i].value==''){
							$td = $("<td class='before_date'>");
							$td.append($datediv);						
						}else{
							$td = $("<td class='sat_day'>");
							$innerDiv = $("<span class='roomInfo'>").text("남은객실 1");
							$td.append($datediv);						
							$td.append($innerDiv);
						}
						$tr.append($td);
					}
					// 일요일일 때
					else if(i%7==0){
						$tableBody = $("#tableBody");
						$tableBody.append($tr);
						$tr = $("<tr>");
						$datediv = $("<div class='sun'>"+data[i].date+"</div>");	

						// 지나간 날짜일 때
						if(data[i].value=='before_date' || data[i].value==''){
							$td = $("<td class='before_date'>");
							$td.append($datediv);						
						}else{
							$td = $("<td class='sun_day'>");
							$innerDiv = $("<span class='roomInfo'>").text("남은객실 1");
							$td.append($datediv);						
							$td.append($innerDiv);
						}

						$tr.append($td);
					// 평일일 때
					}else{
						$datediv = $("<div class='date'>"+data[i].date+"</div>");
						
						// 지나간 날짜일 때
						if(data[i].value=='before_date' || data[i].value==''){
							$td = $("<td class='before_date'>");
							$td.append($datediv);						
						}else{
							$td = $("<td class='normal_day'>");
							$innerDiv = $("<span class='roomInfo'>").text("남은객실 1");
							$td.append($datediv);						
							$td.append($innerDiv);
						}

						$tr.append($td);
					}
			
					
					if(i==data.length-1){
						$tableBody.append($tr);
						break;
					}
				}
	
			},error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
}
</script>
</body>

</html>