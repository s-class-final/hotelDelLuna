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
</style>

<body>
	<jsp:include page="../../common/menubar.jsp"/> 
	

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
				
				<input type="hidden" class="itemDtlData" data-std_adult_cnt="2" data-std_child_cnt="2" data-addable_adult_cnt="1" data-addable_child_cnt="0" data-adult_rpo_amt="55000" data-child_rpo_amt="0" data-salestype_seq="455673" data-salestype="HPHP1912003" data-adult_add_roseq="221" data-child_add_roseq="0" data-adult_bf_roseq="162" data-child_bf_roseq="163" data-adult_bf_rpo_amt="50000" data-child_bf_rpo_amt="29000" data-period="1" data-adult_bf_max_cnt="3" data-child_bf_max_cnt="3" />
			</div>
		
		<input type="hidden" id="BADGE_TYPE2_CNT" value="0"/>
		
		<!-- 우측메뉴 -->
		<div class="reservationAside">
			<section class="reservationSection">
				<div class="productHeader">
					<h1>
						<span>Summary</span>
					</h1>
					<a href="javascript:jsAllDelFromCart();" class="btnDeleteAll">전체삭제</a>
				</div>
				
				<div class="productWrap mCustomScrollbar" data-mcs-theme="dark">
					<div class="productNone" style="display: none;">
						담긴 상품이 없습니다.
					</div>
					
					<div class="productListBox" style="display: none;">
					
						<article class="productItem">
							<div class="productListH">
								<h2>
									<span>상품명 : Hotel Delluna</span>
								</h2>
								<!-- <a onclick="#" class="btnDelete"></a> -->
								<a onclick="javascript:jsDelFromCart(this);" class="btnDelete"></a>
							</div>
							<div class="productListC">
								<!-- <h3>HOTEL PARADISE</h3>
								<p>체크인 / 체크아웃</p>
								<p>성인 / 어린이 / 유아</p>
								<p>객실</p>
								<p>베드타입</p>
								 -->
								<div class="productListC">
								<h3>HOTEL DELLUNA</h3>		
								<p id="checkInOut">${res.res_checkIn} ~ ${res.res_checkOut}</p>			
								<p id="total">성인 ${res.res_adult} / 어린이 ${res.res_child}</p>			
								<p>${res.res_roomType} 룸</p>	
								<p id="res_smoking">흡연 여부  ${res.res_smoking}</p>	
								<p id="res_addBed">베드 추가  ${res.res_addBed}</p>	
							
								<div class="casyBox">
									<dl>
										<dt>
											총액
										</dt>
										<dd class="totalAmt">원</dd>
									</dl>
								</div>
							
							</div>
							
							<input type="hidden" class="summaryItemData" data-product_item='{"RP_SEQ":3182,"OFFER_TYPE":"TA","OFFER_TYPE_CD":"000001","OFFER_CONT":{"PRICE_INFO":{"TOTAL_AMT":0,"DISC_AMT":0}},"OFFER_ORD":0,"OFFER_NAME":"Winter Getaway"}' />
						</article>
						
					</div>
				</div>
		
				<!-- 토탈 설정 -->
				<div class="productFooter">
					<dl>
						<dt>총액</dt>
						<dd id="f_total">원</dd>
					</dl>
					
					<dl>
						<dt>할인액</dt>
						<dd id="f_discount" class="txtRed">원</dd>
					</dl>
					
					<dl>
						<dt>포인트</dt>
						<dd id="f_point">P</dd>
					</dl>
				</div>
				
				<div class="productTotal productLen">
					<dl>
						<dt>최종금액</dt>
						<dd id="f_final">
							<span></span>
							원
						</dd>
					</dl>
				</div>
				
				<button class="btn btnFull" disabled="disabled" onclick="javascript:jsPaymentView();">
					<span>결제정보 입력하기</span>
				</button>
				
			</section>
		</div>
	<!-- Side Form 영역 -->
	<form id="frmSidePage" name="frmSidePage" method="post">
		<input type="hidden" name="TAB_CD" value=""/> <!-- 탭 구분 -->
	</form>
	<!-- //Side Form 영역 -->
	
	
	
	<script type="text/javascript">

	function selectRoom(li){
		//선택된 li에 대한 값들 불러다가 따로 저장하기, 선택된 li에 대해 표시하기 (테두리를 두른다던가)
		alert("li click event");
		
		var list = $(li).val();
		
		//기존에 선택된 값이 다시 클릭된 경우라면 삭제해야 함
		console.log(li);
		//li.find("label").text("취소");
		//li.remove();

		//var label = $("<label>").text("선택");
		
		
		if(li.find("label").length){
			li.find("label").remove();
			//선택 후 summary에도 값 제거(사이드메뉴)
		}else{
			var label = $("<label>").attr({id : list}).text("선택");
			//선택 후 summary에도 값 추가(사이드메뉴)
		}
		
		console.log("li는!");
		console.log(li);
		
		
		
		
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
					console.log($('.start-day').text());
					var cIn = $('.start-day').text();
					console.log($('.end-day').text());
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
                                        
										$("input:radio[name='RR_SEQ_SUITE_DELUXE']").prop('checked', true); // 선택하기
										//slide 이벤트 활성화
										reservationSlick($(".reservationBox").find(".roomSelectBox"));
                                        
										//초기 로딩시만 객실 선택
										jsSelectedRoom();
									}
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
			$("#roomSelectBox").remove();
			
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
					var roomInfo = $("<div>").addClass("roomInfo");
					var img      = $("<p>").addClass("img").append($("<img>").attr({src     : "resources/pcPub/static/images/room/list/room_list1.jpg"}));
					var h3       = $("<h3>").text(list[i].type);
					var pAmt1    = $("<p>").text("주중 : " + list[i].weekDay + "~" + " / " + "박");
					var pAmt2	 = $("<p>").text("주말 : " + list[i].weekEnd + "~" + " / " + "박");	//주중 주말가 따로 보여줘야됨.
					ul.append(drag.append(li.append(roomInfo.append(img).append(h3).append(pAmt1).append(pAmt2))));
				} else {
					ul.find("#" + "RR_SEQ_" + list[i].type).closest("div.choice").append(radioBox);
				}
			}
			
			roomSelectBox.append(h2Desc).append(swiperWrap.append(ul));
			
			//cautionbox 앞에 객실 목록 뿌려주는 div 추가할것임
			$('.cautionBox').before(roomSelectBox);
		}
		
		

		function reservationSlick(obj){
			
			var slider = $('.roomSelectBox .swiperWrap');
			if (!(obj == null || typeof obj == 'undefined')) {
				slider = obj.find(".swiperWrap");
			}
			
			//slide paging
			var swiperArrow = $("<div>").addClass("swiperArrow");
			var btnLeft     = $("<button>").addClass("btnLeft").append($("<span>").attr({"style" : "background:url('/resources/pcPub/static/images/common/btn/btn_slick_arrow.png') no-repeat 0 -10px"}));
			var pNumber     = $("<p>").addClass("number").append($("<em>").text("1")).append($("<span>"));
			var btnRight    = $("<button>").addClass("btnRight").append($("<span>"));
			$(".reservationBox").find(".roomSelectBox").find("ul").after(swiperArrow.append(btnLeft).append(pNumber).append(btnRight));
			
			/* 	$(".reservationBox").find("swiperWrap").text("aaaaaaaaa"); */
			
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

		
		


		//초기 로딩시 방 선택 Action
		function jsSelectedRoom() {
			//선택된 방이 있으면
			if("RR_SEQ" in data.OFFER_CONT) {
				var target  = "RR_SEQ_" + list[i].type
				var ul      = $(target).closest("ul.slick-initialized.slick-slider");
				var arrow   = ul.siblings("div.swiperArrow");
				var pageIdx = 0;
				//표시할 객실의 INDEX를 추출
				ul.find("li.slick-slide").each(function(index) {
					if($(this).find(target).length > 0) {
						pageIdx = index;
						return false;
					}
				});
				//SLIDE 페이지 이동
				ul.slick('slickGoTo', pageIdx);
				//객실 선택
				if (!loginCallFlag) {
					$(target).prop('checked', true);
				} else {
					$(target).click();
				}
			}
		}
		
		
		//금액환산 : 숫자 -> 문자 + 단위
		function jsToStringAmt(amt, exchange) {
			if (isNullOrEmpty(exchange)) exchange  = "원";  //금액 단위
			
			if (toNotNull(amt) == "" || isNaN(amt)) {
				return exchange;
			} else {
				return addCommaStr(amt.toString()) + " " + exchange;
			}
		}
		
		
		
		
		//*예약 관련 공통 Function STEP1 END  *//

		//*예약 관련 공통 Function START*//
		//요약상품목록 화면 설정 > changeFlag : none/add/del)
		function jsSectionView(changeFlag) {
			//우측메뉴 상품 목록 수
			var articleLen = $('article.productItem').length;
			
			if (articleLen == 0) jsSearchView();
			
			//최초 화면 로드 시점
			if ("none" == changeFlag) {
				//요약영역에 담긴게 하나도 없으면
				if (articleLen == 0) {
					//담긴 상품이 없습니다.
					$('div.productNone').css("display", "table-cell");
				} else {
					//요약영역 내용 활성화
					$('div.productListBox').show();
					
					
				}
			//상품 추가 시점
			} else if ("add" == changeFlag) {
				if (articleLen > 0) {
					$('div.productNone').hide();
					$('div.productListBox').show();
					//하단 버튼영역 활성화
					$("section.reservationSection > button.btn.btnFull").prop('disabled', false);
				}
			//상품 삭제 시점
			} else if ("del" == changeFlag) {
				if (articleLen == 0) {
					$('div.productListBox').hide();
					$('div.productNone').css("display", "table-cell");
					//하단 버튼영역 비활성화
					$("section.reservationSection > button.btn.btnFull").prop('disabled', true);
				} else {
					
					$("section.reservationSection > button.btn.btnFull").prop('disabled', jsDisabledPayment());
					
				}
			} else if ("mod" == changeFlag) {
				$("section.reservationSection > button.btn.btnFull").prop('disabled', jsDisabledPayment());
			}
		}

		//*예약 관련 공통 Function STEP2 START*//
		//상품 설정(상품설정 화면 : 정상 반영 시 true)
		function jsSetInfoToCart(eleObj) {
			var rtnFlag = true;
			var rtnChgFlag = false;
			var resBox = eleObj.closest("div.reservationBox");//예약상품 상세 ELEMENT
			var tgtIndex = $("div.reservationBox").index(resBox);//우측메뉴 Index(정렬순서)
			var itemInfo = $("article.productItem").eq(tgtIndex);//담은상품 요약정보 ELEMENT
			var offerType = itemInfo.data().OFFER_TYPE;
			var offerTypeCd = itemInfo.data().OFFER_TYPE_CD;
			
			//상품설정정보가 하나도 없으면 , 상품설정정보 추가
			if (!("OFFER_CONT" in itemInfo.data())) itemInfo.data("OFFER_CONT",{});
			
			var pTag = itemInfo.find("div.productListC").find("p");
			var offerCont = itemInfo.data().OFFER_CONT;
			
			//호텔상품
			if (offerType == "TA") {
				if(eleObj.hasClass("calendar")) {
					//우측메뉴 상품 기본정보 P태그 Index (1. 체크인&체크아웃)
					var pIndex = 1;
					//입력값 변경확인용 Param
					var param  = jsGetParamObject(eleObj, "CALENDAR");
					//객실 선택 초기화가 필요한 경우(값이 변경되었을 때)
					rtnFlag = jsIsChange(resBox, param);
					if (rtnFlag) {
						if (param.CHECK_IN.length > 0 && param.CHECK_OUT.length > 0) {
							//날짜가 설정되었으면 설정값 우측메뉴에 설정
							pTag.eq(pIndex-1).text(param.STAY_TERM.join(" ~ "));
							offerCont.CHECK_IN  = param.CHECK_IN;
							offerCont.CHECK_OUT = param.CHECK_OUT;
							offerCont.PER_DAY   = jsCalcPerDay(param.CHECK_IN, param.CHECK_OUT);
							//객실목록 초기화
							jsInitSelectRoom(resBox);
							//설정값이 생기면, 객실목록 조회
							jsSelectRoom(resBox, true);
							//조식 설정
							jsBreakfastView(eleObj, true);
						} else {
							//초기화되었으면 우측메뉴에 기본값 설정
							pTag.eq(pIndex-1).text(jsGetSettingText(offerType, offerTypeCd, pIndex));
							delete offerCont.CHECK_IN;
							delete offerCont.CHECK_OUT;
							delete offerCont.PER_DAY;
							//객실목록 초기화
							jsInitSelectRoom(resBox);
							//조식 설정(초기화)
							jsBreakfastView(eleObj, false);
						}
					} 
				} else if (eleObj.hasClass("ui-select-option")) {
					//객실 인원 선택
					if (eleObj.closest("div.selectChoice").length) {
						//우측메뉴 상품 기본정보 P태그 Index (2. 인원)
						var pIndex = 2;
						//입력값 변경확인용 Param
						var param = jsGetParamObject(eleObj, "STAYPEOPLE");
						//입력값 변동 확인
						rtnFlag = jsIsChange(resBox, param);
						if (rtnFlag) {
							//유효한 인원정보를 저장
							var targetObj  = param.TARGET.substring(0,1).toUpperCase() + "_COUNT";
							eval("offerCont." + targetObj + "=" + param.CHG_VAL);
							//문구 설정
							var titArr = new Array();
							if (offerCont.A_COUNT > 0) titArr.push("성인" + " " + offerCont.A_COUNT);
							if (offerCont.C_COUNT > 0) titArr.push("어린이" + " " + offerCont.C_COUNT);
							if (offerCont.B_COUNT > 0) titArr.push("유아" + " " + offerCont.B_COUNT);
							//설정된 인원 수에 따른 문구 노출
							if (titArr.length > 0) pTag.eq(pIndex-1).text(titArr.join(" / "));
							else pTag.eq(pIndex-1).text(jsGetSettingText(offerType, offerTypeCd, pIndex));
							
							//객실선택이 가능한 상태면 추가옵션에 대한 설정
							if (resBox.find("div.roomSelectBox").length) {
								//조식 설정
								jsBreakfastView(eleObj, true);
								//객실이 선택된 경우 추가인원 옵션 설정
								if ("RR_SEQ" in offerCont) {
									var optParam = jsGetParamObject(resBox, "ADDPEOPLE");
									//현재 등록된 옵션이 있으면 초기화
									jsInitAddOption(resBox, "ADDPEOPLE");
									//옵션 등록
									jsAddOptionToCart(eleObj, optParam);
								}
							}
						}
					//옵션 변경(조식)
					} else if (eleObj.closest("div.optionSelectBox").length) {
						var key      = eleObj.closest("div.optionSelectBox").data("key");
						var optParam = jsGetParamObject(eleObj, key);
						rtnFlag      = jsIsChange(resBox, optParam);
						if (rtnFlag) {
							//현재 등록된 옵션이 있으면 초기화
							jsInitAddOption(resBox, key);
							//옵션 등록
							jsAddOptionToCart(eleObj, optParam);
						}
					}
				} else if (eleObj.is("input:radio") && eleObj.closest("div.roomSelectBox").length) {
					//객실 정보(객실,침대)
					var param  = jsGetParamObject(eleObj, "ROOMINFO");
					rtnFlag    = jsIsChange(resBox, param);
					if (rtnFlag) {
						//우측메뉴 상품 기본정보 P태그 Index (3. 객실)
						var pIndex = 3;
						//객실정보 저장
						offerCont.RR_ROOM_CATEGORY = param.RR_ROOM_CATEGORY;
						offerCont.RR_ROOM_TYPE     = param.RR_ROOM_TYPE;
						offerCont.RR_SEQ           = param.RR_SEQ;
						offerCont.RMTYPE           = param.RMTYPE;
						offerCont.SALESTYPE_SEQ    = resBox.data().salestype_seq;
						//문구 설정
						pTag.eq(pIndex-1).text(param.RR_ROOM_TYPE_NM);
						
						//우측메뉴 상품 기본정보 P태그 Index (4. 침대)
						pIndex = 4;
						//침대정보 저장
						offerCont.RR_BED_TYPE = param.RR_BED_TYPE;
						//문구 설정
						pTag.eq(pIndex-1).text(param.RR_BED_TYPE_NM);
						
						//상품 금액정보 저장
						jsCalcProdAmt(resBox, itemInfo, offerCont, param);
						
						//인원추가 관련 파리미터
						var optParam = jsGetParamObject(resBox, "ADDPEOPLE");
						//현재 등록된 인원추가가 있으면 초기화
						jsInitAddOption(resBox, "ADDPEOPLE");
						//인원추가 발생시 옵션 추가
						jsAddOptionToCart(eleObj, optParam);
					}
				}
			} 
			
			//버튼 전환
			jsSectionView("mod");
			
			//초기로딩시점과 로그인 콜 시점이 아니면, 
			if (!initPageFlag && !loginCallFlag) {
				//입력값 변동이 유효할 때 JSON DATA 저장 (정상변경 OR 보정변경)
				if (rtnFlag || rtnChgFlag) {
					jsPreSaveJsonData();
				}
			}
			
			return rtnFlag;
		}
		
		
		

		
	
	
		
		
		
		
		
		/**** 인원수 변경 감지 ****/
		$('.aCnt .ui-select-option').on("click change", function(){			
			var adult = $(this).data('value');
			var child = $("#cCnt").val();
			var total = Number(adult) + Number(child);
			
			$("#pTotal").val(total+"명");
		})
		
		$('.cCnt .ui-select-option').on("click change", function(){
			var adult = $("#aCnt").val();
			var child = $(this).data('value');
			var total = Number(adult) + Number(child);
			
			$("#pTotal").val(total+"명");
		})
	});

	


	</script>
</body>
</html>