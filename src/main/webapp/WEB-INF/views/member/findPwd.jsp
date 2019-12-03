<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
body{
   background: #f2f2f2;
}
#outer{
   width: 500px;
   height: 1200px;
   color: black;
   margin-left: auto;
   margin-right: auto;
   margin-top: 50px;
}

#findBtn{
  background:#2b0552;
  color:#fff;
  border:none;
  border-radius: 5px;
  position:relative;
  width: 300px;
  height:50px;
  font-size:1.1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  font-weight: 600;
}
#findBtn:hover{
  background:#fff;
  color:#2b0552;
}
#findBtn:before,#findBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #2b0552;
  transition:400ms ease all;
}
#findBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#findBtn:hover:before,#findBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

.findBtn {
   margin-left: auto;
   margin-right: auto;
   text-align: center;
}
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="outer">
		<br>
		<h2 align="center">비밀번호 찾기</h2>
		<br>
		<br>
		<form id="findForm" action="sendmail.do">
			<h3>이메일 입력</h3>
			<input type="email"	id="findMail" name="findMail" oninput="checkId();"	placeholder="아이디">
			<div id = "checkId" class="check"></div>
			
			<h3>이름</h3>
			<input type="text"	id="findName1" name="findName1" oninput="checkId();" placeholder="성 (last name)"> &nbsp;<input type="text"	id="findName2" name="findName2" oninput="checkId();" placeholder="이름 (first name)">
			<br>
			
			<h3>전화번호 입력</h3>
			<select id = "findPhone1" name = "findPhone1" class = "join" oninput="checkId();">
				<option value = "010">010</option>
				<option value = "011">011</option>
				<option value = "016">016</option>
				<option value = "017">017</option>
				<option value = "019">019</option>
			</select>&nbsp;
			<input type="text" id="findPhone2" name="findPhone2" class = "join" oninput="checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>&nbsp;
			<input type="text" id="findPhone3" name="findPhone3" class = "join" oninput="checkId(); this.value=this.value.replace(/[^0-9]/g,'');" required>
				<input type="hidden" id="randomPwd" name="randomPwd"> <br>
				<br>
			<div class="findBtn">
				<button id="findBtn" type="button">이메일로 비밀번호 찾기</button>
			</div>
		</form>
	</div>
	<script>
		// 임시 비밀번호 생성
		$(function() {
			$("#findMail").keyup(function() {
					var text = "";
					var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";

					for (var i = 0; i < 8; i++) {
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
				if (userId.val().length == 0) {
					$("#checkId").html('');
				} else {
					$.ajax({
						url : "idcheck.do",
		                data:{userId:userId.val()},
		                success:function(data){
		                     if(data == "true"){
		                        $("#checkId").html('');
		                        $("#checkId").html("가입된 이메일입니다").css("color", "green");
		                        idUsable = true;
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
		        		 }
		        	 });
	            }
	         }
	   };

      // 비밀번호 찾기 버튼 클릭했을 때 유효성 검사 함수 실행
      $(function(){
         $("#findBtn").click(function(){
            return find();
         });
      });
      
      // 유효성 검사
      function find(){
    	  if($("#findMail").val().length == 0){
              alert("이메일을 입력하세요");
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
             $("#findName").focus();
             return false;
         }
         
         if(phoneUsable == false){
             alert("전화번호가 일치하지 않습니다.");
             $("#findPhone2").focus();
             return false;
         }
         
         alert("이메일 전송이 완료되면 페이지가 전환됩니다. 잠시만 기다려주세요");
         $("#findForm").submit();
         
      }
      
   </script>

</body>
</html>