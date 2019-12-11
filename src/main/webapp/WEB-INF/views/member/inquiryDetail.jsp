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
	<h1 align="center">문의글 상세보기</h1>
	<br>
	
	<table align="center">
		<tr align="center" valign="middle">
			<th colspan="2">${inquiry.iId}번 글 상세보기</th>
		</tr>
		<tr>
			<td>제목</td>
			<td>${inquiry.iTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${inquiry.iWriter}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${inquiry.iContent}</td>
		</tr>
		<c:if test="${inquiry.reStatus eq 'Y'}">
			<tr>
				<td>관리자 답변 : ${inquiry.reContent}</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2" align="center">
				<c:url var="iupview" value="iupView.do">
					<c:param name="iId" value="${inquiry.iId}"/>
					<c:param name="page" value="${currentPage}"/>
				</c:url>
				<c:url var="idelete" value="idelete.do">
					<c:param name="iId" value="${inquiry.iId}"/>
				</c:url>
				<c:if test="${inquiry.reStatus eq 'N'}">
					<a href="${iupview}">수정하기</a> &nbsp;
				</c:if>
					<a href="${idelete}">삭제하기</a> &nbsp;
				<c:if test="${loginUser.userT eq 1}">
					<a href="minquiry.do">목록으로</a>
				</c:if>
				<c:if test="${loginUser.userT eq 2}">
					<a href="allinquiry.do">목록으로</a> &nbsp;
					<a href="reinquiry.do">답변등록</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>