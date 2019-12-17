<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
body {
    position: relative;
    top: 150px;
}
</style>
</head>
<body onkeydown="javascript:confirmPwd();">
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>비밀번호 확인</span>회원님의 개인정보 보호를 위한 확인 절차이오니,<br />회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox bg"> <!-- 가로값이 1280으로 설정되어진 아이 -->
					<div class="loginBox">
						<div class="inp">
							<h3 style="padding: 10px;">아이디(이메일)</h3>
							<input type="text" id="userId" name="userId" value="${loginUser.userId}" disabled>
							<button class="btnDelete">삭제</button>
						</div>
						<br><br>
						<div class="inp">
							<h3 style="padding: 10px;">비밀번호</h3>
							<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" title="비밀번호">
						</div>
						<br><br>
						<button id="joinBtn" class="btn btnFull btnLogin">확인</button>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>

	<script>
		$(function() {
			$("#joinBtn").click(
				function() {
					var userId = $("#userId").val();
					var userPwd = $("#userPwd").val();

					if (userPwd == null || userPwd == "") {
						alert("비밀번호를 입력하시기 바랍니다.");
						$('#userPwd').focus();
					} else {
						$.ajax({
							url : "mypageLogin.do",
							data : {userId : userId, userPwd : userPwd},
							success : function(data) {
								if (data == "true") {
									location.href = "mypage.do";
								} else {
									alert("비밀번호가 일치하지 않습니다.");
								}
							},
							error : function(request, status, errorData) {
								alert("error code: " + request.status
										+ "\n" + "message: "
										+ request.responseText + "error: "
										+ errorData);
							}
						})
					}
				});
		});
		
		function confirmPwd(){
			var keyCode = window.event.keyCode;
				if (keyCode == 13) {
					$("#joinBtn").click();
				}
		}
	</script>

</body>
</html>