<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indoor Pool</title>
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
<!-- 컨텐츠 영역 -->
<section id="container">
	
	<div class="hotelParadiseWrap pb0">
		<div class="innerBox">
			<h1 class="contTitle"><span>부대시설</span>다채로운 액티비티와 휴식을 함께 <br />즐길 수 있는 호텔 델루나의 시설을 즐겨보세요.</h1>
			
			<section class="jsSwiperMotion">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities2/img_indoorPool1.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities2/img_indoorPool2.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities2/img_indoorPool3.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities2/img_indoorPool4.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/facilities/facilities2/img_indoorPool5.jpg" alt="" /></p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>
			
			<div class="detailTextBox">
				<h2>Indoor Pool</h2>
				<p class="subTit">자연과 하나되는 Relaxation Indoor Pool</p>
				<p class="text">파노라마 윈도우를 통해 영종도의 전경을 만끽하며 수영을 즐길 수 있는 실내 수영장은 길이 23m, 너비 7.5m의 풀로 이루어져 있으며, 투숙객 전용 공간으로 사계절 내내 쾌적하고 여유로운 시간을 만끽할 수 있습니다.</p>
				
			</div>
			
			<div id="idpInfo" class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl>
						<dt>운영시간</dt>
						<dd>
							07:00 ~ 21:00 (점검시간 14:00 ~ 15:00)<br />
							<p style="line-height:1.3;"><span class="smallText textAsta">수영장 정비시간(14:00 ~ 15:00)에는 <br/>일부 풀 이용이 제한될 수 있습니다.</span></p>
							
							<!-- <span class="smallText">*내부 행사로 인해 7월20일 ~ 7월22일 수영장 이용이 제한됩니다.(7월22일 15:00시 이후 이용 가능)</span> -->
						</dd>
					</dl>
					<dl>
						<dt>요금</dt>
						<dd>
							성인 80,000원 <br /> 어린이 60,000원<br />
							<p style="line-height:1.3;"><span class="smallText">*실내/외 수영장에 함께 적용되는 요금입니다.</span></p>
							<p style="line-height:1.3;"><span class="smallText">*시즌 및 상품에 따라 상이할 수 있습니다</span></p>
						</dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>HOTEL DELLUNA 3층<br />
							<!-- 오픈시점 삭제 
							<a href="#" class="link">+ 위치 보기</a>
							-->
						</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>032-729-2170</dd>
					</dl>
				</div>
			</div>
			
			<div class="detailInfo">
				<h3>Pool Side Bar</h3>
				<p class="img"><img src="/pcPub/static/images/hotalParadise/img_indoorPool_sideBar.jpg" alt="" /></p>
				<p style="margin-top:10px;">여유로운 휴식과 함께 시간의 가치를 배가 시켜 줄 Pool Side Bar의 다이닝 서비스까지 함께 즐길 수 있습니다.</p>
				<p class="smallText">*운영시간은 시즌 별로 상이할 수 있습니다.</p>
				<p class="smallText">*메뉴는 시즌 별로 상이합니다.</p>
			</div>
			
			<div class="detailInfo">
				<h3>카바나 이용</h3>
				<p>예약 문의 032-729-2170</p>
				<table class="priceList">
					<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">운영시간</th>
							<th scope="col">금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tbg" rowspan="3">Indoor Cabana</td>
							<td>09:00 ~ 12:00</td>
							<td>100,000 원</td>
						</tr>
						<tr>
							<td>13:00 ~ 16:00</td>
							<td>100,000 원</td>
						</tr>
						<tr>
							<td>17:00 ~ 20:00</td>
							<td>100,000 원</td>
						</tr>
					</tbody>
				</table>
				<p>프라이빗한 공간에서 보다 여유로운 휴식을 즐길 수 있습니다.</p>
				<p class="smallText">*실내카바나는 연중 운영합니다.</p>
				<p class="smallText">*실내카바나는 별도 예약 없이 현장에서만 판매합니다.</p>
			</div>
			
			
			<div class="cautionBox type2">
				<h2>안내사항</h2>
				<ul class="dotList">
					<li>투숙객 전용 시설로 투숙 기간 內 이용 가능합니다. (1객실 당 2인 기준)</li>
					<li>이용 가능 인원은 상품 별로 상이할 수 있습니다.</li>
					<li>1박 1회 이용 가능합니다.</li>
					<li>수영복 대여 서비스는 제공되지 않습니다.</li>
					<li>신장 130cm 미만 어린이 고객은 안전을 위하여 보호자 동반 하에 구명조끼 착용 후 이용 가능합니다.</li>
					<li>객실 당 이용 가능 인원은 상품 별로 상이할 수 있습니다.</li>
					<li>안전하고 편안한 이용을 위하여 튜브, 기타 물놀이 기구 사용 및 음식물 반입, 흡연, 오일 사용을 금하고 있습니다.</li>
					<li>금속, 플라스틱, 유리제품 등 날카롭거나 깨질 수 있는 물건의 반입을 금하고 있습니다.</li>
					<li>타인에게 상해를 입힐 수 있는 귀걸이, 머리핀, 반지 등의 착용을 삼가 주시기 바랍니다.</li>
					<li>유아용 퍼들점퍼 및 목튜브는 반입가능합니다.</li>
					<li>정기 휴일은 내부사정에 의해 조정될 수 있습니다.</li>
					<li>쾌적하고 안전한 운영을 위해 수영장 공사가 진행될 수 있습니다.</li>
					<li>고객의 안전을 위하여 음주 후 수영장 시설 이용은 제한될 수 있습니다.</li>
					<li>휴대전화를 포함한 촬영 장비로 락커 내에서의 촬영은 불가합니다.</li>
					<li>상업적 목적의 촬영은 이용이 제한될 수 있습니다.</li>
					<li>36개월 미만 유아는 방수 기저귀 착용 후 이용 가능합니다.</li>
					<li>신체에 문신이 있는 경우 문신이 노출되지 않도록 가린 후 이용해 주시기 바랍니다. (래시가드 착용 등)</li>
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