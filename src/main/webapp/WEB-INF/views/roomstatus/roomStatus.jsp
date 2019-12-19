<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.hotelDelLuna.room.model.vo.Room, java.util.ArrayList"%>
    <%
    	ArrayList<Room> rns = (ArrayList)request.getAttribute("RClist");
    %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://d3js.org/d3.v4.min.js"></script>
<title>Insert title here</title>
	<style>
		#textinfo {
    	resize: none;
		}
		
		.mainTitle{
		 margin-top : 120px;
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
		overflow:auto;
		}
		
		.amountGraphDiv{
		 margin :5px auto;
		 width : 180px;
		 height : 180px;
		 
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
			 width : 150px;
			 height : 170px;
			 border-radius: 10px;
		}
		
		.tdHeight{
			height : 30px
		}
		
		.cardStatus{
			margin : 5px auto; 
			border : 1px solid black; 
			width  : 134px;  
			height : 35px;
		}
		.searchSel{
			margin-left : 0px;
			height:100%;
			float:left;
			outline: none;
		}
		.searchBtn{
			width:45px;
			height:100%;
			border:0px;
			background: #8a7057;
			outline: none;
			float: right;
			color: #ffffff;
		}	
		.resSearchArea{
			display: inline-block;
			height : 40px;
			width: 248px;
			border: 1px solid #8a7057;
			background: #ffffff
		}
		
		.searchBtn:hover{
		   cursor  : pointer;
		}
		#searchValue{
		  font-size:16px;
		  width:125px;
		  padding:5px;
		  padding-top:10px;	
	      border:0px;
		  outline:none;
		  float:left;
		}
		
		#wrapboard{
		 margin : auto;
		 text-align :center;
		 width : 1500px;
		 height : 1200px;
		}
		#wrapCheckBoard{
		 float: left;
		 width : 230px;
		 height : 750px;
		}
		
		#wrapRoominfo{
		 border : 1px soild white;
		 float: left;
		 width : 1240px;
		 height : 750px;
		}
		
		[id*='_']{
		 width : 210px;
		 height : 350px;
		}
		
		#roomAmount{
		 float: left;
		 width : 190px;
		 height : 730px;
		}
		
		#roomBoard{
		margin : 0px auto;
		overflow:auto;
		  height : 360px;
		}
		#wrapInfo{
		 float: left;
		 width : 1020px;
		 height : 730px;
		}
		#checkHr{
		 width :80%;
		}
		#roomBoard{
		 margin-top : 0px;
		 margin-bottom : 0px;
		 width : 1000px;
		 height : 360px;
		}
		#roomicon{
		height : 85px;
	
		}
		#Infosearch{
		 margin-top : 0px;
		 margin-bottom : 0px;
		 width : 1000px;
		 height : 53px;
		}
		#reservationInfo{
		 margin-top : 0px;
		 margin-bottom : 0px;
		 width : 1000px;
		 height : 240px;
		}
		
		#pagediv{
			height : 35px;
		}
		
		#infoTable{
		 margin : 0px auto;
		 width: 950px;
		}
		
		#infoTableTh{
		background : gray;
		color : white;
		}
		#allAmount{
		margin : 5px auto;
		width : 180px; 
		height: 40px;
		}
		#allAmount:hover{
		 background : lightblue;
		 cursor  : pointer;
		 transition : 0.5s;
		}
		#rdataTR:hover{
			background : lightgray;
			cursor  : pointer;
		}
		.trclick{
		background : lightgray;
		}
		
		#RSselectinfo{
		width : 855px;
		height : 430px;
			
		}
		#selectinfo{
		width : 850px;
		heght : 440px;
		}
		
	</style>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
   <h1 class="mainTitle" >Room status</h1>
   <hr>
	<div id="wrapboard">
		<div id="wrapCheckBoard">
			<div  class="roomDiv" id ='Check_inDiv'>
				<h3 class ="subTitle">Welcome</h3>
				<hr id ="checkHr">
			
				
			</div>
			<div  class="roomDiv" id ="Check_outDiv">
				<h3 class ="subTitle">See Off</h3>
				<hr id = "checkHr">
			
			</div>
		</div>
		
		<div id="wrapRoominfo">
		
			<div id ="roomAmount">
				<h3 class ="subTitle" >roomAmount</h3>
				<hr id ="checkHr">
				
				<div class="amountGraphDiv" id= "superiorAmount">
				</div>
				
				<div class="amountGraphDiv" id= "deluxeAmount">
				</div>
				
				<div class="amountGraphDiv" id= "suiteAmount">
				</div>
				<div id ="allAmount" style=" "> 전체 방 상태</div>
			</div>
			<div  id = "wrapInfo">
				<div  id="roomBoard">
					<h3 class ="subTitle"> Room Status</h3>
					<hr id ="checkHr">
					
					<c:forEach var="rl" items="${RClist }">
						<div class ="roomCard" id ="${rl.roomNo }"> 
							<div class="roomDiv" id="roomNumber"> ${rl.roomNo } </div>
							<div class="roomDiv" id="roomicon" style = "height : 85px;"> 상태 아이콘 </div>
							<c:choose>	
								<c:when test="${rl.condition eq 'WAITING'}">
									<div class="cardStatus">입실 대기 중</div>
									<input type ="hidden" value= "WAITING" >
								</c:when>
								<c:when test="${rl.condition eq 'CLEANING'}">
									<div class="cardStatus">청소 중</div>
									<input type ="hidden" value= "CLEANING" >
								</c:when>
								<c:when test="${rl.condition eq 'STAYING'}">
									<div class="cardStatus">투숙 중</div>
									<input type ="hidden" value= "STAYING" >
								</c:when>
							</c:choose>
						</div>
					</c:forEach>
				
				</div>
				<div id="Infosearch">
					<div align="right" style="margin-top:5px; margin-right:10px">
					<div class="resSearchArea"  align="center" >
					<select id="searchCondition" class="searchSel" name="category"  style="min-height:10px;display:inline">
						<option value="none">-----</option>
						<option value="userName">예약자</option>
						<option value="userId">아이디</option>
						<option value="userPhone">이메일</option>		
					</select>
					<input type="text" name="searchValue" id="searchValue" style="display:inline">

					<button class="searchBtn" onclick="searchResList()">검색</button>
					</div>
					</div> 
				</div>
				<div id="reservationInfo">
					<h3 class ="subTitle">Reservation Info</h3>
					<hr id ="checkHr">
					<table id = "infoTable" border ="1px solid black">
						<tr id = "infoTableTh">
							<th style ="width : 65px">예약 번호</th>
							<th style ="width : 80px">이름</th>
							<th style ="width : 200px">룸 타입</th>
							<th style ="width : 40px">인원</th>
							<th style ="width : 110px">체크인 날짜</th>
							<th style ="width : 110px">체크아웃 날짜</th>
							<th style ="width : 180px">선택 옵션</th>
							<th style ="width : 90px">입금 상태</th>
							<th>요청 사항</th>
						</tr>
						<c:forEach var="rsl" items= "${rlist }">
						 	 <tr id="rdataTR">
								<td class = "tdHeight ">${rsl.res_no}
									<input type ="hidden" value="${rsl.res_no}"> </td>
								<td>${rsl.res_userName}</td>
								<td>${rsl.res_roomType}</td>
								<td>
								 	${rsl.res_adult+rsl.res_child }
								</td>
								<td>${rsl.res_checkIn}</td>
								<td>${rsl.res_checkOut}</td>
								<td>배드추가:${rsl.res_addBed } , 조식 : ${rsl.res_breakfast }, 석식 : ${rsl.res_dinner }</td>
								<td>${rsl.res_payStatus }</td>
							<c:choose>
							<c:when test="${!empty rsl.res_require }">
								<td> O </td>
						   </c:when>
						   <c:when test="${empty rsl.res_require }">
								<td> x</td>
						   </c:when>
							</c:choose> 
				  		 	</tr>
						</c:forEach >						
					</table>
				</div>
				<!-- 페이징 부분 -->	
				<div class="pagingArea" align="center" style="margin : 0px auto;">
					<ul class="pagination  justify-content-center">
						<li class='page-item'>
							<c:url var="rslistBack" value="/roomstatus.do">
	 						<c:param name="page" value="${pi.startPage }"/>
	 						</c:url>
						 		<a class='page-link' href="${ rslistBack}">&lt;&lt;</a>
						</li>
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<li class='page-item active'>
											<a class='page-link' class='page-link'>${p} </a>
										</li>
									</c:if>
										
							<c:if test="${p ne pi.currentPage }">
	 							<c:url var="blistCheck" value="roomstatus.do">
	 								<c:param name="page" value="${p }"/>
	 							</c:url>
	 							<li class='page-item'>
	 								<a class='page-link' href="${blistCheck }">${p }</a>
	 							</li>
	 						</c:if>
						</c:forEach>
					
						<c:if test="${pi.currentPage <= pi.maxPage }">
	 					<c:url var="rslistEnd" value="roomstatus.do">
	 						<c:param name="page" value="${pi.endPage }"/>
	 					</c:url>
	 					<li class='page-item'>
	 						<a class='page-link' href="${rslistEnd }">&gt;&gt;</a>
	 					</li>
	 				</c:if>
					
					</ul>		
				</div>
			</div>
		</div>
		
		<div class= "roomDiv" id = "RSselectinfo">
			<h3 class ="subTitle">Detailed information</h3>
			<hr id ="checkHr">
		<form>
			<table id ="selectinfo" border = "1px solid black" style= "margin : 0 auto; text-align : left;"> 
			 <tr>
			  	<td style="width : 90px;">예약 번호</td> <td>11</td> 
			  	<td style="width : 120px;">성함</td> <td style="width : 130px;"><input type ="text" style="width : 120px;"></td> 
			 	 <td style="width : 60px;">이메일 </td> <td style="width : 130px;"><input type="text" style="width : 120px;"></td> 
			 	 <td style="width : 70px;">전화 번호 </td> <td><input type = "text" style="width : 120px;"></td> 
			  </tr>
			 <tr>
			 	<td>룸 타입 </td><td colspan ="2"> 
			 	<select name = "manualCiry">
			 			<optgroup label="슈페리어">
							<option value="SUPERIOR">슈페리어</option>
							<option value="SUPERIOR_TERRACE">슈페리어 테라스</option>
						</optgroup>
						<optgroup label="디럭스">
							<option value="DELUXE">디럭스</option>
							<option value="DELUXE_GRAND">그랜드 디럭스</option>
							<option value="DELUXE_PREMIUM">프리미엄 디럭스</option>
							<option value="DELUXE_PREMIUM_TERRACE">프리미엄 디럭스 테라스</option>
						</optgroup>
						<optgroup label="스위트">
							<option value="SUITE_JUNIOR">주니어 스위트</option>
							<option value="SUITE_DELUXE">디럭스 스위트</option>
							<option value="SUITE_GRAND_DELUXE">그랜드 디럭스 스위트</option>
							<option value="SUITE_ROYAL">로열 스위트</option>
						</optgroup>
					</select>
					<td>
			 		<td>인원</td> <td colspan="3"><input type ="number" min=1 max=10 value=2 name="capacity"></td>
			 </tr>
			  <tr>
			   <td> 배드 추가 </td> <td ><input type="radio" name="addBed" value="Y">Y 
					<input type="radio" name="addBed" value="N" checked="checked">N</td>
					<td>조식 </td><td> <input type="number" min=0 max=10 value=0 > </td> 
					<td>석식  </td><td colspan="3"> <input type="number" min=0 max=10 value=0> </td>
			  </tr>
			  <tr>
			  	<td >체크 인 날짜</td><td colspan="2"><input type="text" id="onSaleDate"  name="startDay" readonly></td>   
			  	<td>체크 아웃 날짜</td><td colspan="4"><input type="text" id="offSaleDate"  name="endDay" readonly></td>
			  </tr>
			  <tr>
			  <td>요금 </td> <td colspan="7"><input type ="text">
			  </tr>
			  <tr>
			  	<td colspan="8">요청사항</td> 
			  </tr>
			  <tr>
			  	<td colspan="8"><textarea id ="textinfo" cols = "137" rows = "6" > </textArea> </td>
			  </tr>
			  <tr>
			 	 <td colspan="8"> <input type="submit" id="submit" value="오프라인 체크 인" style= "float : right;"></td>
			  </tr>
			</table>
			
		</form>
		</div>
	</div>
	
