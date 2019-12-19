<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<style>
body {
    position: relative;
    top: 80px;
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
	width:155px;
	color: WHITE;
	background: #1b1e24;;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 15px;
	font-weight: 100;
	padding: 10px;
	cursor:pointer;
	text-align: center;
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
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="loginWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1><span>예약 내역</span>회원님께서 예약하신 내역을<br />확인하실 수 있습니다.</h1>
		</div>
		<div class="fullBg">
			<div class="innerBox bg"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<table class="table-fill" align="center">
					<thead>
						<tr>
							<th>예약자</th>
							<th>인원</th>
							<th class="sortHead">체크인<button id="sort_checkIn" class="toggle off"></button></th>
							<th class="sortHead">체크아웃<button id="sort_checkOut" class="toggle off"></button></th>
							<th>입금상태</th>
							<th>예약상태</th>
							<th>요청사항</th>
						</tr>
					</thead>
				
					<tbody class="table-hover">
					</tbody>
				</table>
				<br><br><br>
				
				<br>
				<!-- 페이징 영역 -->
				<div class="pagingArea" align="center">
					<ul class="pagination  justify-content-center">
					
					</ul>		
				</div>
				<!-- //페이징 영역 -->
			</div>
			
		</div>
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
	var nowPage;   //현재 페이지를 담을 변수
	var resNo;	   //예약 번호를 담을 변수
	$(function(){	
 		 pagingAjax(1);
		
		 $("#tabmenu1").prop('checked', true);
		 $("#tabmenu1").parent().toggleClass("hovered");
		 $("#tabmenu2").parent().removeClass("hovered");
         $("input[name=email2]").val($("#email option").eq(0).val());
/* 		 $("#entireRes").prop("hidden",false);	
 */

		 
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
		/* 흡연여부 베드추가여부 체크 */
		$(document).on("click",".check",function(){
			if ($(this).is(":checked")){ 
		        $(this).val("Y");
		    }else{
		        $(this).val("N");
		    }

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
	
			$.ajax({
				url:"myrList.do",
				data:{page:page,
					sort_no:sort_no},
				dataType:"json",
				success:function(data){
					console.log(data.length);
					if(data.length>0){
						for(var i in data){
							$tr=$("<tr>");
							$res_name = $("<td class='text-center' style='cursor:default'>").text(data[i].res_userName);
							$res_adult = $("<td class='text-center' style='cursor:default'>").text(Number(data[i].res_adult)+Number(data[i].res_child));
							$res_checkIn = $("<td class='text-center' style='cursor:default'>").text(data[i].res_checkIn);
							$res_checkOut = $("<td class='text-center' style='cursor:default'>").text(data[i].res_checkOut);
							$res_payStatus = $("<td class='text-center' style='cursor:default'>").text(data[i].res_payStatus);
							$res_status = $("<td class='text-center' style='cursor:default'>").text(data[i].res_status);
							$res_require = $("<td class='text-center' style='cursor:default; overflow:auto;'>").text(data[i].res_require);
							
							
							$tr.append($res_name);
							$tr.append($res_adult);
							$tr.append($res_checkIn);
							$tr.append($res_checkOut);
							$tr.append($res_payStatus);
							$tr.append($res_status);
							$tr.append($res_require);
							$tableBody.append($tr);
						}	
					}else{
						$tr=$("<tr>");
						$td=$("<td colspan='7' height='40px' style='text-align:center; font-size:17px, cursor:default'>").text("예약 내역이 없습니다.");
						$tr.append($td);
						$tableBody.append($tr);
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
				url:"myrPage.do",
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
	</script>
</body>
</html>