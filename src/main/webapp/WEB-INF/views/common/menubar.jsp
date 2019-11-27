<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<style>
#logoimg {

	align: center;
}

.mini-logoimg{

 position : absolute;
 
}

body {
	margin: 0;
	padding: 0;
}


.header {
	padding: 20px 0;
	background: linear-gradient(90deg, rgba(42, 24, 61, 1) 0%,
		rgba(30, 6, 52, 1) 24%, rgba(26, 8, 38, 1) 50%, rgba(44, 15, 66, 1)
		75%, rgba(41, 5, 56, 1) 100%);
		text-align: center;
}

.navbar {
	padding: 15px 0;
	width: 100%;
	height : 65px;
background: linear-gradient(90deg, rgba(25,23,28,1) 0%, rgba(25,10,62,1) 24%, rgba(15,7,47,1) 50%, rgba(34,16,68,1) 72%, rgba(30,6,40,1) 100%);
	text-align: center;
	position: -webkit-sticky;
	color: #fff;
	
}
.sticky {
	position: fixed;
	width: 100%;
	height : 65px;
	left: 0;
	top: 0;
	z-index: 100;
	border-top: 0;
}

ul.mainList {
	margin: auto;
  	margin-top: 5px;
 	 margin-bottom: 5px;
	text-align : center;
    list-style: none;\
    padding: 0px;
    max-width: 900px;
    width: 100%;
}
ul.mainList li {
	width : 100px;
 	 margin-left : 5px;
    display: inline-block;
    padding: 10px;
    font-size: 20px;
     border: 1px #333333;
    cursor: pointer;
}

a:hover{
	 background:black;
}

a{
	height : 50px;
	color : white;
}
</style>

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
							<li><a href="#">호텔 소개</a></li>
							<li><a href="#">오시는 길</a></li>
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
							<li><a href="#">Overview</a></li>
							<li class="on"><a href="#">디럭스</a></li>
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
						<h2><a href=#><span>dine &amp; drink</span>다이닝</a></h2>
						<ul>
							<li><a href="#">RESTRAUNT</a></li>
							<li><a href="#">DRINK &amp; BAR</a></li>
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
							<li><a href="#">공지사항</a></li>
							<li><a href="#">1:1문의</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li>
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
<!-- 			<span class="newCount">99</span> : PC는 갯수 불요-->
		</a>
	</div>
	<div class="quickC">
		<ul>
		<%-- 	<c:url var="entireResList" value="entireResList.do"/>
		 --%>
			<li><a href="#"><em class="icon1"><i></i></em><p>Login</p></a></li>
			<li><a href="#"><em class="icon2"><i></i></em><p><span>HOTEL</span>JOIN US</p></a></li>
			<li><a href="#"><em class="icon3"><i></i></em><p><span>MEMBER</span>MY PAGE</p></a></li>
			<li><a href="#"><em class="icon4"><i></i></em><p><span>RESERVATION</span>MY RESERVATION</p></a></li>
			<li><a href="#"><em class="icon5"><i></i></em><p><span>MAP</span>DELLUNA MAP</p></a></li>
		</ul>
	</div>
</aside>

<!-- //quick Bar -->

</div>
</body>
</html>