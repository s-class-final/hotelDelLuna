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
.detailInfo .brandIntroduce .text2 { margin-right:300px; margin-top:8px; padding-right: 260px; color:#666;}
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
                            <p class="img"><img src="resources/pcPub/static/images/facilities/facilities6/img_theSpaAtParadise1.jpg" alt="" /></p>
                        </li>
                        <li>
                            <p class="img"><img src="resources/pcPub/static/images/facilities/facilities6/img_theSpaAtParadise2.jpg" alt="" /></p>
                        </li>
                        <li>
                            <p class="img"><img src="resources/pcPub/static/images/facilities/facilities6/img_theSpaAtParadise3.jpg" alt="" /></p>
                        </li>
                        <li>
                            <p class="img"><img src="resources/pcPub/static/images/facilities/facilities6/img_theSpaAtParadise4.jpg" alt="" /></p>
                        </li>
                        <li>
                            <p class="img"><img src="resources/pcPub/static/images/facilities/facilities6/img_theSpaAtParadise5.jpg" alt="" /></p>
                        </li>
                    </ul>
                </div>
                <div class="btnArrow">
                    <a href="#" class="btnLeft">좌측</a>
                    <a href="#" class="btnRight">우측</a>
                </div>
            </section>
            
            <div class="detailTextBox">
                <h2>The Spa at Delluna</h2>
                <p class="subTit">Esthetic Spa &amp; Anti-aging Clinic</p>
                
                <p class="text">The Spa at Delluna만이 제공하는 차별화된 럭셔리 프로그램과 최고급 제품을 통해 진정한 델루나를 경험할 수 있습니다.<br />Clinic Delluna는 국내 최고의 안티에이징 클리닉으로 최신의 미용시술 및 노화방지 프로그램을 본원과 동일하게 제공하고 있습니다.</p>
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
                        <dd> 
                            The Spa at Delluna : 10:00~22:00<br />Clinic Delluna : 사전 문의 필수 <br />(시즌 별 운영시간 상이)
                        </dd>
                    </dl>
                    <dl>
						<dt>요금</dt>
						<dd></dd>
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
                        <dd>032-729-2440</dd>
                    </dl>
                </div>
            </div>
            
            <div class="cautionBox type2">
                <h2>안내사항</h2>
                <ul class="dotList">
                    <li><strong style="font-weight:600">AGE REVERSE FACIAL TREATMENT</strong>
                        <ul class="dashList" style="margin-top:10px;">
                            <li><strong style="font-weight:400;">CHERRY BLOSSOM BLOOMING ∙ 60분 / 198,000원</strong><br />
                                자외선, 외부환경으로 스트레스 받은 피부에 빠른 수분공급, 피부 진정, 유수분의 밸런싱을 맞추어드립니다. (데꼴테, 두피 포함)</li>
                            <li><strong style="font-weight:400;">SEA & “ C “ BRIGHTENING ∙ 80분 / 286,000원</strong><br />
                                활력이 부족한 피부에 농축된 Vit C를 공급하고 동결 건조된 해조류가 빠른 피부회복을 도와 맑고 투명한 피부로 가꾸어드립니다. (등, 데꼴데, 두피) </li>
                            <li><strong style="font-weight:400;">BLACK CAVIAR NOURISHING ∙ 80분 / 286,000원 </strong><br />
                                안티에이징으로 뛰어난 최상위 1등급 블랙캐비어 추출물이 피부를 건강하게 가꿔주고 풍부한 영양으로 피부 속 깊은 곳으로부터 빛나는 광채를 선사합니다. (등, 데꼴데, 두피)</li>
                        </ul>
                    </li>
                    <br/>
                    <li><strong style="font-weight:600">TIME REVERSE BODY TREATMENT</strong>
                        <ul class="dashList" style="margin-top:10px;">
                            <li>
                                <strong style="font-weight:400;">RELAXING SWEDISH ∙ 80분 / 286,000원</strong><br />
                                부드럽고 섬세한 테크닉으로 긴장되고 지친 몸과 마음에 진정한 휴식을 부여해줍니다. (두피, 세족 포함)
                            </li>
                            <li>
                                <strong style="font-weight:400;">VITALIZING KOREAN ∙ 80분 / 286,000원 </strong><br />
                                전통적인 한국 스타일로 견고하고 강한 터치로 피로 회복을 돕고 생기 넘치는 활력을 선사합니다. (두피, 세족 포함)
                            </li>
                            <li>
                                <strong style="font-weight:400;">PRONE POSITION ∙ 50분 / 187,000원 </strong><br />
                                피로감을 쉽게 느끼는 등과 후면 다리를 집중 관리하여 스트레스 완화에 도움을 줍니다. (두피, 세족 포함)
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <div class="detailInfo">
				<h3>브랜드 소개</h3>
				<div class="brandIntroduce">
					<h4>The Spa at Delluna</h4>
					<p class="text2">
						지복(至福)의 공간에서 아름답고 건강한 몸과 평안하고 행복한 마음이 실현됩니다.
					</p>
					<div class="brandLogo"><img src="/pcPub/static/images/hotalParadise/the_spa_banner.jpg" alt="" /></div>
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