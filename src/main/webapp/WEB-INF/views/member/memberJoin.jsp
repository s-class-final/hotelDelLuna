<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
#emailCheck{
	width:150px;
	cursor: pointer;
}
#emailCheck span{
	font-weight: 600;
}
#emailCheck:disabled{
	border: 1px solid #c4bfbb;
	color: rgba(255,255,255,0.65);
	cursor: default;
	background: #c4bfbb;
}
#emailCheck:disabled span{
	color: rgba(255,255,255,0.65);
	cursor: text;
}
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section id="container">
		<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>회원가입</span>호텔 델루나 회원가입을 통해 다양한 혜택을 누려보세요.</h1>
			</div>
			<form id="joinForm" action="minsert.do" method="post" onsubmit = "toEnabled()">
				<div class="fullBg">
					<div class="innerBox formJoinWrap">
						<!-- 아이디 및 비밀번호 -->
						
						<div class="formJoin">
							<h2>아이디 및 비밀번호</h2>
							<p class="formImportant"><span class="color">*</span> 필수 입력항목</p>
							<dl class="id">
								<dt><label for="userId1">아이디 (이메일) <span class="color">*</span></label></dt>
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
									<button type="button" id="emailCheck" class="btn small"><span>이메일 인증</span></button>
								</dd>
							</dl>
							<div id = "checkId" class = "check"></div>
							<dl id="codeInput" class="pwd">
							</dl>
								
							<dl class="pwd" style="clear:both; padding-left:0; padding-right: 17px;">
								<dt><label for="userPwd">비밀번호 <span class="color">*</span></label></dt>
								
								<dd>
									<div class="inp">
										<input type="password" id="userPwd" name="userPwd" required maxlength="16" placeholder="영문, 숫자 조합 8~16자 이내">
									</div>
								</dd>
								<dd>
									<div id = "pwdTest" class = "check"></div>
								</dd>
							</dl>
							
							<dl class="pwd">
								<dt><label for="checkPwd">비밀번호 확인 <span class="color">*</span></label></dt>
								
								<dd>
									<div class="inp">
										<input type="password" id="checkPwd" name="checkPwd" required maxlength="16">
									</div>
								</dd>
								<dd>
									<div id = "pwdTF" class = "check"></div>
								</dd>
							</dl>
							
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

<br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>

