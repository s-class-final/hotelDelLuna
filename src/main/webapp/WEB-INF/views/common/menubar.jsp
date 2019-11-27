<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<div class="wrapper">
		<div class="header">
			<div id="logoimg">
				<img src="resources/images/logo.png" height='80px'
					width='180px'>
			</div>
		</div>
		<div class="navbar">
			<div class="mini-logoimg">
				<img src="resources/images/logo_mk3.png"
					height='50px' width='110px' id="mini-logoimg">
			</div>
			<div>
			<ul class="mainList">
				<li>
				<a href="">Hotel Info</a>
				</li>
				<li>
				<a href="">Reservation</a>
				</li>
				<li>
				<a href="">Dining</a>
				</li>
				<li>
				<a href="">reservation</a>
				</li>
				<li>
				<a href="">고객센터</a>
				</li>
				<li>
				<c:if test="${ empty sessionScope.loginUser }">
					<a href="loginForm.do">Login</a>
					</li>
				</c:if>
				<c:if test="${ !empty sessionScope.loginUser }">
					<c:out value="${ loginUser.userName }"/>
					<c:url var="logout" value="logout.do"/>
					<button onclick="location.href='${logout}'">로그아웃</button>
				</c:if>
			</ul>
			</div>
		</div>
	</div>



	<script>
		$(document).ready(function() {
			// grab the initial top offset of the navigation 
			var stickyNavTop = $('.navbar').offset().top;

			// our function that decides weather the navigation bar should have "fixed" css position or not.
			var stickyNav = function() {
				var scrollTop = $(window).scrollTop(); // our current vertical position from the top

				// if we've scrolled more than the navigation, change its position to fixed to stick to top,
				// otherwise change it back to relative
				if (scrollTop > stickyNavTop) {
					$('.navbar').addClass('sticky');
				} else {
					$('.navbar').removeClass('sticky');
				}
			};
 		
			stickyNav();
			// and run it again every time you scroll
			$(window).scroll(function() {
				stickyNav();
			});
		});
	</script>
</body>
</html>