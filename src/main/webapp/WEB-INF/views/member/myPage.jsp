<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	짜잔 마이페이지가 떴습니다
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
	</form>
	
	<hr>
	
	<form>
		<h3>* 이름</h3>
		<c:forTokens var="userName" items="${loginUser.userName}" delims=" " varStatus="status">
			<c:if test="${status.index eq 0}">
				<input type="text" id="lastName" name="lastName" class = "join" placeholder = "last name(성)" value="${userName}"  required>&nbsp;
			</c:if>
			<c:if test="${status.index eq 1}">
				<input type="text" id="firstName" name="firstName" class = "join" placeholder = "first name(이름)" value="${userName}" required>
			</c:if>
		</c:forTokens>
		
		<h3>* 전화번호</h3>
		<c:forTokens var="userPhone" items="${loginUser.userPhone}" delims="-" varStatus="status">
			<c:if test="${status.index eq 0}">
				<select id = "userPhone1" name = "userPhone1" class = "join">
					<c:if test="${userPhone eq 010}">
						<option value = "010" selected>010</option>
						<option value = "011">011</option>
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "019">019</option>
					</c:if>
					<c:if test="${userPhone eq 011}">
						<option value = "010">010</option>
						<option value = "011" selected>011</option>
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "019">019</option>
					</c:if>
					<c:if test="${userPhone eq 016}">
						<option value = "010">010</option>
						<option value = "011">011</option>
						<option value = "016" selected>016</option>
						<option value = "017">017</option>
						<option value = "019">019</option>
					</c:if>
					<c:if test="${userPhone eq 017}">
						<option value = "010">010</option>
						<option value = "011">011</option>
						<option value = "016">016</option>
						<option value = "017" selected>017</option>
						<option value = "019">019</option>
					</c:if>
					<c:if test="${userPhone eq 019}">
						<option value = "010">010</option>
						<option value = "011">011</option>
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "019" selected>019</option>
					</c:if>
				</select>&nbsp;
			</c:if>
			<c:if test="${status.index eq 1}">
				<input type="text" id="userPhone2" name="userPhone2" class = "join" oninput="this.value=this.value.replace(/[^0-9]/g,'');" value="${userPhone}" required>&nbsp;
			</c:if>
			<c:if test="${status.index eq 2}">
				<input type="text" id="userPhone3" name="userPhone3" class = "join" oninput="this.value=this.value.replace(/[^0-9]/g,'');" value="${userPhone}" required>
			</c:if>
		</c:forTokens>
		<button id="changeInfo" type="button">회원정보 변경</button>
	</form>
	
	<button type="button" onclick="location.href='index.jsp'">메인으로</button>
	
	<script>
	
	// 비밀번호 함수 실행
	$(function(){
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
					var conPwd = confirm("비밀번호가 변경되었습니다. 메인으로 돌아가시겠습니까?");
					if(conPwd == true){
						location.href="index.jsp";
					}
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
	
	// 회원정보 함수 실행
	$(function(){
		$("#changeInfo").click(function(){
			return checkInfo();
		});
	});
	
	// 회원정보 유효성 검사 및 회원정보 변경
	function checkInfo(){
		if($("#lastName").val().length == 0){
            alert("이름을 입력하세요");
            $("#lastName").focus();
            return false;
        }
		
		if($("#firstName").val().length == 0){
            alert("이름을 입력하세요");
            $("#firstName").focus();
            return false;
        }
		
		if($("#userPhone2").val().length == 0){
            alert("전화번호를 입력하세요");
            $("#userPhone2").focus();
            return false;
        }
		
		if($("#userPhone3").val().length == 0){
            alert("전화번호를 입력하세요");
            $("#userPhone3").focus();
            return false;
        }
		
		// 유효성 검사 통과 시 회원정보 변경
		$.ajax({
			url:"changeInfo.do",
			data:{},
			success:function(data){
				if(data == "true"){
					
				}else{
					
				}
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
	}
	
	</script>
	
</body>
</html>