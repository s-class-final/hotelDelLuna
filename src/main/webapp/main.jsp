<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">


<title>hotel Delluna</title>

</head>

<body>

<!-- 메인 -->
 <div id="main">
 <!-- 헤더 -->
 <jsp:include page="WEB-INF/views/common/menubar.jsp"/> 
 
<!-- //헤더영역 -->





<!-- 컨텐츠 영역 -->

<section id="container">
	
	<!---------------------- 서브 메인!!!! ----------------------->
	<div class="subMain pad0i">
		
		<!-- FEAUTRED OFFERS 오퍼!!!부분  -->
		<section class="subMainCont SMOffers" style="margin-top: 30px;">
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