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
<body>
	<jsp:include page="../../../common/menubar.jsp"/>



<!-- 컨텐츠 영역 -->
<section id="container">
	
	<!-- //디자인이 확정이 아니랍니다 -->
	
	<div class="hotelParadiseWrap pb0">
		<div class="innerBox">
			<h1 class="contTitle"><span>객실</span>호텔 델루나만의 예술적 품격을 갖춘 객실에서 <br />격이 다른 휴식과 여유를 경험해 보세요.</h1>
			
			<section class="jsSwiperMotion">
				<div class="swiperWrap">
					<ul>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/room/superior/img_superior1.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/room/superior/img_superior2.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/room/superior/img_superior3.jpg" alt="" /></p>
						</li>
						<li>
							<p class="img"><img src="resources/pcPub/static/images/room/superior/img_superior4.jpg" alt="" /></p>
						</li>
					</ul>
				</div>
				<div class="btnArrow">
					<a href="#" class="btnLeft">좌측</a>
					<a href="#" class="btnRight">우측</a>
				</div>
			</section>
			
			<div class="detailTextBox">
				<h2>DELUXE</h2>
				<p class="subTit">모던하면서도 아늑한 인테리어의 슈페리어 룸</p>
				<p class="text">편안한 분위기와 세련된 실내 디자인의 슈페리어 룸은 45평방미터의 공간으로 안락하고 편안한 휴식을 제공합니다. <br />룸서비스 이용은 24시간 가능하며, 와이파이 서비스는 무료로 이용하실 수 있습니다. </p>
				<div class="btnGroup">
					<a href="#map" class="btn small layerPopOpen"><span>도면보기</span></a>
					<!-- 2018.07.09 수정 -->
				</div>
			</div>
			
			<div class="detailInfo">
				<h3>상세정보</h3>
				<div class="infoDetail">
					<dl class="type2">
						<dt>객실 서비스</dt>
						<dd>
							<ul class="dotList type2">
								<li>무료 WIFI</li>
								<li>55인치 FULL HD TV</li>
								<li>위성 TV 63개 채널</li>
								<li>개인용 금고</li>
								<li>커피</li>
								<li>녹차, 홍차(티백)</li>
								<li>미네랄 워터 2병</li>
								<li>커피포트</li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>어메니티</dt>
						<dd>
							<ul class="dotList">
								<li>배쓰 어메니티 5종</li>
								<li>배쓰타올</li>
								<li>목욕용 가운</li>
								<li>샤워캡</li>
								<li>머리 빗</li>
								<li>면봉</li>
								<li>에머리보드</li>
								<li>헤어드라이어</li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>체크인 아웃</dt>
						<dd>
							<dl>
								<dt>Check in</dt>
								<dd>03:00 PM</dd>
								<dt>Check out</dt>
								
								<dd>11:00 AM</dd>
								
							</dl>
						</dd>
					</dl>
				</div>
				<a href="#channel" class="tbLink layerPopOpen">위성채널정보</a>
			</div>
			
			<div class="cautionBox type2">
				<h2>안내사항</h2>
				<ul class="dotList">
					
					<li>성수기 시즌 체크 인/아웃 시간은 조정될 수 있습니다.</li>
					<li>호텔 내 유아용 킥보드 및 전동 퀵보드 사용은 엄격하게 제한됩니다.</li>
				</ul>
			</div>
				
		</div>
		
		<div class="fullBg mt">
			<div class="innerBox">
				<div class="tapBox">
					<ul class="eventTab clearFixed">
						<li class="on"><a href="#">SUPERIOR</a></li>
						<li><a href="#">DELUXE</a></li>
						<li><a href="#">SUITE</a></li>
					</ul>
				</div>
				<!-- SUPERIOR -->
				<div class="tapView" style="display:block;">
					<div class="jsSwiperMotion type2 eventSwipe">
						<div class="swiperWrap" data-show="3">
							<ul>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="superior"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list1.jpg" alt="" /></p>
										<h4>SUPERIOR</h4>
										<p class="text">모던하면서도 아늑한 인테리어의 슈페리어 룸</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="superior_terrace"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list2.jpg" alt="" /></p>
										<h4>SUPERIOR TERRACE</h4>
										<p class="text">한층 여유로운 공간과 세련된 인테리어가 어우러진 슈페리어 테라스</p>
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
				<!-- //SUPERIOR -->
				
				<!-- DELUXE -->
				<div class="tapView">
					<div class="jsSwiperMotion type2 eventSwipe">
						<div class="swiperWrap" data-show="3">
							<ul>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="deluxe"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list5.jpg" alt="" /></p>
										<h4>DELUXE</h4>
										<p class="text">편안한 분위기의 침실과 우아한 감성의 거실이 분리되어 독립적 공간 활용이 매력적인 디럭스 룸</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="grand_deluxe"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list6.jpg" alt="" /></p>
										<h4>GRAND DELUXE</h4>
										<p class="text">침실과 거실이 하나로 이어지는 특별한 공간 구성과 모던한 감각, 그랜드 디럭스</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="premium_deluxe"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list7.jpg" alt="" /></p>
										<h4>PREMIUM DELUXE</h4>
										<p class="text">클래식한 감성과 이국적인 신비로움이 가득한 프리미엄 디럭스</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="premium_deluxe_terrace"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list8.jpg" alt="" /></p>
										<h4>PREMIUM DELUXE TERRACE</h4>
										<p class="text">여유로운 두 개의 침실과 넓게 꾸며진 거실에서 가족이 편안한 시간을 보낼 수 있는 프리미엄 디럭스 테라스</p>
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
				<!-- //DELUXE -->
				
				<!-- SUITE -->
				<div class="tapView">
					<div class="jsSwiperMotion type2 eventSwipe">
						<div class="swiperWrap" data-show="3">
							<ul>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="junior_suite"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list9.jpg" alt="" /></p>
										<h4>JUNIOR SUITE</h4>
										<p class="text">고급스러운 색채와 감각적인 분위기를 지닌 격이 다른 럭셔리한 공간, 주니어 스위트</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="deluxe_suite"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list10.jpg" alt="" /></p>
										<h4>DELUXE SUITE</h4>
										<p class="text">호텔 파라다이스만의 예술적 감성이 묻어나는 호텔 델루나의 대표 스위트 객실, 디럭스 스위트</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="grand_deluxe_suite"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list11.jpg" alt="" /></p>
										<h4>GRAND DELUXE SUITE</h4>
										<p class="text">세계 최고 VIP만을 위한 그랜드 디럭스 스위트</p>
									</a>
								</li>
								<li>
									<c:url var="roomView" value="roomView.do">
										<c:param name="type" value="royal_suite"/>
									</c:url>
									<a href="${roomView }">
										<p class="img"><img src="resources/pcPub/static/images/room/list/room_list12.jpg" alt="" /></p>
										<h4>ROYAL SUITE</h4>
										<p class="text">왕실의 기품이 흐르는 고급스러운 로열 스위트</p>
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
				<!-- //SUITE -->
				
			</div>
		</div>
	</div>

