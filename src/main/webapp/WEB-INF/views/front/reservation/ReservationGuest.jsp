<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<script src="resources/pcPub/static/js/slick.min.js"></script>
	
	<link href="resources/pcPub/static/css/slick-theme.css" rel="stylesheet" />
	<link href="resources/pcPub/static/css/slick.css" rel="stylesheet" />

<style>

#pTotal {
    display: inline-block;
    width: 100%;
    height: 48px;
    border: 1px solid #e6e3df;
    padding: 0 39px 0 15px;
    line-height: 48px;
    font-size: 15px;
    }
    
.meal {
    position: relative;
    padding: 40px 0;
    border-top: 1px dotted #e6e3df;
	}
	
.meal .info {
    font-size: 12px;
    color: #666666;
    margin-left: 6px;

.requirement {
    position: relative;
    padding: 40px 0;
    border-top: 1px dotted #e6e3df;
	}
	
.requirement .info {
    font-size: 12px;
    color: #666666;
    margin-left: 6px;
    }
    
</style>

<body>
	<jsp:include page="../../common/menubar.jsp"/> 
	
	
<script>	
//결제 넘어가기 전에 예약테이블에 기록할 form 값 저장하기
function payment() {
	/* <input type="hidden" id="roomType" name="roomType"/>	<!-- 객실타입 -->
	<input type="hidden" id="checkIn" name="checkIn"/>		<!-- 체크인 -->
	<input type="hidden" id="checkOut" name="checkOut"/>	<!-- 체크아웃 -->
	<input type="hidden" id="adult" name="adult"/>			<!-- 성인 수 -->
	<input type="hidden" id="child" name="child"/>			<!-- 아동 수 -->
	<input type="hidden" id="breakfast" name="breakfast"/>	<!-- 조식여부 -->
	<input type="hidden" id="dinner" name="dinner"/>		<!-- 석식여부 -->
	<input type="hidden" id="require" name="require"/>		<!-- 요청사항 -->
	<input type="hidden" id="allpay" name="allpay"/>		<!-- 총금액 --> 
	
	$("#roomType").val()
	
	$('#CATE').val(CATE);
	$("#form1").attr("action", "dining.do");
	$("#form1").submit();*/
}
</script>

	<!-- 컨텐츠 영역 -->
	<section id="container">
		<!-- reservationWrap -->
		<div class="reservationWrap">
		
			<div class="reservationBox">
				<img src="https://www.p-city.com/upload_file/201911/1574921417053.jpg" alt="MAIN_IMG" />
				<div class="reservationInfoWrap">
					<h1>Winter Getaway</h1>
					<p>사랑하는 가족과 풍성하고 따뜻한 겨울 추억 만들기</p>
					<a href="#detailPop1" class="btn small" onclick="jsShowPop('3182')"><span>자세히 보기</span></a>
				</div>
				
				
				<div class="selectChoice clearFixed">
					<dl>
						<dt>체크인 &amp; 체크아웃</dt>
						<dd>
							<div id="TA0000010" class="inp calendar">
								<input  name="checkInOut" type="text" value="" readonly="readonly" />
								<a class="btnCalendar">달력</a>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>성인</dt>
						<dd>
							<select class="selectBox aCnt" id="aCnt">
								<c:forEach var="i" begin="1" end="8">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>
							어린이<a class="tooltipLink" data-tooltip="tip0"></a>
						<div class="tooltipBox" id="tip0"><p>어린이 기준 : 37개월 ~ 13세(초등학생) 이하</p></div>
						</dt>
						<dd>
							<select class="selectBox cCnt" id="cCnt">
								<c:forEach var="i" begin="0" end="8">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>총 인원</dt>
						<dd>
							<input type="text" id="pTotal" value="0 명">
						</dd>
					</dl>
				</div>
				
				<br><br>
				<div class="requirement">
					<h2>요청사항
						<span class="info" style="font-size: 12px; color: #666666; margin-left: 6px;">투숙 시 추가로 요청할 사항을 적어주십시오.</span>
					</h2>
					
					<textarea style="resize: none; width:99%; height:100%;"></textarea>
				</div>
				
				<br>
				<br>
				<div class="cautionBox">
					<h2 class="cautionH2">유의사항</h2>
					<ul>
						<li class="fontWe">홈페이지에서 예약결제한 상품을 취소할 경우, 홈페이지에서 직접 취소해야 신속한 처리가 가능합니다. 전화문의 시 처리가 지연되거나 제한될 수 있습니다.</li>
						<li>부가세 10%가 별도 부과됩니다.</li>
						<li>본 상품은 성인 2인 &amp; 어린이 2인 기준 상품입니다.
							<ul class="minusList">
							<li><span class="standardSpan">-</span>단, 1객실 당 성인은 최대 3인까지만 투숙 가능하며 성인 3인 투숙 시 어린이(37개월~13세)는 1인까지만 투숙 가능합니다.</li>
							<li><span class="standardSpan">-</span>성인 추가인원 투숙 시 50,000원(부가세 별도)의 요금이 부과되며 수영장, 플레이스테이션 체험존, 피트니스 혜택이 함께 제공됩니다.</li>
							<li><span class="standardSpan">-</span>엑스트라베드 추가 시 70,000원(부가세 별도)의 요금이 부과되며 엑스트라베드, 수영장, 플레이스테이션 체험존, 피트니스 혜택이 함께 제공됩니다.</li>
						</ul>
						</li>
						<li>유아용품 및 객실 대여품은 한정된 수량으로 선착순 대여 가능하며, 조기 마감될 수 있으므로 사전 예약을 권장드립니다.</li>
						<li>체크인은 오후 3시부터, 체크아웃은 11시까지이며 얼리체크인 또는 레이트체크아웃의 경우 별도 요금이 부과될 수 있습니다.</li>
					</ul>
				</div>
			</div>
		
		<!-- 우측메뉴 -->
		<div class="reservationAside">
			<section class="reservationSection">
				<div class="productHeader">
					<h1>
						<span>Summary</span>
					</h1>
					<a href="javascript:jsAllDelFromCart();" class="btnDeleteAll">전체삭제</a>
				</div>
				
				<div class="productWrap mCustomScrollbar" data-mcs-theme="dark" style="height:380px;!important">
				<div class="productListBox">
					<article class="productItem">
						<div class="productListH">
							<h2>
								<span>상품명 : Hotel Delluna</span>
							</h2>
					
						</div>
						<div class="productListC">
							<h3 id="hotelName">HOTEL DELLUNA</h3>		
							<p id="checkInOut">${res.res_checkIn} ~ ${res.res_checkOut}</p>			
							<p id="total">성인 ${res.res_adult} / 어린이 ${res.res_child}</p>			
							<p>${res.res_roomType} 룸</p>	
							<p id="res_smoking">흡연 여부  ${res.res_smoking}</p>	
							<p id="res_addBed">베드 추가  ${res.res_addBed}</p>
							
						</div>
					</article>
				</div>
			</div>
				<div class="casyBox">
					<dl>
						<dt>
							총액
						</dt>
						<dd class="totalAmt">원</dd>
					</dl>
				</div>	
				
				<button class="btn btnFull" disabled="disabled" onclick="javascript:payment();">
					<span>결제정보 입력하기</span>
				</button>
			</section>
		</div>
		
	<!-- Side Form 영역 -->
	<form id="reservationGuest" name="reservationGuest" method="post">
		<input type="hidden" id="roomType" name="roomType"/>	<!-- 객실타입 -->
		<input type="hidden" id="checkIn" name="checkIn"/>		<!-- 체크인 -->
		<input type="hidden" id="checkOut" name="checkOut"/>	<!-- 체크아웃 -->
		<input type="hidden" id="adult" name="adult"/>			<!-- 성인 수 -->
		<input type="hidden" id="child" name="child"/>			<!-- 아동 수 -->
		<input type="hidden" id="breakfast" name="breakfast"/>	<!-- 조식여부 -->
		<input type="hidden" id="dinner" name="dinner"/>		<!-- 석식여부 -->
		<input type="hidden" id="require" name="require"/>		<!-- 요청사항 -->
		<input type="hidden" id="allpay" name="allpay"/>		<!-- 총금액 -->
	</form>
	<!-- //Side Form 영역 -->
	
	
	<script type="text/javascript">
	
	function stayDay(){
		var cIn = $('.start-day').text();
		var cOut = $('.end-day').text();
		
		var inY = cIn.substr(0,4);
		var inM = cIn.substr(5,2);
		var inD = cIn.substr(8,2);
		
		var inDate = new Date(inY, inM-1, inD);
		
		var outY = cOut.substr(0,4);
		var outM = cOut.substr(5,2);
		var outD = cOut.substr(8,2);
		
		var outDate = new Date(outY, outM-1, outD);
		
		$("#checkIn").val(inDate);
		$("#checkOut").val(outDate);
		
		var stay = (((((outDate.getTime()-inDate.getTime())/1000)/60)/60)/24);
		
		return stay;
	}
	
	
	function selectRoom(li){
		//선택된 li에 대한 값들 불러다가 따로 저장하기, 선택된 li에 대해 표시하기 (테두리를 두른다던가)
		alert("li click event");
		
		var index = $(li).val();
		
		//기존에 선택된 값이 다시 클릭된 경우라면 삭제해야 함
		if(li.find("label").length){
			li.find("label").remove();
			//선택 후 summary에도 값 제거(사이드메뉴)
		}else{
			var label = $("<label>").attr({id : index}).text("선택");
			//선택 후 summary에도 값 추가(사이드메뉴)
		}
		
		console.log("inTypeIndex");
		console.log($("#inType"+index).val());
		$("#roomType").val($("#inType"+index).val());
		console.log($("#inCapacity"+index).val());
		console.log("inWeekDay");
		console.log($("#inWeekDay"+index).val());
		$("#inWeekDay"+index).val();
		
		var inWeekDay = $("#inWeekDay"+index).val();
		var stay = stayDay();
		
		$("#allpay").val(Number(inWeekDay) * Number(stay));
		
		//console.log($("#inWeekEnd"+index).val());
		
		li.append(label);
	};
	
	
	$(function(){
		
		//reservationBox 객체요소 가져오기
		var resBox = $(".reservationBox").eq(0);
		
		//체크인아웃 날짜를 선택하면 예약 가능한 방 리스트를 불러옴 (예약 가능한 방 없으면 '선택하신 날짜에 예약 가능한 방이 없습니다 팝업해주기')
		
		/**** 날짜 변경 감지 ****/
		$('.date-picker-wrapper').on("change click",function(){
			
			if($('.start-day').text()!="..."){
				if($('.end-day').text()!="..."){
					var cIn = $('.start-day').text();
					var cOut = $('.end-day').text();
					
					//날짜를 선택하면 해당 날짜에 예약 가능한 방 리스트를 뽑아옴.(사람 수는 고려하지 않는다.)
					$.ajax({
				        url : "roomListGuest.do",
				        method : "post",
				        data : {cIn:cIn, cOut:cOut},
				        dataType: "json",
				        success : function(data, status) {
				            if (status == "success") {
				            	//alert("예약 가능한 방 목록 조회 완료");
				            	//방 타입 리스트 출력되는 공간 생성 (선택 불가하면 불가하다고 알려주는 칸)
				            	var roomSelectBox = $("<div>").addClass("roomSelectBox typeInfo");
				            	
									if(data !=null){
                                        //객실 목록 생성
										jsMakeRoomList(data);
									}
										//조식석식
										
					            }else {
									//객실 목록이 없으면, 해당 날짜 초기화
									alert("해당 투숙 일정에 예약 가능한 객실이 없습니다.");
									delete summaryData.OFFER_CONT.CHECK_IN;
									delete summaryData.OFFER_CONT.CHECK_OUT;
									delete summaryData.OFFER_CONT.PER_DAY;
									resBox.find("div.calendar").find("input[type=text]").val("");
									$('article.productItem').eq(resBox.index()).find("p").eq(0).text(jsGetSettingText(summaryData.OFFER_TYPE, summaryData.OFFER_TYPE_CD, 1));
									jsSelectMonth(resBox, resBox.data("salestype_seq"));
								}
				        },
						error:function(request, status, errorData){
							alert("error code: " + request.status + "\n"
									+"message: " + request.responseText
									+"error: " + errorData);
						}
				    }); 
				}
			}
		});
		
		
		//객실 목록 생성
		function jsMakeRoomList(list) {	//list는 DB에서 받아온 룸타입이 들어가있는 data[i] 리스트
			
			//현재 노출 중인 객실 목록이 존재하면, 초기화(기존것을 없앤다)
			$(".roomSelectBox").remove();
		
			//기본 구성 요소 생성
			var roomSelectBox = $("<div>").addClass("roomSelectBox typeInfo");
			var h2Desc = $("<h2>" + "객실 선택" + "<span class=\"info\">" + "해당 일자에 투숙 가능한 객실 타입만 표시됩니다." + "</span></h2>");
			var swiperWrap = $("<div>").addClass("swiperWrap");
			var ul = $("<ul>").addClass("slick-initialized slick-slider");
			var drag = $("<div>").addClass("slick-drag");
			
			//객실 목록 상세내용 요소 생성
			var rrRoomType     = "";
			
			for(var i in list) {
				
				//객실 유형별 요소 작성	(객실 사진, 소개내용, 1박에 얼마인지 가격)
				if(rrRoomType != list[i].type) {
					
					rrRoomType   = list[i].type;
					var li       = $("<li>").attr({text : list[i].type
												,value : i
												,id : list[i].type
												,onclick : "javascript:selectRoom($(this));"});
					var inType	 = $("<input>").attr({type:"hidden"
													, value:list[i].type
													, id:"inType"+i});
					var inCapacity = $("<input>").attr({type:"hidden"
														, value:list[i].capacity
														, id:"inCapacity"+i});
					var inWeekDay = $("<input>").attr({type:"hidden"
													, value:list[i].weekDay
													, id:"inWeekDay"+i});
					var inWeekEnd = $("<input>").attr({type:"hidden"
													, value:list[i].weekEnd
													, id:"inWeekEnd"+i});
					var roomInfo = $("<div>").addClass("roomInfo");
					var img      = $("<p>").addClass("img").append($("<img>").attr({src     : "resources/pcPub/static/images/room/list/room_list1.jpg"}));
					var h3       = $("<h3>").text(list[i].type);
					var pAmt1    = $("<p>").attr({style:"font-size : 13px;"}).text("주중 : " + list[i].weekDay + "~" + " / " + "박");
					var pAmt2	 = $("<p>").attr({style:"font-size : 13px;"}).text("주말 : " + list[i].weekEnd + "~" + " / " + "박");	//주중 주말가 따로 보여줘야됨.
					ul.append(drag.append(li.append(roomInfo.append(img).append(h3).append(pAmt1).append(pAmt2).append(inType).append(inCapacity).append(inWeekDay).append(inWeekEnd))));
				} else {
					ul.find("#" + "RR_SEQ_" + list[i].type).closest("div.choice").append(radioBox);
				}
			}
			
			roomSelectBox.append(h2Desc).append(swiperWrap.append(ul));
			
			//cautionbox 앞에 객실 목록 뿌려주는 div 추가할것임
			$('.requirement').before(roomSelectBox);
			
			//객실목록 위에 조식석식 고르는 거 있으면 안되니까 없애버리기
			var adult = $("#aCnt").val();
			var child = $("#cCnt").val();
			var total = Number(adult) + Number(child);
			
			console.log("total");
			console.log(total);
			
			meal(total);
		}
		
		

		function reservationSlick(obj){
			
			var slider = $('.roomSelectBox .swiperWrap');
			if (!(obj == null || typeof obj == 'undefined')) {
				slider = obj.find(".swiperWrap");
			}
			
			//slide paging
			var swiperArrow = $("<div>").addClass("swiperArrow");
			var btnLeft     = $("<button>").addClass("btnLeft").append($("<span>"));
			var pNumber     = $("<p>").addClass("number").append($("<em>").text("1")).append($("<span>"));
			var btnRight    = $("<button>").addClass("btnRight").append($("<span>"));
			$(".reservationBox").find(".roomSelectBox").find("ul").after(swiperArrow.append(btnLeft).append(pNumber).append(btnRight));
			
			$(".swiperWrap").each(function(){
				
				var target = $(this),
					ul = target.find('ul'),
					list = ul.find('li'),
					number = $('.swiperArrow .number'),
					bnt_left = target.find('.btnLeft'),
					bnt_right = target.find('.btnRight');
				
				number.find('span').text(' / ' + Math.ceil(list.length/3));
					
				$('.slick-drag').slick({
				    prevArrow: bnt_left,
				    nextArrow: bnt_right,
					infinite: false,
					slidesToShow: 3,
					slidesToScroll: 3,
					speed: 300
				});
				$('.slick-slider').on("afterChange", function(event, slick, currentSlide){
					target.find('.swiperArrow .number em').text(currentSlide/3 +1);
				});
				
				target.css('height','auto');
			});
		};

		
		
		
		
		function meal(total){
			var h2Desc = $("<h2>" + "식사 선택" + "<span class=\"info\">" + "투숙객에게 제공되는 조식/석식 이용 여부를 선택합니다." + "</span></h2><br>");
			
			$(".meal").remove();
			
			var mealBox = $("<div>").addClass("meal");
			
			mealBox.append(h2Desc);
			
			stay=stayDay();
			
			var breakfast = $("<input>").attr({id : "breakfast"
											, name : "breakfast"
											, type : "number"
											, min : "0"
											, max : "10"});
							
			var dinner = $("<input>").attr({id : "dinner"
										, name : "dinner"
										, type : "number"
										, min : "0"
										, max : "10"});
			
			var bfLabel = $("<label>").attr({id : bfLabel}).text("조식 : ");
			var dnLabel = $("<label>").attr({id : dnLabel}).text("석식 : ");
			
			mealBox.append(bfLabel).append(breakfast).append("<br>").append(dnLabel).append(dinner).append("<br>");
				
			//cautionbox 앞에 조식석식 목록 뿌려주는 div 추가할것임
			$('.requirement').before(mealBox);
			
			//$('.meal').append("<br><br>");
		}
		
		
		/**** 인원수 변경 감지 ****/
		$('.aCnt .ui-select-option').on("click change", function(){			
			
			var adult = $(this).data('value');
			var child = $("#cCnt").val();
			var total = Number(adult) + Number(child);
			
			$("#adult").val(adult);
			$("#pTotal").val(total+"명");
			
			meal(total); 
			
		});
		
		$('.cCnt .ui-select-option').on("click change", function(){
			
			var adult = $("#aCnt").val();
			var child = $(this).data('value');
			var total = Number(adult) + Number(child);
			
			$("#child").val(child);
			$("#pTotal").val(total+"명");

			meal(total);
		});
		
		
		$("#breakfast").on("change click", function(){
			var sel = $("#breakfast option:selected").val();
			
			alert(sel);
			console.log("sel");
			console.log(sel);
		});
		
	});
	

	</script>
</body>
</html>