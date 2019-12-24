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
 <script src="https://kit.fontawesome.com/95dca4cca1.js" crossorigin="anonymous"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<title>Insert title here</title>
	<style>
	
		#wrapboard{
		
		 margin : 15px auto;
		 text-align :center;
		 width : 1500px;
		 height : 1230px;
		
		}
	
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
		border : 1px solid #9c836a;
		}
		
		.amountGraphDiv{
		 margin :5px auto;
		 width : 180px;
		 height : 180px;
		 border : 1px solid #9c836a;
		}
		.amountGraphDiv:hover{
		 background : lightblue;
		 cursor  : pointer;
		 transition : 0.5s;
		}
		.roomCard{ 
			margin-left : 23px ;
			margin-bottom : 15px;
			float: left;
			border : 1px solid #9c836a;
			 width : 215px;
			 height : 215px;
			 border-radius: 10px;
		}
		.roomcardDiv{
		margin : 9px auto;
		 border : 1px solid #9c836a;
		 width  : 200px;  
		 height : 30px;
		 font-weight: bold;
		 font-size: 12px;
		 color : #575757;
		 border-radius: 3px;
		padding : 5px;
		}
		
		.tdHeight{
			height : 30px
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
			border : 1px solid #9c836a;
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
		
		
		
		
		#wrapCheckBoard{
		 float: left;
		 width : 230px;
		 height : 730px;
		}
		
		[id*='_']{
		 width : 210px;
		 height : 350px;
		}
				
		
		#wrapRoominfo{
		 border : 1px soild white;
		 float: left;
		 width : 1240px;
		 height : 730px;
		}
		
		
		#roomAmount{
		margin-top: 7px;
		border : 1px solid #9c836a;
		 float: left;
		 width : 190px;
		 height : 707px;
		}
		
		
		#wrapInfo{
		 margin :7px;
		 border : 1px solid #9c836a;
		 float: left;
		 width : 1020px;
		 height : 707px;
		}
		#checkHr{
		 width :80%;
		}
		
		#roomBoard{
		 border : 1px solid #9c836a;
		 margin : 0px auto;
		 width : 1000px;
		 height : 340px;
		  overflow:auto;
		}
		#roomicon{
		height : 80px;
	
		}
		#Infosearch{
		 margin-top : 0px;
		 margin-bottom : 0px;
		 width : 1000px;
		 height : 45px;
		}
		#reservationInfo{
		border : 1px solid #9c836a;
		 margin : 0px auto;
		 width : 1000px;
		 height : 260px;
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
		border : 1px solid #9c836a;
		margin : 5px auto;
		width : 180px; 
		height: 80px;
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
		 float:left;
		width : 855px;
		height : 410px;
			
		}
		#selectinfo{
		width : 850px;
	
		}
		
		#selectinfo td{
			height : 25px;
		}
		#roomStatus{
		 float:left;
		width : 330px;
		height : 410px;
		}
		#enterInfo{
		float:left;
		 width : 227px;
		 height : 410px;
		}
		
		#selectRcTable{
		margin : 0px auto;
		width : 320px; 
		}
		
		#selectRcTable td{
			height : 27px;
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
				<div id ="allAmount"><i class="fa fa-refresh fa-fw fa-3x" id='reicon'style ="margin-top : 20px;"></i>  </div>
			</div>
			<div  id = "wrapInfo">
				<div  id="roomBoard">
					<h3 class ="subTitle"> Room Status</h3>
					<hr id ="checkHr">
					
					<c:forEach var="rl" items="${RClist }">
						<div class ="roomCard" id ="${rl.roomNo }"> 
							<div class="roomcardDiv" id="roomNumber"> ${rl.roomNo } </div>
						
							<div  class="roomcardDiv" id="roomType">${rl.roomType }</div>
						
						<c:choose>
							<c:when test="${rl.condition eq 'WAITING'}">
								<div class="roomcardDiv" id="roomicon"> <i class="fas fa-door-open fa-5x"></i> </div>
							</c:when>
							<c:when test="${rl.condition eq 'CLEANING'}">
								<div class="roomcardDiv" id="roomicon"> <i class="fas fa-broom fa-5x"></i> </div>
							</c:when>
							<c:when test="${rl.condition eq 'STAYING'}">
								<div class="roomcardDiv" id="roomicon"> <i class="fas fa-door-closed fa-5x"></i> </div>
							</c:when>
						</c:choose>
							
							
							<c:choose>	
								<c:when test="${rl.condition eq 'WAITING'}">
									<div class ="roomcardDiv" id="cardStatus">입실 대기 중</div>
									<input type ="hidden" value= "WAITING" >
								</c:when>
								<c:when test="${rl.condition eq 'CLEANING'}">
									<div class ="roomcardDiv" id="cardStatus">청소 중</div>
									<input type ="hidden" value= "CLEANING" >
								</c:when>
								<c:when test="${rl.condition eq 'STAYING'}">
									<div class ="roomcardDiv" id="cardStatus">투숙 중</div>
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
					<ul class="pagination  justify-content-center" >
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
		<!-- 하단 DIV -->
		<div class= "roomDiv" id = "RSselectinfo">
			<h3 class ="subTitle">Detailed information</h3>
			
			<hr id ="checkHr">
			<table id ="selectinfo" border = "1px solid black" style= "margin : 0 auto; text-align : left;"> 
			 <tr>
			  	<td style="width : 80px;">예약 번호</td> <td>오프라인 체크인</td> 
			  	<td style="width : 60px;">성함</td> <td style="width : 130px;"><input type ="text"style="width : 120px;" readonly></td> 
			 	 <td style="width : 90px;">이메일 </td> <td style="width : 180px;"><input type="text"style="width : 175px;" readonly></td> 
			 	 <td style="width : 70px;">전화 번호 </td> <td><input type = "text" name="userPhone" style="width : 116px;" readonly></td> 
			  </tr>
			 <tr>
			 	<td>룸 타입 </td><td colspan ="3"> 
			 		<input type="text"style="width : 175px;" readonly>
				</td>
			 		<td>성인 인원</td> <td ><input type = 'text' style="width : 76px" readonly></td>
			 		<td>유아 인원</td> <td ><input type = 'text' style="width : 76px" readonly></td>
			  </tr>
			  <tr>
			   <td > 배드 추가 </td><td colspan ="3"></td> 
					<td>조식 </td><td> <input type = 'text'  style="width : 76px" readonly> </td> 
					<td>석식  </td><td> <input  type = 'text'  style="width : 76px" readonly> </td>
			  </tr>
			  <tr>
			  	<td>체크 인 날짜</td><td colspan="3"><input type="text" id="onSaleDate"  readonly></td>   
			  	<td>체크 아웃 날짜</td><td colspan="3"><input type="text" id="offSaleDate"  readonly></td>
			  </tr>
			  <tr>
			    <td>요금 </td> <td colspan="7"><input type ="text" >
			  </tr>
			  <tr>
			  	<td colspan="8">요청사항</td> 
			  </tr>
			  <tr>
			  	<td colspan="8"><textarea id ="textinfo" rows ="7"style ="width : 100%"> </textArea> </td>
			  </tr>
			</table>
		</div>
		<div class="roomDiv" id = "roomStatus">
			<h3 class ="subTitle">Select Room</h3>
			<hr id ="checkHr">
			<table id ="selectRcTable" border = '1px solid black'>
				<tr>
				 	<td>룸 넘버</td> 
				 	<td id ="selRN">객실을 선택해주세요</td>
				 
				</tr>
				<tr>
					<td colspan='2'>룸 타입</td> 
				</tr>
				<tr>
					<td colspan='2' id ="selRT"> 객실을 선택해주세요</td>
				</tr>
				<tr>
					<td>컨디션</td> 	
					<td id ="selRC"> 객실을 선택해주세요 </td>
				</tr>
				<tr>
					<td>성함</td><td id ="eName"> 객실을 선택해주세요  </td>
				</tr>
				<tr>
					<td colspan='2'>투숙 중 고객 요청 사항</td>
				</tr>
				<tr>
				 	<td colspan='2'><textarea id ='enterRer' rows="7" style='width : 100%; resize : none;' readonly >객실을 선택해주세요</textarea></td> 
				</tr>
			</table>
		</div>
		
		<div class="roomDiv" id = "enterInfo">
			<h3 class ="subTitle">Enter Info</h3>
			<hr id ="checkHr">
			<table id ="enterInfoTable" border ="1px solid black">
				 <tr>
				   <th>입실 대기 중인 방 수</th>
				 </tr>
				 <tr>
				   <th>청소 중인 방 수  </th>
				 </tr>
				 <tr>
				   <th>고객 투숙 중인 방 수 </th>
				 </tr>
			</table>
		
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
						var roomNo = $("<div>").addClass("roomcardDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomType =$("<div>").addClass("roomcardDiv").attr('id','roomType').text(data[i].roomType);
						
						var RoomiconDiv = $("<div>").addClass("roomcardDiv").attr('id','roomicon');	
						
						var cs1 = $("<div>").addClass("roomcardDiv").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("roomcardDiv").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("roomcardDiv").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"STAYING");
						
					    var wicon = $("<icon>").addClass('fas fa-door-open fa-5x');
					    var cicon = $("<icon>").addClass('fas fa-broom fa-5x');
					    var sicon = $("<icon>").addClass('fas fa-door-closed fa-5x');
						
					roomNo.appendTo(div);
					roomType.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						wicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
						
					}else if (data[i].condition == 'CLEANING'){
						cicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						sicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
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
								$('#'+rn[i]).css("background","#8ff799");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","#f4a66d");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","#f2574e");
							}
						}	
					//룸 카드 hover 이벤트 
						$('.roomCard').mouseover(function(){
							
							$(this).css("background", "lightblue");
							
						});
						$('.roomCard').mouseleave(function(){
							if($(this).find("input").val() == "WAITING"){
								$(this).css("background", "#8ff799");
							}else if($(this).find("input").val() == "CLEANING"){
								$(this).css("background", "#f4a66d");
							}else if($(this).find("input").val() == "STAYING"){
								$(this).css("background", "#f2574e");
							}
						});
					
					
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
						var roomNo = $("<div>").addClass("roomcardDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomType =$("<div>").addClass("roomcardDiv").attr('id','roomType').text(data[i].roomType);
						
						var RoomiconDiv = $("<div>").addClass("roomcardDiv").attr('id','roomicon');	
						
						var cs1 = $("<div>").addClass("roomcardDiv").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("roomcardDiv").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("roomcardDiv").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"STAYING");
						
					    var wicon = $("<icon>").addClass('fas fa-door-open fa-5x');
					    var cicon = $("<icon>").addClass('fas fa-broom fa-5x');
					    var sicon = $("<icon>").addClass('fas fa-door-closed fa-5x');
						
					roomNo.appendTo(div);
					roomType.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						wicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
						
					}else if (data[i].condition == 'CLEANING'){
						cicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						sicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
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
								$('#'+rn[i]).css("background","#8ff799");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","#f4a66d");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","#f2574e");
							}
							
						}	
					
						$('.roomCard').mouseover(function(){
							
							$(this).css("background", "lightblue");
							
						});
						$('.roomCard').mouseleave(function(){
							if($(this).find("input").val() == "WAITING"){
								$(this).css("background", "#8ff799");
							}else if($(this).find("input").val() == "CLEANING"){
								$(this).css("background", "#f4a66d");
							}else if($(this).find("input").val() == "STAYING"){
								$(this).css("background", "#f2574e");
							}
						});
					
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
						var roomNo = $("<div>").addClass("roomcardDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomType =$("<div>").addClass("roomcardDiv").attr('id','roomType').text(data[i].roomType);
						
						var RoomiconDiv = $("<div>").addClass("roomcardDiv").attr('id','roomicon');	
						
						var cs1 = $("<div>").addClass("roomcardDiv").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("roomcardDiv").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("roomcardDiv").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"STAYING");
						
					    var wicon = $("<icon>").addClass('fas fa-door-open fa-5x');
					    var cicon = $("<icon>").addClass('fas fa-broom fa-5x');
					    var sicon = $("<icon>").addClass('fas fa-door-closed fa-5x');
						
					roomNo.appendTo(div);
					roomType.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						wicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
						
					}else if (data[i].condition == 'CLEANING'){
						cicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						sicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
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
								$('#'+rn[i]).css("background","#8ff799");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","#f4a66d");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","#f2574e");
							}
							
						}	
					
						$('.roomCard').mouseover(function(){
							
							$(this).css("background", "lightblue");
							
						});
						$('.roomCard').mouseleave(function(){
							if($(this).find("input").val() == "WAITING"){
								$(this).css("background", "#8ff799");
							}else if($(this).find("input").val() == "CLEANING"){
								$(this).css("background", "#f4a66d");
							}else if($(this).find("input").val() == "STAYING"){
								$(this).css("background", "#f2574e");
							}
						});
						
						}
				}
			})
		});
	 //전체 방 보기 클릭
		$('#allAmount').on('click',function(){
			
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
						var roomNo = $("<div>").addClass("roomcardDiv").attr('id','roomNumber').text(data[i].roomNo);
						var roomType =$("<div>").addClass("roomcardDiv").attr('id','roomType').text(data[i].roomType);
						
						var RoomiconDiv = $("<div>").addClass("roomcardDiv").attr('id','roomicon');	
						
						var cs1 = $("<div>").addClass("roomcardDiv").text('입실 대기 중');
						var cs1hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value','WAITING');
						
						var cs2 = $("<div>").addClass("roomcardDiv").text('청소 중');
						var cs2hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"CLEANING");
						
						var cs3 = $("<div>").addClass("roomcardDiv").text('투숙 중');
						var cs3hidden = $("<input>").attr('type','hidden').attr('id','cardStatus').attr('value',"STAYING");
						
					    var wicon = $("<icon>").addClass('fas fa-door-open fa-5x');
					    var cicon = $("<icon>").addClass('fas fa-broom fa-5x');
					    var sicon = $("<icon>").addClass('fas fa-door-closed fa-5x');
						
					roomNo.appendTo(div);
					roomType.appendTo(div);
					
					if (data[i].condition == 'WAITING'){
						wicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs1.appendTo(div);
						cs1hidden.appendTo(div);
						
					}else if (data[i].condition == 'CLEANING'){
						cicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
						cs2.appendTo(div);
						cs2hidden.appendTo(div);
					}else if (data[i].condition == 'STAYING'){
						sicon.appendTo(RoomiconDiv);
						RoomiconDiv.appendTo(div);
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
								$('#'+rn[i]).css("background","#8ff799");
							}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
								$('#'+rn[i]).css("background","#f4a66d");
							}else if($('#'+rn[i]).find('input').val() == "STAYING"){
								$('#'+rn[i]).css("background","#f2574e");
							}
							
						}	
							
						$('.roomCard').mouseover(function(){
							
							$(this).css("background", "lightblue");
							
						});
						$('.roomCard').mouseleave(function(){
							if($(this).find("input").val() == "WAITING"){
								$(this).css("background", "#8ff799");
							}else if($(this).find("input").val() == "CLEANING"){
								$(this).css("background", "#f4a66d");
							}else if($(this).find("input").val() == "STAYING"){
								$(this).css("background", "#f2574e");
							}
						});
					
						
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
				$('#'+rn[i]).css("background","#8ff799");
			}else if($('#'+rn[i]).find('input').val() == "CLEANING"){
				$('#'+rn[i]).css("background","#f4a66d");
			}else if($('#'+rn[i]).find('input').val() == "STAYING"){
				$('#'+rn[i]).css("background","#f2574e");
			}
			
		}	
		
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

 			var clickcheck=false;
 			var roomNum = 0;
 			var roomCon = '';
 			var roomty = '';
 			
 			//클릭시  룸넘버 가져오는 jquery
 			$(document).on('click','.roomCard', function(){
 				clickcheck=true;
 				
 				roomNum = $(this).attr("id");
 				
 				$("input[name=roomNo]").val(roomNum);
 				$(this).css("background" ,"lightblue");
 				
 				$.ajax({
 					url:'selectRoomcard.do',
 					data : { roomNum : roomNum},
 					dataType : 'json',
 					success:function(data){
 						
 						roomCon = data.condition;
 						roomty = data.roomType;
 						
 						
 						$('#roomStatus').html("");
 						$("<h3 class ='subTitle'>Select Room</h3>"
 								+"<hr id ='checkHr'>").appendTo("#roomStatus");
 						
 						var table = $('<table id="selectRcTable" border = "1px solid black" >');
 						var tr1 = $('<tr>');
 						var td1 = $('<td>').text('룸 넘버');;
 						var td2 = $('<td>').text(data.roomNo);
 						
 						var tr2 = $('<tr>');
 						var td3 = $('<td colspan="2">').html('룸 타입');
 						
 						var tr3 = $('<tr>');
 						var td4 = $('<td colspan="2">').html(data.roomType);
 						
 						var tr4 = $('<tr>');
 						var td5 = $('<td>').html('컨디션');
 						
 						if(data.condition == 'WAITING'){
 						
 							var td6	= $('<td>').html('입실 대기중');
 						
 						}else if(data.condition == 'CLEANING'){
 							var td6	= $('<td>').html('청소 중');
 						}else if(data.condition == 'STAYING'){
 							var td6	= $('<td>').html('투숙 중');
 						}
 						
 						var tr5 = $('<tr>');
 						var td7 = $('<td>').html('성함');
 						var td8 = $('<td>').html('더미 값 없음 오류방지');
 						
 						var tr6 = $('<tr>');
 						var td9 = $('<td colspan="2">').html('투숙 중 고객 요청 사항');
 						
 						var tr7 = $('<tr>');
 						var td10 = $('<td colspan="2">')
 						var textarea = $('<textarea id ="enterRer" rows="7" style="width : 100%; resize : none;" >밸류</textarea>');
 						
 						td1.appendTo(tr1);
 						td2.appendTo(tr1);
 						tr1.appendTo(table);
 						
 						td3.appendTo(tr2);
 						tr2.appendTo(table);
 						
 						td4.appendTo(tr3);
 						tr3.appendTo(table);
 						
 						td5.appendTo(tr4);
 						td6.appendTo(tr4);
 						tr4.appendTo(table);
 						
 						td7.appendTo(tr5);
 						td8.appendTo(tr5);
 						tr5.appendTo(table);
 						
 						td9.appendTo(tr6);
 						tr6.appendTo(table);
 						
 						textarea.appendTo(td10);
 						td10.appendTo(tr7);
 						tr7.appendTo(table);
 						
 						
 						table.appendTo("#roomStatus");
 						
 					}
 				});
 			});
 					
		
		
		//클릭시 에약번호 가져오는 jquery
		//그 후 예약번호로 예약정보 가져오기
		var tbRt = '';
		var tbps = '';
		$(document).on('click', '#rdataTR', function(){
			
			var selectRS = $(this).find('input').val();
			
		
			$.ajax({
				url:"selectRs.do",
				data:{rsNumber:selectRS},
				datatype:"json",
				success:function(data){
					
					var checkInday = data.res_checkIn;
					var checkOutday = data.res_checkOut;
					 tbRt = data.res_roomType;
					 tbps = data.res_payStatus;
					
					 $('#RSselectinfo').html("");
					$("<h3 class ='subTitle'>Detail Info</h3>"
							+"<hr id ='checkHr'>").appendTo("#RSselectinfo");
					$("<form action = 'checkIn.do' id ='detailForm'>").appendTo("#RSselectinfo");
					$("<table id ='selectinfo' border = '1px solid black' style= 'margin : 0 auto; text-align : left;'>").appendTo("#detailForm");
					// 테이블 젓번째 줄
					$("<tr id = 'row1'>").appendTo("#selectinfo");
					
					$('<input>').attr('type','hidden').attr('name', 'roomNo').attr('value', '0').appendTo("#selectinfo");
					
					
					$("<td style='width : 80px;'>예약 번호</td>").appendTo("#row1");
					$("<td id ='rsNo'>").html(data.res_no).appendTo("#row1");
					
					$("<td style='width : 70px;'>성함</td>").appendTo("#row1");
					$("<td style='width : 130px;' id ='nameTd'>").appendTo("#row1");
					$("<input>").attr('type','text').attr('value',data.res_userName).attr('name','userName').attr('readonly','true').attr('style',"width:120px").appendTo("#nameTd");
					
					$("<td style='width :  90px;'>이메일 </td>").appendTo("#row1");
					$("<td style='width : 180px;' id ='idTd'>").appendTo("#row1");
					$("<input>").attr('type','text').attr('value',data.res_userId).attr('name','userId').attr('readonly','true').attr('style',"width:175px;").appendTo("#idTd");
					// 전화번호 뽑아와야댐 mapper 조정 예정 
					$("<td style='width : 70px;'>전화 번호 </td>").appendTo("#row1");
					$("<td style='width : 120px;' id ='phoneTd'>").appendTo("#row1");
					$("<input>").attr('type','text').attr('value',data.res_userPhone).css('width','116px').appendTo('#phoneTd');
					//테이블 두번째 줄
					$("<tr id = 'row2'>").appendTo("#selectinfo");
					
		
					$("<td>룸 타입</td>").appendTo("#row2");
					$("<td colspan ='3' id = 'rTypeTd'>").appendTo("#row2");
					$("<input>").attr('id','rType').attr('name','res_roomType').attr('value',data.res_roomType).attr('style',"width:220px;").attr('readonly','true').appendTo("#rTypeTd");
				
					$("<td>성인 인원</td>").appendTo("#row2");
					$("<td id='adultTd'>").appendTo("#row2");
					$("<input>").attr('type','number').attr('name','res_adult').attr('value',data.res_adult).attr('style',"width:76px;").attr('readonly','true').appendTo("#adultTd");
					
					$("<td>유아 인원</td>").appendTo("#row2");
					$("<td id='childTd'>").appendTo("#row2");
					$("<input>").attr('type','number').attr('name','res_child').attr('value',data.res_child).attr('style',"width:76px;").attr('readonly','true').appendTo("#childTd");
					
					//3번째 줄 
					$("<tr id ='row3'>").appendTo("#selectinfo");
			
					$("<td>배드 추가</td>").appendTo('#row3');
					$("<td>").html(data.res_addBed).appendTo('#row3');
				
					$("<td>조식 </td>").appendTo('#row3');
					$("<td id='breakfirstTd'>").appendTo("#row3");
					$("<input>").attr('type','number').attr('name','res_breakfast').attr('value',data.res_breakfast).attr('style',"width:76px;").attr('readonly','true').appendTo("#breakfirstTd");
				
					$("<td>석식 </td>").appendTo('#row3');
					$("<td id ='dinner'>").appendTo("#row3");
					$("<input>").attr('type','number').attr('name','res_dinner').attr('value',data.res_dinner).attr('style',"width:76px;").attr('readonly','true').appendTo("#dinner");
					
					//4번째 줄
					$("<tr id ='row4'>").appendTo("#selectinfo");
					
					$("<td>체크 인 날찌</td>").appendTo("#row4");
					$("<td colspan='3' id='checkInTd'>").appendTo("#row4");
					$("<input>").attr('name','checkIndate').attr('value',data.res_checkIn).attr('readonly','true').appendTo("#checkInTd");
					
					$("<td>체크 아웃 날찌</td>").appendTo("#row4");
					$("<td colspan='3' id='checkOutTd'>").appendTo("#row4");
					$("<input>").attr('name','checkOutdate').attr('value',data.res_checkOut).attr('readonly','true').appendTo("#checkOutTd");
					
					//5번째 줄
					$("<tr id='row5'>").appendTo("#selectinfo");
					
					$("<td>요금 </td>").appendTo("#row5");
					$("<td  colspan='2' id ='payTd'></td>").appendTo("#row5");
					$("<input>").attr('name','checkOutdate').attr('value',data.res_allPay).attr('readonly','true').appendTo("#payTd");
				
					$("<td>입금 상태</td>").appendTo("#row5");
					$("<td id = 'payStatus' colspan ='4'>").appendTo("#row5");
					$("<input>").attr('name','res_payStatus').attr('value',data.res_payStatus).attr('readonly','true').appendTo("#payStatus");
					
					//6번쨎 줄 
					$("<tr id='row6'>").appendTo("#selectinfo");
					$("<td colspan = '8'>요청 사항</td>").appendTo("#row6");
					//7번째 줄 
					$("<tr id='row7'>").appendTo("#selectinfo");
					$("<td colspan = '8' id='taTd'>").appendTo("#row7");
					$("<textarea id ='require'>").html(data.res_require).appendTo("#taTd");
					$('#require').attr('rows', '7').attr('readonly','true').css( 'resize', 'none').css('width','100%');
					$('<input>').attr('type', 'hidden').attr('name', 'res_require').attr('value',data.res_require).appendTo("#taTd");
					
					//8번째 줄
					$("<tr id='row8'>").appendTo("#selectinfo");
					$("<td colspan = '8' id = 'submitTd'>").appendTo("#row8");
					$("<input>").addClass('searchBtn').attr('type','submit').attr('id','checksubmit').attr("onclick","return invalidJoin();").attr('value', '체크인').css('float','right').appendTo("#submitTd");
				}
			});
		});
		
	// 마우스 호버시 색 변경 and 마우스 아웃시 원래 색으 돌리기
		$('.roomCard').mouseover(function(){
			$(this).css("background", "lightblue");
		});
		$('.roomCard').mouseleave(function(){
			if($(this).find("input").val() == "WAITING"){
				$(this).css("background", "#8ff799");
			}else if($(this).find("input").val() == "CLEANING"){
				$(this).css("background", "#f4a66d");
			}else if($(this).find("input").val() == "STAYING"){
				$(this).css("background", "#f2574e");
			}
		});
	
		
		//room status 호버 아이콘 돌리기 
		$('#allAmount').mouseover(function(){
			$('#reicon').removeClass('fa fa-refresh fa-fw fa-3x');
			$('#reicon').addClass('fa fa-refresh fa-spin fa-fw fa-3x');
		});
		
		$('#allAmount').mouseleave(function(){
			$('#reicon').removeClass('fa fa-refresh fa-spin fa-fw fa-3x');
			$('#reicon').addClass('fa fa-refresh fa-fw fa-3x');
		});
		
		
		
		function invalidJoin(){

			if(clickcheck==false){
				alert('객실을 선택해주세요');
				
				
				return false;
			}else {
				if(roomCon == 'CLEANING'){
					
					alert('청소 중인 객실입니다.');
					
					return false;
				}else if (roomCon == 'STAYING'){
					
					alert('투숙 중인 객실입니다.');
					
					return false;
					
				}else {
					
					if(tbRt != roomty){
						alert("예약한 방 타입과 선택한 룸 카드 방타입이 같지 않습니다 .");
						return false;
							//확인
					}else{
							if (tbps == '입금대기'){
								if (confirm("입금 대기 상태입니다. 결제 후 체크인을 진행 해주세요.")){
									return true;
								}else{
									return false;
								}
								
							}
					
				}
				
			}
			}
		}
		
			

		
</script>
</body>
</html>