</section>
<!-- //컨텐츠 영역 -->

<!-- 도면보기 -->
<div class="layerPopWrap normalLayer" id="map">
	<div class="bg"></div>
	<!-- layerPopCont -->
	<div class="layerPopCont" style="width:864px;">
		<h1 class="popHeader">도면보기</h1>
		<div class="mapPop tc">
			<div class="tapBox">
				<ul>
					<li class="on"><a href="#">KING</a></li>
					<li><a href="#">TWIN</a></li>
				</ul>
			</div>
			<div class="tapView" style="display:block;">
				<img src="resources/pcPub/static/images/room/superior/img_superior_map1.jpg" alt="" />
			</div>
			<div class="tapView">
				<img src="resources/pcPub/static/images/room/superior/img_superior_map2.jpg" alt="" />
			</div>
		</div>
		
		<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
	</div>
	<!-- //layerPopCont -->
</div>
<!-- //도면보기 -->

<!-- 2018.07.30 위성 채널 -->
<div class="layerPopWrap normalLayer" id="channel">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
    <h1 class="popHeader">위성채널정보</h1>
        <table class="tableList">
               <colgroup>
                   <col style="width:35px;" />
                   <col style="" />
                   <col style="width:100px;" />
                   <col style="" />
               </colgroup>
               <thead>
                   <tr>
                       <th scope="col">Ch.</th>
                       <th scope="col">Ch. Name</th>
                       <th scope="col">Language</th>
                       <th scope="col">Info</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>1</td>
                       <td>Hotel Guide 1</td>
                       <td></td>
                       <td>Information</td>
                   </tr>
                   <tr>
                       <td>2</td>
                       <td>Hotel Guide 2</td>
                       <td></td>
                       <td>Information</td>
                   </tr>
                   <tr>
                       <td>5</td>
                       <td>SBS</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>7</td>
                       <td>KBS2</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>9</td>
                       <td>KBS1</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>11</td>
                       <td>MBC</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>13</td>
                       <td>EBS1</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>15</td>
                       <td>Channel A</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>16</td>
                       <td>OBS</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>17</td>
                       <td>JTBC</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>18</td>
                       <td>MBN</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>19</td>
                       <td>TV Chosun</td>
                       <td>Korean</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>20</td>
                       <td>YTN</td>
                       <td>Korean</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>21</td>
                       <td>SBS CNBC</td>
                       <td>Korean</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>22</td>
                       <td>매일경제 TV</td>
                       <td>Korean</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>23</td>
                       <td>JTBC GOLF</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>24</td>
                       <td>SBS GOLF</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>25</td>
                       <td>SBS Sport</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>26</td>
                       <td>KBS Sport</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>27</td>
                       <td>MBC Sport+</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>28</td>
                       <td>스카이 Sport</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>29</td>
                       <td>SPOTV+</td>
                       <td>Korean</td>
                       <td>Sport/Leisure</td>
                   </tr>
                   <tr>
                       <td>30</td>
                       <td>채널 CGV</td>
                       <td>Korean</td>
                       <td>Movie/Series</td>
                   </tr>
                   <tr>
                       <td>31</td>
                       <td>OCN</td>
                       <td>Korean</td>
                       <td>Movie/Series</td>
                   </tr>
                   <tr>
                       <td>32</td>
                       <td>TVN</td>
                       <td>Korean</td>
                       <td>Drama</td>
                   </tr>
                   <tr>
                       <td>33</td>
                       <td>On Style</td>
                       <td>Korean</td>
                       <td>Woman/Drama</td>
                   </tr>
                   <tr>
                       <td>34</td>
                       <td>O'live</td>
                       <td>Korean</td>
                       <td>Woman/Drama</td>
                   </tr>
                   <tr>
                       <td>35</td>
                       <td>M.net</td>
                       <td>Korean</td>
                       <td>Music</td>
                   </tr>
                   <tr>
                       <td>36</td>
                       <td>EBS U</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>37</td>
                       <td>KBS Kids</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>38</td>
                       <td>Tooniverse</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>39</td>
                       <td>Catoon Network</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>40</td>
                       <td>AniOne</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>41</td>
                       <td>Disney Channel</td>
                       <td>Korean</td>
                       <td>Kids/Education</td>
                   </tr>
                   <tr>
                       <td>43</td>
                       <td>아리랑 TV(Arirang TV)</td>
                       <td>English/<br />Korean</td>
                       <td>Culture &amp; Docu</td>
                   </tr>
                   <tr>
                       <td>45</td>
                       <td>CNBC</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>46</td>
                       <td>CNN</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>47</td>
                       <td>BBC World</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>48</td>
                       <td>Discovey</td>
                       <td>English</td>
                       <td>Culture &amp; Docu</td>
                   </tr>
                   <tr>
                       <td>49</td>
                       <td>Blomberg</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>50</td>
                       <td>Star Sprots</td>
                       <td>English</td>
                       <td>Sprots/Leisure</td>
                   </tr>
                   <tr>
                       <td>51</td>
                       <td>CCTV News</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>52</td>
                       <td>CCTV4</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>53</td>
                       <td>CCTV9</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>54</td>
                       <td>Phoenix Chinese</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>55</td>
                       <td>Channel V Chinese</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>56</td>
                       <td>후난위성TV(湖南卫视)</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>57</td>
                       <td>Channel Chinese</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>58</td>
                       <td>중화 TV(中国电视)</td>
                       <td>Chinese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>59</td>
                       <td>NHK World TV</td>
                       <td>English</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>60</td>
                       <td>NHK World Premium</td>
                       <td>Japanese</td>
                       <td>Culture &amp; Docu</td>
                   </tr>
                   <tr>
                       <td>61</td>
                       <td>NHK BS1</td>
                       <td>Japanese</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>62</td>
                       <td>NHK BS2</td>
                       <td>Japanese</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>63</td>
                       <td>FUJI TV</td>
                       <td>Japanese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>64</td>
                       <td>ASAHI TV</td>
                       <td>Japanese</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>65</td>
                       <td>AUAZEERA English</td>
                       <td>English</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>66</td>
                       <td>AUAZEERA</td>
                       <td>Arobic</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>67</td>
                       <td>DUBAI Sports</td>
                       <td>Arobic</td>
                       <td>Sports/Leisure</td>
                   </tr>
                   <tr>
                       <td>68</td>
                       <td>Russia Today</td>
                       <td>Russian</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>69</td>
                       <td>DW</td>
                       <td>Gernman</td>
                       <td>Public broadcasting</td>
                   </tr>
                   <tr>
                       <td>70</td>
                       <td>French24</td>
                       <td>French</td>
                       <td>News/Economic</td>
                   </tr>
                   <tr>
                       <td>71</td>
                       <td>International Arrival</td>
                       <td></td>
                       <td>Infomation</td>
                   </tr>
                   <tr>
                       <td>72</td>
                       <td>International Departure</td>
                       <td></td>
                       <td>Infomation</td>
                   </tr>
                   <tr>
                       <td>73</td>
                       <td>International Arrival(Cargo)</td>
                       <td></td>
                       <td>Infomation</td>
                   </tr>
                   <tr>
                       <td>74</td>
                       <td>International Departure(Cargo)</td>
                       <td></td>
                       <td>Infomation</td>
                   </tr>
               </tbody>
           </table>
        <a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
    </div>
    <!-- //layerPopCont -->
</div>
<!-- //2018.07.30 위성 채널 -->

<!-- 1:1 문의 (레이어 팝업) -->

<script>
var title = "1:1 문의";

var strFacility1 = "000001";
var strFacility2 = "000001";

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
    memberMenu[0] =  '델루나 리워즈  포인트';
    memberMenu[1] =  '델루나 시그니처';
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
            selectVal("#FACILITY2", "000001");
            $('#FACILITY2').children("option").each(function() {
                if ($(this).is(":selected")) {
                    $(this).trigger("change");
                }
            });
            //'세부시설 유형' 초기값 설정
            selectVal("#FACILITY3", "");
        }
    }, 100);
    
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$(document).ready(function(){
    // 팝업 제목 설정
    
        title = "상품문의";
    
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
                
            // 호텔 델루나(시설) & 다이닝(세부시설)
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
                
            // 호텔 델루나(시설) & 다이닝(세부시설)
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
                            <p>호텔델루나는 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.<br />
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




		
</body>
</html>