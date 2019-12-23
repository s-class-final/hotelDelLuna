<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delluna Boutique</title>
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
	
	<!-- 컨텐츠 영역 -->
<section id="container">
	<div class="hotelParadiseWrap pb0">
		<div class="innerBox">
			<h1 class="contTitle"><span>부대시설</span>다채로운 액티비티와 휴식을 함께 <br />즐길 수 있는 호텔 델루나의 시설을 즐겨보세요.</h1>
			
			<section class="jsSwiperMotion">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities7/img_paradiseBoutique1.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities7/img_paradiseBoutique2.jpg" alt="" /></p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>
			
			<div class="detailTextBox">
				<h2>DELLUNA BOUTIQUE</h2>
				<p class="subTit">호텔 델루나의 시그니처 아이템을 <br />만나는 공간</p>
				<p class="text">호텔 델루나의 대표적인 기념품과 엄선된 시그니처 아이템을 만나볼 수 있는 공간입니다.</p>
				
			</div>
			
			<div class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl>
						<dt>운영시간</dt>
						<dd>MON ~ FRI 10:00~20:00</dd>
						<dd>SAT ~ SUN 10:00~21:00</dd>
					</dl>
					<dl>
						<dt>요금</dt>
						<dd></dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>HOTEL DELLUNA 1층<br />
							<!-- 오픈시점 삭제 
							<a href="#" class="link">+ 위치 보기</a>
							-->
						</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>032-729-2106</dd>
					</dl>
				</div>
			</div>
		</div>
		
		<div class="fullBg mt">
			<div class="innerBox">
				<div class="tapBox">
					<ul class="eventTab clearFixed">
						<li class="on"><a href="#">부대시설</a></li>
					</ul>
				</div>
				<!-- 레져시설 -->
				<div class="tapView" style="display:block;">
					<div class="jsSwiperMotion type2 eventSwipe">
						<div class="swiperWrap" data-show="3">
							<ul>
								<li>
									<a href="fac1.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list1.jpg" alt="" /></p>
										<h4>OUTDOOR POOL</h4>
										<p class="text">하늘과 마주한 로맨틱한 Outdoor Pool</p>
									</a>
								</li>
								<li>
									<a href="fac2.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list2.jpg" alt="" /></p>
										<h4>INDOOR POOL</h4>
										<p class="text">자연과 하나되는 Relaxation Indoor Pool</p>
									</a>
								</li>
								<li>
									<a href="fac3.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list3.jpg" alt="" /></p>
										<h4>SAUNA</h4>
										<p class="text">편안한 휴식을 즐길 수 있는 실내 사우나</p>
									</a>
								</li>
								<li>
									<a href="fac4.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list4.jpg" alt="" /></p>
										<h4>FITNESS</h4>
										<p class="text">일상의 밸런스를 디자인하는 피트니스</p>
									</a>
								</li>
								<li>
									<a href="fac5.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list6.jpg" alt="" /></p>
										<h4>KIDS ZONE</h4>
										<p class="text">아이가 자라는 시간, Kids Zone</p>
									</a>
								</li>
								<li>
									<a href="fac6.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list7.jpg" alt="" /></p>
										<h4>THE SPA AT DELLUNA</h4>
										<p class="text">Esthetic Spa &amp; Anti-aging Clinic</p>
									</a>
								</li>
								<li>
									<a href="fac7.do">
										<p class="img"><img src="resources/pcPub/static/images/facilities/facilities_list8.jpg" alt="" /></p>
										<h4>DELLUNA BOUTIQUE</h4>
										<p class="text">호텔 델루나의 시그니처 아이템을 <br />만나는 공간</p>
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
				<!-- //레져시설 -->
			</div>
		</div>
	</div>

</section>
<!-- //컨텐츠 영역 -->
<jsp:include page="../../../common/footer.jsp"/>
</body>
</html>