<!-- 그래프용 스크립트 -->
<script>
	//슈페리어 
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [${SClist[0].waitingCount},${SClist[0].cleaningCount}+${SClist[0].stayingCount}];
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
	//슈페리어 숫자 글자 갯수
	var spwcstr = ${SClist[0].waitingCount};
	spwcstr = spwcstr.toString();
	var spallstr = d3.sum(graphData);
	spallstr = spallstr.toString();
	//일단 타입별 입실 가능 갯수 와 총 방 갯수를 var로 받아 .tostring으로 문자열 변환 후 
	//lenth로 길이 세서 if(var.length == 1 or 2 or 3)으로 나눠서 중앙 정렬
	//값 넣어줌 
	
	//남은 방수 카운트 최대 두자릿수까지 이건 자릿수당 translate(-6씩(좌우간격) , 80 고정)
	if( spwcstr.length == 1){
		svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+82+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}
	if(spwcstr.length == 2){
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+76+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}else if(spwcstr.length == 3){
		svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+70+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}
 
 	//총 방 갯수    최대 3자릿수 까지 if문으로  이건 자릿수당 translate(-2씩(좌우간격) , 90(높이) 고정)
	if(spallstr.length == 2) {
 	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+50+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));		
	}else if(spallstr.length == 3){
		 	svg.append("text")
		    	.attr("class", "total")
		    	.attr("font-weight","300")
		    	.attr("transform", "translate("+47.5+", "+95+")")
		    .text("OUT OF " + d3.sum(graphData));		
	}
 	
	//방 타입 텍스트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","15")
		.attr("font-weight","600")
		.attr("transform", "translate("+45.5+", "+110+")")
	.text("SUPERIOR");


	//디럭스 
	var w = 100, h = 100;
				//들어갈수 있는방 없는 방 카운트
	var graphData = [${SClist[1].waitingCount},${SClist[1].cleaningCount}+${SClist[1].stayingCount}];
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
	
	//디럭스 숫자 갯수
	var spwcstr = ${SClist[1].waitingCount};
	spwcstr = spwcstr.toString();
	var spallstr = d3.sum(graphData);
	spallstr = spallstr.toString();
	
	//그래프 안 텍스트
	g.append("text")
    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text(function(d, i) {
        return graphData[i];
    });
	
	//남은 방수 카운트 최대 두자릿수까지 이건 자릿수당 translate(-6씩(좌우간격) , 80 고정)
	if(spwcstr.length == 1){
		svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+82+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}
	
	if(spwcstr.length == 2){
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+76+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}else if(spwcstr.length == 3){
		svg.append("text")
		.attr("class", "total") 
		.attr("font-size","18")
		.attr("font-weight","800")
		.attr("transform", "translate("+70+", "+80+")")
		//들어갈 수있는 방의 수 배열로 꺼내와
	.text(graphData[0]);
	}
 
 	//총 방 갯수    최대 3자릿수 까지 if문으로  이건 자릿수당 translate(-2.5씩(좌우간격) , 90(높이) 고정)
	if(spallstr.length == 2) {
 	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+50+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));		
	}else if(spallstr.length == 3){
		svg.append("text")
		    .attr("class", "total")
		   .attr("font-weight","300")
		   .attr("transform", "translate("+47.5+", "+95+")")
		.text("OUT OF " + d3.sum(graphData));		
	}
    
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
	var graphData = [${SClist[2].waitingCount},${SClist[2].cleaningCount}+${SClist[2].stayingCount}];
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
	
	
	//스위트 숫자 갯수
	var spwcstr = ${SClist[2].waitingCount};
	spwcstr = spwcstr.toString();
	var spallstr = d3.sum(graphData);
	spallstr = spallstr.toString();
	
	
	//그래프 안 텍스트
	g.append("text")
    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text(function(d, i) {
        return graphData[i];
    });
	
		
	if(spwcstr.length == 1){
		svg.append("text")
			.attr("class", "total")
			.attr("font-size","18")
			.attr("font-weight","800")
			.attr("transform", "translate("+80+", "+80+")")
			//들어갈 수있는 방의 수 배열로 꺼내와
		.text(graphData[0]);
		}else if(spwcstr.length == 2){
			svg.append("text")
			.attr("class", "total")
			.attr("font-size","18")
			.attr("font-weight","800")
			.attr("transform", "translate("+76+", "+80+")")
			//들어갈 수있는 방의 수 배열로 꺼내와
		.text(graphData[0]);
		}
	//총 방 갯수    최대 3자릿수 까지 if문으로  이건 자릿수당 translate(-2.5씩(좌우간격) , 90(높이) 고정)
	if(spallstr.length == 1) {
 	svg.append("text")
    	.attr("class", "total")
    	.attr("font-weight","300")
    	.attr("transform", "translate("+52.5+", "+95+")")
    .text("OUT OF " + d3.sum(graphData));		
	}else if(spallstr.length == 2){
		svg.append("text")
		    .attr("class", "total")
		   .attr("font-weight","300")
		   .attr("transform", "translate("+50+", "+95+")")
		.text("OUT OF " + d3.sum(graphData));		
	}
    
	//방 타입 텍스트
	svg.append("text")
		.attr("class", "total")
		.attr("font-size","15")
		.attr("font-weight","600")
		.attr("transform", "translate("+62+", "+110+")")
	.text("SUITE");
	

	</script>
	
	
	
	<!-- amountdiv 클릭시 ajax로 불러오기 -->
