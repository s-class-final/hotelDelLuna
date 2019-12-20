<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<style>
.textAsta {display:block; position:relative; text-align:left; padding-left: 10px;}
.textAsta:before {content:'*'; position:absolute;left:0;top:3px;display:block;width:2px;height:2px;vertical-align:top;}
.textDash {display:block; position:relative; text-align:left; padding-left: 10px;margin-elft:10px;}
.textDash:before {content:'-'; position:absolute;left:0px;top:0px;display:block;width:3px;height:2px;vertical-align:top;margin-right:5px;}
.detailInfo .infoDetail > dl.w325px{width:325px;}
.detailInfo .infoDetail > dl.w300px{width:300px;}
.detailInfo .infoDetail > dl.w268px{width:268px;}
.detailInfo .infoDetail > dl.w244px{width:244px;}
.detailInfo .infoDetail > dl.w242px{width:242px;}
.detailInfo .infoDetail > dl.w241px{width:241px;}
.detailInfo .infoDetail > dl.w229px{width:229px;}
</style>
<script>

</script>
<style>
div.tbView{display:table;width:100%;padding-top:10px;}
div.tbView div.tcView{display:table-cell;width:50%;}
</style>

<!-- 컨텐츠 영역 -->
<section id="container">
	
	<div class="hotelParadiseWrap pb0">
		<div class="innerBox">
			<h1 class="contTitle"><span>부대시설</span>다채로운 액티비티와 휴식을 함께 <br />즐길 수 있는 호텔 델루나의 시설을 즐겨보세요.</h1>
			
			<section class="jsSwiperMotion">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities5/img_kidsZone1.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities5/img_kidsZone2.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities5/img_kidsZone3.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities5/img_kidsZone4.jpg" alt="" /></p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>
			
			<div class="detailTextBox">
				<h2>Kids Zone</h2>
				<p class="subTit">아이가 자라는 시간, Kids Zone</p>
				<p class="text">키즈존은 유아 및 어린이 고객을 위한 특별 공간으로 아이의 오감을 자극하고 자신감을 길러주는 다양한 시설과 프로그램이 마련되어 있습니다. <br />‘지구’를 컨셉으로 한 키즈존은 소중한 우리 아이들에게 상상력과 꿈을 심어주며 모험심을 키워주는 자연친화적인 체험공간으로 자리매김 할 것입니다.</p>
				
			</div>
			<!-- 2019.09.04 문구변경요청 [김병철] -->
			
			<!--
			<div class="spaceBullet">
			키즈존 내부 사정으로 인하여 한시적으로 아래와 같이 운영시간이 변경됩니다. 고객 여러분의 양해 부탁드립니다.
			</div>
			<div class="pb15i" style="display:table; width:100%; padding-left:10px; padding-top:10px;">
				<div class="rowMap" style="font-size:13px;">
					<div class="cellMap" style="width:180px;">- 7월 28일 ~ 7월 31일</div>
					<div class="cellMap">9AM ~ 10PM</div>
				</div>
				<div class="rowMap" style="font-size:13px;">
					<div class="cellMap" style="width:180px;">- 8월  1일 ~ 8월 3일</div>
					<div class="cellMap">9AM ~ 8:30PM</div>
				</div>
				<div class="rowMap" style="font-size:13px;">
					<div class="cellMap" style="width:180px;">- 8월  4일 </div>
					<div class="cellMap">9AM ~ 10PM</div>
				</div>
			</div>
			-->
			
			<div class="spaceBullet">공휴일 키즈존 연장 운영 안내</div>
			<div class="pb15i" style="display:table; width:100%; padding-left:10px; padding-top:10px;">
				<div class="rowMap" style="font-size:13px;">
					<div class="cellMap" style="width:180px;">- 10월 3일 ~ 10월 9일</div>
					<div class="cellMap">09:00 ~ 22:00</div>
				</div>
				<div class="rowMap" style="font-size:13px;">
					<div class="cellMap" style="width:180px;">- 12월 24일 ~ 2020년 1월 1일</div>
					<div class="cellMap">09:00 ~ 22:00</div>
				</div>
			</div>
			
			<!-- //2019.09.04 문구변경요청 [김병철] -->
			
			<div class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl>
						<dt>운영시간</dt>
						<dd>
							<div class="tbView">
								<div class="tcView">일~목요일 </div>
								<div class="tcView">09:00~18:00</div>
							</div>
							<div class="tbView">
								<div class="tcView">금~토요일</div>
								<div class="tcView">09:00~22:00</div>
							</div>
							<div class="tbView" style="padding-bottom:10px;">
								<div class="tcView">(점검시간</div>
								<div class="tcView">14:00~15:00)</div>
							</div>
							<span class="spaceBullet" style="font-size:12px;">특정 공휴일에는 22:00시 까지 연장 운영합니다.</span>
						</dd>
					</dl>
					<dl>
						<dt>요금</dt>
						<dd>
							투숙객 한정 무료
						</dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>HOTEL DELLUNA 3층<br />
							
						</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>032-729-2179</dd>
					</dl>
				</div>
			</div>
			
			<div class="cautionBox type2">
				<h2>안내사항</h2>
				<ul class="dotList">
					<li>투숙객 전용 시설로 투숙 기간 內 이용 가능합니다. (1객실 당 2인 기준)</li>
					<li>키즈존은 2세부터 12세까지 이용 가능합니다.</li>
					<li>부모님 동반하에 입장 가능한 시설입니다.</li>
					<li>키즈존 내에 음식물 반입이 불가합니다.</li>
					<li>분실 위험이 있는 귀중품은 데스크에 보관해주시기 바랍니다.</li>
					<li>부모님 또는 어린이 부주의에 의해 발생한 안전사고 및 분쟁에 대해서는 당 호텔에서 책임지지 않습니다</li>
					<li>키즈존 운영 시간은 내부 사정에 의해 조정될 수 있습니다.</li>
					<li>키즈존은 1박 1회 이용 가능합니다.</li>
				</ul>
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