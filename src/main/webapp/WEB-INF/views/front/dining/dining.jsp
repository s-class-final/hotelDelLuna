<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>





<script>
$(document).ready(function() {
	$('#allLi').click(function(){
		jsList('dining');
	});
	
	//목록 별 높이 조정 (전체 목록의 갯수가 짝수가 아닌 경우)
	if ($(".findDiningItem").length%2 != 0 && $(".findDiningItem").length > 2) {
		//마지막에서 첫번째 높이
		var lastOneH = $(".findDiningItem").eq($(".findDiningItem").length-2).height();
		//마지막에서 두번째 높이
		var lastTwoH = $(".findDiningItem").eq($(".findDiningItem").length-3).height();
		//마지막에서 두번째 높이가 마지막에서 첫번째 높이보다 크면 마지막에 숨김 엘리먼트 추가
		if (lastTwoH > lastOneH) {
			var lastTwoCl = $(".findDiningItem").eq($(".findDiningItem").length-3).clone();
			lastTwoCl.find("a").attr("href", "javascript:void(0);");
			lastTwoCl.find("div.textBox").remove();
			lastTwoCl.css("visibility", "hidden");
			$(".DDfindList").append(lastTwoCl);
		}
	}
});
//페이지 컨텐츠 로딩 완료 시점
$(window).load(function(){
	$(".DDfindList").css("visibility", "visible");
});
//목록으로
function jsList(CATE) {
	$('#CATE').val(CATE);
	$("#form1").attr("action", "dining.do");
	$("#form1").submit();
}
</script>

<!-- 컨텐츠 영역 -->
<section id="container">
	
	
	<form id="form1" name="form1">
		<input type="hidden" id="CATE" name="CATE" value=""/>
		<input type="hidden" id="F_SEQ" name="F_SEQ" value=""/>
	</form>
	
	<div class="dindDrinkwrap innerBox">
		
		<h1 class="contTitle"><span>다이닝</span>미슐랭 스타 레스토랑부터 트렌디한 Bar까지, <br />호텔 델루나에서 펼쳐지는 미식의 세계로 초대합니다.</h1>
		<!-- <div class="rightButton"><a href="/front/dining" class="btn small arrow"><span>호텔 델루나의 모든 식음시설 보기</span></a></div> -->
		
		<div class="utilMenu">
			
			<ul class="diningTab clearFixed">
				<li class="dining on" id="allLi"><a href="dining" onclick="javascript:jsList('dining');" >All</a></li>
				<li class="restaurant"><a href="restaurant" onclick="javascript:jsList('restaurant');">Restaurant</a></li>
				<li class="cafe"><a href="cafe" onclick="javascript:jsList('cafe');">Café &amp; Bar</a></li>
			</ul>
		</div>
		
		
		<div class="DDfindList" style="visibility:hidden;">
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="OnThePlate"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining1.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>ON THE PLATE</h2>
					<p class="text">
					
				         유럽, 뉴욕, 상해의 최신 Trend를 반영,<br/>다섯가지 Station으로 구성된 Premium Buffet Restaurant	
				    
					</p>
					
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="LaScala"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining2.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>LA SCALA</h2>
					<p class="text">
					
				         밀라노의 감성으로 이탈리아 본연의 맛을 추구하는<br/>Italian Gourmet Restaurant	
				    
					
					</p>
					<!-- <a href="#popReservation" class="btn small2" onclick="javascript:$('#F_SEQ').val('022');initPop();layerPopOpen('#popReservation')"><span>예약하기</span></a> -->
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="Raku"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining3.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>RAKU</h2>
					<p class="text">
					
				         다양한 장르의 일식을 창의적으로 재해석한 메뉴를<br/>합리적인 가격에 즐길 수 있는 트렌디한 일식의 진수	
				    
					</p>
					<!-- <a href="#popReservation" class="btn small2" onclick="javascript:$('#F_SEQ').val('024');initPop();layerPopOpen('#popReservation')"><span>예약하기</span></a> -->
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="ImperialTreasure"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining4.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>IMPERIAL TREASURE</h2>
					<p class="text">한국 최초로 선보이는 정통 광동식 Fine Dining Cuisine</p>
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="Rubik"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining5.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>RUBIK</h2>
					<p class="text">색다른 공연을 만나는 라이브 뮤직 라운지</p>
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="LoungeParadise"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining6.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>LOUNGE PARADISE</h2>
					<p class="text">음악이 흐르는 로비라운지</p>
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="GardenCafe"/>
				</c:url>
				<a href="${diningView }">
				<img src="resources/pcPub/static/images/dining/dining7.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>GARDEN CAFÉ</h2>
					<p class="text">유럽의 정취를 지닌 카페</p>
				</div>
			</div>
			
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="TheEmperor"/>
				</c:url>
				<a href="${diningView }">
				<img style="width:100%;" src="resources/pcPub/static/images/dining/dining8.jpg" alt="" /></a></p>
				<div class="textBox" style="padding-right:80px;">
					<h2>THE EMPEROR</h2>
					<p class="text">최고의 고객에게 최고만을 선보이는 카지노 클럽 멤버십 전용 레스토랑</p>
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="Cafe9"/>
				</c:url>
				<a href="${diningView }">
				<img style="width:100%;" src="resources/pcPub/static/images/dining/dining9.jpg" alt="" /></a></p>
				<div class="textBox">
					<h2>Café 9</h2>
					<p class="text">게임 속 오아시스, 미식의 즐거움을 경험하는 곳</p>
				</div>
			</div>
			
			
			<div class="findDiningItem" data-animation="fadeInUp">
				<p class="img">
				<c:url var="diningView" value="diningView.do">
					<c:param name="type" value="Bar21"/>
				</c:url>
				<a href="${diningView }">
				<img style="width:100%;" src="resources/pcPub/static/images/dining/dining10.jpg" alt="" /></a></p>
				<div class="textBox" style="padding-right:90px;">
					<h2>Bar 21</h2>
					<p class="text">카지노를 한층 더 다이내믹하게 즐길 수 있는 카지노 엔터테인먼트바</p>
				</div>
			</div>
			
			
			
		</div>
		
	</div>