<script>
	// 처음 시작할 때 naver.com으로
	$(function() {
		$("#userId2").val($("#email option").eq(0).val());
	});
	
	
	// 메일 바뀌게 하는 함수(바뀔 때마다 아이디 중복체크 함수 실행)
	$('#email').change(function() {
		$("#email option:selected").each(function() {
			if ($(this).parent().val() == "1") { // 직접입력일 경우
				$("#userId2").val(""); // 값 초기화
				$("#userId2").attr("disabled", false); // 활성화
				checkId();
			} else { // 직접입력이 아닐경우
				$("#userId2").val($(this).parent().val()); // 선택값 입력
				$("#userId2").attr("disabled", true); // 비활성화
				checkId();
			}
		});
	});

	function toEnabled() {
		$("#userId1").attr("disabled", false);
		$("#userId2").attr("disabled", false); // 메일주소 제대로 넘어가게
	}

	// 아이디 중복체크
	var idUsable = false;
	function checkId() {
	      var userId = $("#userId3");
	      var userId1 = $("#userId1");

	      if (userId1.val().indexOf(" ") >= 0) {
	         alert("공백은 입력할 수 없습니다");
	         userId1.val("");
	         $("#checkId").html('');

	      } else {
	         $("#userId3").val(
	               $("#userId1").val() + '@' + $("#userId2").val());

	         if (userId1.val().length <= 3) {
	            $("#checkId").html('');
	         } else {
	            $.ajax({
	               url : "idcheck.do",
	               data : {userId : userId.val()},
	               success : function(data) {
	                  if (data == "false"){
	                     $("#checkId").html('');
	                     $("#checkId").html("아이디 사용 가능합니다").css("color","green");
	                     idUsable = true;
	                  }else if(data == "false1"){
	                     $("#checkId").html('');
	                     $("#checkId").html("아이디 사용 가능합니다 (예약 내역 존재)").css("color","green");
	                     idUsable = true;
	                  }else if(data == "nope"){
	                     $("#checkId").html('');
	                     $("#checkId").html("이미 탈퇴한 이메일입니다. 동일한 이메일로 재가입을 원하시면 따로 문의해주세요").css("color","red");
	                     idUsable = false;
	                  }else{
	                     idUsable = false;
	                     kakaoCheck();
	                  }
	               },
	               error : function(request, status, errorData) {
	                  alert("error code: " + request.status + "\n"
	                        + "message: " + request.responseText
	                        + "error: " + errorData);
	               }
	            });
	         }
	      }
	   };
	
	// 카카오 이메일 체크
	function kakaoCheck(){
	   var userId = $("#userId3");
	   
	   $.ajax({
		  url:"findkakao.do",
		  data:{userId:userId.val()},
		  success:function(data){
			  if(data == "true"){
				  $("#checkId").html('');
                     $("#checkId").html("카카오 아이디로 가입된 이메일입니다. 카카오 아이디로 로그인 해주세요").css("color", "#ebd700");
                     kakaoUsable = false;
			  }else{
				  $("#checkId").html('');
                     $("#checkId").html("이미 가입된 이메일입니다").css("color", "#e66045");
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

	var emailCode = 0; // 이메일 인증 번호
	var sendCode = false; // 인증 번호 발송 확인용
	var isCorrectCode = false // 인증 번호 체크용

	// 인증번호 만들어서 emailCode에 넣기
	function makeRandom() {
		var code = "";
		for (var i = 0; i < 6; i++) {
			code += Math.floor(Math.random() * 10) + "";
		}
		emailCode = code;
	};

	// 이메일로 인증번호 보내는 함수
	function sendCode1() {
		var userId = $("#userId3").val();
		var userId1 = $("#userId1").val();
		
		$.ajax({
			url : "sendcode.do",
			data : {userId : userId, emailCode : emailCode},
			type : "post",
			success : function(data) {
				/* if (data == "true") {
					alert("사실 지금이 진짜 발송");
				} */
			},
			error : function(request, status, errorData) {
				alert("error code: " + request.status + "\n"
						+ "message: " + request.responseText
						+ "error: " + errorData);
			}
		});
	};
	
	// 타이머 함수
	function timer() {
		
		var timeLeft = 180; // 타이머 시간 설정, 초 단위
		var num = function(str) {
			if (str < 10)
				return '0' + str;
			else
				return str;
		}
		updateLeftTime();
		function updateLeftTime() {

			timeLeft = (timeLeft <= 0) ? 0 : --timeLeft;

			var hours = num(Math.floor(timeLeft / 3600));
			var minutes = num(Math.floor((timeLeft - 3600 * hours) / 60));
			var seconds = num(timeLeft % 60);
			
			$('#leftTime').html(minutes + ':' + seconds);
			
			if (minutes === "00" && seconds === "00") {
				stopCount();
				if(isCorrectCode == false){
					alert("인증시간이 초과되었습니다. 다시 인증해주세요");
					$("#emailCheck").attr("disabled", false);
				}
			} else {
				ID = setTimeout(updateLeftTime, 1000);
			}
		}

		function stopCount() {
			clearTimeout("ID");
		}

	}
	
	// 이메일 인증 버튼 클릭
	$("#emailCheck").click(function() {
		
		var userId1 = $("#userId1").val();
		var userId2 = $("#userId2").val();
		
		if(userId1.length <= 3){
			alert("아이디는 4자 이상 입력해 주세요");
			$("#userId1").focus();
			
		}else if($("#email").val() == 1 && userId2.indexOf(".") == -1){
			alert("이메일을 정확히 입력해 주세요");
			$("#userId2").focus();
			
		}else if(idUsable == false){
			alert("이미 가입된 이메일입니다.");
			
		}else{
			$("#emailCheck").attr({
				"disabled":"true"
			});
			makeRandom();
			makeInput();
			timer();
			sendCode1();
			alert("이메일로 인증번호가 전송되었습니다");
			
			setTimeout(function(){	// 인증코드 재설정하는 시간
				makeRandom();
			}, 180000);
		}

	});
	
	// 인증번호 입력 란 만들기
	
	function makeInput(){
		if(!sendCode){
			var cDiv = $("<div>").attr({
				"class" : "inp"
			});
			cDiv.append($("<input>").attr({
				"type" : "text",
				"id" : "emailCode",
				"oninput" : "correctCode(); this.value=this.value.replace(/[^0-9]/g,'');",
				"maxlength" : "6",
				"required" : true,
				"placeholder" : "인증번호를 입력하세요 (6자리)"
			}));
			cDiv.append($("<span>").attr({
				"id" : "leftTime",
				"class" : "count",
				"style" : "position: absolute; top: 50%; right: 16px; transform: translateY(-50%); font-size: 14px; color: #e65649;"
			}));
			
			var chkCode= $("<label>").attr({
				"name" : "chkCode"
			});

			$("#codeInput").append(cDiv);
			$("#codeInput").append(chkCode);
			sendCode = true;
		}
	}
	
	// 인증번호 입력 시 실행 함수
	function correctCode(){
		// 비었을 때
		if($("#emailCode").val().length == 0){
			if($("#emailCode").focus){
				$("#emailCode").css({
					"border": "1px solid #e6e3df"
				});
			}
			$("label[name=chkCode]").text("");
		// 인증번호 일치
		}else if (emailCode == ($("#emailCode").val())) {
			$("#emailCode").css({
				"border": "1px solid green"
			});
			
			$("label[name=chkCode]").css({
				"color" : "green",
				"text-align" : "center"
			}).text("일치!");
			
			$("#leftTime").attr("style", "display:none;");	// 시계 없애기
			$("#userId1").attr("disabled", true);	// 아이디 비활성화
			$("#email").attr("disabled", true);		// 이메일 select태그 비활성화
			$("#emailCheck").attr("disabled", true);	// 이메일 인증 버튼 비활성화
			
			$("#emailCode").attr({
				"disabled" : true
			});
			isCorrectCode= true;
			
		} else {
			$("#emailCode").css({
				"border": "2px solid #e66045"
			});
			
			$("label[name=chkCode]").css({
				"color" : "#e66045",
				"text-align" : "center"
			}).text("불일치!");
			isCorrectCode=false;
		}
	}

	// 비밀번호 및 비밀번호 확인 일치 체크
	$(function() {
		$('#userPwd').keyup(function() {
			$("#pwdTF").html('');
		});

		$('#checkPwd').keyup(function() {
			if ($('#userPwd').val() != $('#checkPwd').val()) {
				$("#pwdTF").html('');
				$("#pwdTF").html("비밀번호 불일치").css("color", "red");
			} else {
				$("#pwdTF").html('');
				$("#pwdTF").html("비밀번호 일치").css("color", "green");
			}
		});
	});

	// 비밀번호 유효성 검사
	$(function() {
		$("#userPwd").blur(function() {
			checkPassword($('#userPwd').val(), $('#userId1').val()); // 유효성 검사 함수 실행
			if ($('#userPwd').val() != $('#checkPwd').val() && $('#checkPwd').val() != "") { // 비밀번호를 다 썼으면 일치 불일치 뜨게
				$("#pwdTF").html('');
				$("#pwdTF").html("비밀번호 불일치").css("color", "red");
			}
		});
	});

	// 비밀번호 유효성 검사 실행 함수
	function checkPassword(password, id) {
		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);
		var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
		var pattern2 = /(\w)\1\1\1/;

		if (password.length > 16) {
			$("#pwdTest").html("비밀번호는 16자 이하만 가능합니다").css("color", "red");

		} else if (!pattern1.test(password)) {
			$("#pwdTest").html("영문, 숫자 8자 이상 조합을 사용해야 합니다").css("color",
					"red");

		} else if (pattern2.test(password)) {
			$("#pwdTest").html("같은 문자를 4번 이상 사용하실 수 없습니다").css("color",
					"red");

		} else if (password.search(id) > -1 && id.length > 3) {
			$("#pwdTest").html("비밀번호에 아이디가 포함되어 있습니다").css("color", "red");

		} else {
			$("#pwdTest").html('');
		}
	}
	
	// 전화번호 4글자 입력 시 다음 칸 넘어가게
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
			alert("아이디를 입력하세요");
			$("#userId1").focus();
			return false;
		}

		if ($("#userPwd").val().length == 0) {
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return false;
		}

		if ($("#userPwd").val().length < 8) {
			alert("비밀번호는 8자 이상이어야 합니다");
			$("#userPwd").focus();
			return false;
		}

		if ($("#userPwd").val().length > 16) {
			alert("비밀번호는 16자 이하여야 합니다");
			$("#userPwd").focus();
			return false;
		}

		if ($("#checkPwd").val().length == 0) {
			alert("비밀번호 확인을 입력하세요");
			$("#checkPwd").focus();
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
			alert("이메일을 확인해주세요.");
			$("#userId1").focus();
			return false;
		}

		if ($("#userPwd").val() != $("#checkPwd").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#checkPwd").focus();
			return false;
		}

		if (!/^[a-zA-Z0-9]*$/.test($("#userId1").val())) {
			alert("아이디에 한글 및 특수문자는 입력하실 수 없습니다");
			$("#userId1").focus();
			return false;
		}

		if ($("#userId1").val().indexOf(" ") >= 0) {
			alert("아이디에 공백은 입력할 수 없습니다");
			$("#userId1").focus();
			return false;
		}

		if ($('#userPwd').val().indexOf(" ") >= 0) {
			alert("비밀번호에 공백은 입력할 수 없습니다");
			$('#userPwd').focus();
			return false;
		}

		if ($('#checkPwd').val().indexOf(" ") >= 0) {
			alert("비밀번호 확인에 공백은 입력할 수 없습니다");
			$('#checkPwd').focus();
			return false;
		}

		if (!pattern1.test($("#userPwd").val())) {
			alert("비밀번호는 영문, 숫자 8자 이상 조합을 사용해야 합니다");
			$("#userPwd").focus();
			return false;
		}

		if (pattern2.test($("#userPwd").val())) {
			alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다");
			$("#userPwd").focus();
			return false;
		}

		if ($("#userPwd").val().search($("#userId1").val()) > -1
				&& $("#userId1").val().length > 3) {
			alert("비밀번호에 아이디가 포함되어 있습니다");
			$("#userPwd").focus();
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
		
		if(sendCode == false){
			alert("이메일을 인증해주세요");
			$("#userId1").focus();
			return false;
		}
		
		if(isCorrectCode == false){
			alert("인증번호가 일치하지 않습니다");
			$("#emailCode").focus();
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>