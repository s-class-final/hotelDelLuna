<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin || entireResView</title>
</head>

<style>



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
	color: WHITE;
	background: #1b1e24;;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 15px;
	font-weight: 100;
	padding: 10px;
	cursor:pointer;
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

.toggle{
    display: inline;
    width: 8px;
    height: 5px;
    margin-left: 5px;
    border : none;
}
.toggle.off {
    background: url(resources/pcPub/static/images/common/bg_topArrow.png) no-repeat 0 0px;
}
.toggle.on{
    background: url(resources/pcPub/static/images/common/bg_topArrow.png) no-repeat 0 -5px;

}
/******************* 오른쪽 예약 입력 메뉴 ****************/
.resInsertForm{
	background: white;
	border: 1px solid;

}
.resButtonDiv{
	background: #f9f9f9;
	height:50px;
}
.resButton{
	width:80px;
	height:75%;
	border:0px;
	margin: 7px 7px;
	background: #8a7057;
	outline: none;
	float: right;
	color: #ffffff;
}
.resInp input{
    width: 100%;
    height: 30px;
    border: 1px solid #e6e3df;
    padding: 0 5px;
    line-height: 3;
    font-size: 14px;
    font-weight: 200;
    outline: 0;
    transition: all .3s ease;
}
.resInp input:focus { border:1px solid #9c836a;}


/** 검색 영역 관련 css **/
.resSearchArea{
	display: inline-block;
	height : 40px;
	width: 248px;
	border: 1px solid #8a7057;
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
	background: #8a7057;
	outline: none;
	float: right;
	color: #ffffff;
}
.searchSel{
	height:100%;
	float:left;
	outline: none;
	
}



</style>
<body>

	<div class="reservationBox">
			<br><br><br><br>
			<table class="table-fill">
				<thead>
					<tr>
						<th class="sortHead" style="width:100px">예약번호<button id="sort_no" class="toggle off"></button></th>
						<th class="sortHead">예약자<button id="sort_name" class="toggle off"></button></th>
						<th style="width:50px">인원</th>
						<th class="sortHead">체크인<button id="sort_checkIn" class="toggle off"></button></th>
						<th class="sortHead" style="width:95px">체크아웃<button id="sort_checkOut" class="toggle off"></button></th>
						<th>입금상태</th>
						<th>예약상태</th>
					</tr>
				</thead>	
			
				<tbody class="table-hover">
				</tbody>
			</table>
			<br><br><br>
			
			<!-- 검색 영역 -->
			<div align="center" style="padding-right:150px">
			<div class="resSearchArea"  align="center" >
				<select id="searchCondition" class="searchSel" name="category"  style="min-height:10px;display:inline">
						<option value="none">-----</option>
						<option value="userName">예약자</option>
						<option value="userId">아이디</option>
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
				
				</ul>		
			</div>
			<!-- //페이징 영역 -->
			
			</div>
			<div class="reservationAside">
			<section class="reservationSection" style="width:400px;right:30px">
				<br><br>
				<form class="resInsertForm">
				<div class="resInp">
				<table style="margin:30px;">
				<tr>
					<td >예약자: </td>
					<td><input type="text" name="userName"></td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td>이메일: </td>
					<td colspan="4">
					<input type="text" name="email1" size="7" style="display:inline;width:25%">@
					<input type="text" name="email2" size="7" style="display:inline;width:25%">
					<select id = "email" name = "email" class = "join" style="display:inline;width:30%">
                     <option value = "naver.com">naver.com</option>
                            <option value = "hanmail.net">hanmail.net</option>
                            <option value = "gmail.com">gmail.com</option>
                            <option value = "nate.com">nate.com</option>
                     <option value = "1">직접입력</option>
                    </select>
					</td>
				</tr>
				<tr>
					<td>핸드폰: </td>
					<td colspan="3">
						<input type="text" name="phone1"  style="display:inline;width:17%">
						<input type="text" name="phone2"  style="display:inline;width:20%">
						<input type="text" name="phone3"  style="display:inline;width:20%">
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
					<td>날짜: </td>
					<td colspan=2>
							<b class="inp calendar">		
							<input type="text" width=100% readonly="readonly" />
							<a class="btnCalendar" style="right:-20px"></a>
							</b>
					</td>
				<tr>
				<tr>
					<td></td>
					<td colspan="3">조식: &nbsp;<input type="checkbox"  name="res_breakfast" style="width:auto;display:inline;">
					&nbsp;디너: &nbsp;<input type="checkbox" name="res_dinner" style="width:auto;display:inline;">
					</td>
				</tr>
			</table>
				</div>
				<div class="resButtonDiv">
						<button type="reset" class="resButton">예약 입력</button>
						<button type="submit" class="resButton">초기화</button>					
				</div>
				</form>
			</section>
			</div>
	<!-------------------- 팝업창  ---------------------->
	<form>
	<div class="layerPopWrap" id="loginPop">
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
						<a href="#" class="btn small2" style="display:inline;right:65px"><span>삭제</span></a>
						<a href="javascript:void(0);" class="btnPopClose btn small2" style="display:inline;right:150px"><span>취소</span></a>
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
	var nowPage;
	$(function(){	
 		 pagingAjax(1);
		
		 $("#tabmenu1").prop('checked', true);
		 $("#tabmenu1").parent().toggleClass("hovered");
		 $("#tabmenu2").parent().removeClass("hovered");
         $("input[name=email2]").val($("#email option").eq(0).val());
/* 		 $("#entireRes").prop("hidden",false);	
 */
		 // 메일 바뀌게 하는 함수(바뀔 때마다 아이디 중복체크 함수 실행)
		 $('#email').change(function(){
		     $("#email option:selected").each(function () {
		       if($(this).parent().val()== "1"){ // 직접입력일 경우
		    	  $("input[name=email2]").val(""); // 값 초기화
		    	  $("input[name=email2]").attr("disabled",false); // 활성화

		       }else{ // 직접입력이 아닐경우
		    	  $("input[name=email2]").val($(this).parent().val()); // 선택값 입력
		    	  $("input[name=email2]").attr("disabled",true); // 비활성화
		       }
		    });
		 });
		 
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
		
		
		/******************* 정렬  ******************/
		$(".sortHead").click(function(){
			var sort_no;
			var className = $(this).children("button").attr('class');
			var btnId = $(this).children("button").attr('id');

			/*** 내림차순 ***/
			if(className == "toggle on"){
				$(this).children("button").css("background-position-y",0);
				$(this).children("button").prop('class','toggle off');
				
				switch(btnId){
				case "sort_no":
					sort_no=0;
					break;
				case "sort_name":
					sort_no=2;
					break;
				case "sort_checkIn":
					sort_no=4;
					break;
				case "sort_checkOut":
					sort_no=6;
					break;
				}
			/*** 오름차순 ***/
			}else{
				$(this).children("button").css("background-position-y",-5);
				$(this).children("button").prop('class','toggle on');
				
				switch(btnId){
				case "sort_no":
					sort_no=1;
					break;
				case "sort_name":
					sort_no=3;
					break;
				case "sort_checkIn":
					sort_no=5;
					break;
				case "sort_checkOut":
					sort_no=7;
					break;
				}

			}
			pagingAjax(nowPage,null,null,sort_no,false);
		})
		
		
	});
		
		/* 상세 정보 가져오기 */
		$(document).on("click",".text-left",function(){
			var res_no=$(this).parents().children("td").eq(0).text();
			console.log(res_no);
			location.href="resDetail.do?res_no="+res_no;
		});
		
		
		/* 예약 삭제하기 */
		$(document).on("click",".deleteRes",function(event){
			var res_no=$(this).parents().children("td").eq(0).text();
			console.log(res_no);
		    event.stopPropagation();
		});
		
		
		/***** 테이블 ajax 처리 *****/
		function loadData(code,sort_no){
			console.log("전달된 페이지 인자값 : "+ code);
			
			var page = code; // 페이지 정보 담기
			var $tableBody = $(".table-hover");
			$tableBody.html("");
			

			// 예약번호 예약자 인원 체크인 체크아웃 입금상태 예약상태
			var $tr;
			var $res_no;
			var $res_name;
			var $res_adult;
			var $res_checkIn;
			var $res_checkOut;
			var $res_payStatus;
			var $res_status;
			var $deleteBtn;
	
			$.ajax({
				url:"rList.do",
				data:{page:page,
					sort_no:sort_no},
				dataType:"json",
				success:function(data){
					console.log(data.length);
					if(data.length>0){
						for(var i in data){
							$tr=$("<tr>");
							$res_no = $("<td class='text-left'>").text(data[i].res_no);
							$res_name = $("<td class='text-left'>").text(data[i].res_userName);
							$res_adult = $("<td class='text-left'>").text(data[i].res_adult);
							$res_checkIn = $("<td class='text-left'>").text(data[i].res_checkIn);
							$res_checkOut = $("<td class='text-left'>").text(data[i].res_checkOut);
							$res_payStatus = $("<td class='text-left'>").text(data[i].res_payStatus);
							$res_status = $("<td class='text-left'>").text(data[i].res_status);
							$deleteBtn = $("<button class='btnOptionClose deleteRes' onclick='deletePopModal()'>");
							
							/*** 입금 대기 상태일 때 예약 삭제버튼 추가 ***/
							if(data[i].res_payStatus=='입금대기'){
								$res_status.append($deleteBtn);
							}
							
							
							$tr.append($res_no);
							$tr.append($res_name);
							$tr.append($res_adult);
							$tr.append($res_checkIn);
							$tr.append($res_checkOut);
							$tr.append($res_payStatus);
							$tr.append($res_status);
							$tableBody.append($tr);
						}	
					}
				},error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			});
		}
	
		/***** 페이징 ajax 처리 *****/
		function pagingAjax(currentPage,searchCondition,searchValue,sort_no,bool){
			var $pagination = $(".pagination");
			$pagination.html("");
			var $startPage;
			var $prevPage;
			var $nextPage;
			var $endPage;
			var $pageList;
			var $page;
			var cPage = currentPage;
			var searchCondition = searchCondition;
			var searchValue = searchValue;
			var search = bool;
			$.ajax({
				url:"rPage.do",
				data:{page:cPage,
					searchCondition:searchCondition,
					searchValue:searchValue,
					search:search,
					sort_no:sort_no},
				dataType:"json",
				success:function(data){
					console.log(data);
					if(data!=null){
						// 맨 처음으로
						 $pageList = $("<li class='page-item'>");
						 $startPage = $("<a class='page-link' onclick='pagingAjax("+data.startPage+")'>").text(" << ");
						 $pageList.append($startPage);
						 $pagination.append($pageList);
						 
						 // 이전으로
						 // 현재 페이지가 1보다 클 때
						 $pageList = $("<li class='page-item'>");
						 if(data.currentPage>1){
							 $prevPage = $("<a class='page-link' onclick='pagingAjax("+(data.currentPage-1)+")'>").text("prev");
					     // 현재 페이지가 1이랑 같을 때
						 }else{
							 $prevPage = $("<a class='page-link'>").text("prev");							 
						 }

						 $pageList.append($prevPage);
						 $pagination.append($pageList);
						 
						 // 페이지 목록
						for(var i=1;i<=data.maxPage;i++){
							
							if(currentPage==i){
								$pageList = $("<li class='page-item active'>");
								$page = $("<a class='page-link'>").text(i);
							}else{
								$pageList = $("<li class='page-item'>");
								$page = $("<a class='page-link' onclick='pagingAjax("+i+")'>").text(i);
							}
							$pageList.append($page);
							$pagination.append($pageList);
						}	
						 // 다음으로
						 // 현재 페이지가 마지막이 아닐 때
						 	$pageList = $("<li class='page-item'>");
						 	if(data.currentPage<data.endPage){
						 		$nextPage = $("<a class='page-link' onclick='pagingAjax("+(data.currentPage+1)+")'>").text("next");
						 // 현재 페이지가 마지막일 때
						 	}else{
						 		$nextPage = $("<a class='page-link'>").text("next");
						 		
						 	}
						 
							
							$pageList.append($nextPage);
							$pagination.append($pageList);
							
						 // 마지막으로
						 	$pageList = $("<li class='page-item'>");
							$endPage = $("<a class='page-link' onclick='pagingAjax("+data.endPage+")'>").text(" >> ");
							$pageList.append($endPage);
							$pagination.append($pageList);
							
							loadData(data.currentPage);
							
							nowPage = data.currentPage;
					}
			
				},error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			});
		}
		
		function deletePopModal(){
			layerPopOpen("#loginPop");
		};
		function closePopModal(){
			layerPopClose("#loginPop");
		}

		/* 검색 필터 적용하여 검색 */
		function searchResList(){
			 
			var currentPage = 1;
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			$("#searchValue").val("");
			$("#searchCondition").val("none");
			var bool = true;
			console.log("searchResList 실행 됨. 컨디션 : "+searchCondition + " 값 : "+searchValue);
			
			pagingAjax(currentPage,searchCondition,searchValue,0,bool);
		}
	</script>

</body>
</html>