</section>
<!-- //컨텐츠 영역 -->










<script>
var diningNm = "";
var fSeq = "";
var deptCd = "";

var adultNumList = {DTL_CD: [1, 2, 3, 4], DTL_CD_NM: [1, 2, 3, 4]};
var childNumList = {DTL_CD: [0, 1, 2, 3, 4], DTL_CD_NM: [0, 1, 2, 3, 4]};
var toddNumList = {DTL_CD: [0, 1, 2, 3, 4], DTL_CD_NM: [0, 1, 2, 3, 4]};

var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var blank_pattern = /[\s]/g;

var multiLangSelect = "선택";
$(document).ready(function() {
	initPop();
	/* F_SEQ를 동적으로 넘기는 경우, 이전 페이지의 예약하기 버튼에서 initPop() 실행 후에 레이어팝업 함수 호출 필요 (FineDiningVm.jsp 참고) */
	
	
	$(document).on("change", "#RSV_DATE", function() {
		$("#MEAL_TIME").prop("disabled", false);
		$("#MEAL_TIME").next("div.selectBox").removeClass("disabled");
		
		if($(this).val() == "") {
			$("#MEAL_TIME").prop("disabled", true);
			$("#RSV_TIME").prop("disabled", true);
			$("#MEAL_TIME").next("div.selectBox").addClass("disabled");
			$("#RSV_TIME").next("div.selectBox").addClass("disabled");
			
			selectVal("#MEAL_TIME", "");
			selectVal("#RSV_TIME", "");
		}
	});
	
	// Lunch/Dinner 이벤트
	$(document).on("mouseup", "#MEAL_TIME + .selectBox .ui-select-option", function(e){
		if($(this).closest("li").hasClass("disabled")) {
			return;
		}
		if($(this).data("value") == "") {
			selectRemoveThenMakeForDinRsv("#RSV_TIME", {}, multiLangSelect);
			return;
		}
		
		$("#RSV_TIME").prop("disabled", false);
		$("#RSV_TIME").next("div.selectBox").removeClass("disabled");
		
		// Lunch Dinner 예약 가능 시간대 조회
		$.ajax({
		    url : "/front/dining/getMealTime"
    	  , method : "post"
		  , data : "RSV_DATE=" + $("#RSV_DATE").val() + "&MEAL_TIME=" + $(this).data("value") + "&DEPT_CD=" + $("#DEPT_CD").val()
		  , success : function(data, stat, xhr) {
				if(data.result == "success" && $.isEmptyObject(data.list) == false) {
					var dtlCdArr  = data.list.DTL_CD;
					var toTimeArr = data.list.TO_TIME;
					var durMinute = moment.duration(moment(moment(toTimeArr[0], "hmm")._d).diff(moment(dtlCdArr[0], "hmm")._d)).asMinutes();
					var selCount  = durMinute / 30;
					var DTL_CD_NM = new Array();
					var DTL_CD    = new Array();
					for (var i = 0; i < selCount; i++) {
						if (i == 0) {
							DTL_CD_NM.push(moment(dtlCdArr[0], "hmm").format("HH:mm"));
							DTL_CD.push   (moment(dtlCdArr[0], "hmm").format("HHmm")); 
						} else {
							DTL_CD_NM.push(moment(DTL_CD[i-1], "hmm").add("minutes",30).format("HH:mm"));
							DTL_CD.push   (moment(DTL_CD[i-1], "hmm").add("minutes",30).format("HHmm"));
						}
					}
					data.list.DTL_CD_NM = DTL_CD_NM;
					data.list.DTL_CD    = DTL_CD;
					
					selectRemoveThenMakeForDinRsv("#RSV_TIME", data.list, multiLangSelect);
				}
			}
		});
	});
	
	// 인원수 확인
	$(document).on("mouseup", ".person + .selectBox .ui-select-option", function(e){
		checkPersonNum($(this).closest("div.selectBox").prev("select.selectBox").attr("id"), $(this).data("value"));
	});
	
	//Form submit 방지
	$("button.btnSingleSubmit").attr("type", "button");
	
});

