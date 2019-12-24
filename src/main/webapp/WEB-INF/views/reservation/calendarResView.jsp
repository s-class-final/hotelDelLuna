<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Admin || calendarResView</title>
 <script src="https://d3js.org/d3.v4.min.js"></script>
 
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

<!-- 그래프용 스크립트 -->

.amountGraphDiv{
	 margin :5px auto;
	 width : 180px;
	 height : 180px;
	 border : 1px solid black;
}
.amountGraphDiv:hover{
	 background : lightblue;
	 cursor  : pointer;
	 transition : 0.5s;
}


</style>
</head>

<body>
	<div class="reservationBox" style="width:90%">
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
		<div class="layerPopCont" style="width:650px;left:45%">
			<div class="loginWrap">
				<h1><span>예약 정보</span></h1>
				<label style="width:32%;text-align:center;">디럭스</label>
				<label style="width:33%;text-align:center;">슈페리어</label>
				<label style="width:33%;text-align:center;">스위트</label>
				<br>
				<div class="amountGraphDiv" id= "superiorAmount" style="display:inline-block;">
				</div>
				<div class="amountGraphDiv" id= "deluxeAmount" style="display:inline-block;">
				</div>
				<div class="amountGraphDiv" id= "suiteAmount" style="display:inline-block;">
				</div>
				<br><br>

				<div class="popJoinBox">
					<div class="wrap">
						<p>방 배정 확인을 누르면 <br />배정 상태를 확인할 수 있습니다. </p>
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
						if(i%7==0){
							$tr = $("<tr>");
						}
						$datediv = $("<div class='date'>"+data[i].date+"</div>");
						$td = $("<td class='today' onclick='detailModal("+data[i].date+","+data[i].superiorCount+","+data[i].deluxeCount+","+data[i].suiteCount+","+data[i].superiorRes+","+data[i].deluxeRes+","+data[i].suiteRes+")'>");
						$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+(data[i].superiorCount-data[i].superiorRes)+"  DELUXE-"+(data[i].deluxeCount-data[i].deluxeRes)+"   SUITE-"+(data[i].suiteCount-data[i].suiteRes)+"   ' >").text("남은객실 "+data[i].emptyRoom);
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
							$td = $("<td class='sat_day' onclick='detailModal("+data[i].date+","+data[i].superiorCount+","+data[i].deluxeCount+","+data[i].suiteCount+","+data[i].superiorRes+","+data[i].deluxeRes+","+data[i].suiteRes+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+(data[i].superiorCount-data[i].superiorRes)+"  DELUXE-"+(data[i].deluxeCount-data[i].deluxeRes)+"   SUITE-"+(data[i].suiteCount-data[i].suiteRes)+"   '>").text("남은객실 "+data[i].emptyRoom);
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
							$td = $("<td class='sun_day' onclick='detailModal("+data[i].date+","+data[i].superiorCount+","+data[i].deluxeCount+","+data[i].suiteCount+","+data[i].superiorRes+","+data[i].deluxeRes+","+data[i].suiteRes+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+(data[i].superiorCount-data[i].superiorRes)+"  DELUXE-"+(data[i].deluxeCount-data[i].deluxeRes)+"   SUITE-"+(data[i].suiteCount-data[i].suiteRes)+"   '>").text("남은객실 "+data[i].emptyRoom);
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
							$td = $("<td class='normal_day' onclick='detailModal("+data[i].date+","+data[i].superiorCount+","+data[i].deluxeCount+","+data[i].suiteCount+","+data[i].superiorRes+","+data[i].deluxeRes+","+data[i].suiteRes+")'>");
							$innerDiv = $("<span class='roomInfo' data-tooltip-text='SUPERIOR-"+(data[i].superiorCount-data[i].superiorRes)+"  DELUXE-"+(data[i].deluxeCount-data[i].deluxeRes)+"   SUITE-"+(data[i].suiteCount-data[i].suiteRes)+"   '>").text("남은객실 "+data[i].emptyRoom);
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
function detailModal(date,superiorCount,deluxeCount,suiteCount,superiorRes,deluxeRes,suiteRes){
		console.log(date);
		
		$(".loginWrap h1 span").text(date+"일 객실 정보");
		makeGraph(superiorCount-superiorRes,deluxeCount-deluxeRes,suiteCount-suiteRes,superiorRes,deluxeRes,suiteRes);
		layerPopOpen("#loginPop3");
		
	};

function closePopModal(){
	layerPopClose("#loginPop3");
	
};

