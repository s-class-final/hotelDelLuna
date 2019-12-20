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


<script>
$(document).ready(function() {
	
});



function jsList() {
	$("#form1").attr("action", "noticeList.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

function jsInsert() {
	$("#form1").attr("action", "noticeInsert.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}
</script>

<!-- 컨텐츠 영역 -->
<section id="container">
	<form id="form1" name="form1">
		<input type="hidden" id="N_SEQ" name="N_SEQ" value="145" />
		<input type="hidden" name="SBU_CD" id="SBU_CD" value="000002" />
		
		<input type="hidden" id="PAGE_SIZE" name="PAGE_SIZE" value="10" />
		<input type="hidden" id="PAGE_NO" name="PAGE_NO" value="1" />
	</form>
	
	
	
	
	<div class="noticeViewWrap">
		<h1>공지사항</h1>
		<h2>새 공지사항 작성</h2> 
		<form action="binsert.do" method="post">
		<table align="center">
			<input type="hidden" id="user_T" name="user_T" value="${loginUser.userT }" />
			<tr>
				<td height="15" width="70">제목</td>
				<td><input type="text" name="nTitle"></td>
			</tr>
			<%-- <tr>
				<td>작성자</td>
				<td><input type="text" readonly name="nWriter" value="${loginUser.userId }"></td>
			</tr> --%>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="nContent"></textarea></td>
			</tr>
			<tr>
				<td>공지사항 공개여부
					<input type="check" value="Y">공개&nbsp;
					<input type="check" value="N" checked>비공개&nbsp;
				</td>
			</tr>
		</table>
		<!--  binsert.do 만들러 ㄱㄱ씽 -->
	</form>
	
	<a href="javascript:jsInsert();" class="btn btnFull"><span>등록</span></a>
	<a href="javascript:jsList();" class="btn btnFull"><span>목록</span></a>
	</div>
</section>
<!-- //컨텐츠 영역 -->

<jsp:include page="../../common/footer.jsp"/>
</body>
</html>