function doActionOnCalChange(obj) {
	$("#MEAL_TIME").prop("disabled", false);
	$("#MEAL_TIME").next("div.selectBox").removeClass("disabled");
	
	$.ajax({
		url : "/front/dining/getLunchDinnerAvail"
        , method : "post"
		, data : $("#form_rsv").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.result != null) {
					if (data.result == "success") {
						var lunch_close = "Lunch" + "예약마감";
						var dinner_close = "Dinner" + "예약마감";
						var list = {DTL_CD: ["L", "D"], DTL_CD_NM: [lunch_close, dinner_close]};
						var isDisabled = ["Y", "Y"];
						if($.isEmptyObject(data.list) == false) {
							if(data.list.MEAL_TYPE) {
								for(var i = 0; i < data.list.MEAL_TYPE.length; i++) {
									if(data.list.MEAL_TYPE[i] == "L") {
										list.DTL_CD_NM[0] = "Lunch";
										isDisabled[0] = "N";
									} else if(data.list.MEAL_TYPE[i] == "D") {
										list.DTL_CD_NM[1] = "Dinner";
										isDisabled[1] = "N";
									}
								}
								selectRemoveThenMakeForDinRsv("#MEAL_TIME", list, multiLangSelect, isDisabled);
							}
						} else {
							selectRemoveThenMakeForDinRsv("#MEAL_TIME", list, multiLangSelect, isDisabled);
						}
					}
				} else {
					alert("에러가 발생했습니다!");
				}
			}
		}
	});
}

