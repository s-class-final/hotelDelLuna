<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 정보 입력</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
    position: relative;
    top: 80px;
}
#email{
	display: inline-block;
    width: 100%;
    height: 48px;
    border: 1px solid #e6e3df;
    padding: 0 39px 0 15px;
    line-height: 48px;
    font-size: 15px;
}
#joinBtn, #email{
	cursor: pointer;
}
</style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp"/>
   
   <section id="container">
		<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>추가 정보 입력</span>호텔 델루나 회원가입을 통해 다양한 혜택을 누려보세요.</h1>
			</div>
			<form id="joinForm" action="kakaoinsert.do" method="post" onsubmit = "toEnabled()">
				<div class="fullBg">
					<div class="innerBox formJoinWrap">
						
						<div class="formJoin">
							<h2>이메일</h2>
							<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
							<dl class="id">
								<dt><label for="userId1">이메일 <span class="color">*</span></label></dt>
								<dd style="display: flex; margin-inline-start: 0px; width: 100%;">
									<div class="inp">
										<input type="text" id="userId1" name="userId1" oninput = "checkId();" placeholder = "아이디" required autofocus style="width:30%;">&nbsp;&nbsp; @ &nbsp;
										<input type="text" id="userId2" name="userId2" oninput = "checkId();" style="width:30%;" disabled> &nbsp;
										<input type = "hidden" id = "userId3" name = "userId3">
										<select id="email" name="email" style="width:300px;">
											<option value = "naver.com">naver.com</option>
											<option value = "hanmail.net">hanmail.net</option>
											<option value = "gmail.com">gmail.com</option>
											<option value = "nate.com">nate.com</option>
											<option value = "1">직접입력</option>
										</select>
									</div>
								</dd>
							</dl>
							<div id = "checkId" class = "check"></div>
							
						</div>
						<!-- //아이디 및 비밀번호 -->
						
						<!-- 회원정보 -->
						<div class="formInfo clearFixed">
							<h2>회원 정보</h2>
							
							<div class="left">
								<dl class="nameType2">
									<dt><label for="lastName">이름 </label><span class="color">*</span></dt>
									<dd>
										<div class="inp">
											<input type="text" id="lastName" name="lastName" maxlength="50" placeholder = "last name (성)" required>
										</div>
										<div class="inp">
											<input type="text" id="firstName" name="firstName" maxlength="50" placeholder = "first name (이름)" required>
										</div>
										
									</dd>
								</dl>
							</div>
							<div class="right">
								
								<dl class="phone">
									<dt><label for="Phone">휴대폰 번호 <span class="color">*</span></label></dt>
									<dd>
										<select class="selectBox" id="userPhone1" name="userPhone1" required>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<div class="inp">
											<input type="text" id="userPhone2" name="userPhone2" required maxlength="4" oninput="nextPhone(); this.value=this.value.replace(/[^0-9]/g,'');" required>
										</div>
										<span>-</span>
										<div class="inp">
											<input type="text" id="userPhone3" name="userPhone3" required maxlength="4" oninput="this.value=this.value.replace(/[^0-9]/g,'');" required>>
										</div>
										
									</dd>
								</dl>
							</div>
						</div>
						<!-- //회원정보 -->
						
					</div>
					<div class="btnJoin">
						<button type="submit" id = "joinBtn" class="btn btnFull"><span>가입하기</span></button>
					</div>
				</div>
			</form>
		</div>
	</section>
   <!-- 
   <div class = "outer">
      <br>
      <h2 align = "center">추가 정보 입력</h2>

      <form id="joinForm" action="kakaoinsert.do" method="post" onsubmit = "toEnabled()">
         <table align = "center">
            <tr>
               <td><h3>* 이메일</h3></td>
            </tr>
            <tr>
               <td>
                  <input id="userId1" name="userId1" class = "join" type="text" oninput = "checkId();" placeholder = "아이디" required autofocus> &nbsp;@ 
                  <input id="userId2" name="userId2" class = "join" type="text" oninput = "checkId();" disabled>&nbsp;&nbsp;
                  <input type = "hidden" id = "userId3" name = "userId3">
                  <select id = "email" name = "email" class = "join">
                     <option value = "naver.com">naver.com</option>
                            <option value = "hanmail.net">hanmail.net</option>
                            <option value = "gmail.com">gmail.com</option>
                            <option value = "nate.com">nate.com</option>
                     <option value = "1">직접입력</option>
                  </select>
               </td>
            </tr>
               <tr><td><div id = "checkId" class = "check"></div></td></tr>
            <tr>
               <td><h3>* 이름</h3></td>
            </tr>
            <tr>
               <td class = "check"></td>
            </tr>
            <tr>
               <td>
	               <input type="text" id="lastName" name="lastName" class = "join" placeholder = "last name(성)" required>&nbsp;
	               <input type="text" id="firstName" name="firstName" class = "join" placeholder = "first name(이름)" required>
               </td>
            </tr>
               <tr><td><div id = "nickTF" class = "check"></div></td></tr>
            <tr>
               <td><h3>* 전화번호</h3></td>
            </tr>
            <tr>
            	<td>
            		<select id = "userPhone1" name = "userPhone1" class = "join">
						<option value = "010">010</option>
						<option value = "011">011</option>
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "018">018</option>
						<option value = "019">019</option>
					</select>&nbsp;
					<input type="text" id="userPhone2" name="userPhone2" maxlength="4" class = "join" oninput="nextPhone(); this.value=this.value.replace(/[^0-9]/g,'');" required>&nbsp;
					<input type="text" id="userPhone3" name="userPhone3" maxlength="4" class = "join" oninput="this.value=this.value.replace(/[^0-9]/g,'');" required>
            	<td>
            </tr>
          
         </table>
         <br><br><br>
         <div class="joinBtn">
            <button id = "joinBtn" type="submit">가입하기</button>
         </div>
      </form>
   </div> -->
   
   <script>
      
      // 처음 시작할 때 naver.com으로
      $(function(){
         $("#userId2").val($("#email option").eq(0).val());
      });
      
      // 메일 바뀌게 하는 함수(바뀔 때마다 아이디 중복체크 함수 실행)
      $('#email').change(function(){
          $("#email option:selected").each(function () {
            if($(this).parent().val()== "1"){ // 직접입력일 경우
               $("#userId2").val(""); // 값 초기화
               $("#userId2").attr("disabled",false); // 활성화
               checkId();
            }else{ // 직접입력이 아닐경우
               $("#userId2").val($(this).parent().val()); // 선택값 입력
               $("#userId2").attr("disabled",true); // 비활성화
               checkId();
            }
         });
      });
      
      function toEnabled() {
         $("#userId2").attr("disabled",false);   // 메일주소 제대로 넘어가게
         
      }
       
      // 아이디 중복체크
      var idUsable = false;
      function checkId(){
         var userId = $("#userId3");
         var userId1 = $("#userId1");
         
         $("#checkId").show();
         
         if(userId1.val().indexOf(" ") >= 0){
            alert("공백은 입력할 수 없습니다");
            userId1.val("");
            $("#checkId").html('');
            
         }else{
            $("#userId3").val($("#userId1").val() + '@' + $("#userId2").val());
         
            if(userId1.val().length <= 3){
               $("#checkId").html('');
            }else{
               $.ajax({
                  url:"idcheck.do",
                  data:{userId:userId.val()},
                  success:function(data){
                	  if (data == "false"){
 	                     $("#checkId").html('');
 	                     $("#checkId").html("이메일 사용 가능합니다").css("color","green");
 	                     idUsable = true;
 	                  }else if(data == "false1"){
 	                     $("#checkId").html('');
 	                     $("#checkId").html("이메일 사용 가능합니다 (예약 내역 존재)").css("color","green");
 	                     idUsable = true;
 	                  }else if(data == "nope"){
 	                     $("#checkId").html('');
 	                     $("#checkId").html("이미 탈퇴한 회원입니다. 동일한 이메일로 재가입을 원하시면 고객센터에 문의해주세요.").css("color","red");
 	                     idUsable = false;
 	                  }else{
	 	   				  $("#checkId").html('');
	                      $("#checkId").html("이미 가입된 이메일입니다").css("color", "#e66045");
	                      idUsable = false;
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
      
      function nextPhone() {
			if ($("#userPhone2").val().length >= 4) {
				$("#userPhone3").focus();
			}
		};

		// 가입 버튼 클릭했을 때 유효성 검사 함수 실행
		$(function() {
			$("#joinBtn").click(function() {
				return invalidJoin();
			})
		});

		// 가입버튼 클릭했을 때 유효성 검사
		function invalidJoin() {
			var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
			var pattern2 = /(\w)\1\1\1/;

			if ($("#userId1").val().length == 0) {
				alert("이메일을 입력하세요");
				$("#userId1").focus();
				return false;
			}
			
			if ($("#userId1").val().length < 4) {
				alert("이메일 아이디는 4자 이상 입력하세요");
				$("#userId1").focus();
				return false;
			}

			if ($("#lastName").val().length == 0) {
				alert("성(last name)을 입력하세요");
				$("#lastName").focus();
				return false;
			}

			if ($("#firstName").val().length == 0) {
				alert("이름(first name)을 입력하세요");
				$("#firstName").focus();
				return false;
			}

			if ($("#userPhone2").val().length == 0) {
				alert("휴대폰 가운데 자리를 입력하세요");
				$("#userPhone2").focus();
				return false;
			}

			if ($("#userPhone3").val().length == 0) {
				alert("휴대폰 끝자리를 입력하세요");
				$("#userPhone3").focus();
				return false;
			}

			if (idUsable == false) {
				alert("사용할 수 없는 이메일입니다.");
				$("#userId1").focus();
				return false;
			}

			if (!/^[a-zA-Z0-9]*$/.test($("#userId1").val())) {
				alert("이메일에 한글 및 특수문자는 입력하실 수 없습니다");
				$("#userId1").focus();
				return false;
			}

			if ($("#userId1").val().indexOf(" ") >= 0) {
				alert("이메일에 공백은 입력할 수 없습니다");
				$("#userId1").focus();
				return false;
			}

			if ($("#lastName").val().indexOf(" ") >= 0) {
				alert("이름에 공백은 입력할 수 없습니다");
				$("#lastName").focus();
				return false;
			}

			if ($("#firstName").val().indexOf(" ") >= 0) {
				alert("이름에 공백은 입력할 수 없습니다");
				$("#firstName").focus();
				return false;
			}

			if (!/^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#lastName").val())) {
				alert("이름은 한글, 영문만 입력 가능합니다");
				$("#lastName").focus();
				return false;
			}

			if (!/^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#firstName").val())) {
				alert("이름은 한글, 영문만 입력 가능합니다");
				$("#firstName").focus();
				return false;
			}

			return true;
		}
		
   </script>


</body>
</html>