<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 소개</title>
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
	





<style>img.imgW100P{width:100%;}</style>
<!-- 컨텐츠 영역 -->


<section id="container">
<!-- 이미지 경로 설정 -->
	<%-- <c:url var="path" value="resources/pcPub/static/images/instruction"> --%>
	
	<div class="subMain">
		<div class="visual">
			<div class="img">
				<div style="background-image:url('resources/pcPub/static/images/instruction/img_visual.jpg');"></div>
			</div>
			<div class="textBox">
				<h1 data-animation="fadeInDown">HOTEL<br />DEL LUNA</h1>
				<p data-animation="fadeInUp">고급스럽고 넓은 객실, <br />파인다이닝 레스토랑, 품격 있는 클럽 라운지를 보유한, <br />예술적 감성과 여유를 느낄 수 있는 컨템포러리 럭셔리 호텔입니다.</p>
			</div>
			<a href="#" class="btnArrowLeft">이전이미지</a>
			<a href="#" class="btnArrowRight">다음이미지</a>
			<span class="scrollDown">scroll down</span>
		</div>
		
		<section class="section01">
			<div class="innerBox">
				<span class="bgbar"></span>
				<div class="sectionH">
					<h1 data-animation="fadeInUp">객실</h1>
					<p data-animation="fadeInUp">호텔 델루나만의 예술적 품격을 갖춘 객실에서 격이 다른<br />휴식과 여유를 경험해 보세요.</p>
					<a href="overView.do" class="link" data-animation="fadeInUp">전체 보기</a>
				</div>
				
				<section class="mainSwiperMotion">
					<div class="swiperWrap" data-animation="fadeInUp">
						<ul>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_accommodation1.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_accommodation2.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_accommodation3.jpg" alt="" /></p>
							</li>
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a>
						<a href="#" class="btnRight">우측</a>
					</div>
					<div class="swipeCont">
						<div class="on">
							<p class="title">프리미어 디럭스</p>
							<p class="text">한층 여유로운 공간과 세련된 인테리어가 어우러진 프리미어 디럭스</p>
						</div>
						<div>
							<p class="title">그랜드 디럭스 스위트</p>
							<p class="text">클래식한 감성과 이국적인 신비로움이 가득한 그랜드 디럭스 스위트</p>
						</div>
						<div>
							<p class="title">로열 스위트</p>
							<p class="text">왕실의 기품이 흐르는 고급스러운 로열 스위트</p>
						</div>
					</div>
				</section>
				
			</div>
		</section>
		
		<section class="section02">
			<div class="innerBox">
				<span class="bgbar"></span>
				<div class="sectionH">
					<h1 data-animation="fadeInUp">다이닝</h1>
					<p data-animation="fadeInUp">미슐랭 스타 레스토랑부터 트렌디한 Bar까지, <br />호텔 델루나에서 펼쳐지는 미식의 세계로 초대합니다.</p>
					<a href="dining.do?CATE=dining" class="link" data-animation="fadeInUp">전체 보기</a>
				</div>
				
				<section class="mainSwiperMotion">
					<div class="swiperWrap" data-animation="fadeInUp">
						<ul>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining1.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining2.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining3.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining6.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining5.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining4.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_dining7.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img class="imgW100P" src="resources/pcPub/static/images/instruction/emperor_ssImg.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img class="imgW100P" src="resources/pcPub/static/images/instruction/cafe9_ssImg.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img class="imgW100P" src="resources/pcPub/static/images/instruction/bar21_ssImg.jpg" alt="" /></p>
							</li>
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a>
						<a href="#" class="btnRight">우측</a>
					</div>
					<div class="swipeCont">
						<div class="on">
							<p class="title">ON THE PLATE</p>
							<p class="text">유럽, 뉴욕, 상해의 최신 Trend를 반영, 다섯가지 Station으로 구성된<br />Premium Buffet Restaurant</p>
						</div>
						<div>
							<p class="title">RAKU</p>
							<p class="text">모던한 분위기에서 즐기는 트렌디한 일식의 진수</p>
						</div>
						<div>
							<p class="title">RUBIK</p>
							<p class="text">색다른 공연을 만나는 라이브 뮤직 라운지</p>
						</div>
						<div>
							<p class="title">GARDEN CAFÉ</p>
							<p class="text">유럽의 정취를 지닌 카페</p>
						</div>
						<div>
							<p class="title">IMPERIAL TREASURE</p>
							<p class="text">한국 최초로 선보이는 정통 광동식 Fine Dining Cuisine</p>
						</div>
						<div>
							<p class="title">LA SCALA</p>
							<p class="text">밀라노의 감성으로 이탈리아 본연의 맛을 추구하는 Italian Gourmet Restaurant</p>
						</div>
						<div>
							<p class="title">LOUNGE DELLUNA</p>
							<p class="text">음악이 흐르는 로비라운지</p>
						</div>
						<div>
							<p class="title">The Emperor</p>
							<p class="text">최고의 고객에게 최고만을 선보이는 카지노 클럽 멤버십 전용 레스토랑</p>
						</div>
						<div>
							<p class="title">Café 9</p>
							<p class="text">게임 속 오아시스, 미식의 즐거움을 경험하는 곳</p>
						</div>
						<div>
							<p class="title">Bar 21</p>
							<p class="text">카지노를 한층 더 다이내믹하게 즐길 수 있는 카지노 엔터테인먼트바</p>
						</div>
					</div>
				</section>
			</div>
		</section>
		
		<section class="section03">
			<div class="innerBox">
				<span class="bgbar"></span>
				<div class="sectionH">
					<h1 data-animation="fadeInUp">부대시설</h1>
					<p data-animation="fadeInUp">다채로운 액티비티와 휴식을 함께 즐길 수 있는 <br />호텔 델루나의 시설을 즐겨보세요.</p>
					<a href="facility.do" class="link" data-animation="fadeInUp">전체 보기</a>
				</div>
				
				<section class="mainSwiperMotion">
					<div class="swiperWrap" data-animation="fadeInUp">
						<ul>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_facilities1.jpg" alt="" /></p>
							</li>
							<li>
								<p class="img"><img src="resources/pcPub/static/images/instruction/img_facilities3.jpg" alt="" /></p>
							</li>
						</ul>
					</div>
					<div class="btnArrow">
						<a href="#" class="btnLeft">좌측</a>
						<a href="#" class="btnRight">우측</a>
					</div>
					<div class="swipeCont">
						<div class="on">
							<p class="title">아웃도어풀</p>
							<p class="text">하늘과 마주한 로맨틱한 Outdoor Pool</p>
						</div>
						<div>
							<p class="title">키즈존 </p>
							<p class="text">아이가 자라는 시간, Kids Zone</p>
						</div>
					</div>
				</section>
			</div>
		</section>
	</div>
	<%-- </c:url> --%>
</section>
<!-- //컨텐츠 영역 -->
<jsp:include page="../../common/footer.jsp"/>

<form id="form_evt" name="form_evt">
	<input type="hidden" id="SBU_CD" name="SBU_CD" value="000001"/>
	<input type="hidden" id="P_SEQ" name="P_SEQ" value=""/>
	<input type="hidden" id="SC_END" name="SC_END" value="PRO"/>
</form>

</body>
</html>