function initPop() {
	// 입력폼 초기화
	jsInitInputForm();
	
	// DEPT_CD 선택(온더플레이트: 021, 라꾸: 024, 새라새: 202, 루빅: 025, 라스칼라: 022)
	if($("#F_SEQ").length > 0) {
		deptCd = $("#F_SEQ").val();
	}
	$("#DEPT_CD").val(deptCd);
	//deptCd = $("#DEPT_CD").val();
	
	// TODO JH DINE 테이블 F_SEQ 수정하면 삭제 필요, 아래 data fSeq -> deptCd로 바꾸기
	var fSeq = "";
	if(deptCd == "021") fSeq = "141";
	if(deptCd == "024") fSeq = "77";
	if(deptCd == "022") fSeq = "78";
    
	// TODO serase를 등록한 후, 생성된 SEQ를 fSeq에 대입 필요
	if(deptCd == "202") fSeq = "202";
	
	if(deptCd != "") {
		// 다이닝 정보 세팅
		$.ajax({
			url : "/front/dining/getDining"
	        , method : "post"
	        , async : false
			, data : "SC_F_SEQ=" + fSeq
			, success : function(data, stat, xhr) {
				if (stat == "success") {
					if (data.result != null) {
						if (data.result == "success") {
							// TO DO, serase 등록시  삭제 필요
							// 시작
							if( deptCd == "202" ){
								data.rs.F_NAME[0] = "SERASÉ";
								data.rs.F_LOCATION[0] = "HOTEL ART PARADISO 3F";
								data.rs.F_TEL[0] = "032-729-5010";
							}
							// 끝
							
							if(data.rs.F_NAME) $(".dining_rsv_nm").text(data.rs.F_NAME[0]);
							if(data.rs.F_LOCATION) $(".dining_rsv_loc").text(data.rs.F_LOCATION[0]);
							if(data.rs.F_TEL) $(".dining_rsv_tel").text(data.rs.F_TEL[0]);
						}
					} else {
						alert("에러가 발생했습니다!");
					}
				}
			}
		});
	}
	
	// '아트 파라디소' 성인 전용(새라새)
	if(deptCd == "202") {
		$("#CHILD").prop("disabled", true);
		$("#TODDLER").prop("disabled", true);
		$("#CHILD").next("div.selectBox").addClass("disabled");
		$("#TODDLER").next("div.selectBox").addClass("disabled");
	} else {
		$("#CHILD").prop("disabled", false);
		$("#TODDLER").prop("disabled", false);
		$("#CHILD").next("div.selectBox").removeClass("disabled");
		$("#TODDLER").next("div.selectBox").removeClass("disabled");
	}
}

function jsInitInputForm() {
	$("#RSV_DATE").val("");
	selectVal("#MEAL_TIME", "");
	selectRemoveThenMakeForDinRsv("#MEAL_TIME", {}, multiLangSelect);
	selectVal("#RSV_TIME", "");
	selectRemoveThenMakeForDinRsv("#RSV_TIME", {}, multiLangSelect);
	selectVal("#ADULT", 1);
	selectVal("#CHILD", 0);
	selectVal("#TODDLER", 0);
	$("#NAME").val("");
	$(".emailClass").val("");
	selectVal("#PHONE1", "010");
	$("#PHONE2").val("");
	$("#PHONE3").val("");
	$("#ALLERGY").val("");
	$("#REQ_ADD").val("");
	$("#ReservationPopCont").data("dateRangePicker").clear();
}

