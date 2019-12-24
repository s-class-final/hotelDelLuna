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
				<p class="tit">델루나에서 준비한 특별한 즐길거리와 시설을 지금 만나보세요. </p>
				<div class="offers">
					<ul class="clearFixed">
						
						<li data-animation="fadeInUp">
							<a href="fac3.do">
								<div class="img">
									<img src="resources/pcPub/static/images/facilities/facilities3.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Delluna Sauna</strong>
									<span class="sub">사랑하는 가족과 보내는 따뜻한 연말</span>
									<p class="price">
									
									
									<span class="price1">20,000원 ~ </span>
									
									</p>
									<span class="tag">#HOTEL DELLUNA</span>
									
																		
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="fac4.do">
								<div class="img">
									<img src="resources/pcPub/static/images/facilities/facilities4.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Delluna Fitness</strong>
									<span class="sub">건강한 하루를 호텔에서도 유지할 수 있게 도와주는 피트니스클럽</span>
									<p class="price">
									
										<span class="price1">18,000원 ~ </span>
									
									
									</p>
									<span class="tag">#DELLUNA FITNESS</span>
									
																		
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="fac2.do">
								<div class="img">
									<img src="resources/pcPub/static/images/facilities/facilities2.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Indoor Pool</strong>
									<span class="sub">자연과 하나되는 Relaxation Indoor Pool</span>
									<p class="price">
									
										<span class="price1">30,000원 ~ </span>
									
									
									</p>
									<span class="tag">#POOL #INDOOR POOL</span>
									
																		
								</div>
							</a>
						</li>
						
						<li data-animation="fadeInUp">
							<a href="fac5.do">
								<div class="img">
									<img src="resources/pcPub/static/images/facilities/facilities6.jpg" alt="">
								</div>
								<div class="txt">
									<strong>Kids Zone</strong>
									<span class="sub">아이가 자라는 시간, Kids Zone</span>
									<p class="price">
									
										<span class="price1">10,000원 ~ </span>
									
									
									
									</p>
									<span class="tag">#KIDS #KIDS ZONE</span>
									
									
									
								</div>
							</a>
						</li>
						
					</ul>
					<div class="btnMore"><a href="#"><span>전체 보기</span></a></div>
				</div>


			</div>
		</section> 
		<!-- //FEAUTRED OFFERS 오퍼!!!부분  -->

		<!-- MEMBERSHIP -->
		<section class="subMainCont SMMembership bg pb192i">
			<div class="innerBox">
				<h2>HOTEL DELLUNA DINING</h2>
				<p class="tit">델루나 고객님께 특별한 혜택을 제공해드리는 다양한 다이닝을 소개합니다. </p>
				<ul>
					<li data-animation="fadeInUp" data-delay="0">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership1.jpg" alt="">
							<div class="cover">
								<div>
									<p>유럽의 정취를 지닌 카페 <br />고풍스러운 음악을 즐길 수 있는 카페</p>
									<a href="diningView.do?type=GardenCafe" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">GARDEN CAFÉ</p>	
					</li>
					<li data-animation="fadeInUp" data-delay="0.2">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership2.jpg" alt="">
							<div class="cover">
								<div>
									<p>유럽, 뉴욕, 상해의 최신 Trend를 반영 <br />다섯가지 Station으로 구성된<br />Premium Buffet Restaurant</p>							
									<a href="diningView.do?type=OnThePlate" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">ON THE PLATE</p>	
					</li>
					<li data-animation="fadeInUp" data-delay="0.4">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership3.jpg" alt="">
							<div class="cover">
								<div>
									<p>고품격 서비스와 다양한 음악이 <br />어우러진 색다른 공연을 만나는 <br />라이브 뮤직 라운지입니다.</p>	
									<a href="diningView.do?type=Rubik" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">HOTEL DELLUNA RUBIK</p>	
					</li>
					
					<li data-animation="fadeInUp" data-delay="0.6">
						<div class="img">
							<img src="resources/pcPub/static/images/submain/hotelParadise/img_membership4.jpg" alt="">
							<div class="cover">
								<div>
									<p>음악이 흐르는 <br />델루나의 로비 라운지 입니다.</p>
									<a href="diningView.do?type=LoungeParadise" class="btn small2 btnLine2">자세히 보기</a>
								</div>
							</div>
						</div>
						<p class="text">LOUNGE DELLUNA</p>	
					</li>
					
				</ul>
			</div>
		</section>
		<!-- //MEMBERSHIP -->
	</div>
	<!---------------------- 서브 메인!!!! ----------------------->
</section>

<!-- //컨텐츠 영역 -->

<jsp:include page="WEB-INF/views/common/footer.jsp"/>
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