<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100)
	;

body {
	font-family: "Roboto", helvetica, arial, sans-serif;
	font-weight: 400;
	text-rendering: optimizeLegibility;
}



/*** Table Styles **/
.table-fill {

	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	height: auto;
	margin-right: auto;
	max-width: 600px;
	width: 100%;
	padding: 5px;
	margin-left: 20px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

.table-fill  th {
	color: #D5DDE5;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 15px;
	font-weight: 100;
	padding: 10px;

	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

.table-fill  th:first-child {
	border-top-left-radius: 3px;
}

.table-fill  th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

.table-fill  tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 13px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

.table-fill  tr:hover td {
	cursor: pointer;
	background: #4E5066;
	color: #FFFFFF;
	border-top: 1px solid #22262e;
}

.table-fill  tr:first-child {
	border-top: none;
}

.table-fill  tr:last-child {
	border-bottom: none;
}

.table-fill  tr:nth-child(odd) td {
	background: #EBEBEB;
}

.table-fill  tr:nth-child(odd):hover td {
	background: #4E5066;
}

.table-fill  tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

.table-fill  tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

.table-fill  td {
	background: #FFFFFF;
	padding: 8px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 13;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
}

.resInsertForm{
	background: lightgray;

}



/** 탭 메뉴 관련 css **/

.tabmenu{ 
  max-width:600px; 
  position:relative; 
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input ~ label{
	cursor:pointer;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}

/** 검색 영역 관련 css **/
.resSearchArea{
	display: inline-block;
	height : 40px;
	width: 248px;
	border: 1px solid #17a2b8;
	background: #ffffff
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
.searchBtn{
	width:45px;
	height:100%;
	border:0px;
	background: #17a2b8;
	outline: none;
	float: right;
	color: #ffffff;
}
.searchSel{
	height:100%;
	float:left;
	outline: none;
	
}

/** 탭 메뉴 호버 상태 유지  **/
.btnCon.btn.small.hovered { color:#fff; border-color:#8a7057; background:#8a7057;}
.btnOptionClose {
  border:none;
  width:18px; 
  height:18px; 
  font-size:0; 
  background:url('../hotelDelLuna/resources/pcPub/static/images/reservation/btn_option_close.png')   no-repeat;
  cursor:pointer;
  }

</style>
<body>
<div id="main">
 <jsp:include page="../common/menubar.jsp"/>
	<!-- 섹션 영역 -->
	<section id="container">
	
		<div class="reservationWrap">
		<div class="tabmenu">
			<ul>
				<li id="tab1" class="btnCon btn small"> 
					<input type="radio" checked name="tabmenu" id="tabmenu1" onclick="tabMenuCheck()"> 
					<label for="tabmenu1">테이블</label> 
					
				</li>
				<li id="tab1" class="btnCon btn small"> 
					<input type="radio" name="tabmenu" id="tabmenu2" onclick="tabMenuCheck()"> 
					<label for="tabmenu2">달력</label> 

				</li>
			</ul>
		</div>
			<div class="reservationBox">
			<br><br><br><br>
			<table class="table-fill">
				<thead>
					<tr>
						<th class="text-left" style="width:80px">예약번호</th>
						<th class="text-left">예약자</th>
						<th style="width:50px">인원</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>입금상태</th>
						<th>예약상태</th>
					</tr>
				</thead>	
			
				<tbody class="table-hover">
				<c:forEach var="r" items="${list }">
					<tr>
						<td class="text-left">${r.res_no}</td>
						<td class="text-left">d</td>
						<td class="text-left">${r.res_adult}</td>
						<td class="text-left">${r.res_checkIn }</td>
						<td class="text-left">${r.res_checkOut }</td>
						<td class="text-left">${r.res_payStatus }</td>
						<td class="text-left">${r.res_status } <button class="btnOptionClose deleteRes" onclick="deletePopModal()"></button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br><br><br>
			
			<!-- 검색 영역 -->
			<div align="center" style="padding-right:150px">
			<div class="resSearchArea"  align="center" >
				<select id="searchCondition" class="searchSel" name="category"  style="min-height:10px;display:inline">
						<option>-----</option>
						<option value="userName">예약자</option>
						<option value="userEmail">아이디</option>
						<option value="userPhone">전화번호</option>		
				</select>
				<input type="text" name="searchValue" id="searchValue" style="display:inline">

				<button class="searchBtn" onclick="searchResList()">검색</button>
			</div>
			</div>
			<!-- //검색 영역 -->
			
			<br>
			<!-- 페이징 영역 -->
			<div class="pagingArea" align="center" style="padding-right:150px">
				<ul class="pagination  justify-content-center">
				
				<c:if test="${empty sc}">
					<c:url var="rlistFirst" value="entireResList.do?page=${pi.startPage}"/>
					<c:url var="rlistBack" value="entireResList.do?page=${pi.currentPage -1}"/>
					<c:url var="rlistEnd" value="entireResList.do?page=${pi.currentPage + 1 }"/>
					<c:url var="rlistLast" value="entireResList.do?page=${pi.maxPage}"/>
				</c:if>
				<c:if test="${!empty searchCondition && !empty searchValue}">
					검색완료!
					<c:url var="rlistFirst" value="searchResList.do?page=${pi.startPage}&searchCondition=${searchCondition}&searchValue=${searchValue}"/>
					<c:url var="rlistBack" value="searchResList.do?page=${pi.currentPage-1}&searchCondition=${searchCondition}&searchValue=${searchValue}"/>
					<c:url var="rlistEnd" value="searchResList.do?page=${pi.currentPage+1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"/>
					<c:url var="rlistLast" value="searchResList.do?page=${pi.maxPage}&searchCondition=${searchCondition}&searchValue=${searchValue}"/>
				</c:if>
				
				
				<!-- 맨 처음으로(<<) -->

					<li class="page-item"><a class="page-link" href="${rlistFirst }"> << </a></li>
					
				
				<!--  이전 페이지로(<) -->
				<c:if test="${pi.currentPage == 1 }">
					<li class="page-item disabled"><a class="page-link" href="#"> prev </a></li>
				</c:if>
				<c:if test="${pi.currentPage >1 }">
					<li class="page-item"><a class="page-link" href="${rlistBack}"> prev </a></li>
				</c:if>
		
				
				<!-- 10개의 페이지 목록 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
					<c:if test="${p eq pi.currentPage }">
						<li class="page-item active"><a class="page-link" href="#">${p}</a></li>
					</c:if>
					
					<c:if test="${p ne pi.currentPage}">
						<c:if test="${empty searchCondition || empty searchValue}">
							<c:url var="rlistCheck" value="entireResList.do?page=${p}"/>
						</c:if>
						<c:if test="${!empty searchCondition && !empty searchValue}">
							<c:url var="rlistCheck" value="searchResList.do?page=${p}&searchCondition=${searchCondition}&searchValue=${searchValue}"/>
						</c:if>
						<li class="page-item"><a class="page-link" href="${rlistCheck }">${p}</a></li>	
					</c:if>
				</c:forEach>
				
			
				<!-- 다음 페이지로 (next) -->
				<c:if test="${pi.currentPage == pi.maxPage or pi.currentPage>pi.maxPage}">
					<li class="page-item disabled"><a class="page-link" href="#"> next </a></li>		
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<li class="page-item"><a class="page-link" href="${rlistEnd }"> next </a></li>
				</c:if>
					
				
				<!-- 마지막 페이지로 (>>) -->	
				<li class="page-item"><a class="page-link" href="${rlistLast}"> >> </a></li>
				</ul>
		
			</div>
			<!-- //페이징 영역 -->
			
			</div>
			<div class="reservationAside">
			<section class="reservationSection" style="width:350px">
				<br><br>
				<form class="resInsertForm">
				<table style="margin:30px;">
				<tr>
					<td >예약자: </td>
					<td><input type="text" name="userName"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>이메일: </td>
					<td colspan="3">
					<input type="text" name="email1" size="7" style="display:inline">@
					<input type="text" name="email2" size="7" style="display:inline">
					</td>
				</tr>
				<tr>
					<td>핸드폰: </td>
					<td colspan="3">
						<input type="text" name="phone1" size="1" style="display:inline">
						<input type="text" name="phone2" size="2" style="display:inline">
						<input type="text" name="phone3" size="2" style="display:inline">
					</td>
				</tr>
				<tr>
					<td>객실타입: </td>
					<td>
						<select>
							<option name="res_roomType" value="---">---</option>
							<option name="res_roomType" value="---">---</option>							
							<option name="res_roomType" value="---">---</option>														
						</select>
					</td>
				</tr>
				<tr>
					<td>성인: </td>
					<td><input type="number" id="adult"name="res_adult" min=0 max=10 value=0 style="width:50px;display:inline"></td>
				</tr>
				<tr>
					<td>어린이: </td>
					<td><input type="number" id="child" name="res_child" min=0 max=10 value=0 style="width:50px;display:inline"></td>
				</tr>
				<tr>
					<td>총 인원: </td>
					<td><input type="text" id="totalNum" name="res_totalNum" value="0명" readonly></td>
				</tr>
				<tr>
					<td>체크인: </td>
					<td><input type="date" id="checkIn"  name="res_checkIn"></td>
					<td></td>
				</tr>
				<tr>
					<td>체크아웃: </td>
					<td><input type="date" id="checkOut" name="res_checkOut"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">조식: &nbsp;<input type="checkbox" name="res_breakfast">
					&nbsp;디너: &nbsp;<input type="checkbox" name="res_dinner">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="reset">초기화</button>
					</td>
					<td>
						<button type="submit">예약 입력</button>					
					</td>
				</tr>
			</table>
				
				</form>
			</section>
			</div>
		</div>
	</section>
	<!-------------------- 팝업창  ---------------------->
	<form>
	<div class="layerPopWrap" id="loginPop">
		<div class="bg"></div>
		<!-- layerPopCont -->
		<div class="layerPopCont">
			<div class="loginWrap">
				<h1><span>예약 정보</span>로그인을 하시고<br/>더 편리하게 이용하세요.</h1>
				<div class="loginBox">
					<div class="inp">
						<input type="text" id="USER_ID" name="USER_ID" onKeyPress="if(event.keyCode=='13') jsLogin();" placeholder="아이디" title="아이디">
						<button class="btnDelete">삭제</button>
					</div>
					
					<div class="inp">
						<input type="password" id="USER_PWD" name="USER_PWD" onKeyPress="if(event.keyCode=='13') jsLogin();" placeholder="비밀번호" title="비밀번호">
						<button class="btnDelete">삭제</button>
					</div>
					<div class="loginSave">
						<div class="checkbox">
							<input type="checkbox" id="loginchk" name="loginchk"/><label for="check">로그인 상태 유지</label>
						</div>
					</div>
					
					
					<div class="btnLoginGroup">
						<button id="btnPaymentLogin" class="btn btnFull btnLogin" onclick="#">로그인</button>
						<button id="btnPaymentGuest" class="btn btnLogin" onclick="#">비회원 구매</button>
					</div>
					
				</div>
				<div class="popJoinBox">
					<div class="wrap">
						<p>파라다이스 리워즈 회원이 되시면 <br />더 많은 혜택을 누리실 수 있습니다. </p>
						<a href="javascript:void(0);" class="btnPopClose btn small2" style="display:inline;right:65px"><span>닫기</span></a>
						<a href="#" class="btn small2" style="display:inline;right:150px"><span>예약 삭제</span></a>
					</div>
				</div>
			</div>
			<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
		</div>
		<!-- //layerPopCont -->
	</div>
	</form>
	<!-------------------- //팝업창  ---------------------->
	
	<!-- //섹션 영역 -->
	<script>
	$(function(){
		var totalNum=0;
		var nowDate = new Date().toISOString().substring(0, 10);

		/* 체크인 날짜 최소 오늘 */
		$("#checkIn").attr("min",nowDate);
		
		/* 체크아웃 날짜 최소 체크인 날짜 다음날 */
		$("#checkIn").focusout(function(){
			var minDate = new Date($("#checkIn").val());
			minDate.setDate(minDate.getDate()+1);
			minDate = minDate.toISOString().substring(0, 10);
 			$("#checkOut").attr("min",minDate);
		});
		
		
		/* 어른 아이 총 인원수 계산 */
		$("#adult").focusout(function(){
			totalNum = parseInt($("#adult").val()) + parseInt($("#child").val());
			$("#totalNum").val(totalNum+"명");

		});
	
		$("#child").focusout(function(){
			totalNum = parseInt($("#adult").val()) + parseInt($("#child").val());
			$("#totalNum").val(totalNum+"명");		
		});
		/*************************/
	
		/* 상세 정보 가져오기 */
		$(".table-hover").find("td").click(function(){
			var res_no=$(this).parents().children("td").eq(0).text();
			console.log(res_no);
			location.href="resDetail.do?res_no="+res_no;
		});

		
		/* 예약 삭제하기 */
		$(".deleteRes").on("click",function(event){
			var res_no=$(this).parents().children("td").eq(0).text();
			console.log(res_no);
		    event.stopPropagation();

		});
		
	});
	
		function deletePopModal(){
			layerPopOpen("#loginPop");
		};
		function closePopModal(){
			layerPopClose("#loginPop");
		}
	
		// 탭 메뉴 체크시 변경 기능
		function tabMenuCheck(){
			for(var i=0;i<$("input[name=tabmenu]").length;i++){
				console.log($("input[name=tabmenu]").eq(i).prop("checked"));
				if($("input[name=tabmenu]").eq(i).prop("checked")==true){
				 $("input[name=tabmenu]").eq(i).parent().toggleClass("hovered");
				}else{
				 $("input[name=tabmenu]").eq(i).parent().removeClass("hovered");

				}
			}
		}	
	
	
		function searchResList(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			console.log("searchResList 실행 됨. 컨디션 : "+searchCondition + " 값 : "+searchValue);
			
			location.href="searchResList.do?searchCondition="+searchCondition+
			"&searchValue="+searchValue;
		}
	</script>
</div>


</body>
</html>