//예약 신청
function jsApplyRsv() {
	if($("#RSV_DATE").val() == "" || isNaN($("#RSV_DATE").val().replace(".", ""))) {
		alert("예약날짜를 선택해주세요.");
		$("#RSV_DATE").focus();
        return;
	}
	
	if(($("#MEAL_TIME").next(".selectBox").find(".ui-select-option.selection").length == 0 || $("#MEAL_TIME").next(".selectBox").find(".ui-select-option.selection").data("value") == "")) {
		alert("방문하실 시간대(Lunch/Dinner)를 선택해주세요.");
		$("#MEAL_TIME").focus();
		return;
	}
	
	if($("#RSV_TIME").next(".selectBox").find(".ui-select-option.selection").length == 0 || $("#RSV_TIME").next(".selectBox").find(".ui-select-option.selection").data("value") == "") {
		alert("예약시간을 선택해주세요.");
		$("#RSV_TIME").focus();
		return;
	}
	
	if($("#NAME").val() == "") {
		alert("이름을 입력해주세요.");
		$("#NAME").focus();
		return;
	}
	
	if($(".emailClass").val() == "") {
		alert("이메일을 입력해주세요.");
		$(".emailClass").focus();
		return;
	}
	
	//이메일 형식 및 사이 공백 validation Check
    if(blank_pattern.test($('.emailClass').val()) == true || emailFormat.test($('.emailClass').val()) == false){
    	alert("이메일주소 형식이 올바르지 않습니다.");
    	$(".emailClass").focus();
    	return;
    }
     
    if($("#PHONE2").length > 0 && $("#PHONE2").val().length == 0) {
    	alert("휴대폰번호를 입력해주세요.");
    	$("#PHONE2").focus();
    	return;
    }
    
    if($("#PHONE3").length > 0 && $("#PHONE3").val().length == 0) {
    	alert("휴대폰번호를 입력해주세요.");
    	$("#PHONE3").focus();
    	return;
    }
	
    if($("#PHONE2").length > 0 && $("#PHONE2").val().length < 3) {
    	alert("휴대폰 번호를 정확히 입력해주세요.");
    	$("#PHONE2").focus();
    	return;
    }
    
    if($("#PHONE3").length > 0 && $("#PHONE3").val().length < 4) {
    	alert("휴대폰 번호를 정확히 입력해주세요.");
    	$("#PHONE3").focus();
    	return;
    }
    
    // 예약 인원수 예약 가능 여부 확인
    $.ajax({
		url : "/front/dining/checkMaxPerson"
        , method : "post"
		, data : $("#form_rsv").serialize()
		, success : function(data, stat, xhr) {
			if (stat == "success") {
				if (data.result != null) {
					if (data.result == "success") {
						// 신청가능 시간 확인
					    var selectedDate = $("#RSV_DATE").val().split(".");
					    var year = "";
					    var month = "";
					    var day = "";
					    
					    if(selectedDate.length == 3 && typeof parseInt(selectedDate[0]) === "number" && typeof parseInt(selectedDate[1]) === "number" && typeof parseInt(selectedDate[2]) === "number") {
						    year = parseInt(selectedDate[0]);
					    	month = parseInt(selectedDate[1]) - 1;
					    	day = parseInt(selectedDate[2]);
					    	var rsv_date = new Date(year, month, day);
					    	var tmp = new Date();
					    	var today = new Date(tmp.getFullYear(), tmp.getMonth(), tmp.getDate());
					    	
					    	if(rsv_date - today < 1) {
					    		alert("당일 예약은 전화문의 문의바랍니다.");
					    		return;
					    	}
					    }
					    
					    // 조회 결과 2개 이상인 경우, 첫번째 SEQ 세팅(최대가능인원 중 최소값 선택) 
					    // 예약 인원수와 조회 결과 이용가능한 테이블 최소 좌석수가 2자리 이상 차이나는 경우, 예약 불가 (2018.10.26 수정)
					    var numOfPerson = $("#MAX_PERSON").val() * 1;
					    var maxPerson = data.list.MAX_PERSON[0] * 1;
					    
					    if((numOfPerson > maxPerson)) {
					    	alert("예약 가능한 테이블이 없습니다.");
					    	return;
					    } else {
						    $("#I_BLOCK_SEQ").val(data.list.SEQ[0]);
					    }
					    
					    // 예약 등록 진행
					    $.ajax({
							url : "/front/dining/reservation"
					        , method : "post"
							, data : $("#form_rsv").serialize()
							, success : function(data, stat, xhr) {
								if (stat == "success") {
									if (data.result != null) {
										if (data.result == "success") {
											alert("예약 신청이 완료되었습니다.\n좌석 가능여부 확인 후 직원이 직접 연락 드려 최종 예약을 확정해 드릴 예정입니다.");
											$(".btnPopClose").click();
										} else {
											alert("예약실패");
										}
									} else {
										alert("에러가 발생했습니다!");
									}
								}
							}
						});
					} else {
						alert("예약 가능한 테이블이 없습니다.");
					}
				} else {
					alert("에러가 발생했습니다!");
				}
			}
		}
	});
   
}
/* 
function getMinutesFromStrTime(hour, minute) {
	if(!isNaN(hour) && !isNaN(minute)) {
		var hour = hour * 1;
		var minute = minute * 1;
		return hour * 60 + minute;
	} else {
		return -1;
	}
}

function getStrTimeFromMinutes(minutes) {
	if(!isNaN(minutes)) {
		var minutes = minutes * 1;
		var hour = parseInt(minutes / 60);
		var minutes = minutes % 60 < 10 ? "0" + (minutes % 60) : minutes % 60;
		return hour + ":" + minutes;
	} else {
		return "";
	}
}
 */
