<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>

</head>
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 		<script src="/resources/resource/front/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script> -->
		<script src="resources/common/component/jquery-upload-file/js/file_handlers.js"></script>
		<script src="resources/common/js/check.js"></script>
		<script src="resources/common/js/form.js"></script>
		<script src="resources/common/js/string.js"></script>
		<script src="resources/common/js/common.js"></script>

		<!-- S : 1-2 js -->	
		<script type="text/javascript" src="resources/pcPub/static/js/common.js"></script>
		<script src="resources/common/component/jquery-session/jquery.session.js"></script>
		
		<!-- S : 1-2 css -->
		<link href="resources/pcPub/static/css/reset.css" rel="stylesheet" />	
		<link href="resources/pcPub/static/css/common.css" rel="stylesheet" />
		<link href="resources/pcPub/static/css/contents.css" rel="stylesheet" />
		
		<script type="text/javascript" src="resources/pcPub/static/js/ui.js"></script>
		<script src="resources/front/js/front.js"></script>
		
	<!-- <link href="resources/pcPub/static/css/lib/swiper2.css" rel="stylesheet"/>  -->
<body>


<div id="main">

<header id="headerWrap">
   <h1 style="margin-left:90px"><a href="index.jsp">HOTEL DELLUNA</a></h1>
   <nav class="gnb">
      <ul>
         <li>
            <a href="#">introduce</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="#"><span>INTRODUCTION</span>소개</a></h2>
                  <ul>
                     <li><a href="hotelDelLunar.do">호텔 소개</a></li>
                     <li><a href="location.do">오시는 길</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">hotels</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="#"><span>DELLUNA</span>객실안내</a></h2>
                  <ul>
                     <li><a href="overView.do">Overview</a></li>
                     <li class="on"><a href="roomView.do">디럭스</a></li>
                     <li><a href="#">슈페리어</a></li>
                     <li><a href="#">패밀리</a></li>
                  </ul>
               </div>
            </div>
         </li>   
         <li>
            <a href="#">entertainment</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="#"><span>entertainment</span>즐길거리</a></h2>
                  <ul>
                     <li><a href="#">Swimming Pool</a></li>
                     <li><a href="#">CASINO</a></li>
                     <li class="on"><a href="#">가격 및 이용안내</a></li>
                     <li><a href="#">주변 즐길거리</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">dine &amp; drink</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="dining.do"><span>dine &amp; drink</span>다이닝</a></h2>
                  <ul>
                     <li><a href="restaurant.do">RESTRAUNT</a></li>
                     <li><a href="cafe.do">DRINK &amp; BAR</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">service center</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="#"><span>Service Center</span>고객센터</a></h2>
                  <ul>
                     <li><a href="notice.do">공지사항</a></li>
                     <li><a href="voc.do">1:1문의</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
				<a href="entireResList.do">관리자 페이지</a>
				<div class="gnbDepth2">
					<div>
						<h2><a href="#"><span>Admin page</span>관리자 페이지</a></h2>
						<ul>
							<li><a href="iRoomView.do">방 등록</a></li>
							
						</ul>
					</div>
				</div>
		
			</li>
      </ul>
   </nav>
   
   <div class="topLink">
      <div class="more">
         <a href="#" class="topMore">LANGUAGE</a>
         <ul>
            <li><a href="#">KR</a></li>
            <li><a href="#">EN</a></li>

         </ul>
      </div>

   <!------------------------ 언어 선택 부분 ------------------------>
   
   <!--       
      <div class="language">
         <a href="#">         
      
         KR

         </a>
      </div> 
   -->
   <!----------------------- //언어 선택 부분 ------------------------>
   </div>
   
   <div class="bgDepth"></div>
</header>

<!-- quick Bar 퀵메뉴 퀵 메뉴 -->
<aside class="quickBar view">
   <div class="quickH">
      <a href="#">
         <h1><img src="resources/pcPub/static/images/common/Reservation_icon_100.png" />reservation</h1>
         <p>호텔 델루나의 시설과 <br />상품을 한번에 예약하세요.</p>
<!--          <span class="newCount">99</span> : PC는 갯수 불요-->
      </a>
   </div>
   <div class="quickC">
      <ul>
      <%--    <c:url var="entireResList" value="entireResList.do"/>
       --%>
          <c:if test="${ empty sessionScope.loginUser }">
            <li><a href="loginForm.do"><em class="icon1"><i></i></em><p>Login</p></a></li>
         </c:if>
         <c:if test="${ !empty sessionScope.loginUser }">
            <li><a href="logout.do"><em class="icon1"><i></i></em><p>Logout</p></a></li>
         </c:if>
         <li><a href="#"><em class="icon2"><i></i></em><p><span>HOTEL</span>JOIN US</p></a></li>
         <li><a href="#"><em class="icon3"><i></i></em><p><span>MEMBER</span>MY PAGE</p></a></li>
         <li><a href="entireResList.do"><em class="icon4"><i></i></em><p><span>RESERVATION</span>MY RESERVATION</p></a></li>
         <li><a href="#"><em class="icon5"><i></i></em><p><span>MAP</span>DELLUNA MAP</p></a></li>
      </ul>
   </div>
</aside>
<script language="JavaScript">

// 스와이프 관련 오류 해결. 나중에 지울 것
/* 
$(document).ready(function(){
	
	//메인 갤러리 선언
	var galleryMain = new Swiper('.gallery-main', {
		preventClicks: false,
		preventClicksPropagation: false,
		slideToClickedSlide: true,
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev'
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'fraction',
		}
	});
});

 */
$(window).load(function(){
	if ($(".quickBar").length > 0) {
		setTimeout(function() {
			$(".quickBar").removeClass("view");
		}, 100);
	}
	
	
});

</script>

<!-- //quick Bar -->

</div>
</body>

</html>