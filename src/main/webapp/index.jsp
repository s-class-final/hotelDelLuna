<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body class="pc ko">

<!-- 메인 -->
 <div id="main">
 <!-- 헤더 -->
 <jsp:include page="WEB-INF/views/common/menubar.jsp"/>
<!-- //헤더영역 -->


<script language="JavaScript">

// 스와이프 관련 오류 해결. 나중에 지울 것
/* 
$(document).ready(function(){
	
	//메인 갤러리 선언
	var galleryMain = new Swiper('.gallery-main', {
		preventClicks: false,
		preventClicksPropagation: false,
		slideToClickedSlide: true,
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev'
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'fraction',
		}
	});
});

 */
$(window).load(function(){
	if ($(".quickBar").length > 0) {
		setTimeout(function() {
			$(".quickBar").removeClass("view");
		}, 100);
	}
	
	
});

</script>

<!-- 컨텐츠 영역 -->


<section id="container">
	
	<!-- Main Visual 숨겨놓음 -->
	
	<!--   
	<div class="mainVisual">
		<div class="visualView">
			<div class="bg1"><span></span></div>
			<div class="bg2"><span></span></div>
			
			<div class="bg3"><span></span></div>
			
			<div class="bg4"><span></span></div>
			<div class="bg5"><span></span></div>
		</div>
		<div class="visual">
			<div class="bg1">
				<div class="textBox">
					<i class="icon1"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0">Hospitality</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.3">예술적 품격과 여유가 공존하는 파라다이스<br />시티에서 격이 다른 휴식을 경험해보세요.</p>
				</div>
				
				<div class="textView">
					<a href="#">
						<h2>HOTEL PARADISE</h2>
						<p class="text">최고급 리조트형 호텔객실과 부대시설을 갖춘 <br />컨템포러리 럭셔리 호텔 </p>
					</a>
					<a href="#">
						<h2>hotel Art Paradiso</h2>
						<p class="text">트렌디한 감성의 유러피안 컨셉으로 <br />예술적 영감을 불러 일으키는 디자인 호텔</p>
					</a>
				</div>
			</div>
			<div class="bg2">
				<div class="textBox">
					<i class="icon2"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.2">Excitement</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.5">이색적인 놀거리가 넘쳐나는 엔터테인먼트 스팟!<br />날마다 새로운 즐거움이 펼쳐집니다. </p>
				</div>
				
				<div class="textView">
					<a href="#">
						<h2>CIMER</h2>
						<p class="text">유럽의 감성과 한국식 찜질방 문화가 접목된 <br />세계 유일의 신개념 힐링 스파 </p>
					</a>
					<a href="#">
						<h2>CHROMA</h2>
						<p class="text">글로벌 정상급 DJ들과 함께 다양한 클러빙을 즐길 수 있는 나이트라이프 데스티네이션, 최고의 클럽</p>
					</a>
					<a href="#">
						<h2>wonderbox</h2>
						<p class="text">놀이와 축제가 있는 밤의 유원지 컨셉의 <br />가족형 실내 테마파크</p>
					</a>
				</div>
			</div>
			
			<div class="bg3">
				<div class="textBox">
					<i class="icon3"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.4">Gaming</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.7">여행지에서 찾는 특별한 행운! <br />쉴틈 없이 짜릿한 게이밍의 세계로 초대합니다.</p>
				</div>
				
				<div class="textView">
					<a href="#">
						<h2>casino</h2>
						<p class="text">품격 있는 서비스, 합리적 게임운영, 최첨단 시스템을 갖춘 한국 최대 외국인 전용 카지노</p>
					</a>
				</div>
			</div>
			
			<div class="bg4">
				<div class="textBox">
					<i class="icon4"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.6">Inspiration</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.9">발 딛는 순간, 내 안에 잠재해 있던 <br />예술적 영감이 살아납니다.</p>
				</div>
				
				<div class="textView">
					<a href="#">
						<h2>PLAZA</h2>
						<p class="text">트렌디한 라이프스타일을 창조하는 <br />이벤트형 쇼핑아케이드</p>
					</a>
					<a href="#">
						<h2>PARADISE ART SPACE</h2>
						<p class="text">국내 유명작가부터 세계적인 스타작가까지, <br />폭넓은 장르를 소개하는 예술 전시공간</p>
					</a>
					<a href="#">
						<h2>STUDIO PARADISE</h2>
						<p class="text">흥미로운 컨텐츠가 제작되며 색다른 이벤트가 <br />펼쳐지는 신개념 스튜디오</p>
					</a>
				</div>
			</div>
			<div class="bg5">
				<div class="textBox">
					<i class="icon5"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.8">Gourmet</p>
					<p class="text" data-animation="fadeInUp" data-delay="1.1">입 안을 가득 채우는 다채로운 풍미와 함께 <br />소중한 사람과의 시간은 더욱 빛이 납니다. </p>
				</div>
				
				<div class="textView">
					<a href="#">
						<h2>FINE DINING</h2>
						<p class="text">파라다이스시티에서 떠나는 미식 여행<br />유명 스타 쉐프들의 화려한 맛의 유혹</p>
					</a>
					<a href="#">
						<h2>CASUAL DINING</h2>
						<p class="text">간편하게 즐기는 글로벌 푸드 스트리트 <br />트렌디한 미식세계로의 초대</p>
					</a>
				</div>
			</div>
		</div>
		<span class="scrollDown">scroll down</span>
	</div>
	
	 -->
	<!-- Main Visual -->
	
	<!---------------------- 서브 메인!!!! ----------------------->
	<div class="subMain pad0i">
		
		<!-- FEAUTRED OFFERS 오퍼!!!부분  -->
		<section class="subMainCont SMOffers">
			<div class="innerBox">
				<h2>FEATURED OFFERS</h2>
				<p class="tit">델루나에서 준비한 특별한 상품과 혜택을 지금 만나보세요. </p>
				<div class="offers">
					<ul class="clearFixed">
						
						<li data-animation="fadeInUp">
							<a href="#">
								<div class="img">
									<img src="https://www.p-city.com/upload_file/201911/1574228365042.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Family Friendly</strong>
									<span class="sub">사랑하는 가족과 보내는 따뜻한 연말</span>
									<p class="price">
									
										<span class="price1">480,000원 ~ </span>
									
									
									
									</p>
									<span class="tag">#HOTEL PARADISE</span>
									
									
									<span class="date">2019-12-24~2019-12-31</span>
									
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="#">
								<div class="img">
									<img src="https://www.p-city.com/upload_file/201911/1573619194929.jpg" alt="">
								</div>
								<div class="txt">
									<strong>EarlyBird: Art Paradiso</strong>
									<span class="sub">3주 먼저 예약하고 현명하게 누리는 호텔 아트파라디소 얼리버드 혜택</span>
									<p class="price">
									
									
									
									</p>
									<span class="tag">#ART PARADISO #ART SPACE</span>
									
									
									<span class="date">2019-11-14~2020-03-31</span>
									
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="#">
								<div class="img">
									<img src="https://www.p-city.com/upload_file/201907/1562552196356.jpg" alt="">
								</div>
								<div class="txt">
									<strong>씨메르 아쿠아스파권/찜질스파권</strong>
									<span class="sub">씨메르 입장권</span>
									<p class="price">
									
									
									
									</p>
									<span class="tag">#CIMER</span>
									
									
									<span class="date">2018-09-20~2019-12-31</span>
									
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="/front/reservation?TAB_CD=PKG">
								<div class="img">
									<img src="https://www.p-city.com/upload_file/201911/1574146971501.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Black Friday in Cimer</strong>
									<span class="sub">(4탄) 11월 단 한 달간, 매주 금요일 찾아오는 놀라운 혜택</span>
									<p class="price">
									
										<span class="price1">30,000원 ~ </span>
									
									
									
									</p>
									<span class="tag">#CIMER</span>
									
									
									<span class="date">2019-11-22~2019-12-20</span>
									
								</div>
							</a>
						</li>
						
					</ul>
					<div class="btnMore"><a href="#"><span>전체 보기</span></a></div>
				</div>


			</div>
		</section>
		<!-- //FEAUTRED OFFERS 오퍼!!!부분  -->
		
		<!-- DELLUNA EVENTS 이벤트!!!부분   -->
		<section class="subMainCont SMEvent">
			<div class="innerBox">
				<h2>DELLUNA EVENTS</h2>
				<p class="tit">델루나에서 진행되는 다양한 이벤트를 만나보세요. </p>
				
				<ul class="eventList clearFixed">
					
					<li data-animation="fadeInUp" class="animated fadeInUp">
						<a href="javascript:jsEventView('4368')">
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<p class="img">
								<img src="https://www.p-city.com/upload_file/201911/1574207904809.jpg" alt="">
							</p>
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<div class="txt">
								<strong>FESTIVE WEEK</strong>
								<span class="sub">윈터 마켓과 스페셜 디너, 패키지, 공연 등이 가득한 델루나의  Festive Week</span>
								
								<span class="date">2019.11.20~2020.01.01</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp" class="animated fadeInUp">
						<a href="javascript:jsEventView('4372')">
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<p class="img">
								<img src="https://www.p-city.com/upload_file/201911/1574323511557.jpg" alt="">
							</p>
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<div class="txt">
								<strong>FESTIVE WEEK - SPECIAL OFFER</strong>
								<span class="sub">델루나가 추천하는 특별한 연말을 위한 OFFER!</span>
								
								<span class="date">2019.11.21~2019.12.31</span>
								
							</div>
						</a>
					</li>
					
					<li data-animation="fadeInUp" class="animated fadeInUp">
						<a href="javascript:jsEventView('4318')">
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<p class="img">
								<img src="https://www.p-city.com/upload_file/201911/1573625858230.jpg" alt="">
							</p>
							<!-- 2018.06.20 img를 감싸는 p태그 추가 -->
							<div class="txt">
								<strong>FESTIVE WEEK - SANTA VILLAGE</strong>
								<span class="sub">크리스마스 마켓과 시즌 푸드로 가득한 산타 빌리지</span>
								
								<span class="date">2019.11.29~2020.01.01</span>
								
							</div>
						</a>
					</li>
					
				</ul>
				<div class="btnMore"><a href="#"><span>전체 보기</span></a></div>
			</div>
		</section>
		
		<!-- //	DELLUNA EVENTS 이벤트!!!부분   -->
		
		<!--  갤러리 부분 일단 지움. 추후 삭제 예정 갤러리부분 갤러리 -->
		<!-- GALLERY -->
	<!-- 	<section class="subMainCont type-gallery">
			<div class="innerBox">
				<h2>IMAGE GALLERY</h2>
				<p class="tit">파라다이스시티의 다양한 시설을 한 눈에 만나보세요 .</p>
				<div class="swiper-container gallery-main">
					<div class="swiper-wrapper">
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU01');" style="background-image:url(https://www.p-city.com/upload_file/201908/1565571980748.jpg)">
							<span class="gallery-title">PARADISE CITY</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU02');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564560783416.jpg)">
							<span class="gallery-title">HOTEL PARADISE</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU03');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564560846634.jpg)">
							<span class="gallery-title">HOTEL ART PARADISO</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU04');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564560920759.jpg)">
							<span class="gallery-title">CASINO</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU05');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564560975039.jpg)">
							<span class="gallery-title">SPA CIMER</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU06');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564560887259.jpg)">
							<span class="gallery-title">CLUB CHROMA</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU07');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564561011929.jpg)">
							<span class="gallery-title">THEME PARK WONDERBOX</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU08');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564561103626.jpg)">
							<span class="gallery-title">SHOPPING PLAZA</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU09');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564561148751.jpg)">
							<span class="gallery-title">ART</span>
						</span>
					
						<span class="swiper-slide cPointer" onclick="javascript:goGalleryDtl('GSBU10');" style="background-image:url(https://www.p-city.com/upload_file/201907/1564561227907.jpg)">
							<span class="gallery-title">STUDIO PARADISE</span>
						</span>
					
					</div>
				</div>
				<div class="pagingWrap">
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
				</div>
				<div class="btnMore"><a href="/front/gallery"><span>갤러리 전체보기</span></a></div>
			</div>
		</section> -->
		<!-- //GALLERY -->
		
		<!-- MEMBERSHIP -->
		<section class="subMainCont SMMembership bg pb192i">
			<div class="innerBox">
				<h2>HOTEL DELLUNA MEMBERSHIP</h2>
				<p class="tit">델루나 고객님께 특별한 혜택을 제공해드리는 다양한 멤버십 프로그램을 소개합니다. </p>
				<ul>
					<li data-animation="fadeInUp" data-delay="0">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership1.jpg" alt="">
							<div class="cover">
								<div>
									<p>차별화된 회원 특전과 포인트<br />혜택을 제공하는 델루나<br />통합 무료 멤버십입니다.</p>
									<a href="#" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">HOTEL DELLUNA REWARDS</p>	
					</li>
					<li data-animation="fadeInUp" data-delay="0.2">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership2.jpg" alt="">
							<div class="cover">
								<div>
									<p>고품격 서비스와 다양한 혜택이 <br />어우러진 호텔 델루나 <br />통합 유료 멤버십입니다.</p>
									<a href="#" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">HOTEL DELLUNA SIGNATURE</p>	
					</li>
					<li data-animation="fadeInUp" data-delay="0.4">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership3.jpg" alt="">
							<div class="cover">
								<div>
									<p>회원의 가치를 더욱 <br />빛나게 해줄 차별화된 서비스와 <br />혜택 중심의 Invitation Only <br />크로마 전용 멤버십입니다.</p>
									<a href="#" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">CHROMA VIP</p>	
					</li>
					
					<li data-animation="fadeInUp" data-delay="0.6">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership4.jpg" alt="">
							<div class="cover">
								<div>
									<p>K-Style 프리미엄 <br />외국인 전용 카지노의 회원만을 <br />위해 다양한 혜택으로 구성된 <br />카지노 전용 멤버십입니다.</p>
									<a href="#" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">CASINO MEMBERSHIP</p>	
					</li>
					
				</ul>
			</div>
		</section>
		<!-- //MEMBERSHIP -->
	</div>
	<!---------------------- 서브 메인!!!! ----------------------->
	