function checkPersonNum(id, val) {
	var tot = 0;
	var list = {};
	var adult = $("#ADULT").next(".selectBox").find(".ui-select-trigger").text() * 1;
	var child = $("#CHILD").next(".selectBox").find(".ui-select-trigger").text() * 1;
	var todd = $("#TODDLER").next(".selectBox").find(".ui-select-trigger").text() * 1;
	
	if(id == "ADULT") {
		adult = val * 1;
		list = adultNumList;
	}
	if(id == "CHILD") {
		child = val * 1;
		list = childNumList;
	}
	if(id == "TODDLER") {
		todd = val * 1;
		list = toddNumList;
	}
	
	// 영업장에 따른 최대 예약 가능 인원수 확인
	if(deptCd == "022") { // 라 스칼라 4인, 유아는 카운팅 제외
		tot = adult + child;
		if(tot > 4) {
			selectRemoveThenMakeForDinRsv("#"+id, list);
			alert('예약 가능 인원수를 초과하였습니다.\n라스칼라(032-729-2203)로 전화연락 주시면 예약 도와드리겠습니다.');
			var adult2 = $("#ADULT").next(".selectBox").find(".ui-select-trigger").text() * 1;
			var child2 = $("#CHILD").next(".selectBox").find(".ui-select-trigger").text() * 1;
			tot = adult2 + child2;
			$("#MAX_PERSON").val(tot);
			return;
		}
	} else if(deptCd == "024") { // 라꾸 4인
		tot = adult + child + todd;
		if(tot > 4) {
			selectRemoveThenMakeForDinRsv("#"+id, list);
			alert('예약 가능 인원수를 초과하였습니다.\n라쿠(032-729-2207)로 전화연락 주시면 예약 도와드리겠습니다.');
			var adult2 = $("#ADULT").next(".selectBox").find(".ui-select-trigger").text() * 1;
			var child2 = $("#CHILD").next(".selectBox").find(".ui-select-trigger").text() * 1;
			var todd2 = $("#TODDLER").next(".selectBox").find(".ui-select-trigger").text() * 1;
			tot = adult2 + child2 + todd2;
			$("#MAX_PERSON").val(tot);
			return;
		}
	} else if(deptCd == "202") { // 새라새 4인, 성인 전용
		tot = adult;
		if(tot > 4) {
			selectRemoveThenMakeForDinRsv("#"+id, list);
			alert('예약 가능 인원수를 초과하였습니다.\n새라새(032-729-5010)로 전화연락 주시면 예약 도와드리겠습니다.');
			var adult2 = $("#ADULT").next(".selectBox").find(".ui-select-trigger").text() * 1;
			tot = adult2;
			$("#MAX_PERSON").val(tot);
			return;
		}
	} else {
		tot = adult + child + todd;
	}
	$("#MAX_PERSON").val(tot);
	
}

//식음예약 Select Box 초기화 & 생성
function selectRemoveThenMakeForDinRsv(selector, list, defaultOpt1, isDisabled){
	$(selector).empty();
	
	var html = "";
	if(defaultOpt1) {
		html += "<option value='' class='disabled'>" + defaultOpt1 + "</option>";
	}
	if(!$.isEmptyObject(list)) {
		for(var i = 0; i < list.DTL_CD.length; i++) {
			var cVal = "";
			if(isDisabled && isDisabled[i] && isDisabled[i] == "Y") {
				cVal = "disabled";
			}
			html += "<option value='" + list.DTL_CD[i] + "' class='" + cVal + "'>" + list.DTL_CD_NM[i] + "</option>";
		}
	}
	$(selector).append(html);
	  
	var $select = $(selector);
	$select.next("div.selectBox").remove();
	
	if($select.parents('pre').length < 1){
		$select.css("display", "block");
		$(selector).show();
		
		var classes = $select.attr("class"),
			id      = $select.attr("id"),
			name    = $select.attr("name"),
			style	= $select.attr("style");
			
		var template  = '<div class="' + classes + '" style="' +  style + '">';
			template += '<a href="#" class="ui-select-trigger">' + $select.find(':selected').text() + '</a>';
			template += '<ul class="ui-select-options">';
			
			var idx = 0;
			$select.find("option").each(function(){
				var cl = '';
				$(this).attr('class') ? cl = $(this).attr('class') : cl;
				template += '<li class="' + cl + '"><a href="#" class="ui-select-option" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</a></li>';
			});
			template += '</ul></div>';
	  
			$select.hide().after(template);
		if($select.is(':disabled')){
			$select.next('.selectBox').addClass('disabled');
		}
	}
}

