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
	
	<h1 align="center">문의 목록</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${pi.listCount}
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="700" id="td">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>답변여부</th>
		</tr>
		<c:forEach var="i" items="${list}">
			<tr>
				<td align="center">${i.iId}</td>
				<td align="left">
					<c:url var="idetail" value="idetail.do">
						<c:param name="iId" value="${i.iId}"/>
						<c:param name="page" value="${pi.currentPage}"/>
					</c:url>
					<a href="${idetail}">${i.iTitle}</a>
				</td>
				
				<td align="center">${i.iWriter}</td>
				<td align="center">${i.iCreateDate}</td>
				<td align="center">${i.reStatus}</td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 부분 -->
			<tr align="center" height="20">
				<td colspan="6">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전]&nbsp;
					</c:if>
					
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="ilistBack" value="allinquiry.do">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ ilistBack }">[이전]</a>
					</c:if>
					
					<!-- [번호들] -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${p}]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="ilistCheck" value="allinquiry.do">
								<c:param name="page" value="${p}"/>
							</c:url>
							<a href="${ ilistCheck }">${p}</a>
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp;[다음]
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="ilistEnd" value="allinquiry.do">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ ilistEnd }">[다음]</a>
					</c:if>
				</td>
			</tr>
		
	</table>
	
</body>
</html>