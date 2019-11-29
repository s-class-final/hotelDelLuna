<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body{
   align-items: center;
}
#outer{
   width: 400px;
   height: 800px;
   color: black;
   margin-left: auto;
   margin-right: auto;
   margin-top: 50px;
}

#loginBtn{
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
#loginBtn:hover{
  background:#fff;
  color:#2b0552;
}
#loginBtn:before,#loginBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #2b0552;
  transition:400ms ease all;
}
#loginBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#loginBtn:hover:before,#loginBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

form {
  display: grid;
  grid-template-rows: 80px;
  font-family: Avenir;
  -webkit-text-size-adjust: 100%;
  -webkit-font-smoothing: antialiased;
  overflow: hidden;
}
* {
  box-sizing: border-box;
}
.inp {
  position: relative;
  margin: auto;
  width: 100%;
  max-width: 280px;
}
.inp .label {
  position: absolute;
  top: 16px;
  left: 0;
  font-size: 16px;
  color: #9098a9;      /* 이메일 입력 글씨색 */
  font-weight: 500;
  transform-origin: 0 0;
  transition: all 0.2s ease;
}
.inp svg {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 26px;
  fill: none;
}
.inp svg path {
  stroke: #c8ccd4;      /* 커서 안눌렀을 때 왼쪽 줄 색 */
  stroke-width: 2;
}
.inp svg path d {
  transition: all 0.2s ease;
}
.inp .border {
  position: absolute;
  bottom: 0;
  left: 120px;
  height: 2px;
  right: 0;
  background: #c8ccd4;      /* 커서 안눌렀을 때 오른쪽 줄 색 */
}
.inp input {
  -webkit-appearance: none;
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 12px 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}
.inp input:not(:placeholder-shown) + span {
  color: #5a667f;
  transform: translateY(-26px) scale(0.75);
}
.inp input:focus {
  background: none;
  outline: none;
}
.inp input:focus + span {
  color: #2b0552;      /* 커서 눌렀을 때 이메일 입력 글씨 색 */
  transform: translateY(-26px) scale(0.75);
  transition-delay: 0.1s;
}
.inp input:focus + span + svg path {
  stroke: #2b0552;      /* 커서 눌렀을 때 왼쪽 줄 색 */
  animation: elasticInput 0.4s ease forwards;
}
.inp input:focus + span + svg + .border {
  background: #2b0552;      /* 커서 눌렀을 때 오른쪽 줄 색 */
}
@-moz-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-webkit-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-o-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}

/* 체크박스 */
.grid .item {
  align-self: center;
  user-select: none;
  transform: translateZ(0);
}
.grid .item .cbx {
  position: relative;
  top: 5px;
  display: inline-block;
  width: 14px;
  height: 14px;
  margin-right: 6px;
  border: 1px solid #c8ccd4;
  border-radius: 3px;
  cursor: pointer;
}
.grid .item .cbx svg {
  position: relative;
  top: -5px;
  transform: scale(0);
  fill: none;
  stroke-linecap: round;
  stroke-linejoin: round;
}
.grid .item .cbx svg polyline {
  stroke-width: 2;
  stroke: #18cda6;
}
.grid .item .cbx:before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -10px 0 0 -10px;
  width: 20px;
  height: 20px;
  border-radius: 100%;
  background: #18cda6;
  transform: scale(0);
}
.grid .item .cbx:after {
  content: '';
  position: absolute;
  top: 5px;
  left: 5px;
  width: 2px;
  height: 2px;
  border-radius: 2px;
  box-shadow: 0 -18px 0 #18cda6, 12px -12px 0 #18cda6, 18px 0 0 #18cda6, 12px 12px 0 #18cda6, 0 18px 0 #18cda6, -12px 12px 0 #18cda6, -18px 0 0 #18cda6, -12px -12px 0 #18cda6;
  transform: scale(0);
}
.grid .item .cbx-lbl {
  position: relative;
  cursor: pointer;
  transition: color 0.3s ease;
}
.grid .item input {
  display: none;
}
.grid .item input:checked + .cbx {
  border-color: transparent;
}
.grid .item input:checked + .cbx svg {
  transform: scale(1);
  transition: all 0.4s ease;
  transition-delay: 0.1s;
}
.grid .item input:checked + .cbx:before {
  transform: scale(1);
  opacity: 0;
  transition: all 0.3s ease;
}
.grid .item input:checked + .cbx:after {
  transform: scale(1);
  opacity: 0;
  transition: all 0.6s ease;
}
.grid .item input:checked + .cbx:after {
  width: 100%;
  transition: all 0.4s ease;
}

