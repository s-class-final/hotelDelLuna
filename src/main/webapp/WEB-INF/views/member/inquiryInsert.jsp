<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">문의글 작성</h1>
	<br>
	
	<form action="iInsert.do" method="post">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="iTitle"></td>
			</tr>
			<input type="hidden" name="iWriter" value="${loginUser.userId}">
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="iContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기">
					<br>
					<a href="minquiry.do">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>