<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://d3js.org/d3.v4.min.js"></script>
<title>Insert title here</title>
	<style>
		
		.mainTitle{
		 margin-top : 150px;
		 text-align :center;
		 font-size : 30px;
		}
		.subTitle{
		font-size :17px;
		margin : 8px auto;
		text-align : center;
		}
		.roomDiv{
		margin : 7px;
		border : 1px solid black;
		overflow:auto
		}
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
		.roomCard{ 
			margin : 5px;
			float: left;
			 border : 1px solid black;
			 width : 140px;
			 height : 150px;
			 border-radius: 10px;
		}
		#wrapboard{
		 margin : auto;
		 text-align :center;
		 width : 1500px;
		 height : 700px;
		}
		#wrapCheckBoard{
		 float: left;
		 width : 230px;
		 height : 680px;
		}
		[id*='_']{
		 width : 210px;
		 height : 325px;
		}
		#wrapRoominfo{
		 float: left;
		 width : 1230px;
		 height : 680px;
		}
		#roomAmount{
		 float: left;
		 width : 190px;
		 height : 660px;
		}
		#wrapInfo{
		 float: left;
		 width : 980px;
		 height : 660px;
		}
		#checkHr{
		 width :80%;
		}
		#roomBoard{
		 width : 960px;
		 height : 340px;
		}
		#Infosearch{
		 width : 960px;
		 height : 30px;
		}
		#reservationInfo{
		 width : 960px;
		 height : 255px;
		}
		#infoTableTh{
		background : gray;
		color : white;
		}
	</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
   <h1 class="mainTitle" >Room status</h1>
   <hr>
	<div class="roomDiv" id="wrapboard">
		<div class="roomDiv" id="wrapCheckBoard">
			<div class="roomDiv" id ='Check_inDiv'>
				<h3 class ="subTitle">Welcome</h3>
				<hr id ="checkHr">
				check in시 ajax로 업데이트 (이름 객실 날짜 시간)
				
			</div>
			<div class="roomDiv" id ="Check_outDiv">
				<h3 class ="subTitle">See Off</h3>
				<hr id = "checkHr">
				check in시 ajax로 업데이트 (이름 객실 날짜 시간)
			</div>
		</div>
		
		<div class="roomDiv" id="wrapRoominfo">
		
			<div class="roomDiv" id ="roomAmount">
				<h3 class ="subTitle" >roomAmount</h3>
				<hr id ="checkHr">
				
				<div class="amountGraphDiv" id= "superiorAmount">
				</div>
				<div class="amountGraphDiv" id= "deluxeAmount">
				</div>
				<div class="amountGraphDiv" id= "suiteAmount">
				</div>
			</div>
			<div  class="roomDiv" id = "wrapInfo">
				<div  class="roomDiv" id="roomBoard">
					<h3 class ="subTitle">SUITE</h3>
					<hr id ="checkHr">
					<div class ="roomCard" id = "roomnumber1"> </div>
					<div class ="roomCard" id = "roomnumber2"> </div>
					<div class ="roomCard" id = "roomnumber3"> </div>
					<div class ="roomCard" id = "roomnumber4"> </div>
					<div class ="roomCard" id = "roomnumber5"> </div>
					<div class ="roomCard" id = "roomnumber6"> </div>
					<div class ="roomCard" id = "roomnumber7"> </div>
					<div class ="roomCard" id = "roomnumber8"> </div>
					<div class ="roomCard" id = "roomnumber9"> </div>
					<div class ="roomCard" id = "roomnumber10"> </div>
					
				</div>
				<div  class="roomDiv" id="Infosearch">
					search
				</div>
				<div class="roomDiv" id="reservationInfo">
					<h3 class ="subTitle">Reservation Info</h3>
					<hr id ="checkHr">
					<table id = "infoTable" border ="1px solid black">
						<tr id = "infoTableTh">
							<th style ="width : 70px">예약 번호</th>
							<th style ="width : 80px">이름</th>
							<th style ="width : 205px">룸 타입</th>
							<th style ="width : 40px">인원</th>
							<th style ="width : 150px">선택 옵션</th>
							<th style ="width : 90px">입금 상태</th>
							<th>요청 사항</th>
						</tr>
						<tr>
							<td>1</td><td>신 재혁</td> <td>DELUXE_SUITE</td><td>10</td><td>배드추가:N , 흡연객실:Y</td><td>입금 대기</td><td> O </td>
						</tr>
						<tr>
							<td>2</td><td>Robert John Downey Jr.</td> <td>PREMIUM_DELUXE_TERRACE</td><td>10</td><td>배드추가:N , 흡연객실:Y</td><td>입금 완료</td><td> O </td>
						</tr>
						<tr>
							<td>3</td><td>신 재혁</td> <td>DELUXE_SUITE</td><td>10</td><td>배드추가:N , 흡연객실:Y</td><td>입금 대기</td><td> X</td>
						</tr>
						<tr>
							<td>4</td><td>신 재혁</td> <td>DELUXE_SUITE</td><td>10</td><td>배드추가:N , 흡연객실:Y</td><td>입금 대기</td><td> X </td>
						</tr>
						<tr>
							<td>5</td><td>신 재혁</td> <td>DELUXE_SUITE</td><td>10</td><td>배드추가:N , 흡연객실:Y</td><td>입금 완료</td><td> O </td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
	</div>
<!-- 그래프용 스크립트 -->
<script>
	//슈페리어 
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [125, 15];
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
		.attr("transform", "translate("+70+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
 
 	//총 방 갯수    최대 3자릿수 까지 if문으로  이건 자릿수당 translate(-5씩(좌우간격) , 90(높이) 고정)
	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+47.5+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));
    
	//방 타입 텍스트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","15")
		.attr("font-weight","600")
		.attr("transform", "translate("+47+", "+110+")")
	.text("SUPERIOR");
	
	
	//디럭스 
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [12, 8];
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
	var graphData = [8, 2];
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

	</script>
	
</body>
</html>