<script>

	//슈페리어 클릭
		$('#superiorAmount').on('click',function(){
			
			$('#superiorAmount').css("background","lightblue");
			$('#deluxeAmount').css("background","white");
			$('#suiteAmount').css("background","white");
			$('#allAmount').css("background","white");
			
			$.ajax({
				url:"RoomTypeClick.do",
				data:{roomType:"SUPERIOR"},
				datatype:"json",
				success:function(data){
					
					$('#roomBoard').html("");
					
					$("#roomBoard").animate({ scrollTop: 0 }, "fast");
					
					$("<h3 class ='subTitle'>SUPERIOR</h3>" + "<hr id ='checkHr'>").appendTo("#roomBoard");
					
					for(var i in data) {
						
						var div = $("<div>").addClass("roomCard").attr('id',data[i].roomNo);
						var roomNo = $("<div>").addClass("roomDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomicon = 	$("<div>").addClass("roomDiv").attr('id','roomicon').text('상태 아이콘');	
						
						var cs1 = $("<div>").addClass("cardStatus").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("cardStatus").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("cardStatus").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('value',"STAYING");
						
					roomNo.appendTo(div);
					roomicon.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
					}else if (data[i].condition == 'CLEANING'){
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						cs3.appendTo(div);
						cs3hidden.appendTo(div);
					}
						div.appendTo("#roomBoard");
					
					//ajax로 불러온 div들 색 지정
						var rn = [];
						 <%for(int i=0; i< rns.size(); i++){%>
							rn[<%=i%>] = <%=rns.get(i).getRoomNo()%>;
						<%}%>
											
						for(var i = 0 ; i < rn.length ; i ++ ) {
							if($('#'+rn[i]).find('input').val() == "WAITING"){
								$('#'+rn[i]).css("background","lightgreen");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","orange");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","red");
							}
							
						}	
					
					}
					
				}
			})
		});
		
	//디럭스 클릭
		$('#deluxeAmount').on('click',function(){
			
			$('#superiorAmount').css("background","white");
			$('#deluxeAmount').css("background","lightblue");
			$('#suiteAmount').css("background","white");
			$('#allAmount').css("background","white");
			
			$.ajax({
				url:"RoomTypeClick.do",
				data:{roomType:"DELUXE"},
				datatype:"json",
				success:function(data){
					var rn = [];
			 		 
					$('#roomBoard').html("");
					
					$("#roomBoard").animate({ scrollTop: 0 }, "fast");
					
					$("<h3 class ='subTitle'>DELUXE</h3>"
					+"<hr id ='checkHr'>").appendTo("#roomBoard");
					
					for(var i in data) {
						
						var div = $("<div>").addClass("roomCard").attr('id',data[i].roomNo);
						var roomNo = $("<div>").addClass("roomDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomicon = 	$("<div>").addClass("roomDiv").attr('id','roomicon').text('상태 아이콘');	
						
						var cs1 = $("<div>").addClass("cardStatus").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("cardStatus").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("cardStatus").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('value',"STAYING");
						
					roomNo.appendTo(div);
					roomicon.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
					}else if (data[i].condition == 'CLEANING'){
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						cs3.appendTo(div);
						cs3hidden.appendTo(div);
					}
						div.appendTo("#roomBoard");
						
						<%for(int i=0; i< rns.size(); i++){%>
							rn[<%=i%>] = <%=rns.get(i).getRoomNo()%>;
						<%}%>
						
						for(var i = 0 ; i < rn.length ; i ++ ) {
							if($('#'+rn[i]).find('input').val() == "WAITING"){
								$('#'+rn[i]).css("background","lightgreen");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","orange");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","red");
							}
							
						}	
						}
					
				}
			})
	 	});
	 //스위트 클릭
		$('#suiteAmount').on('click',function(){

			$('#superiorAmount').css("background","white");
			$('#deluxeAmount').css("background","white");
			$('#suiteAmount').css("background","lightblue");
			$('#allAmount').css("background","white");
			
			$.ajax({
				url:"RoomTypeClick.do",
				data:{roomType:"SUITE"},
				datatype:"json",
				success:function(data){
			
					$('#roomBoard').html("");
					
					$("#roomBoard").animate({ scrollTop: 0 }, "fast");
					
					$("<h3 class ='subTitle'>SUITE</h3>"
					+"<hr id ='checkHr'>").appendTo("#roomBoard");
					
					for(var i in data) {
						
						var div = $("<div>").addClass("roomCard").attr('id',data[i].roomNo);
						var roomNo = $("<div>").addClass("roomDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomicon = 	$("<div>").addClass("roomDiv").attr('id','roomicon').text('상태 아이콘');	
						
						var cs1 = $("<div>").addClass("cardStatus").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("cardStatus").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("cardStatus").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('value',"STAYING");
						
					roomNo.appendTo(div);
					roomicon.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
					}else if (data[i].condition == 'CLEANING'){
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						cs3.appendTo(div);
						cs3hidden.appendTo(div);
					}
						div.appendTo("#roomBoard");

						var rn = [];
						 <%for(int i=0; i< rns.size(); i++){%>
							rn[<%=i%>] = <%=rns.get(i).getRoomNo()%>;
						<%}%>
			
						for(var i = 0 ; i < rn.length ; i ++ ) {
							if($('#'+rn[i]).find('input').val() == "WAITING"){
								$('#'+rn[i]).css("background","lightgreen");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","orange");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","red");
							}
							
						}	
							
						}
				}
			})
		});
	 //전체 방 보기 클릭
		$('#allAmount').on('click',function(){
			
			$('#allAmount').css("background","lightblue");
			$('#superiorAmount').css("background","white");
			$('#deluxeAmount').css("background","white");
			$('#suiteAmount').css("background","white");
			
			$.ajax({
				url:"RoomTypeClick.do",
				data:{roomType:"ALL"},
				datatype:"json",
				success:function(data){
					$('#roomBoard').html("");
					
					$("#roomBoard").animate({ scrollTop: 0 }, "fast");
					
					$("<h3 class ='subTitle'>Room Status</h3>"
					+"<hr id ='checkHr'>").appendTo("#roomBoard");
					
					for(var i in data) {
						
						var div = $("<div>").addClass("roomCard").attr('id',data[i].roomNo);
						var roomNo = $("<div>").addClass("roomDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomicon = 	$("<div>").addClass("roomDiv").attr('id','roomicon').text('상태 아이콘');	
						
						var cs1 = $("<div>").addClass("cardStatus").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("cardStatus").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("cardStatus").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('value',"STAYING");
						
					roomNo.appendTo(div);
					roomicon.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
					}else if (data[i].condition == 'CLEANING'){
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						cs3.appendTo(div);
						cs3hidden.appendTo(div);
					}
						div.appendTo("#roomBoard");
						
						
						var rn = [];
						 <%for(int i=0; i< rns.size(); i++){%>
							rn[<%=i%>] = <%=rns.get(i).getRoomNo()%>;
						<%}%>

						
						for(var i = 0 ; i < rn.length ; i ++ ) {
							if($('#'+rn[i]).find('input').val() == "WAITING"){
								$('#'+rn[i]).css("background","lightgreen");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","orange");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","red");
							}
							
						}	
							
						}
				}
			})
		});
		
 	$(function(){
 		 var rn = [];
 		 
		 <%for(int i=0; i< rns.size(); i++){%>
			rn[<%=i%>] = <%=rns.get(i).getRoomNo()%>;
		<%}%>
		
		for(var i = 0 ; i < rn.length ; i ++ ) {
			if($('#'+rn[i]).find('input').val() == "WAITING"){
				$('#'+rn[i]).css("background","lightgreen");
			}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
				$('#'+rn[i]).css("background","orange");
			}else if($('#'+rn[i]).find('input').val() == "STAYING"){
				$('#'+rn[i]).css("background","red");
			}
			
		}	
		
 	});
		//클릭시  룸넘버 가져오는 jquery
 			$(document).on('click','.roomCard', function(){
 					alert($(this).attr("id"));
 				
 			});
		//테이블 클릭시 백그라운드 변경 
 			$(document).ready(function () {
 	            $("#infoTable").on("click", "tr", function() {
 	                if (!$(this).is($("tr").eq(0))) { //첫 행 제외
 	                    $("table tr").removeAttr("style");
 	                    $(this).css("background", "lightgray");
 	                
 	                }
 	            });
 	        });

		
		//클릭시 에약번호 가져오는 jquery
		$(document).on('click', '#rdataTR', function(){
			
			var selectRS = $(this).find('input').val();
			$.ajax({
				url:"selectRs.do",
				data:{rsNumber:selectRS},
				datatype:"json",
				success:function(data){
					
					$('#RSselectinfo').html("");
					
					
				 
				}
		
 			});
		});
		
		//캘린더 DATEPICKER 사용
	     $(function() {
               //datepicker 한국어로 사용하기 위한 언어설정
               $.datepicker.setDefaults($.datepicker.regional['ko']); 
               // 시작일(onSaleDate)은 종료일(offSaleDate) 이후 날짜 선택 불가
               // 종료일(offSaleDate)은 시작일(onSaleDate) 이전 날짜 선택 불가
               //시작일.
               $('#onSaleDate').datepicker({
                   showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                   buttonImage: "resources/images/calendarIcon.png", // 버튼 이미지
                   buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                   //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                   dateFormat: "yy-mm-dd",             // 날짜의 형식
                   changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                   minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                   onClose: function( selectedDate ) {    
                       // 시작일(onSaleDate) datepicker가 닫힐때
                       // 종료일(offSaleDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                       $("#offSaleDate").datepicker( "option", "minDate", selectedDate );
                   }                
               });
               //종료일
               $('#offSaleDate').datepicker({
                   showOn: "both", 
                   buttonImage: "resources/images/calendarIcon.png", 
                   buttonImageOnly : true,
                   // buttonText: "날짜선택",
                   dateFormat: "yy-mm-dd",
                   changeMonth: true,
                   //minDate: 0, // 오늘 이전 날짜 선택 불가
                   onClose: function( selectedDate ) {
                       // 종료일(offSaleDate) datepicker가 닫힐때
                       // 시작일(onSaleDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                       $("#onSaleDate").datepicker( "option", "maxDate", selectedDate );
                   }                
               });
           });
</script>
</body>
</html>