</section>

<!-- //컨텐츠 영역 -->


<style>
.pd0i{padding: 0px !important;}
p.astBefore{color: #999; font-size: 12px !important; margin-left: 12px;}
p.astBefore::before {content: "*"; left: 66px; position: absolute; top: 163px;}
.fs12p{font-size:12px;}
.fs13p{font-size:13px;}
.fs16p{font-size:16px;}
</style>
<script type="text/javascript">


function setCookie(cname, cvalue, exdays) {
    console.log("overiding setCookie Pc");
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

/**
 * 레이어 팝업 초기화
	offFlag : 레이어 팝업 기본이벤트 제거 여부 (바탕 눌렀을 때 닫기처리 방지)
	title   : 레이어 팝업 타이틀
	ctxtArr : 레이어 팝업 컨텐츠 TEXT
	tClsArr : 레이어 팝업 컨텐츠 TEXT Class 추가
	**주의** > ctxtArr, tClsArr의 길이는 동일하게 구성
	btnObj  : 레이어 팝업 버튼 정보
 */
function jsInitInfoPop(offFlag, popId, title, ctxtArr, tClsArr, btnObj) {
	//레이어 팝업 기본이벤트 제거
	if (offFlag) {
		$(document).off('click','.btnPopClose, .layerPopWrap .bg');
	//레이어 팝업 기본이벤트 복원
	} else {
		$(document).on('click','.btnPopClose, .layerPopWrap .bg', function(){
			return jsLayerEventDefault(this);
		});
	}
	
	//레이어 팝업 닫기 버튼 이벤트 설정
	$(document).on('click','.btnPopClose',function(){
		return jsLayerEventDefault(this);
	});
	
	//레이어 타이틀 지정
	$(popId).find(".layerTitleText").text(title);
	
	//레이어 컨텐츠 초기화
	$(popId).find("div.loginBox").find("p.pb15i").remove();
	//레이어 컨텐츠 지정
	for (var i = ctxtArr.length - 1; i >= 0; i--) {
		//컨텐츠 기본 클래스
		var clsDef = "pb15i";
		//클래스 지정시 지정 클래스 추가
		if (!isNullOrEmpty(tClsArr[i])) {
			clsDef = clsDef + " " + tClsArr[i];
		}
		$(popId).find("div.loginBox").prepend($("<p>").addClass(clsDef).html(ctxtArr[i]));
	}
	
	//버튼 정보 설정
	if (!isNullOrEmpty(btnObj)) {
		//버튼 갯수 확인
		var btnTrId = btnObj.btnTrId;
		$(popId).find("tr.btnAreaTr").empty();
		$(popId).find("tr.btnAreaTr").append($(btnTrId).html())
		
		if ($(popId).find(".LayerbtnLeft").length > 0) {
			//레이어 좌측 버튼 설정(버튼명, 이벤트)
			$(popId).find(".LayerbtnLeft").text(btnObj.leftBtnNm);
			$(popId).find(".LayerbtnLeft").closest("a").attr("onclick", btnObj.leftBtnAct);
			
			//레이어 팝업 닫기 버튼 이벤트 재설정
			if (toNotNull(btnObj.btnUnionYn) == "Y") {
				$(document).off('click','.btnPopClose');
				$(document).on ('click','.btnPopClose', function(){
					jsLayerEventDefault(this);
					//현재 활성화되고 클릭된 레이어 팝업이 알림 팝업일 경우만 이벤트 설정
					if ($(this).closest(popId).length > 0) {
						$(popId).find(".LayerbtnLeft").click();
					}
					return false;
				});
			}
		}
		
		if ($(popId).find(".LayerbtnRight").length > 0) {
			//레이어 우측 버튼 설정(버튼명, 이벤트)
			$(popId).find(".LayerbtnRight").text(btnObj.rightBtnNm);
			$(popId).find(".LayerbtnRight").closest("a").attr("onclick", btnObj.rightBtnAct);
		}
	}
}

//레이어 팝업 기본 이벤트, ui.js > function layerPopClose()
function jsLayerEventDefault(obj) {
	$(obj).closest('.layerPopWrap').removeClass('on');
	$('body').removeClass('hidden');
	return false;
}
</script>



<div class="layerPopWrap" id="NOTICE_POP">
	<div class="bg"></div>
	<div class="layerPopCont">
		<div class="loginWrap">
			<h1 class="pt15i pb15i">
				<span class="layerTitleText fw500"></span> 
			</h1>
			<div class="loginBox">
				<div class="termTxt pb15i">
					<table class="bdNone">
						<tbody>
							<tr class="btnAreaTr bdNone"></tr> 
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<a href="javascript:void(0);" class="layerPopClose btnPopClose"></a>
	</div>
</div>



<table style="display:none;">
	<tbody>
		<tr id="btnOneTr">
			<td colspan="2" class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnLeft"></span>
				</a>
			</td>
		</tr>
	</tbody>
</table>

<table style="display:none;">
	<tbody>
		<tr id="btnTwoTr">
			<td class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnLeft"></span>
				</a>
			</td>
			<td class="bdNone">
				<a href="javascript:void(0);" class="dpi btn small full btnFull">
					<span class="LayerbtnRight"></span>
				</a>
			</td>
		</tr>
	</tbody>
</table>

			</div>
<!-- 	</div id=main>  -->	
</body>
</html>