function selectVal(id, val){
	var valueIdx;
	$(id).next().find('li').each(function(){
			if($(this).find('a').attr('data-value') == val){
				valueIdx = $(this).index();
			}
	});
	
	var $select = $(id).next().find('li>a').eq(valueIdx).closest(".ui-select-wrapper").find("select");
	
	$select.val(val);
	$(id).next().find('li>a').eq(valueIdx).addClass("selection").parent().siblings().find(".ui-select-option").removeClass("selection");
	$(id).next().find('li>a').eq(valueIdx).closest('.ui-select-options').hide().siblings(".ui-select-trigger").text($(id).next().find('li>a').eq(valueIdx).text());
}

function jsSingleDayFilter(date, obj) {
	if (moment(new Date()).format("YYYYMMDD") == moment(date).format("YYYYMMDD")) return [false];
	else return [true];
}
</script>

<form id="form_rsv" name="form_rsv">
	<input type="hidden" id="DEPT_CD" name="DEPT_CD" value=""/> <!-- HMS 영업장 코드 -->
	<input type="hidden" id="I_BLOCK_SEQ" name="I_BLOCK_SEQ" value=""/> <!-- HMS 조회 SEQ -->
	<input type="hidden" id="MAX_PERSON" name="MAX_PERSON" value="1" /> <!-- 예약 인원수 -->	
