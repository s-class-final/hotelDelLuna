<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>임시 비밀번호 변경</title>
<style>
body {
    position: relative;
    top: 80px;
}
#changePwd{
	cursor: pointer;
}
</style>
</head>
<body onkeydown="javascript:changePwd();">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="loginWrap">
		<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
			<h1><span>임시 비밀번호 수정</span>임시 비밀번호를 변경하신 후 <br />호텔 델루나 서비스를 정상적으로 이용하실 수 있습니다.</h1>
		</div>
		<div class="fullBg">
			<div class="innerBox formJoinWrap">
				<form name="form1" id="form1">
					<div class="formJoin">
						<br><br>
						<h2>아이디 및 비밀번호</h2>
						<dl class="id">
							<dt><label for="userId">아이디 (이메일)</label></dt>
							<dd>
								<div class="inp">
									<input type="email" id="userId" name="userId" title="아이디" value="${loginUser.userId}" disabled>
									
									<c:forTokens var="userId" items="${loginUser.userId}" delims="@" varStatus="status">
										<c:if test="${status.index eq 0}">
											<input type="hidden" id="userId1" value="${userId}">
										</c:if>
									</c:forTokens>
								</div>
							</dd>
						</dl>
						<br>
						<dl class="pwd">
							<dt><label for="userPwd">변경할 비밀번호</label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="inp">
									<input type="password" id="userPwd" name="userPwd" maxlength="16" title="비밀번호" placeholder="영문, 숫자 조합 8~16자 이내" onkeydown="javascript:confirmPwd();">
								</div>
							</dd>
						</dl>
						<dl class="pwd">
							<dt><label for="checkPwd">변경할 비밀번호 확인</label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="inp">
									<input type="password" id="checkPwd" name="checkPwd" maxlength="16" title="비밀번호 확인" onkeydown="javascript:confirmPwd();">
								</div>	
							</dd>
						</dl>
						
						<div class="btnChangePWD">
							<!-- <a href="javascript:jsModifyPwd();" class="btn small"><span>비밀번호 수정</span></a> -->
							<button id="changePwd" type="button" class="btn small"><span>비밀번호 수정</span></button>
						</div>
					</div>
					</form>
			</div>
		</div>
		
	</div>
	
	<%-- 
	임시비번 다시 바꾸는 곳
	<form>
		<h3>아이디(이메일)</h3>
		<input type="text" id="userId" name="userId" value="${loginUser.userId}" disabled>
		<c:forTokens var="userId" items="${loginUser.userId}" delims="@" varStatus="status">
			<c:if test="${status.index eq 0}">
				<input type="hidden" id="userId1" value="${userId}">
			</c:if>
		</c:forTokens>
		
		<h3>변경할 비밀번호</h3>
		<input type="password" id="userPwd" name="userPwd">
		<h3>변경할 비밀번호 확인</h3>
		<input type="password" id="checkPwd" name="checkPwd">
		<button id="changePwd" type="button">비밀번호 변경</button>
	</form> --%>
	
	<script>
	// 비밀번호 함수 실행
	$(function(){
		$("#userPwd").focus();
		
		$("#changePwd").click(function(){
			return checkPwd();
		});
	});
	
	// 비밀번호 유효성 검사 및 비밀번호 변경
	function checkPwd(){
		var userId = $("#userId").val();
		var userId1 = $("#userId1").val();
		var userPwd = $("#userPwd").val();
		var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
        var pattern2 = /(\w)\1\1\1/;
        
        // 비밀번호 유효성 검사
        if(userPwd.length == 0){
            alert("변경할 비밀번호를 입력하세요");
            $("#userPwd").focus();
            return false;
        }
        
        if($("#checkPwd").val().length == 0){
            alert("변경할 비밀번호 확인을 입력하세요");
            $("#checkPwd").focus();
            return false;
        }
        
        if(userPwd.length < 8 || userPwd.length > 16){
            alert("비밀번호는 8자~16자만 가능합니다.");
            $("#userPwd").focus();
        	return false;
         }
		
		if(!pattern1.test(userPwd)){
        	alert("영문, 숫자 8자 이상 조합을 사용해야 합니다");
        	$("#userPwd").focus();
        	return false;
        }
		
		if(pattern2.test(userPwd)){
        	alert("같은 문자를 4번 이상 사용하실 수 없습니다");
        	$("#userPwd").focus();
        	return false;
        }
		
		if(userPwd.search(userId1) > -1){
			alert("비밀번호에 아이디가 포함되어 있습니다.");
        	$("#userPwd").focus();
        	return false;
		}
		
		if($("#userPwd").val() != $("#checkPwd").val()){
            alert("비밀번호가 일치하지 않습니다");
            $("#checkPwd").focus();
            return false;
		}
		
		if($('#userPwd').val().indexOf(" ") >= 0){
            alert("비밀번호에 공백은 입력할 수 없습니다");
            $('#userPwd').focus();
            return false;
		}
		
		// 유효성 검사 통과 시 비밀번호 변경
		$.ajax({
			url:"changepwd.do",
			data:{userId:userId, userPwd:userPwd},
			success:function(data){
				if(data == "true"){
					$("#userPwd").val("");
					$("#checkPwd").val("");
					alert("비밀번호가 변경되었습니다.");
					location.href="index.jsp";
					
				}else{
					$("userPwd").val("");
					$("checkPwd").val("");
					alert("비밀번호 변경에 실패했습니다.");
				}
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
	};
	
	//엔터 입력 시 버튼 클릭
	function changePwd(){
	   var keyCode = window.event.keyCode;
	   if (keyCode == 13) {
	      $("#changePwd").click();
	   }
	}
	</script>
</body>
</html>