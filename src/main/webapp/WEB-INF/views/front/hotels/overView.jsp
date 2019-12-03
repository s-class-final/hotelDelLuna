<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<jsp:include page="../../common/menubar.jsp"/>
	
	
<!-- 컨텐츠 영역 -->
<section id="container">
	<!-- //디자인이 확정이 아니랍니다 -->
	<div class="hotelParadiseWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1 class="contTitle"><span>객실</span>호텔 파라다이스만의 예술적 품격을 갖춘 객실에서 <br />격이 다른 휴식과 여유를 경험해 보세요. </h1>
				
				
			<div class="roomWrap">
				<h2>게스트 룸</h2>
				<p class="text">예술적 감성과 아늑함을 동시에 느낄 수 있는 디럭스 객실</p>
				<div class="descBox">
					<section class="jsSwiperMotion">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="resources/pcPub/static/images/room/room1.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room2.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room3.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room4.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<!-- 이미지별 텍스트 내용 -->
								<div class="text on">
									<p class="title"><span>디럭스</span>모던하면서도 아늑한 인테리어의 디럭스 룸</p>
									<div class="info">
										<p><span>면적</span>45m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span>KING, TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomDeluxe" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>프리미어 디럭스</span>한층 여유로운 공간과 세련된 인테리어가 어우러진 프리미어 디럭스</p>
									<div class="info">
										<p><span>면적</span>54m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING, TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomPremierDeluxe" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>그랜드 프리미어 디럭스</span>침실과 거실이 하나로 이어지는 특별한 공간 구성과 모던한 감각, 그랜드 프리미어 디럭스</p>
									<div class="info">
										<p><span>면적</span>60m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING, TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomGrandPremierDeluxe" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>그랜드 프리미어 디럭스 테라스</span>테라스의 탁트인 전경과 모던한 감각의 객실 인테리어가 조화를 이루는 그랜드 프리미어 디럭스 테라스</p>
									<div class="info">
										<p><span>면적</span>70m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING, TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomGrandPremierDeluxeTerrace" class="btn small2"><span>상세 보기</span></a>
								</div>
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
			<div class="roomWrap">
				<h2>스위트</h2>
				<p class="text">여유로운 휴식을 즐길 수 있는 우아한 감성의 스위트 객실</p>
				<div class="descBox">
					<section class="jsSwiperMotion">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="resources/pcPub/static/images/room/room5.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room6.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room7.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room8.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room9.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room10.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<!-- 이미지별 텍스트 내용 -->
								<div class="text on">
									<p class="title"><span>코너 스위트</span>편안한 분위기의 침실과 우아한 감성의 거실이 분리되어 독립적 공간 활용이 매력적인 코너 스위트</p>
									<div class="info">
										<p><span>면적</span>68m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomCornerSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>디럭스 스위트</span>심플함과 우아함의 상반적인 매력을 지닌 호텔 파라다이스의 대표 스위트 객실, 디럭스 스위트</p>
									<div class="info">
										<p><span>면적</span>90m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING, TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomDeluxeSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>그랜드 디럭스 스위트</span>클래식한 감성과 이국적인 신비로움이 가득한 그랜드 디럭스 스위트</p>
									<div class="info">
										<p><span>면적</span>135m²</p>
										<p><span>인원</span>성인 2인 기준</p>
										<p><span>베드타입</span></span>KING</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomGrandDeluxeSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>투 베드룸 그랜드 디럭스 스위트</span>여유로운 두 개의 침실과 넓게 꾸며진 거실에서 가족이 편안한 시간을 보낼 수 있는 투 베드룸 그랜드 디럭스 스위트</p>
									<div class="info">
										<p><span>면적</span>135m²</p>
										<p><span>인원</span>성인 4인 기준</p>
										<p><span>베드타입</span></span>KING &amp; TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomTwoBedroomGrandDeluxeSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>로열 스위트</span>왕실의 기품이 흐르는 고급스러운 로열 스위트</p>
									<div class="info">
										<p><span>면적</span>180m²</p>
										<p><span>인원</span>성인 4인 기준</p>
										<p><span>베드타입</span></span>KING &amp; TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomRoyalSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title"><span>프레지덴셜 스위트</span>세계 최고 VIP만을 위한 최상급 프레지덴셜 스위트</p>
									<div class="info">
										<p><span>면적</span>368m²</p>
										<p><span>베드타입</span></span>KING &amp; TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomPresidentialSuite" class="btn small2"><span>상세 보기</span></a>
								</div>
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
			<div class="roomWrap">
				<h2>풀 빌라</h2>
				<p class="text">프라이빗하게 즐길 수 있어 자유롭고 힐링 가득한 고급 풀빌라</p>
				<div class="descBox">
					<section class="jsSwiperMotion">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="resources/pcPub/static/images/room/room11.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room12.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<!-- 이미지별 텍스트 내용 -->
								<div class="text on">
									<p class="title"><span>디럭스 풀 빌라</span>고급스러운 색채와 감각적인 분위기를 지닌 풀빌라의 정석, 디럭스 풀빌라</p>
									<div class="info">
										<p><span>면적</span>457m²</p>
										<p><span>베드타입</span></span>KING</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomDeluxePoolVilla" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title">
										<span>그랜드 디럭스 풀 빌라</span>
										호텔 파라다이스만의 예술적 감성이 묻어나는 격이 다른 럭셔리한 공간, 그랜드 디럭스 풀빌라
									</p>
									<div class="info">
										<p><span>면적</span>942m²</p>
										<p><span>베드타입</span></span>KING &amp; TWIN</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomGrandDeluxePoolVilla" class="btn small2"><span>상세 보기</span></a>
								</div>
								
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>

			<div class="roomWrap">
				<h2>라운지</h2>
				<p class="text">호텔 파라다이스에서의 시간을 더욱 빛내줄 고급 라운지 시설</p>
				<div class="descBox">
					<section class="jsSwiperMotion">
						<div class="swiperWrap imageWrap">
							<ul>
								<li><img src="resources/pcPub/static/images/room/room13.jpg" alt=""></li>
								<li><img src="resources/pcPub/static/images/room/room14.jpg" alt=""></li>
							</ul>
							<div class="textBox">
								<!-- 이미지별 텍스트 내용 -->
								<div class="text on">
									<p class="title">
										<span>클럽 라운지</span>
										호텔 파라다이스에서만 경험할 수 있는 격이 다른 Club Lounge
									</p>
									<div class="info">
										<p style="padding-left:110px;"><span>위치</span>3F</p>
										<p style="padding-left:110px;"><span>Breakfast</span>06:30~10:30</p>
										<p style="padding-left:110px;"><span>Tea &amp; Coffee</span>11:00~17:00</p>
										<p style="padding-left:110px;"><span>Happy Hour</span>18:00~21:00</p>
										<p style="padding-left:110px;"><span>Break time</span>10:30~11:00 <br />(라운지 재정비 시간입니다.)</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomClubLounge" class="btn small2"><span>상세 보기</span></a>
								</div>
								
								<!-- 이미지별 텍스트 내용 -->
								<div class="text">
									<p class="title">
										<span>패밀리 라운지</span>
										꿈꾸던 가족만의 공간, 즐거움 가득한 Family Lounge
									</p>
									<div class="info">
										<p style="padding-left:110px;"><span>위치</span>3F / Purple Wing</p>
										<p style="padding-left:110px;"><span>Tea &amp; Coffee</span>10:00~21:00</p>
										<p style="padding-left:110px;"><span>Break time</span>13:00~13:30 <br />(라운지 재정비 시간입니다.)</p>
									</div>
									<a href="/front/hotel/room/view?ROOM_NM=RoomFamilyLounge" class="btn small2"><span>상세 보기</span></a>
								</div>
								
							</div>
						</div>
						<div class="btnArrow">
							<a href="#" class="btnLeft">좌측</a>
							<a href="#" class="btnRight">우측</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	
</section>
	
	
	

</body>
</html>