#wrongId{
   width: 300px;
   height:25px;
   border-radius: 5px;
}

#mainImg:hover{
   cursor:pointer;
}

a {
   text-decoration:none;
   color : black;
} 
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
   
   <div id="outer" align = "center">
   
     <%--  <div id = "wrongId"></div>
      <script>
      <%if(msg != null) {%>
      $(function(){         
      $("#wrongId").html("이메일 주소나 비밀번호가 틀립니다").css({'background-color':'#ffcccc', color:'red'});
      });
      <%}else{ %>
      $(function(){         
            $("#wrongId").html("");
            });
      <%}%>
      </script> --%>
      <br><br>
   <form id=loginForm " action="login.do" onsubmit="return validate();" method="post">
   <label for="userId" class="inp">
      <input type="text" name="userId" id="userId" oninput = "checkId();" placeholder="&nbsp;">
      <span class="label">아이디(이메일)</span>
      <svg width="120px" height="26px" viewBox="0 0 120 26">
      <path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
      </svg>
      <span class="border"></span>
   </label>
   
   <label for="userPwd" class="inp">
      <input type="password" name="userPwd" id="userPwd" oninput = "checkId();" placeholder="&nbsp;">
      <span class="label">비밀번호</span>
      <svg width="120px" height="26px" viewBox="0 0 120 26">
      <path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
      </svg>
      <span class="border"></span>
   </label>
   <br><br>
   <div class="grid">
      <label for="saveId" class="cbx-lbl">아이디 저장</label>&nbsp;
      <label for="saveId" class="item"> <input type="checkbox" name="saveId" id="saveId" class="hidden" />
      <label for="saveId" class="cbx">
      <svg width="14px" height="12px" viewBox="0 0 14 12">
      <polyline points="1 7.6 5 11 13 1"></polyline>
      </svg>
      </label>
      </label>
   </div>
   <br><br>
   

   
   <div class = "findBtn">
   <button id="loginBtn" type="submit">로그인</button>
   </div>
   </form>
   <br>
   <div id = "kakao">
      <a id="kakao-login-btn"></a>
      <a href="http://developers.kakao.com/logout"></a>
   </div>
   
   <p>비밀번호를 잊으셨나요?<p><a href='<%= request.getContextPath() %>/views/member/findPwdView.jsp'>비밀번호 찾기</a>
   
   </div>
   
   
   <script>

   //홈으로
   function goHome(){
      location.href ="<%=request.getContextPath() %>/index.jsp";
   }
   
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
   
   // 아이디 저장(쿠키) 관련 함수
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
   
   </script>
   
   <script type='text/javascript'>
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('e955c40a1536d6e04ad9bbc441193544');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      size: 'large',
      success: function(authObj) {
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
         url: '/v1/user/me',
         success: function(res) {
            <%-- console.log(JSON.stringify(res.id));
            var kakaoId = JSON.stringify(res.id);
            
            $.ajax({
               url:"<%=request.getContextPath()%>/kakaocheck.me",
               type:"post",
               data:{kakaoId:kakaoId},
               success:function(data){
                  if(data == "o"){
                     location.href = '<%= request.getContextPath() %>/kakaologin.me?kakaoId='+kakaoId;
                  }else{
                     location.href = '<%= request.getContextPath() %>/views/member/kakaoJoinForm.jsp?kakaoId='+kakaoId;
                  } --%>
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
   
   </script>

</body>
</html>