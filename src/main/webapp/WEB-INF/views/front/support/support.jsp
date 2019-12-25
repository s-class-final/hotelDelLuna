<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>
	
<!-- 컨텐츠 영역 -->
<section id="container">
	<!-- 디자인이 확정이 아니랍니다 -->
	
	
	<div class="wonderBoxWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			
			<h1 class="contTitle"><span>고객지원</span>호텔 델루나의 각종 안내 정보와<br />궁금한 사항을 확인하세요.</h1>

			<div>
				<p class="phoneCall">전화문의<span>1833-8855</span></p>
				<ul class="helpMenu clearFixed">
					<li>
						<span></span>
						<p><span>공지사항</span>호텔 델루나의 다양한 소식을 확인해보세요.</p>
						<a href="noticeList.do" class="btn small2"><span>바로가기</span></a>
					</li>
					<!-- <li>
						<span></span>
						<p><span>FAQ</span>자주 하는 질문에 대한 답변을 확인할 수 있습니다.</p>
						<a href="/front/faq?mCode=000002" class="btn small2"><span>바로가기</span></a>
					</li> -->
					<li>
						<span></span>
						<p><span>이용문의</span>궁금하신 점은 무엇이든 물어보세요.</p>
						<c:if test="${ empty sessionScope.loginUser }">
							<a href="#poppop" class="layerPopOpen btn small2"><span>바로가기</span></a>
						</c:if>
						<c:if test="${ !empty sessionScope.loginUser }">
							<a href="minquiry.do" class="btn small2"><span>바로가기</span></a>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->
</body>
</html>