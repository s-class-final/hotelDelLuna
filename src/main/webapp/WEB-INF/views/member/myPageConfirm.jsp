<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>
		<span>비밀번호 확인</span>
		<br>
		"회원님의 개인정보 보호를 위한 절차이오니,"
		<br>
		"회원 로그인 시 사용하시는 비밀번호를 입력해 주세요"
	</h1>
	<form>
		<h3>아이디(이메일)</h3>
		<input type="text" id="userId" name="userId" value="${loginUser.userId}" disabled>
		<h3>비밀번호</h3>
		<input type="password" id="userPwd" name="userPwd" placeholder="password">
		<br>
		<button id="joinBtn" type="button">확인</button>
	</form>
	
	<script>
	$(function(){
		$("#joinBtn").click(function(){
			var userId = $("#userId").val();
			var userPwd = $("#userPwd").val();
			
			$.ajax({
				url:"mypageLogin.do",
				data:{userId:userId, userPwd:userPwd},
				success:function(data){
					if(data == "true"){
						location.href="mypage.do";
					}else{
						alert("비밀번호가 일치하지 않습니다.");
					}
				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
			 }
			})
		});

	});
	</script>
	
</body>
</html>