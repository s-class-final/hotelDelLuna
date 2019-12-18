<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
body {
    position: relative;
    top: 80px;
}
#findBtn{
	cursor: pointer;
}
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body onkeydown="javascript:confirmMail();">
	<jsp:include page="../common/menubar.jsp"/>
	<!-- 
	<div id="outer">
		<br>
		<h2 align="center">비밀번호 찾기</h2>
		<br>
		<br>
		<form id="findForm" action="sendmail.do">
			<h3>이메일 입력</h3>
			<input type="text"	id="findMail" name="findMail" oninput="checkId();" placeholder="이메일">
			<div id = "checkId" class="check"></div>
			
			<h3>이름</h3>
			<input type="text"	id="findName1" name="findName1" oninput="checkId();" placeholder="성 (last name)">
			 &nbsp;<input type="text"	id="findName2" name="findName2" oninput="checkId();" placeholder="이름 (first name)">
			<br>
			
			<h3>전화번호 입력</h3>
			<select id = "findPhone1" name = "findPhone1" class = "join" oninput="checkId();">
				<option value = "010">010</option>
				<option value = "011">011</option>
				<option value = "016">016</option>
				<option value = "017">017</option>
				<option value = "019">019</option>
			</select>&nbsp;
			<input type="text" id="findPhone2" name="findPhone2" class = "join" maxlength="4" oninput="nextPhone(); checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>&nbsp;
			<input type="text" id="findPhone3" name="findPhone3" class = "join" maxlength="4" oninput="checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>
				<input type="hidden" id="randomPwd" name="randomPwd"> <br>
				<br>
			<div class="findBtn">
				<button id="findBtn" type="button">이메일로 비밀번호 찾기</button>
			</div>
		</form>
	</div>
	 -->
	<form id="findForm" action="sendmail.do">
		<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>비밀번호 찾기</span>아이디 / 비밀번호를 잊으셨나요?<br />임시 비밀번호를 발급 받으세요!</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox bg"> <!-- 가로값이 1280으로 설정되어진 아이 -->
					<div class="loginBox">
						<div class="inp">
							<h3 style="padding: 10px;">아이디(이메일)</h3>
							<input type="text"	id="findMail" name="findMail" oninput="checkId();" placeholder="이메일">
						</div>
						<div id = "checkId" class="check"></div>
						
						
						<div class="inp" style="width:220px; padding-right:12px;">
							<h3 style="padding: 10px;">이름</h3>
							<input type="text"	id="findName1" name="findName1" oninput="checkId();" placeholder="성 (last name)">
						</div>
						<div class="inp" style="width:220px; padding-left:12px;">
							<input type="text"	id="findName2" name="findName2" oninput="checkId();" placeholder="이름 (first name)">
						</div>
						
						<br>
						
						<div class="phone">
							<h3 style="padding: 10px;">전화번호</h3>
							<select class="selectBox" id = "findPhone1" name = "findPhone1" oninput="checkId();" style="width:145px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<div class="inp" style="width:145px;">
								<input type="text" id="findPhone2" name="findPhone2" class = "join" maxlength="4" oninput="nextPhone(); checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>
							</div>
							<div class="inp" style="width:145px; margin-top:0px;">
								<input type="text" id="findPhone3" name="findPhone3" class = "join" maxlength="4" oninput="checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>
							</div>
							<input type="hidden" id="randomPwd" name="randomPwd"> <br>
							
						</div>
						<br>
						<button type="button" id="findBtn" class="btn btnFull btnLogin">임시 비밀번호 전송</button>
					</div>
				</div>
				
			</div>
		</div>
	</form>
	
	<br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		// 임시 비밀번호 생성
		$(function() {
			$("#findMail").keyup(function() {
				var text = "";
				var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";

				for (var i = 0; i < 7; i++) {
					text += possible.charAt(Math.floor(Math.random() * possible.length));
				}

				$("#randomPwd").val('');
				$("#randomPwd").val(text);
			});
		});

		// 가입된 회원정보인지 확인
		var idUsable = false;
		var nameUsable = false;
		var phoneUsable = false;
		var kakaoUsable = false;
		
		function checkId() {
			var userId = $("#findMail");
       		var lastName = $("#findName1");
    		var firstName = $("#findName2");
    		var userPhone = $("#findPhone1").val() + "-" + $("#findPhone2").val() + "-" + $("#findPhone3").val();

    		if (userId.val().indexOf(" ") >= 0) {
				alert("공백은 입력할 수 없습니다");
				userId.val("");
				$("#checkId").html('');
			} else {
				if (userId.val().length <= 3) {
					$("#checkId").html('');
				} else {
					$.ajax({
						url : "idcheck.do",
		                data:{userId:userId.val()},
		                success:function(data){
		                     if(data == "true"){
		                        idUsable = true;
		                    	kakaoCheck();
		                     }else{
		                        $("#checkId").html('');
		                        $("#checkId").html("가입되지 않은 이메일입니다").css("color", "red");
		                        idUsable = false;
		                     }
		                  },
		                  error:function(request, status, errorData){
								alert("error code: " + request.status + "\n"
										+"message: " + request.responseText
										+"error: " + errorData);
						 }
	               });
					// 이름 일치하는지
					$.ajax({
		        		 url:"namecheck.do",
		        		 data:{userId:userId.val(), lastName:lastName.val(), firstName:firstName.val()},
		        		 success:function(data){
		        			 if(data == "true"){
		        				 nameUsable = true;
		        			 }else{
		        				 nameUsable = false;
		        			 }
		        		 },
		                  error:function(request, status, errorData){
								alert("error code: " + request.status + "\n"
										+"message: " + request.responseText
										+"error: " + errorData);
						 }
		        	 });
					
					// 전화번호 일치하는지
					$.ajax({
		        		 url:"phonecheck.do",
		        		 data:{userId:userId.val(), userPhone:userPhone},
		        		 success:function(data){
		        			 if(data == "true"){
		        				 phoneUsable = true;
		        			 }else{
		        				 phoneUsable = false;
		        			 }
		        		 },
		                  error:function(request, status, errorData){
								alert("error code: " + request.status + "\n"
										+"message: " + request.responseText
										+"error: " + errorData);
						 }
		        	 });
	            }
	         }
	   };
	   
	   // 카카오 이메일 체크
	   function kakaoCheck(){
		   var userId = $("#findMail");
		   
		   $.ajax({
			  url:"findkakao.do",
			  data:{userId:userId.val()},
			  success:function(data){
				  if(data == "true"){
					  $("#checkId").html('');
                      $("#checkId").html("카카오 아이디로 가입된 이메일입니다").css({"color" : "#ffec42", "text-shadow" : "1px 1px 2px brown"});
                      kakaoUsable = false;
				  }else{
					  $("#checkId").html('');
                      $("#checkId").html("가입된 이메일입니다").css("color", "green");
                      kakaoUsable = true;
				  }
			  },
			  error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
			 }
		   });
	   }
	   
		// 전화번호 4글자 입력 시 다음 칸 넘어가게
		function nextPhone() {
			if ($("#findPhone2").val().length >= 4) {
				$("#findPhone3").focus();
			}
		};

      $(function(){
      	 // 비밀번호 찾기 버튼 클릭했을 때 유효성 검사 함수 실행
         $("#findBtn").click(function(){
            return find();
         });
      	 
      	 $("#findMail").focus();
      });
      
      // 유효성 검사
      function find(){
    	  if($("#findMail").val().length == 0){
              alert("이메일을 입력하세요");
              $("#findMail").focus();
              return false;
           }
    	  
    	  if ($("#findMail").val().indexOf("@") == -1) {
				alert("이메일을 정확히 입력해 주세요");
				$("#findMail").focus();
	            return false;
			}
    	  
    	  if ($("#findMail").val().indexOf(".") == -1) {
				alert("이메일을 정확히 입력해 주세요");
				$("#findMail").focus();
	            return false;
			}
    	  
    	  if($("#findName1").val().length == 0){
              alert("성을 입력하세요");
              $("#findName1").focus();
              return false;
           }
    	  
    	  if($("#findName2").val().length == 0){
              alert("이름을 입력하세요");
              $("#findName2").focus();
              return false;
           }
    	  
    	  if($("#findPhone2").val().length == 0){
              alert("전화번호를 입력하세요");
              $("#findPhone2").focus();
              return false;
           }
    	  
    	  if($("#findPhone3").val().length == 0){
              alert("전화번호를 입력하세요");
              $("#findPhone3").focus();
              return false;
           }
    	  
         if(idUsable == false){
            alert("가입되지 않은 이메일입니다");
            $("#findMail").focus();
            return false;
         }
         
         if(nameUsable == false){
             alert("이름이 일치하지 않습니다");
             $("#findName1").focus();
             return false;
         }
         
         if(phoneUsable == false){
             alert("전화번호가 일치하지 않습니다.");
             $("#findPhone2").focus();
             return false;
         }
         
         if(kakaoUsable == false){
             alert("카카오로 가입된 이메일입니다. 카카오 아이디로 로그인 해주세요");
             $("#findMail").focus();
             return false;
         }
         
         alert("이메일 전송이 완료되면 페이지가 전환됩니다. 잠시만 기다려주세요");
         fullLoding($("body"));
         $("#findForm").submit();
         
      }
      
    //엔터 입력 시 가입 버튼 클릭
	function confirmMail(){
	   var keyCode = window.event.keyCode;
	   if (keyCode == 13) {
	      $("#findBtn").click();
	   }
	}
      
   </script>

</body>
</html>