<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변 등록</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#reContent {
    width: 100%;
    height: 128px;
    border: 1px solid #e6e3df;
    padding: 12px;
    font-size: 14px;
    font-weight: 200;
    box-sizing: border-box;
    outline: 0;
    resize: none;
}
</style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp"/>


<!-- 컨텐츠 영역 -->
<section id="container">
   
   <div class="noticeViewWrap inquiry">
	<form id="reInquiry" action="reupdate.do" method="post">
		<input type="hidden" id="iId" name="iId" value="${inquiry.iId}">
		<input type="hidden" id="page" name="page" value="${currentPage}">
      <h1>1:1 문의</h1>
      <h2>${inquiry.iTitle}</h2>
      <div class="cont">
      <p>작성자 : ${inquiry.iWriter}</p>
      <br>
      <p>${inquiry.iContent}</p>
      </div>
      <p style="font-size: 14px; color: #9c836a;">관리자 답변</p>
      <br>
      <textarea id="reContent" name="reContent">${inquiry.reContent}</textarea>
      <br><br><br><br>
      <div style="text-align:center;">
         <a onclick="replyInquiry();" class="btn btnFull layerPopOpen"><span>등록</span></a>
      </div>
   </div>   
	</form>
   
</section>
<!-- //컨텐츠 영역 -->

<jsp:include page="../common/footer.jsp"/>

<script>
	function replyInquiry(){
		if (confirm("답변하시겠습니까?")){
			$("#reInquiry").submit();
		}
		
	}
</script>
      
</body>
</html>