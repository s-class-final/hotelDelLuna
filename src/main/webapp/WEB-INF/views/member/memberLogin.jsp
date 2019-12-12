<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  top:10%;
  overflow: hidden;
  width: 900px;
  height: 650px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("resources/images/login.jpg");
  background-size: 535px;
  background-repeat: no-repeat;
  transition: 0.5s linear;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 5px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: center;
  line-height: 0.5em;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: inline-block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>
</head>
<body onkeydown="javascript:onEnterLogin();">
	<jsp:include page="../common/menubar.jsp"/>

<section class="container">
		    <article class="half">
			        <h1>Hotel del luna</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">로그인</a></span>
				            <span class="tab signup"><a href="#signup">비회원(예약 확인)</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form id="loginForm" action="login.do" method="post">
						                    <input type="text" name="userId" id="userId" class="inpt" required="required" placeholder="Your email">
						                    <label for="email">Your email</label>
						                    <input type="password" name="userPwd" id="userPwd" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="saveId" name="saveId" class="checkbox">
						                    <label for="saveId">Remember id</label>
						                    <div class="submit-wrap">
							                        <input type="button" id="loginBtn" value="Login" class="submit" onclick="checkLogin()"><br>
							                        <input type="button" id="kakao" value="kakao login" class="submit">
							                        <a href="mjoin.do" class="more">Join us</a>&nbsp;
							                        <a href="findpwd.do" class="more">Forgot your password?</a>
						                    </div>
        					        </form>
    				        </div>
    				        <div class="signup-cont cont">
                <form action="#" method="post" enctype="multipart/form-data">
                    						<input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your email">
						                    <label for="email">Your email</label>
						                    <input type="text" name="email" id="name" class="inpt" required="required" placeholder="Your name">
						                    <label for="name">Your name</label>
						                    <input type="number" name="password" id="password" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your phone</label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="confirm" class="submit">
							                        <a href="#" class="more">Terms and conditions</a>
						                    </div>
        					        </form>
            </div>
			        </div>
		    </article>
		    <div class="half bg"></div>
	</section>



<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    }
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});

// 아이디 비번 미입력 시
function validate(){
    if($("#userId").val().trim().length == 0){
       alert("아이디를 입력하세요");
       $("#userId").focus();
       
       return false;   // return값이 false면 submit이 되지 않는다
    }
    if($("#userPwd").val().trim().length == 0){
       alert("비밀번호를 입력하세요");
       $("#userPwd").focus();
       
       return false;
    }
    
    return true;
 }
 
//아이디 저장(쿠키) 관련 함수
$(function(){
   // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
   $("#userId").val(userInputId);
     
   if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
      $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
   $("#saveId").change(function(){ // 체크박스에 변화가 있다면,
      if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
         var userInputId = $("#userId").val();
         setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
           deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
       if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
          var userInputId = $("#userId").val();
          setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});

function setCookie(cookieName, value, exdays){
   var exdate = new Date();
   exdate.setDate(exdate.getDate() + exdays);
   var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toUTCString());
   document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
   var expireDate = new Date();
   expireDate.setDate(expireDate.getDate() - 1);
   document.cookie = cookieName + "= " + "; expires=" + expireDate.toUTCString();
}

function getCookie(cookieName) {
   cookieName = cookieName + '=';
   var cookieData = document.cookie;
   var start = cookieData.indexOf(cookieName);
   var cookieValue = '';
   if(start != -1){
      start += cookieName.length;
      var end = cookieData.indexOf(';', start);
      if(end == -1)end = cookieData.length;
         cookieValue = cookieData.substring(start, end);
   }
   return unescape(cookieValue);
}

// 탭 클릭 시 사진 변경
$(function(){
	$(".signin").click(function(){
		$(".half.bg").css("background-image", "url('resources/images/login.jpg')");
	});
	
	$(".signup").click(function(){
		$(".half.bg").css("background-image", "url('resources/images/login2.jpg')");
	});
});

//엔터 입력 시 로그인 버튼 클릭
function onEnterLogin(){
   var keyCode = window.event.keyCode;
   if (keyCode == 13) {
      $("#loginBtn").click();
   }
}

// 로그인 버튼 클릭 시 아이디, 비번 체크
function checkLogin(){
	var userId = $("#userId").val();
	var userPwd = $("#userPwd").val();
	
	if(userId.trim().length == 0){
		alert("아이디를 입력하세요");
		$("#userId").focus();
		return false;
	}
	
	if(userPwd.trim().length == 0){
		alert("비밀번호를 입력하세요");
		$("#userPwd").focus();
		return false;
	}
	
	$.ajax({
		url:"idcheck.do",
		data:{userId:userId},
		success:function(data){
			if(data == "true"){
				$.ajax({
					url:"pwdcheck.do",
					type:"post",
					data:{userId:userId, userPwd:userPwd},
					success:function(data){
						if(data == "true"){
							$("#loginForm").submit();
						}else{
							alert("비밀번호를 확인해 주세요");
							$("#userPwd").focus();
						}
					},
					error : function(request, status, errorData) {
						alert("error code: " + request.status + "\n"
								+ "message: " + request.responseText
								+ "error: " + errorData);
					}
				});
			}else{
				alert("아이디를 확인해 주세요");
				$("#userId").focus();
			}
		},
		error : function(request, status, errorData) {
			alert("error code: " + request.status + "\n"
					+ "message: " + request.responseText
					+ "error: " + errorData);
		}
	})
}
</script>

<script type='text/javascript'>	// 카카오 로그인
	$(function(){
		$("#kakao").click(function(){
		   Kakao.init('de55ce2e9e0330e7281dfe9da45b537b');
		   Kakao.Auth.login({
		      success: function(authObj) {
		      // 로그인 성공시, API를 호출합니다.
		      Kakao.API.request({
		         url: '/v1/user/me',
		         success: function(res) {
		            console.log(JSON.stringify(res.id));
		            var kakaoId = JSON.stringify(res.id);
		            
		            $.ajax({
		               url:"kakaocheck.do",
		               data:{kakaoId:kakaoId},
		               success:function(data){
		                  if(data == "true"){
		                     location.href = "kakaologin.do?" + kakaoId;
		                  }else{
		                     location.href = "kakaojoin.do?" + kakaoId;
		                  }
		               },
		               error:function(data){
		                  console.log("서버 통신 안됨");
		               }
		            });
		            
		         },
		         fail: function(error) {
		            alert(JSON.stringify(error));
		         }
		      });
		      },
		      fail: function(err) {
		         alert(JSON.stringify(err));
		      }
		   });
	
		});
	});
   
   </script>

</body>
</html>