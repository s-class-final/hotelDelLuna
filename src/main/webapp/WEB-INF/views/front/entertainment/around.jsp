<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>


<script type="text/javascript">
$(document).ready(function() {
	$('.activityTap li').click(function(){
		var idx = $(this).index();
		var ul = $('.activityTap').next('.eventList');
		$(this).addClass('on').siblings().removeClass('on');
		if(idx == 0){
			ul.find('li').hide();
			setTimeout(function(){
				ul.find('li').show().removeClass('wait-animation');
			},100);
		}else{
			idx = '.target' + idx;
			ul.find('li').hide();
			setTimeout(function(){
				ul.find(idx).show().removeClass('wait-animation');
			},100);
		}
		 
		return false;
	});
	
	
	
	
});

</script>

<!-- 컨텐츠 영역 -->
<section id="container">
	<!-- 디자인이 확정이 아니랍니다 -->
	<section class="subGnb">
		<div class="innerBox">
			<h1>ACTIVITIES</h1>
			<ul>
				<li><a href="/front/activities/paradise/list">파라다이스 즐길거리</a></li>
				<li class="on"><a href="/front/activities/around/list">주변 즐길거리</a></li>
			</ul>
		</div>
	</section>
	<!-- //디자인이 확정이 아니랍니다 -->
	
	<div class="activityWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			
			<h1 class="contTitle"><span>주변 즐길거리</span>파라다이스시티 주변에서 즐길 수 있는 <br />액티비티를 만나보세요.</h1>


			<div class="tapBox tapBoxCate1">
				<ul>
					<li class="on gen"><a href="">일반</a></li>
					<li class="course"><a href="">코스</a></li>
					<li class="cityTour"><a href="">시티투어</a></li>
				</ul>
			</div>
			
			<!-- 일반 -->
			<div class="tapView" style="display:block;">
				<div class="eventBox type2">
					<div class="linkTab activityTap">
						<ul class="eventTab clearFixed ">
							<li class="on"><a href="#all">전체</a></li>
							<li class="see"><a href="">볼거리</a></li>
							<li class="play"><a href="">놀거리</a></li>
							<li class="sea"><a href="">바다/섬</a></li>
							<li class="shopping"><a href="">쇼핑</a></li>
						</ul>
					</div>
					
					<ul class="eventList clearFixed">
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A01">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A01.jpg" alt="">
								</p>
								<div class="txt">
									<strong>인천대교전망대 오션스코프</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A02">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A02.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도 센트럴파크</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A03">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A03.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도 트라이볼(공연장)</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A04">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A04.jpg" alt="">
								</p>
								<div class="txt">
									<strong>정서진</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A05">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A05.jpg" alt="">
								</p>
								<div class="txt">
									<strong>늘솔길공원</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A06">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A06.jpg" alt="">
								</p>
								<div class="txt">
									<strong>인천대공원</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A07">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A07.jpg" alt="">
								</p>
								<div class="txt">
									<strong>인천상륙작전기념관</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A08">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A08.jpg" alt="">
								</p>
								<div class="txt">
									<strong>내동성공회성당</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A09">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A09.jpg" alt="">
								</p>
								<div class="txt">
									<strong>내리교회</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A10">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A10.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송월동 동화마을</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A11">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A11.jpg" alt="">
								</p>
								<div class="txt">
									<strong>인천아트플랫폼</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A12">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A12.jpg" alt="">
								</p>
								<div class="txt">
									<strong>차이나타운</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A13">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A13.jpg" alt="">
								</p>
								<div class="txt">
									<strong>삼국지 벽화거리</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A14">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A14.jpg" alt="">
								</p>
								<div class="txt">
									<strong>짜장면박물관</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A15">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A15.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화 온수리 성공회 사제관</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A16">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A16.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화고인돌 - 강화지석묘</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A17">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A17.jpg" alt="">
								</p>
								<div class="txt">
									<strong>마니산 참성단</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A18">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A18.jpg" alt="">
								</p>
								<div class="txt">
									<strong>전등사</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target1">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-A19">
								<p class="img">
									<span class="tag">볼거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_A19.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화향교</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B01">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B01.jpg" alt="">
								</p>
								<div class="txt">
									<strong>BMW 드라이빙센터</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B02">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B02.jpg" alt="">
								</p>
								<div class="txt">
									<strong>SKY72 골프&amp;리조트</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B03">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B03.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도 센트럴파크 이스트보트하우스</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B04">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B04.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도 센트럴파크 수상택시</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B05">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B05.jpg" alt="">
								</p>
								<div class="txt">
									<strong>도호부청사 전통문화체험</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B06">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B06.jpg" alt="">
								</p>
								<div class="txt">
									<strong>포내 어촌체험마을</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B07">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B07.jpg" alt="">
								</p>
								<div class="txt">
									<strong>큰무리 어촌체험마을</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B08">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B08.jpg" alt="">
								</p>
								<div class="txt">
									<strong>미추홀 전통음식문화연구원 전통문화체험</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B09">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B09.jpg" alt="">
								</p>
								<div class="txt">
									<strong>월미전통정원</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B10">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B10.jpg" alt="">
								</p>
								<div class="txt">
									<strong>월미테마파크</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B11">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B11.jpg" alt="">
								</p>
								<div class="txt">
									<strong>왕산 가족 오토캠핑장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B12">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B12.jpg" alt="">
								</p>
								<div class="txt">
									<strong>선재해상낚시터</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B13">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B13.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화도 황청낚시터</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B14">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B14.jpg" alt="">
								</p>
								<div class="txt">
									<strong>아라뱃길</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target2">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-B15">
								<p class="img">
									<span class="tag">놀거리</span>
									<img src="/pcPub/static/images/activity/img_activity_1_B15.jpg" alt="">
								</p>
								<div class="txt">
									<strong>전등사 템플스테이</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C01">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C01.jpg" alt="">
								</p>
								<div class="txt">
									<strong>을왕리해수욕장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C02">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C02.jpg" alt="">
								</p>
								<div class="txt">
									<strong>왕산해수욕장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C03">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C03.jpg" alt="">
								</p>
								<div class="txt">
									<strong>동막해수욕장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C04">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C04.jpg" alt="">
								</p>
								<div class="txt">
									<strong>실미도</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C05">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C05.jpg" alt="">
								</p>
								<div class="txt">
									<strong>무의바다누리길</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target3">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-C06">
								<p class="img">
									<span class="tag">바다/섬</span>
									<img src="/pcPub/static/images/activity/img_activity_1_C06.jpg" alt="">
								</p>
								<div class="txt">
									<strong>덕적도</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D01">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D01.jpg" alt="">
								</p>
								<div class="txt">
									<strong>신포국제시장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D02">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D02.jpg" alt="">
								</p>
								<div class="txt">
									<strong>모래내시장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D03">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D03.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화풍물시장</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D04">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D04.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화인삼센터</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D05">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D05.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도굿마켓</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D06">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D06.jpg" alt="">
								</p>
								<div class="txt">
									<strong>배다리 공예상가</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D07">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D07.jpg" alt="">
								</p>
								<div class="txt">
									<strong>배다리 헌책방골목</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D08">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D08.jpg" alt="">
								</p>
								<div class="txt">
									<strong>휴띠끄 차이나타운점</strong>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp" class="target4">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType1-D09">
								<p class="img">
									<span class="tag">쇼핑</span>
									<img src="/pcPub/static/images/activity/img_activity_1_D09.jpg" alt="">
								</p>
								<div class="txt">
									<strong>느티나무소금집</strong>
								</div>
							</a>
						</li>
					</ul>
					
				</div>
			</div>
			<!-- 일반 -->
			
			
			<!-- 코스 -->
			<div class="tapView">
				<div class="eventBox type2">
					<ul class="eventList clearFixed">
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType2-1">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_2_1.jpg" alt="">
								</p>
								<div class="txt">
									<strong>송도 코스</strong>
									<span class="sub">현대 프리미엄 아울렛 - 경복궁 송도 본점  - 센트럴파크 - 파라다이스시티</span>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType2-2">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_2_2.jpg" alt="">
								</p>
								<div class="txt">
									<strong>아라뱃길 코스</strong>
									<span class="sub">아라마루&amp;아라폭포 - 홍장표 동해막국수 - 수향8경코스 - 파라다이스시티</span>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType2-3">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_2_3.jpg" alt="">
								</p>
								<div class="txt">
									<strong>강화도 코스</strong>
									<span class="sub">보문사 - 강화 석모도 자연휴양림 - 민머루 해수욕장 - 강화 충남 서산집 - 파라다이스시티 </span>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType2-4">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_2_4.jpg" alt="">
								</p>
								<div class="txt">
									<strong>영종도 코스</strong>
									<span class="sub">을왕리 해수욕장 - 마시안 갯벌체험장 - 황해 해물칼국수 - BMW 드라이빙 센터 - 파라다이스시티</span>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 코스 -->
			
			<!-- 시티투어 -->
			<div class="tapView">
				<div class="eventBox type2">
					<ul class="eventList clearFixed">
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType3-1">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_3_1.jpg" alt="">
								</p>
								<div class="txt">
									<strong>바다라인</strong>
									<span class="sub">송도~인천대교~파라다이스시티~영종</span>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType3-2">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_3_2.jpg" alt="">
								</p>
								<div class="txt">
									<strong>하버라인</strong>
									<span class="sub">송도~월미·개항장</span>
								</div>
							</a>
						</li>
						<li data-animation="fadeInUp">
							<a href="/front/activities/around/view?VIEW_NM=activity_viewType3-3">
								<p class="img">
									<img src="/pcPub/static/images/activity/img_activity_3_3.jpg" alt="">
								</p>
								<div class="txt">
									<strong>시티라인</strong>
									<span class="sub">송도~소래포구~부평~구월</span>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 시티투어 -->
			
		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->


		
</body>
</html>