<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hotel Delluna</title>


</head>

<body>
<div id="main">
 <jsp:include page="WEB-INF/views/common/menubar.jsp"/>
 <section id="container" style="padding-bottom:0px">
	
	<!-- Main Visual 숨겨놓음 -->
	
	<div class="mainVisual">
		<div class="visualView">
			<div class="bg1"><span style="width:100%"></span></div>
			<div class="bg2"><span style="width:100%"></span></div>
			<div class="bg5"><span style="width:100%"></span></div>
		</div>
		<div class="visual">
			<div class="bg1">
				<div class="textBox">
					<i class="icon1"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0">Hospitality</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.3">예술적 품격과 여유가 공존하는 호텔 델루나<br />델루나에서 격이 다른 휴식을 경험해보세요.</p>
				</div>
				
				<div class="textView">
					<a href="main.jsp">
						<h2>HOTEL DELLUNA</h2>
						<p class="text">최고급 리조트형 호텔객실과 부대시설을 갖춘 <br />컨템포러리 럭셔리 호텔 </p>
					</a>
					<a href="instruction.do">
						<h2>DELLUNA INTRODUCE</h2>
						<p class="text">트렌디한 감성의 유러피안 컨셉으로 <br />예술적 영감을 불러 일으키는 디자인 호텔</p>
					</a>
				</div>
			</div>
			<div class="bg2">
				<div class="textBox">
					<i class="icon2"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.2">Excitement</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.5">이색적인 놀거리가 넘쳐나는 엔터테인먼트 스팟!<br />날마다 새로운 즐거움이 펼쳐집니다. </p>
				</div>
				
				<div class="textView">
					<a href="facility.do?focus=1">
						<h2>DELLUNA POOL</h2>
						<p class="text">호텔 델루나의 하늘과 마주할 수 있는<br />로맨틱한 아웃도어 풀</p>
					</a>
					<a href="facility.do?focus=5">
						<h2>DELLUNA SPA</h2>
						<p class="text">유럽의 감성과 한국식 찜질방 문화가 접목된 <br />세계 유일의 신개념 힐링 스파 </p>
					</a>
					<a href="facility.do?focus=6">
						<h2>DELLUNA BOUTIQUE</h2>
						<p class="text">호텔 델루나의 시그니처 아이템을 만나는 공간</p>
					</a>
				</div>
			</div>
			<div class="bg5">
				<div class="textBox">
					<i class="icon5"></i>
					<p class="title" data-animation="fadeInUp" data-delay="0.2">GOURMET</p>
					<p class="text" data-animation="fadeInUp" data-delay="0.5">입 안을 가득 채우는 다채로운 풍미와 함께<br />소중한 사람과의 시간은 더욱 빛이 납니다. </p>
				</div>
				
				<div class="textView">
					<a href="dining.do?CATE=restaurant">
						<h2>RESTRAUNT</h2>
						<p class="text">미슐랭 스타의 프리미엄 레스토랑<br />다양한 파인 다이닝을 만나보세요. </p>
					</a>
					<a href="dining.do?CATE=cafe">
						<h2>CAFÉ & BAR</h2>
						<p class="text">품격있는 서비스와 럭셔리한 바<br />델루나에서 행복한 시간을 보내세요.</p>
					</a>
				</div>
			</div>

		</div>
	</div>
</section>
</div>
	
	<!-- Main Visual -->
</body>
</html>