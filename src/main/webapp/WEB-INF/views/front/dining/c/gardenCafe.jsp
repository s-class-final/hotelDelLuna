<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* reset */
button { margin:0; padding:0; border:0; font:inherit; color:inherit; background:transparent; overflow:visible; cursor:pointer; line-height:1; }

/* jsSwiperMotion */
.jsSwiperMotion { display:none; position:relative; }
.jsSwiperMotion .tit { margin-bottom:12px; font-size:16px; color:#333;}
.jsSwiperMotion .slick-slider { position:static;}
.jsSwiperMotion .swiperWrap li { width:260px;}
.jsSwiperMotion .swiperWrap h2 { margin-bottom:10px; color:#333; font-weight:450; text-transform:uppercase;}
.jsSwiperMotion .swiperWrap p { color:#666;}

.jsSwiperMotion .btnArrow { overflow:hidden; margin-top:24px;}
.jsSwiperMotion .btnArrow a { display:block; float:left; width:32px; height:17px; font-size:0; background: url('resources/pcPub/static/images/mypage/btn_membership_arrow.png') no-repeat;}
.jsSwiperMotion .btnArrow .btnRight { float:right; background-position:0 -17px;}

.jsSwiperMotion .slick-dots { position:absolute; bottom:5px; left:50%; text-align:center; transform:translateX(-50%); font-size:0;}
.jsSwiperMotion .slick-dots li { display:inline-block; width:6px; height:6px; margin:0 4px; border-radius:50%; background:#c6c6c6;}
.jsSwiperMotion .slick-dots li.slick-active { background:#9c836a;}

.jsSwiperMotion .swiperArrow { position:absolute; top:0px; right:0;}
.jsSwiperMotion .swiperArrow [class*=btn] { width:19px; height:19px;}
.jsSwiperMotion .swiperArrow [class*=btn].slick-disabled span { background-position:0 0;}
.jsSwiperMotion .swiperArrow .btnLeft span { display:inline-block; width:6px; height:10px; font-size:0; vertical-align: middle; background:url('resources/pcPub/static/images/common/btn/btn_slick_arrow.png') no-repeat 0 -10px;}
.jsSwiperMotion .swiperArrow .btnRight span { display:inline-block; width:6px; height:10px; font-size:0; vertical-align: middle; transform:rotate(180deg); background:url('resources/pcPub/static/images/common/btn/btn_slick_arrow.png') no-repeat 0 -10px;}
.jsSwiperMotion .swiperArrow .number { display:inline-block; width:75px; text-align:center; vertical-align: middle; font-weight:300; color:#999;}
.jsSwiperMotion .swiperArrow .number em { color:#9c836a;}

.jsSwiperMotion.type2 .slick-initialized { margin-left:-32px;}
.jsSwiperMotion.type2 .slick-slide { margin-left:32px;}


/* swiper*/
.swiper-container{margin:0 auto;position:relative;overflow:hidden;direction:ltr;-webkit-backface-visibility:hidden;-moz-backface-visibility:hidden;-ms-backface-visibility:hidden;-o-backface-visibility:hidden;backface-visibility:hidden;z-index:1}.swiper-wrapper{position:relative;width:100%;-webkit-transition-property:-webkit-transform,left,top;-webkit-transition-duration:0s;-webkit-transform:translate3d(0px,0,0);-webkit-transition-timing-function:ease;-moz-transition-property:-moz-transform,left,top;-moz-transition-duration:0s;-moz-transform:translate3d(0px,0,0);-moz-transition-timing-function:ease;-o-transition-property:-o-transform,left,top;-o-transition-duration:0s;-o-transition-timing-function:ease;-o-transform:translate(0px,0);-ms-transition-property:-ms-transform,left,top;-ms-transition-duration:0s;-ms-transform:translate3d(0px,0,0);-ms-transition-timing-function:ease;transition-property:transform,left,top;transition-duration:0s;transform:translate3d(0px,0,0);transition-timing-function:ease;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}.swiper-free-mode>.swiper-wrapper{-webkit-transition-timing-function:ease-out;-moz-transition-timing-function:ease-out;-ms-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out;margin:0 auto}.swiper-slide{float:left;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}.swiper-wp8-horizontal{-ms-touch-action:pan-y}.swiper-wp8-vertical{-ms-touch-action:pan-x}

/* Slider */
.slick-slider{position: relative;display: block;box-sizing: border-box;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;-webkit-touch-callout: none;-khtml-user-select: none;-ms-touch-action: pan-y;touch-action: pan-y;/* -webkit-tap-highlight-color: transparent; */}
.slick-list{position: relative;display: block;overflow: hidden;margin: 0;padding: 0;}
.slick-list:focus{outline: none;}
.slick-list.dragging{cursor: pointer;cursor: hand;}
.slick-slider .slick-track,
.slick-slider .slick-list{-webkit-transform: translate3d(0, 0, 0);-moz-transform: translate3d(0, 0, 0);-ms-transform: translate3d(0, 0, 0);-o-transform: translate3d(0, 0, 0);transform: translate3d(0, 0, 0);}
.slick-track{position: relative;top: 0;left: 0;display: block;}
.slick-track:before,
.slick-track:after{display: table;content: '';}
.slick-track:after{clear: both;}
.slick-loading .slick-track{visibility: hidden;}
.slick-slide{display: none;float: left;height: 100%;min-height: 1px; outline:0;}
[dir='rtl'] .slick-slide{float: right;}
.slick-slide.slick-loading img{display: none;}
.slick-slide.dragging img{pointer-events: none;}
.slick-initialized .slick-slide{display: block;}
.slick-loading .slick-slide{visibility: hidden;}
.slick-vertical .slick-slide{display: block;height: auto;border: 1px solid transparent;}
.slick-arrow.slick-hidden {display: none;}

</style>
</head>
<body>
 <jsp:include page="../../../common/menubar.jsp"/>


<script>
$(document).ready(function() {
	
});

function jsList(CATE) {
	$('#CATE').val(CATE);
	$("#form1").attr("action", "dining.do");
	$("#form1").submit();
}

function jsDownImg(F_SEQ){
	$('#F_SEQ_3').val(F_SEQ);
	$('#form3').attr('action', '/file/download');
	submitGet($('#form3'));
}
</script>

<form name="form3" id="form3">
	<input type="hidden" id="F_DIVISION_3" name="F_DIVISION" />
	<input type="hidden" id="F_PK_3" name="F_PK" />
	<input type="hidden" id="F_TYPE_3" name="F_TYPE"/>
	<input type="hidden" id="F_SEQ_3" name="F_SEQ"/>
</form>
<!-- 컨텐츠 영역 -->
<section id="container">
	
	<div class="hotelParadiseWrap pb0">
		<div class="innerBox">
			<h1 class="contTitle"><span>다이닝</span>미슐랭 스타 레스토랑부터 트렌디한 Bar까지, <br />호텔 파라다이스에서 펼쳐지는 미식의 세계로 초대합니다.</h1>
			
			<section class="jsSwiperMotion">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/dining/gardenCafe/img_gardenCafe1.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/dining/gardenCafe/img_gardenCafe2jpg" alt="" /></p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>
			
			<div class="detailTextBox">
				<h2>GARDEN CAFÉ</h2>
				<p class="subTit">유럽의 정취를 지닌 카페</p>
				<p class="text">호텔 파라다이스만의 감성을 담아 정성스러운 손길로 준비되는 베이커리와 패스트리를 만나 보실 수 있는 유럽스타일 카페입니다. <br />예술적 감각을 담은 케이크와 신선한 베이커리류, 테이크 아웃 가능한 커피와 음료 등을 함께 즐겨보시기 바랍니다.</p>
				<div class="btnGroup">
					<!-- 2018.07.09 수정 -->
					<a href="#pop1" class="btn small btnFull layerPopOpen"><span>문의하기</span></a>
				</div>
			</div>
			
			<div class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl>
						<dt>운영시간</dt>
						<dd>10:00~22:00</dd>
					</dl>
					<dl>
						<dt>좌석수</dt>
						<dd>총 38 석</dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>HOTEL PARADISE 1층<br />
							<!-- 오픈시점 삭제 
							<a href="#" class="link">+ 위치 보기</a>
							-->
						</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>032-729-2262</dd>
					</dl>
				</div>
				<!--
				<a href="#" class="tbLink">위성채널정보</a>
				-->
			</div>
			
			<!-- 세부 서비스  -->
			<!-- <div class="detailInfo">
				<h3>시그니처 메뉴 (Premium Cake)</h3>
				<section class="jsSwiperMotion">
					<div class="swiperWrap" data-show="2">
						<ul>
							
							<li>
								<p class="img"><img src="/pcPub/static/images/hotalParadise/img_gardenCafe_menu2.jpg" alt="" /></p>
								<h4>크림 치즈 케이크</h4>
								<p class="text">진한 크림치즈의 풍미를 느낄 수 있는 치즈케이크입니다. <br />달콤한 초코 크럼블과 크림치즈가 어우러진 부드러우면서도 바삭한 식감을 느끼실 수 있습니다.</p>
								<p class="text">가격 50,000원</p>
							</li>
							<li>
								<p class="img"><img src="/pcPub/static/images/hotalParadise/img_gardenCafe_menu3.jpg" alt="" /></p>
								<h4>당근 케이크</h4>
								<p class="text">당근을 이용하여 만들어진 시트와 크림치즈, <br />시나몬 파우더가 만나 달콤함과 건강한 맛이 조화로운 케이크입니다.</p>
								<p class="text">가격 50,000원</p>
							</li>
							<li>
								<p class="img"><img src="/pcPub/static/images/hotalParadise/img_gardenCafe_menu4.jpg" alt="" /></p>
								<h4>계절과일 생크림 케이크</h4>
								<p class="text">부드럽고 촉촉한 스폰지 시트, 달콤한 생크림, 각 계절의 제철 과일이 조화를 이룬 부드러운 생크림 케이크 입니다.</p>
								<p class="text">가격 60,000원</p>
							</li>
							
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a>
						<a href="#" class="btnRight">우측</a>
					</div>
				</section>
			</div> -->
			<!-- //세부 서비스  -->
			
			<!-- 세부 서비스  -->
			<!-- <div class="detailInfo">
				<h3>시그니처 메뉴 (Gift Set)</h3>
				<section class="jsSwiperMotion">
					<div class="swiperWrap" data-show="2">
						<ul>
							<li>
								<p class="img"><img src="/pcPub/static/images/hotalParadise/img_gardenCafe_menu6.jpg" alt="" /></p>
								<h4>사각 쿠키 세트</h4>
								<p class="text">호텔 파라다이스시티의 수제 쿠키 ‘아몬드 튀일, 쉘, 마스카포네 치즈, 얼그레이, 헤이즐넛 샤브레, <br />호두 캔디’ 중 2종 선택 하도록 구성 된 쿠키세트입니다.</p>
								<p class="text">가격 40,000원</p>
							</li>
							<li>
								<p class="img"><img src="/pcPub/static/images/hotalParadise/img_gardenCafe_menu7.jpg" alt="" /></p>
								<h4>원형 쿠키 세트</h4>
								<p class="text">고소한 풍미의 아몬드 튀일과 반건조과일, 호두 캔디로 구성 된 쿠키 세트 입니다.</p>
								<p class="text">가격 45,000원</p>
							</li>
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a>
						<a href="#" class="btnRight">우측</a>
					</div>
				</section>
			</div> -->
			<!-- //세부 서비스  -->
			<!--
			<div class="cautionBox type2">
				<h2>안내사항</h2>
				<ul class="dotList">
					<li>18년부터 주중(월~금),주말(토,일)로 진행됩니다.</li>
					<li>공휴일 및 법정 휴일은 주말 요금이 적용됩니다.</li>
					<li>12월과 스페셜 데이에는 운영 시간 및 가격이 변동 될 수 있습니다.</li>
					<li>설 연휴, 추석 연휴, 7월&amp;8월 성수기 시즌에는 운영시간이 변동 될 수 있습니다. </li>
					<li>어린이 요금은 37개월 이상 ~ 만 12세 이하의 초등학생에게 적용됩니다.</li>
				</ul>
			</div>
			-->
		</div>
		
		
		



<div class="fullBg mt">
	<div class="innerBox">
		<div class="tapBox">
			<ul class="eventTab clearFixed">
				<li class="on"><a href="javascript:void(0);">Restaurant</a></li>
				<li><a href="javascript:void(0);">Café &amp; Bar</a></li>
			</ul>
		</div>
		<!-- Restaurant -->
		<div class="tapView" style="display:block;">
			<div class="jsSwiperMotion type2 eventSwipe">
				<div class="swiperWrap" data-show="3">
					<ul>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="OnThePlate"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list1.jpg" alt="" /></p>
								<h4>ON THE PLATE</h4>
								<p class="text">유럽, 뉴욕, 상해의 최신 Trend를 반영, 다섯가지 Station으로 구성된 Premium Buffet Restaurant</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="LaScala"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list2.jpg" alt="" /></p>
								<h4>LA SCALA</h4>
								<p class="text">밀라노의 감성으로 이탈리아 본연의 맛을 추구하는 Italian Gourmet Restaurant</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="Raku"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list3.jpg" alt="" /></p>
								<h4>RAKU</h4>
								<p class="text">모던한 분위기에서 즐기는 트렌디한 일식의 진수</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="ImperialTreasure"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list4.jpg" alt="" /></p>
								<h4>IMPERIAL TREASURE</h4>
								<p class="text">한국 최초로 선보이는 정통 광동식 Fine Dining Cuisine</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="TheEmperor"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list8.jpg" alt="" style="width:100%;"/></p>
								<h4>The Emperor</h4>
								<p class="text">최고의 고객에게 최고만을 선보이는 카지노 클럽 멤버십 전용 레스토랑</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="Cafe9"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list9.jpg" alt="" style="width:100%;"/></p>
								<h4>Café 9</h4>
								<p class="text">게임 속 오아시스, 미식의 즐거움을 경험하는 곳</p>
							</a>
						</li>
					</ul>
					
					<div class="swiperArrow">
						<button class="btnLeft"><span>좌측</span></button>
						<p class="number"><em>1</em><span></span></p>
						<button class="btnRight"><span>우측</span></button>
					</div>
				</div>
			</div>
		</div>
		<!-- //Restaurant -->
		
		<!-- Café &amp; Bar -->
		<div class="tapView">
			<div class="jsSwiperMotion type2 eventSwipe">
				<div class="swiperWrap" data-show="3">
					<ul>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="Rubik"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list5.jpg" alt="" /></p>
								<h4>RUBIK</h4>
								<p class="text">색다른 공연을 만나는 라이브 뮤직 라운지</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="LoungeParadise"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list6.jpg" alt="" /></p>
								<h4>LOUNGE PARADISE</h4>
								<p class="text">음악이 흐르는 로비라운지</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="GardenCafe"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list7.jpg" alt="" /></p>
								<h4>GARDEN CAFÉ</h4>
								<p class="text">유럽의 정취를 지닌 카페</p>
							</a>
						</li>
						<li>
							<c:url var="diningView" value="diningView.do">
								<c:param name="type" value="Bar21"/>
							</c:url>
							<a href="${diningView }">
								<p class="img"><img src="resources/pcPub/static/images/dining/list/dining_list10.jpg" alt="" style="width:100%;"/></p>
								<h4>Bar 21</h4>
								<p class="text">카지노를 한층 더 다이내믹하게 즐길 수 있는 카지노 엔터테인먼트바</p>
							</a>
						</li>
					</ul>
					
					<div class="swiperArrow">
						<button class="btnLeft"><span>좌측</span></button>
						<p class="number"><em>1</em><span></span></p>
						<button class="btnRight"><span>우측</span></button>
					</div>
				</div>
			</div>
		</div>
		<!-- //Café &amp; Bar -->
	</div>
</div>


	</div>

</section>
<!-- //컨텐츠 영역 -->

<!-- 1:1 문의 (레이어 팝업) -->









<script>
var title = "1:1 문의";

var strFacility1 = "000001";
var strFacility2 = "000004";

var fac3HotelParaDining = {
        
        DTL_CD: ["On the Plate", "La Scala", "Raku", "Imperial Treasure", "Rubik", "Lounge Paradise", "Garden Cafe"]
      , DTL_CD_NM: ["ON THE PLATE", "LA SCALA", "RAKU", "Imperial Treasure", "Rubik", "Lounge Paradise", "Garden Café"]
};

var fac3ArtParaDining = {
        DTL_CD: ["Serase", "Lounge & Bar Serase"]
      , DTL_CD_NM: ["SERASÉ", "LOUNGE &amp; BAR SERASÉ"]
};

var fac3GrpWedEstimate = {
        DTL_CD: ["컨벤션/MICE", "웨딩", "가족연회"]
      , DTL_CD_NM: ["컨벤션/MICE", "웨딩", "가족연회"]
};

var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var blank_pattern = /[\s]/g;

function jsGetMultiLang(sbu_code){
	if( (sbu_code < 1 || sbu_code > 12)){
        return;
    }
        
    var hotelMenu = new Array();
    hotelMenu[0] = '객실';
    hotelMenu[1] = '상품/이벤트';
    hotelMenu[2] = '시설'; 
    hotelMenu[3] = '다이닝';
    hotelMenu[4] = '기타';
    
    var casinoMenu = new Array();
    casinoMenu[0] =  '게임';
    casinoMenu[1] =  '상품/이벤트';
    casinoMenu[2] =  '카지노멤버십/포인트';
    casinoMenu[3] =  '기타 서비스';
    
    var cimerMenu = new Array();
    cimerMenu[0] =  '시설이용';
    cimerMenu[1] =  'F&B';
    cimerMenu[2] =  '입장권/요금';
    cimerMenu[3] =  '제휴할인';
    cimerMenu[4] =  '이벤트/액티비티';
    cimerMenu[5] =  '기타';
    
    var chromaMenu = new Array();
    chromaMenu[0] =  '시설이용';
    chromaMenu[1] =  '공연';
    chromaMenu[2] =  '크로마 VIP 멤버십';
    chromaMenu[3] =  '요금';
    chromaMenu[4] =  '기타';
    
    var wonderboxMenu = new Array();
    wonderboxMenu[0] =  '시설이용';
    wonderboxMenu[1] =  '이벤트/액티비티';
    wonderboxMenu[2] =  '입장권/요금';
    wonderboxMenu[3] =  'F&B';
    wonderboxMenu[4] =  '제휴할인';
    wonderboxMenu[5] =  '기타';
    
    var plazaMenu = new Array();
    plazaMenu[0] =  '매장이용';
    plazaMenu[1] =  '입점문의';
    plazaMenu[2] =  '기타';
    
    var spaceMenu = new Array();
    spaceMenu[0] =  '전시';
    spaceMenu[1] =  '입장권/요금';
    spaceMenu[2] =  '이벤트/액티비티';
    spaceMenu[3] =  '기타';
    
    var studioMenu = new Array();
    studioMenu[0] =  '행사/이벤트';
    studioMenu[1] =  '대관';
    studioMenu[2] =  '시설';
    studioMenu[3] =  '기타';
    
    var gwMenu = new Array();
    gwMenu[0] =  '견적';
    gwMenu[1] =  '서비스';
    gwMenu[2] =  '기타';
    
    var memberMenu = new Array();
    memberMenu[0] =  '파라다이스 리워즈  포인트';
    memberMenu[1] =  '파라다이스 시그니처';
    memberMenu[2] =  '크로마 VIP';
    memberMenu[3] =  '카지노';
    
    var etcMenu = new Array();
    etcMenu[0] =  '기타';
    
    var Menu = new Array();
    Menu[1] = hotelMenu;
    Menu[2] = hotelMenu;
    Menu[3] = casinoMenu;
    Menu[4] = cimerMenu;
    Menu[5] = chromaMenu;
    Menu[6] = wonderboxMenu;
    Menu[7] = plazaMenu;
    Menu[8] = spaceMenu;
    Menu[9] = studioMenu;
    Menu[10] = gwMenu;
    Menu[11] = memberMenu;
    Menu[12] = etcMenu;
    
    return Menu[sbu_code];
}

$(window).load(function(){
    //Ajax 대기시간 설정 (IE브라우저 처리시간 문제 대응)
    var timer = setInterval(function() {
        if ($('#FACILITY2').children("option").length > 0) {
            //Ajax 대기시간 초기화
            clearInterval(timer);
            //load 이벤트 시작
            selectVal("#FACILITY2", "000004");
            $('#FACILITY2').children("option").each(function() {
                if ($(this).is(":selected")) {
                    $(this).trigger("change");
                }
            });
            //'세부시설 유형' 초기값 설정
            selectVal("#FACILITY3", "On the Plate");
        }
    }, 100);
    
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$(document).ready(function(){
    // 팝업 제목 설정
    
    $(".popHeaderInq").text(title);
    
    $("#PI_VOC_CN").val("");
    
    // '문의 유형' 셀렉트 박스 선택 이벤트
    $("#QUESTION").next().on("mouseup",".ui-select-option", function(e){
        if($(this).attr('data-value')) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
        } else {
            $("#FACILITY1").prop("disabled", true);
            $("#FACILITY1").next("div.selectBox").addClass("disabled");
        }
        $("#FACILITY2").prop("disabled", true);
        $("#FACILITY2").next("div.selectBox").addClass("disabled");
        
        selectVal("#FACILITY1", "");
        selectVal("#FACILITY2", "");
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
        
    });
    
    // '문의 유형' 셀렉트 박스 선택 이벤트
    $("#QUESTION").on("change", function(e){
        if($(this).val()) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
        } else {
            $("#FACILITY1").prop("disabled", true);
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY1").next("div.selectBox").addClass("disabled");
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY1", "");
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
        
    });
    
    // '시설' 셀렉트 박스 선택 이벤트
    $("#FACILITY1").next().on("mouseup",".ui-select-option", function(e){
        if($(this).attr('data-value')) {
            $("#FACILITY2").prop("disabled", false);
            $("#FACILITY2").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").empty();
            
            // '세부시설' 셀렉트 박스 데이터 세팅
            $("#MST_CD").val($(this).attr('data-value'));
            $.ajax({
                url : "/front/inquiry/getCode"
              , method : "post"
              , data : $("#form_inquiry").serialize()
              , success : function(data, stat, xhr) {
                  if(data.result == "success" && data.rsCodeDtl) {
                      
                      var selectIndex = Number($("#FACILITY1").val());
                      data.rsCodeDtl.DTL_CD_NM = jsGetMultiLang(selectIndex);
                      
                      selectRemoveThenMakeForInq("#FACILITY2", data.rsCodeDtl, "세부시설");
                  }
              }
            });
            
        } else {
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
    });
    
    // '시설' 셀렉트 박스 선택 이벤트
    $("#FACILITY1").change(function(){
        if($(this).val()) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").prop("disabled", false);
            $("#FACILITY2").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").empty();
            
            // '세부시설' 셀렉트 박스 데이터 세팅
            $("#MST_CD").val($(this).val());
            
            $.ajax({
                url : "/front/inquiry/getCode"
              , method : "post"
              , data : $("#form_inquiry").serialize()
              , success : function(data, stat, xhr) {
                  if(data.result == "success" && data.rsCodeDtl) {
                      
                      var selectIndex = Number($("#FACILITY1").val());
                      data.rsCodeDtl.DTL_CD_NM = jsGetMultiLang(selectIndex);
                      
                      selectRemoveThenMakeForInq("#FACILITY2", data.rsCodeDtl, "세부시설");
                  }
              }
            });
            
        } else {
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
    });
    
    // '세부시설' 셀렉트 박스 선택 이벤트
    $(document).on("mouseup", "#FACILITY2 + .selectBox .ui-select-option", function(e){
        if($("#FACILITY3").length == 0) {
            var html  = "<div class='ui-select-wrapper'>";
                html += "   <select class='selectBox' id='FACILITY3' name='CATEGORY4'>";
                html += "</select></div>";
                
            // 호텔 파라다이스(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000001" && $(this).attr("data-value") == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3HotelParaDining, '세부시설 유형');
            }
            // 아트 파라디소(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000002" && $(this).attr("data-value") == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3ArtParaDining, '세부시설 유형');
            }
            // 그룹스&웨딩스(시설) & 견적(세부시설)
            if($("#FACILITY1").val() == "000010" && $(this).attr("data-value") == "000001") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3GrpWedEstimate, '세부시설 유형');
            }
        } else {
            if(!($("#FACILITY1").val() == "000001" && $(this).attr("data-value") == "000004") && !($("#FACILITY1").val() == "000002" && $(this).attr("data-value") == "000004") && !($("#FACILITY1").val() == "000010" && $(this).attr("data-value") == "000001")) {
                $("#FACILITY3").closest(".ui-select-wrapper").remove();
            }
        }
    });
    
    // '세부시설' 셀렉트 박스 선택 이벤트
    $(document).on("change", "#FACILITY2", function(e){
        if($("#FACILITY3").length == 0) {
            var html  = "<div class='ui-select-wrapper'>";
                html += "   <select class='selectBox' id='FACILITY3' name='CATEGORY4'>";
                html += "</select></div>";
                
            // 호텔 파라다이스(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000001" && $(this).val() == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3HotelParaDining, '세부시설 유형');
            }
            // 아트 파라디소(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000002" && $(this).val() == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3ArtParaDining, '세부시설 유형');
            }
            // 그룹스&웨딩스(시설) & 견적(세부시설)
            if($("#FACILITY1").val() == "000010" && $(this).val() == "000001") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3GrpWedEstimate, '세부시설 유형');
            }
        } else {
            if(!($("#FACILITY1").val() == "000001" && $(this).val() == "000004") && !($("#FACILITY1").val() == "000002" && $(this).val() == "000004") && !($("#FACILITY1").val() == "000010" && $(this).val() == "000001")) {
                $("#FACILITY3").closest(".ui-select-wrapper").remove();
            }
        }
    });
    
    try {
        //addInputHandler({input:$("#EMAIL"), dataType:"AP", handler:function() {
        addInputHandler({input:$(".inqEmailValidation"), dataType:"AP", handler:function() {
            //$("#EMAIL").closest("dd").removeClass("error");
            $(".inqEmailValidation").closest("dd").removeClass("error");
        }});
    } catch(e) {
        console.log(e);
    }
    
    if($("#TEL").length > 0) {
        try {
            addInputHandler({input:$("#TEL"), dataType:"N", handler:function() {
                $("#TEL").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    if($("#TEL2").length > 0) {
        try {
            addInputHandler({input:$("#TEL2"), dataType:"N", handler:function() {
                $("#TEL2").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    if($("#TEL3").length > 0) {
        try {
            addInputHandler({input:$("#TEL3"), dataType:"N", handler:function() {
                $("#TEL3").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    selectVal("#QUESTION", "문의");
    selectVal("#FACILITY1", "000001");
    
    $('#QUESTION').children("option").each(function() {
        if ($(this).is(":selected")) {
            $(this).trigger("change");
        }
    });
    
    $('#FACILITY1').children("option").each(function() {
        if ($(this).is(":selected")) {
            $(this).trigger("change");
        }
    });
    
});


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

function selectRemoveThenMakeForInq(selector, list, defaultOpt1){
    var html = "";
    if(defaultOpt1) {
        html += "<option value=''>" + defaultOpt1 + "</option>";
    }
    if(!$.isEmptyObject(list)) {
        for(var i = 0; i < list.DTL_CD.length; i++) {
            html += "<option value='" + list.DTL_CD[i] + "'>" + list.DTL_CD_NM[i] + "</option>";
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
            style   = $select.attr("style");
            
        var template  = '<div class="' + classes + '" style="' +  style + '">';
            template += '<a href="#" class="ui-select-trigger">' + $select.find(':selected').text() + '</a>';
            template += '<ul class="ui-select-options">';
            $select.find("option").each(function(){
                template += '<li><a href="#" class="ui-select-option" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</a></li>';
            });
            template += '</ul></div>';
      
            $select.hide().after(template);
        if($select.is(':disabled')){
            $select.next('.selectBox').addClass('disabled');
        }
    }
    
    //SELECT BOX 재 생성 시  스크롤바 조정
    var targetUl =$(selector).siblings("div.selectBox").find("ul.ui-select-options").eq(0); 
    if (selector == "#FACILITY2") {
        if (targetUl.length > 0) {
            //2번째 selectBox 추가 처리
            targetUl.css("left" , "4px");
        }
    } else if (selector == "#FACILITY3") {
        var facility2Ul = $("#FACILITY2").siblings("div.selectBox").find("ul.ui-select-options").eq(0);
        //SELECT BOX가 3개일 경우, 추가 처리
        if (facility2Ul.length > 0) {
            //2번째 selectBox 추가 처리
            facility2Ul.css("right" , "4px");
            //3번째 selectBox 추가 처리
            targetUl.css("left" , "4px");
        }
    }
}

function jsSave() {
    
    //if(blank_pattern.test($('#EMAIL').val()) == true || emailFormat.test($('#EMAIL').val()) == false){
    if(blank_pattern.test($('.inqEmailValidation').val()) == true || emailFormat.test($('.inqEmailValidation').val()) == false){
        //alert($("#USER_EMAIL").attr("title") + " 형식이 올바르지 않습니다.");
        //$("#EMAIL").closest("dd").addClass("error");
        //$("#EMAIL").closest("div.inp").next(".errorText").text("이메일 형식이 올바르지 않습니다.");
        //$("#EMAIL").focus();
        $(".inqEmailValidation").closest("dd").addClass("error");
        $(".inqEmailValidation").closest("div.inp").next(".errorText").text("이메일 형식이 올바르지 않습니다.");
        $(".inqEmailValidation").focus();
        return;
    }
    
    
    if($("#TEL").length > 0 && $("#TEL").val().length < 7) {
        $("#TEL").closest("dd").addClass("error");
        $("#TEL").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL").focus();
        return;
    }
    
    if($("#TEL2").length > 0 && $("#TEL2").val().length < 3) {
        $("#TEL2").closest("dd").addClass("error");
        $("#TEL2").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL2").focus();
        return;
    }
    
    if($("#TEL3").length > 0 && $("#TEL3").val().length < 4) {
        $("#TEL3").closest("dd").addClass("error");
        $("#TEL3").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL3").focus();
        return;
    }
    
    rtn = $("#form_inquiry").validate();
    
    if (rtn.isValid == false) {
        var sub_fix = "항목을 입력하세요.";
        if (rtn.chkType == "type") {
            sub_fix = "형식이 올바르지 않습니다.";
        }
        
        if (rtn.msg != "") {
            alert(rtn.msg + " " + sub_fix);
        } else {
            alert(sub_fix);
        }
        
        return;     
    }
    
    if(!$("#FACILITY1").val()) {
        alert("시설을 선택해주세요.");
        return;
    }
    
    if(!$("#FACILITY2").val()) {
        alert("세부시설을 선택해주세요.");
        return;
    }
    
    if($("#FACILITY3").length > 0 && !$("#FACILITY3").val()) {
        alert("세부시설 유형을 선택해주세요.");
        return;
    }
    
    if($("#AGREE").is(":checked") == false) {
        alert("‘필수적 개인정보 수집 및 이용에 대한 동의’에 동의하셔야합니다.");
        $("#AGREE").focus();
        return;
    }
    
    

    if(!isNum($("#TEL2").val())) {
        alert("휴대 전화는 숫자만 입력 가능합니다.");
        $("#TEL2").val("");
        $("#TEL2").focus();
        return;
    } else if(!isNum($("#TEL3").val())) {
        alert("휴대 전화는 숫자만 입력 가능합니다.");
        $("#TEL3").val("");
        $("#TEL3").focus();
        return;
    }
    $('#PI_TELNO').val($('#TEL1').val() + '-' + $('#TEL2').val() + '-' + $('#TEL3').val() );


    if($("#QUESTION").val() == "칭찬" || $("#QUESTION").val() == "불만") {
        $("#CRM_VOC_CONN").val("Y");
    }
    
    addValue("휴대폰 번호", "PI_TELNO");
    addValue("시설", "FACILITY1", "", "", true);
    addValue("세부시설", "FACILITY2", "", "", true);
    if($("#FACILITY3").length > 0) {
        addValue('세부시설 유형', "FACILITY3", "", "", true);
    }
    
    addValue("질문유형", "QUESTION");
    addValue("내용", "CTNT");
    
    $("#PI_REG_EMPNO").val($("#PI_CUST_NM").val());
    
    $("#CATEGORY2").val($("#FACILITY1").next("div.selectBox").find(".ui-select-trigger").text());
    $("#CATEGORY3").val($("#FACILITY2").next("div.selectBox").find(".ui-select-trigger").text());
    
     $.ajax({
        url : "/front/inquiry/register"
        , method : "post"
        , data : $("#form_inquiry").serialize()
        , success : function(data, stat, xhr) {
            if (stat == "success") {
                if (data.result != null) {
                    if (data.result == "success") {
                        alert("문의가 정상적으로 등록되었습니다.");
                        //location.href=document.URL;
                        location.reload();
                    }
                } else {
                    $("#PI_VOC_CN").val("");
                    alert("에러가 발생했습니다!");
                }
            }
        }
    });
}

function addValue(objTitle, objNm1, objNm2, objNm3, isSelectBox) {
    var name1 = $("#"+objNm1).val() != null ? $("#"+objNm1).val() : "";
    var name2 = $("#"+objNm2).val() != null ? $("#"+objNm2).val() : "";
    var name3 = $("#"+objNm3).val() != null ? $("#"+objNm3).val() : "";
    
    if(isSelectBox) {
        name1 = $("#"+objNm1).find(':selected').text() != null ? $("#"+objNm1).find(':selected').text() : "";
        name2 = $("#"+objNm2).find(':selected').text() != null ? $("#"+objNm2).find(':selected').text() : "";
        name3 = $("#"+objNm3).find(':selected').text() != null ? $("#"+objNm3).find(':selected').text() : "";
    }
    
    if($("#PI_VOC_CN").val() != "") {
    $("#PI_VOC_CN").val($("#PI_VOC_CN").val() + "\n"+ objTitle+ " : " + name1 + name2 + name3 );
    } else {
        $("#PI_VOC_CN").val( objTitle+ " : " + name1 + name2 + name3  );
    }
    return;
}
    
</script>

<!-- 1:1 문의 (레이어 팝업) -->
<div class="layerPopWrap normalLayer" id="pop1">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
        <h1 class="popHeader popHeaderInq"></h1>
        <div class="inquiryPopCont">
            <form id="form_inquiry" name="form_inquiry">
                <input type="hidden" id="COMM_CD" name="COMM_CD" value="INQ_FAC"/> <!-- COMM_CD -->
                <input type="hidden" id="MST_CD" name="MST_CD" value=""/> <!-- MST_CD -->
                <input type="hidden" id="CD_TYPE" name="CD_TYPE" value="INQ"/> <!-- CD_TYPE -->
                <input type="hidden" id="PI_TELNO" name="PI_TELNO" value=""/> <!-- 연락처 -->
                
                <input type="hidden" id="PI_VOC_CN" name="PI_VOC_CN" value=""/> <!--VOC 내용 -->
                <input type="hidden" id="BBS_CATE_CD" name="BBS_CATE_CD" value="ONE"/>
                <input type="hidden" id="CRM_VOC_CONN" name="CRM_VOC_CONN" value="N"/> <!-- CRM VOC 연계 여부 -->
                <input type="hidden" id="CATEGORY2" name="CATEGORY2" value=""/>
                <input type="hidden" id="CATEGORY3" name="CATEGORY3" value=""/>
                
                <div class="category">
                    <select class="selectBox" id="QUESTION" name="CATEGORY1"> <!-- 클래스 selectBox 추가 -->
                        <option value="">질문유형</option>
                        <option value="칭찬">칭찬</option>
                        <option value="불만">불만</option>
                        <option value="문의">문의</option>
                        <option value="제안">제안</option>
                        <option value="기타">기타</option>
                    </select>
                    <div class="double clearFixed">
                        <!-- 활성화 풀시 (스크립트로 해당영역 체크 해제 시키는 방법)
                            1. 해당 select박스의 disabled삭제
                            2. <div class="selectBox disabled"> 의  disabled 클래스 삭제
                            ※ 디자인 상에서 select 의 디자인 입히는 버전으로 ui.js에서 해당 클래스를 생성하는 코드가 있습니다.
                            반드시 크롬 관리자 화면에서 변경된 마크업 확인 후 변경하시기 바랍니다.
                         -->
                        <select class="selectBox" id="FACILITY1" name="FACILITY1" disabled="disabled">
                            <option value="">시설</option>
                            <option value='000001' >HOTEL PARADISE</option> <option value='000002' >HOTEL ART PARADISO</option> <option value='000003' >CASINO</option> <option value='000004' >CIMER</option> <option value='000005' >CHROMA</option> <option value='000006' >WONDERBOX</option> <option value='000007' >PLAZA</option> <option value='000008' >PARADISE ART SPACE</option> <option value='000009' >STUDIO PARADISE</option> <option value='000010' >GROUP &amp; WEDDINGS</option> <option value='000011' >MEMBERSHIP</option> <option value='000012' >기타</option> 
                        </select>
                        <script type="text/javascript">
                        $("#FACILITY1").find("option").each(function(){ //STUDIO PARADISE > STUDIO PARADISE / CULTURE PARK (000009)
                            if ($(this).val() == "000009") {
                                $(this).text("STUDIO PARADISE / CULTURE PARK");
                                return;
                            }
                        });
                        </script>
                        <select class="selectBox" id="FACILITY2" name="FACILITY2" disabled="disabled">
                            <option value="">세부시설</option>
                        </select>
                    </div>
                </div>
                
                <div class="formInquiryWrap">
                    <dl class="title">
                        <dt>
                            <label for="TITLE">제목 <span class="color">*</span></label>
                            <p class="imp"><span class="color">*</span>필수 입력 항목</p>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" id="TITLE" name="TITLE" required title="제목">
                                <button class="btnDelete">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="CTNT">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="CTNT" name="CTNT" required title="내용"></textarea>
                        </dd>
                    </dl>
                    <div class="clearFixed">
                        <dl class="name">
                            <dt><label for="PI_CUST_NM">이름 <span class="color">*</span></label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="text" id="PI_CUST_NM" name="PI_CUST_NM" value="" required title="이름">
                                    <button class="btnDelete">삭제</button>
                                </div>
                                
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>
                            </dd>
                        </dl>
                        <dl class="pwd">
                            <dt><label for="EMAIL">이메일 <span class="color">*</span></label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="email" class="inqEmailValidation" id="EMAIL" name="EMAIL" value="" required title="이메일">
                                    <button class="btnDelete">삭제</button>
                                </div>
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>  
                            </dd>
                        </dl>
                    </div>
                    
                    <dl class="phone">
                        
                        <dt><label for="TEL1">휴대폰 번호 <span class="color">*</span></label></dt>
                        <dd>
                            <select class="selectBox" id="TEL1" name="TEL1" required title="핸드폰 첫째자리 선택" >
                                <option value="010">010</option>
                                <option value="011" >011</option>
                                <option value="016" >016</option>
                                <option value="017" >017</option>
                                <option value="018" >018</option>
                                <option value="019" >019</option>
                            </select>
                            <div class="inp">
                                <input type="tel" id="TEL2" name="TEL2" required value="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 가운데자리 입력" maxlength="4">
                                <button class="btnDelete">삭제</button>
                            </div>
                            <span>-</span>
                            <div class="inp">
                                <input type="tel" id="TEL3" name="TEL3" required value="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 끝자리 입력" maxlength="4">
                                <button class="btnDelete">삭제</button>
                            </div>
                        
                            <div class="errorText">
                                <!-- 에러 메시지 -->
                            </div>
                        </dd>
                    </dl>
                </div>
                
                <div class="termArea">
                    <div>
                        <h2>필수적 개인정보 수집 및 이용에 대한 동의 <span>(필수)</span></h2>
                        <div class="termTxt" tabindex="0">
                            <p>파라다이스시티는 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.<br />
<br />
[개인정보 수집 및 이용 동의]<br />
1. 수집 및 이용 목적 : 회원제 서비스에 따른 본인 확인 절차, 고객 공지 사항 전달 및 불만 처리 등<br />
2. 수집 항목<br />
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 휴대폰번호, Email<br />
- 선택항목 : 주소, 직업, 결혼기념일, 관심 시설, 관심 분야<br />
<br />
3. 개인정보 휴면처리 회원의 개인정보 이용 기준에 대한 유효기간을 아래와 같이 정하며, 최종 이용 시점을 기산일로 하여 유효기간 경과 이후 회원의 개인정보를 분리 저장/관리 또는 파기합니다.<br />
1) 유효기간: 1년<br />
2) 서비스 이용 기준: 멤버십 서비스 이용(회원인증, 홈페이지 로그인, 포인트 조회, 포인트 적립, 포인트 사용, 포인트 조정, 포인트 전환 등), 카드 발급, 호텔 상품 및 서비스 구매, 정보 변경 등<br />
3) 유효기간 경과 이후: 분리 저장 및 관리<br />
가. 분리 저장 및 관리: 파기에 준하는 조치의 일환으로, 장기 미 이용자의 개인정보를 일반회원의 개인정보 DB와 분리하여 별도 저장/관리하고, 일반 직원의 접근 권한을 제한합니다.<br />
나. 유효기간 도래 통지: 유효기간 만료 30일 전까지 e-mail, SMS 등으로 개인정보가 파기 또는 분리 및 보관되는 사실 및 일시, 개인정보 항목을 해당 회원에게 통지합니다.<br />
다. 유효기간 경과 이후 회원이 멤버십 서비스를 이용할 경우, 이를 재이용 요청으로 간주하여 분리 저장/관리 상태에서 정상 이용 상태로 원복합니다.<br />
<br />
4. 개인정보 보유 기간 및 파기시점 회원의 개인정보는 개인정보처리방침 제 2조 개인정보 수집 및 이용 목적의 보유기간이 달성되거나, 고객이 별도 요청할 경우 파기하는 것을 원칙으로 합니다. 다만 아래의 경우 관련 근거에 의해 개인 정보를 보존합니다.<br />
- 보유&bull;이용 기간: 상거래이력<br />
- 보존 근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률<br />
- 보존기간<br />
ㆍ소송이나 법적 분쟁 관련 사항의 근거 자료에 관한 기록: 10년<br />
ㆍ계약 또는 청약 철회 등에 관한 기록 : 5년<br />
ㆍ소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래 등의 소비자 보호에 관한 법률)<br />
ㆍ신용정보의 수집처리 및 이용 등에 관한 기록: 3년(신용정보의 이용 및 보호에 관한 법률)<br />
요금의 과납 또는 미납이 있을 경우와 분쟁이 있을 경우 해결시 까지 보유합니다.<br />
<br />
5. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 회원가입에 제한이 있을 수 있음을 알려드립니다.</p>

                        </div>
                        <div class="checkbox">
                            <input type="checkbox" id="AGREE" name="AGREE" value="Y"><label for="AGREE">동의함</label>
                        </div>
                    </div>
                </div>
            </form>
            
            <div class="btnGroup">
                <a href="javascript:jsSave();" class="btn btnFull small"><span>등록</span></a>
            </div>
        </div>
        <a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
    </div>
    <!-- //layerPopCont -->
</div>
<!-- //1:1 문의 (레이어 팝업) -->



<!-- 예약하기 (레이어 팝업) -->









<script>
var diningNm = "";
var fSeq = "";
var deptCd = "021";

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