<!-- offer 상세1 -->
<div class="layerPopWrap normalLayer popOfferDetail" id="popReservation">
	<div class="bg"></div>
	<!-- layerPopCont -->
	<div class="layerPopCont">
		<h1 class="popHeader">RESTAURANT RESERVATION</h1>
		<div class="reservationPopCont">
			<div class="textTopBox">
				예약 신청을 위한 페이지로, 예약 신청 후 해당 레스토랑 직원이 전화를 드려 예약을 확정해드립니다. <br />단, 레스토랑 사정에 따라 예약이 확정되지 않거나 시간이 변경될 수 있습니다.
			</div>
			
			<h2 class="dining_rsv_nm"></h2>
			<p class="subTxt"><span class="dining_rsv_loc"></span><span class="dining_rsv_tel"></span></p>
			
			<div class="reservationSelect">
				<dl>
					<dt><label for="RSV_DATE">방문 희망 일자 <span class="color">*</span></label></dt>
					<dd>
						<div class="inp calendar single" id="ReservationPopCont">
							<input type="text" id="RSV_DATE" name="RSV_DATE" value="" readonly="readonly">
							<button class="btnCalendar" type="button">달력</button>
						</div>
					</dd>
				</dl>
				<dl>
					<dt><label for="MEAL_TIME">중식/석식 <span class="color">*</span></label></dt>
					<dd>
						<select class="selectBox" id="MEAL_TIME" name="MEAL_TIME" disabled="disabled" required> <!-- 클래스 selectBox 추가 -->
							<option value="" class="disabled">선택</option>
							<option value="L">중식</option>
							<option value="D">석식</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt><label for="RSV_TIME">예약시간   <span class="color">*</span></label></dt>
					<dd>
						<select class="selectBox" id="RSV_TIME" name="RSV_TIME" disabled="disabled" required> <!-- 클래스 selectBox 추가 -->
							<option value="" class="disabled">선택</option>
						</select>
					</dd>
				</dl>
			</div>
			<div class="reservationSelect">
				<dl>
					<dt><label for="ADULT">성인</label></dt>
					<dd>
						<select class="selectBox person" id="ADULT" name="ADULT" required>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt><label for="CHILD">어린이</label></dt>
					<dd>
						<select class="selectBox person" id="CHILD" name="CHILD">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt><label for="TODDLER">유아</label></dt>
					<dd>
						<select class="selectBox person" id="TODDLER" name="TODDLER">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</dd>
				</dl>
			</div>
			
			<div class="useCheckOk">
				
				<div class="formInfoPop">
					<h3>개인정보</h3>
					
					<dl class="name">
						<dt><label for="NAME">이름 <span class="color">*</span></label></dt>
						<dd>
							<div class="inp">
								<input type="text" id="NAME" name="NAME"  required />
								<button class="btnDelete">삭제</button>
							</div>
						</dd>
					</dl>
					
					<dl class="email">
						<dt><label for="EMAIL">이메일 <span class="color">*</span></label></dt>
						<dd>
							<div class="inp">
								<input type="text" id="EMAIL" name="EMAIL" class="emailClass"  required placeholder="paradise@paradise.com" />
								<button class="btnDelete">삭제</button>
							</div>
							<div class="errorText">
								<!-- 에러 메시지 -->
							</div>
						</dd>
					</dl>
					
					<dl class="phone">
						<!-- TODO JH 휴대폰 번호 KO가 아닌 경우 처리 필요 -->
							
							<dt><label for="PHONE1">휴대폰 번호 <span class="color">*</span></label></dt>
							<dd>
								<select class="selectBox" id="PHONE1" name="PHONE1" required title="핸드폰 첫째자리 선택" >
									<option value="010">010</option>
									<option value="011" >011</option>
									<option value="016" >016</option>
									<option value="017" >017</option>
									<option value="018" >018</option>
									<option value="019" >019</option>
								</select>
								<div class="inp">
									<input type="text" id="PHONE2" name="PHONE2" maxlength="4" value="" required title="핸드폰 가운데자리 선택" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" />
									<button class="btnDelete">삭제</button>
								</div>
								<span>-</span>
								<div class="inp">
									<input type="text" id="PHONE3" name="PHONE3" maxlength="4" value="" required title="핸드폰 끝자리 선택" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" />
									<button class="btnDelete">삭제</button>
								</div>
								<div class="errorText">
									<!-- 에러 메시지 -->
								</div>
							</dd>
					</dl>
					
					<dl class="allergy">
						<dt><label for="ALLERGY">알러지 유무(선택)</label></dt>
						<dd>
							<div class="inp">
								<input type="text" id="ALLERGY" name="ALLERGY" />
								<button class="btnDelete">삭제</button>
							</div>
						</dd>
					</dl>
					
					<dl class="requestText">
						<dt><label for="REQ_ADD">추가 요청사항(선택)</label></dt>
						<dd>
							<textarea class="textarea" id="REQ_ADD" name="REQ_ADD"></textarea>
						</dd>
					</dl>
				</div>
				
				<div class="cautionBox">
					<h2>유의사항</h2>
					<ul class="dotList">
						<li>예약 신청 후 해당 레스토랑 직원이 확인하여 연락드립니다.</li>
						<li>레스토랑 예약 상황에 따라 일정이 조정되거나 예약이 진행되지 않을 수 있습니다.</li>
						<li>예약 취소를 원하실 경우 최소 하루 전까지(D-1일) 해당 레스토랑 전화 연락바랍니다.<br/>(로그인 후 예약신청 시 마이페이지 예약내역에서 취소 가능합니다.)</li>
						<li>어린이 및 유아 동반 시 사전 세팅을 위해 반드시 추가 요청사항에 기재 부탁드립니다.</li>
					</ul>
				</div>
				
				<div class="btnSubmit">
					<a href="javascript:jsApplyRsv();" class="btn small btnFull"><span>예약신청</span></a>
				</div>
			</div>
			<!-- //사용가능여부 체크 완료 -->
			
		</div>
		<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
	</div>
	<!-- //layerPopCont -->
</div>
<!-- //offer 상세1 -->

</form>







</body>
</html>