function makeGraph(superiorCount,deluxeCount,suiteCount,superiorRes,deluxeRes,suiteRes){
	
	$("#superiorAmount").html("");
	$("#deluxeAmount").html("");
	$("#suiteAmount").html("");
	
	// 슈페리어
	var w = 100, h = 100;
		//들어갈수 있는방 없는 방 카운트
	var graphData = [superiorCount,superiorRes];
	var colorData = ["lightgreen", "lightgray"];
	var pie = d3.pie();
	var arc = d3.arc().innerRadius(50).outerRadius(70); 
	
	var svg = d3.select("#superiorAmount")
	.append("svg")
	.attr("width", 170)
	.attr("height", 170)
	.attr("id", "graphWrap");
	
	var g = svg.selectAll(".pie")
	.data(pie(graphData))
	.enter()
	.append("g")
	.attr("class", "pie")
	.attr("transform","translate("+85+","+90+")");
	
	g.append("path")
	.style("fill", function(d, i) {
	return colorData[i];
	}) 
	.transition()
	.duration(500)
	.delay(function(d, i) { 
	return i * 500;
	})
	.attrTween("d", function(d, i) { 
	var interpolate = d3.interpolate(
	    {startAngle : d.startAngle, endAngle : d.startAngle}, 
	    {startAngle : d.startAngle, endAngle : d.endAngle} 
	);
	return function(t){
	    return arc(interpolate(t)); 
	}
	});
	//그래프 안 텍스트
	g.append("text")
	.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
	.attr("dy", ".35em")
	.style("text-anchor", "middle")
	.text(function(d, i) {
	return graphData[i];
	});
	//그래프 중앙 텍스트들
	
	//일단 타입별 입실 가능 갯수 와 총 방 갯수를 var로 받아 .toㄴtring으로 문자열 변환 후 
	//lenth로 길이 세서 if(var.length == 1 or 2 or 3)으로 나눠서 중앙 정렬
	//값 넣어줌 
	
	//남은 방수 카운트 최대 두자릿수까지 이건 자릿수당 translate(-5씩(좌우간격) , 80 고정)
	svg.append("text")
	.attr("class", "total")
	.attr("font-size","18")
	.attr("font-weight","800")
	.attr("transform", "translate("+75+", "+80+")")
	//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	
	//총 방 갯수    최대 3자릿수 까지 if문으로  이건 자릿수당 translate(-5씩(좌우간격) , 90(높이) 고정)
	svg.append("text")
	.attr("class", "total")
	.attr("font-weight","300")
	.attr("transform", "translate("+50+", "+95+")")
	.text("OUT OF " + d3.sum(graphData));
	
	//방 타입 텍스트
	svg.append("text")
	.attr("class", "total")
	.attr("font-size","15")
	.attr("font-weight","600")
	.attr("transform", "translate("+47.5+", "+110+")")
	.text("SUPERIOR");

	
	
	//디럭스 
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [deluxeCount, deluxeRes];
	var colorData = ["lightgreen", "lightgray"];
	var pie = d3.pie();
	var arc = d3.arc().innerRadius(50).outerRadius(70); 
	 
	var svg = d3.select("#deluxeAmount")
    .append("svg")
    .attr("width", 170)
    .attr("height", 170)
    .attr("id", "graphWrap");
	 
	var g = svg.selectAll(".pie")
	    .data(pie(graphData))
	    .enter()
	    .append("g")
	    .attr("class", "pie")
	    .attr("transform","translate("+85+","+90+")");
	 
	g.append("path")
	    .style("fill", function(d, i) {
	        return colorData[i];
	    }) 
	    .transition()
	    .duration(500)
	    .delay(function(d, i) { 
	        return i * 500;
	    })
	    .attrTween("d", function(d, i) { 
	        var interpolate = d3.interpolate(
	            {startAngle : d.startAngle, endAngle : d.startAngle}, 
	            {startAngle : d.startAngle, endAngle : d.endAngle} 
	        );
	        return function(t){
	            return arc(interpolate(t)); 
	        }
	    });
	//그래프 안 텍스트
	g.append("text")
    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text(function(d, i) {
        return graphData[i];
    });
	//그래프 중앙 텍스트들
	//남은 방수 카운트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+75+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
 
 	//총 방 갯수 
	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+50+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));
    
	//방 타입 텍스트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","15")
		.attr("font-weight","600")
		.attr("transform", "translate("+55+", "+110+")")
	.text("DELUXE");
	
	//스위트
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [suiteCount, suiteRes];
	var colorData = ["lightgreen", "lightgray"];
	var pie = d3.pie();
	var arc = d3.arc().innerRadius(50).outerRadius(70); 
	 
	var svg = d3.select("#suiteAmount")
    .append("svg")
    .attr("width", 170)
    .attr("height", 170)
    .attr("id", "graphWrap");
	 
	var g = svg.selectAll(".pie")
	    .data(pie(graphData))
	    .enter()
	    .append("g")
	    .attr("class", "pie")
	    .attr("transform","translate("+85+","+90+")");
	 
	g.append("path")
	    .style("fill", function(d, i) {
	        return colorData[i];
	    }) 
	    .transition()
	    .duration(500)
	    .delay(function(d, i) { 
	        return i * 500;
	    })
	    .attrTween("d", function(d, i) { 
	        var interpolate = d3.interpolate(
	            {startAngle : d.startAngle, endAngle : d.startAngle}, 
	            {startAngle : d.startAngle, endAngle : d.endAngle} 
	        );
	        return function(t){
	            return arc(interpolate(t)); 
	        }
	    });
	//그래프 안 텍스트
	g.append("text")
    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text(function(d, i) {
        return graphData[i];
    });
	
		
	//남은 방수 카운트
 	svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+80+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
 
 	//총 방 갯수 
	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+50+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));
    
	//방 타입 텍스트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","15")
		.attr("font-weight","600")
		.attr("transform", "translate("+62+", "+110+")")
	.text("SUITE");

	
}

</script>

</body>

</html>