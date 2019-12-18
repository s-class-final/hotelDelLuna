<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>FullCalendar Example</title>
 
<style TYPE="text/css">


.container {
    margin: 40px;
}
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
	.divDotText {
	overflow:hidden;
	text-overflow:ellipsis;
	}
	
	.day{
		width:100px; 
		height:40px;
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
		background:#f9f9f9;
	    border-radius: .5rem;
		color: #8a7057;
		border: 1px solid #9c836a;
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
		border:1px solid black;
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
		border:1px solid black;
		height:120px;
		background-color:#f9f9f9;
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
		border:1px solid black;
		height:120px;
		background-color:#f9f9f9;
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
		border:1px solid black;
		height:120px;
		background-color:#f9f9f9;
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
		background:red;
		color:white;
		border-radius: .25rem;
	}
	.before_date{
		border:1px solid white;
		height:120px;
		background-color:grey;
		vertical-align: top;
		text-align: left;
	}
	 #theadPart {
	    color: WHITE;
	    background: #1b1e24;
	    border-bottom: 4px solid #9ea7af;
	    border-right: 1px solid #343a45;
	    font-size: 15px;
	    font-weight: 100;
	    padding: 10px;
	    cursor: pointer;
	    text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	    vertical-align: middle;
	}
	
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

	background-color: rgba(0, 0, 0, 0.8);

  -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	
  -webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	
  color: #FFFFFF;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: 154%;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;

	opacity: 0;
	left: -9999px;
  top: 90%;
	
	content: attr(data-tooltip-text);
}

[data-tooltip-text]:hover:after {
	top: 130%;
	left: 0;
	opacity: 1;
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
		<tr id="theadPart" bgcolor="#CECECE">
			<th class="day sun" >
				일
			</th>
			<th class="day" >
				월
			</th>
			<th class="day" >
				화
			</th>
			<th class="day" >
				수
			</th>
			<th class="day" >
				목
			</th>
			<th class="day" >
				금
			</th>
			<th class="day sat" >
				토
			</th>
		</tr>
	</thead>

<tbody id="tableBody">
	
</tbody>
	
	</table>
	</div>
	</form>
	</div>
<!-------------------- 팝업창  ---------------------->
<form>
	<div class="layerPopWrap" id="loginPop3">
		<div class="bg"></div>
		<!-- layerPopCont -->
		<div class="layerPopCont">
			<div class="loginWrap">
				<h1><span>예약 정보</span></h1>
				<img src="#" style="width:100%;height:300px">
				<br><br>

				<div class="popJoinBox">
					<div class="wrap">
						<p>삭제 버튼을 누르면 <br />해당 예약 내역이 삭제됩니다. </p>
						<a href="roomstatus.do" class="btn small2" style="display:inline;right:65px"><span>방 배정 확인</span></a>
						<a href="javascript:void(0);" class="btnPopClose btn small2" style="display:inline;right:200px"><span>취소</span></a>
					</div>
				</div>
			</div>
			<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
		</div>
		<!-- //layerPopCont -->
	</div>
</form>
<!-------------------- //팝업창  ---------------------->
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
				//$before_year = $("<a class='before_after_year' style='float:left;' id='before_year' onclick='initDate("+(data.search_year-1)+","+(data.search_month-1)+")'>").text(" prev ");
				$before_month = $("<a class='before_after_month' id='before_month' onclick='initDate("+data.before_year+","+data.before_month+")'>").text(" ◁ ");
				$this_month = $("<span class='this_month'>");
					
		 		if(data.search_month<10){
					$this_month.text(data.search_year+". 0"+data.search_month);
				}else{
					$this_month.text(data.search_year+". "+data.search_month);
				}
		 		$after_month = $("<a class='before_after_month' id='after_month' onclick='initDate("+data.after_year+","+data.after_month+")'>").text(" ▷ "); 
		 		//$after_year = $("<a class='before_after_year' style='float:right;' id='after_year' onclick='initDate("+(data.search_year+1)+","+(data.search_month-1)+")'>").text(" next ");
		 		
		 		
		 		//$navigation.append($before_year);
		 		$navigation.append($before_month);
		 		$navigation.append($this_month);
		 		$navigation.append($after_month);
		 		//$navigation.append($after_year);

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
						$td = $("<td class='today' onclick='detailModal("+data[i].year+data[i].month+data[i].date+")'>");
						$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+data[i].superiorCount+"  DELUXE-"+data[i].deluxeCount+"   SUITE-"+data[i].suiteCount+"   ' >").text("남은객실 "+data[i].emptyRoom);
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
							$td = $("<td class='sat_day' onclick='detailModal("+data[i].year+data[i].month+data[i].date+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+data[i].superiorCount+"  DELUXE-"+data[i].deluxeCount+"   SUITE-"+data[i].suiteCount+"   '>").text("남은객실 "+data[i].emptyRoom);
							$td.append($datediv);						
							$td.append($innerDiv);
						}
						$tr.append($td);
						$tableBody = $("#tableBody");
						$tableBody.append($tr);
					}
					// 일요일일 때
					else if(i%7==0){

						$tr = $("<tr>");
						$datediv = $("<div class='sun'>"+data[i].date+"</div>");	

						// 지나간 날짜일 때
						if(data[i].value=='before_date' || data[i].value==''){
							$td = $("<td class='before_date'>");
							$td.append($datediv);						
						}else{
							$td = $("<td class='sun_day' onclick='detailModal("+data[i].year+data[i].month+data[i].date+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+data[i].superiorCount+"  DELUXE-"+data[i].deluxeCount+"   SUITE-"+data[i].suiteCount+"   '>").text("남은객실 "+data[i].emptyRoom);
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
							$td = $("<td class='normal_day' onclick='detailModal("+data[i].year+data[i].month+data[i].date+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+data[i].superiorCount+"  DELUXE-"+data[i].deluxeCount+"   SUITE-"+data[i].suiteCount+"   '>").text("남은객실 "+data[i].emptyRoom);
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

/** 확인창 띄우기 **/
function detailModal(date){
		console.log(date);
		
		$(".loginWrap h1 span").text(date+" 객실 정보");
		layerPopOpen("#loginPop3");
	};

function closePopModal(){
	layerPopClose("#loginPop3");
	
};

</script>
</body>

</html>