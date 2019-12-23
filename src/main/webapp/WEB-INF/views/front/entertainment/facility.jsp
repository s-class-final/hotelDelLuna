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
	
	<section id="container">
	
	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle"><span>부대시설</span>다채로운 액티비티와 휴식을 함께 <br />즐길 수 있는 호텔 델루나의 시설을 즐겨보세요.</h1>
			<div class="rightButton"><!-- <a href="#" class="btn small arrow"><span>FLOOR MAP</span></a> --></div>
			
			<div class="descBox">
				<div id="focus1" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities1.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Outdoor Pool</span>하늘과 마주한 로맨틱한 Outdoor Pool</p>
					<a href="fac1.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div id="focus2" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities2.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Indoor Pool</span>자연과 하나되는 Relaxation Indoor Pool</p>
					<a href="fac2.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div  id="focus3" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities3.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Sauna</span>편안한 휴식을 즐길 수 있는 실내 사우나</p>
					<a href="fac3.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div id="focus4" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities4.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Fitness</span>건강한 하루를 호텔에서도 <br />유지할 수 있게 도와주는 피트니스클럽</p>
					<a href="fac4.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div  class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities6.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Kids Zone</span>아이가 자라는 시간, Kids Zone</p>
					<a href="fac5.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div id="focus5" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities7.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>The Spa at Delluna</span>Esthetic Spa &amp; Anti-aging Clinic</p>
					<a href="fac6.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
			<div class="descBox">
				<div id="focus6" class="imageWrap"><img src="resources/pcPub/static/images/facilities/facilities8.jpg" alt=""></div>
				<div class="text">
					<p class="title"><span>Delluna Boutique</span>호텔 델루나의 시그니처 아이템을 <br />만나는 공간</p>
					<a href="fac7.do" class="btn small2"><span>상세 보기</span></a>
				</div>
			</div>
		</div>
	</div>

</section>
<script>
$(function(){
	var focus = ${focus};
	if(focus==1){
		$("#focus1").attr("tabindex", -1).focus();		
	}
	if(focus==5){
		$("#focus5").attr("tabindex", -1).focus();		
		console.log("마마2");		
	}	
	if(focus==6){
		$("#focus6").attr("tabindex", -1).focus();		
		console.log("마마3");
	}
});

</script>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>