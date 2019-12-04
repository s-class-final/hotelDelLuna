<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 정보 입력</title>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body{
   background: #f2f2f2;
}
.outer {
   width: 900px;
   height: 1200px;
   background: #f2f2f2;
   color: black;
   margin-left: auto;
   margin-right: auto;
   margin-top: 50px;
}

.outer label, .outer td {
   color: black;
}

input {
   margin-top: 2px;
}

.check{
   font-size: 14px;
}

/* 가입버튼 */
#joinBtn{
  background:#2b0552;
  color:#fff;
  border:none;
  border-radius: 5px;
  position:relative;
  width: 300px;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  font-weight: 600;
}
#joinBtn:hover{
  background:#fff;
  color:#2b0552;
}
#joinBtn:before,#joinBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #2b0552;
  transition:400ms ease all;
}
#joinBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#joinBtn:hover:before,#joinBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

.joinBtn {
   margin-left: auto;
   margin-right: auto;
   text-align: center;
   height:50px;
}

.join {
   width: 200px;
   padding: 12px 20px;
   margin: 8px 0;
   box-sizing: border-box;
   border: 3px solid #ccc;
   -webkit-transition: 0.5s;
   transition: 0.5s;
   outline: none;
   border-style: hidden;
   box-shadow : 5px 5px 3px 2px gray;
   border-radius: 5px;
}
.join:focus {
   box-shadow : 5px 5px 3px 2px #2b0552;
   border: 1px solid #2b0552;
}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #2b0552;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: "✔";
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #2b0552;
  content: "";
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

/* input */
form {
  display: grid;
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
  color: #9098a9;
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
  stroke: #c8ccd4;
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
  background: #c8ccd4;
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
  color: #07f;
  transform: translateY(-26px) scale(0.75);
  transition-delay: 0.1s;
}
.inp input:focus + span + svg path {
  stroke: #07f;
  animation: elasticInput 0.4s ease forwards;
}
.inp input:focus + span + svg + .border {
  background: #07f;
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

</style>
</head>
<body>
   
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
						<option value = "019">019</option>
					</select>&nbsp;
					<input type="text" id="userPhone2" name="userPhone2" class = "join" required>&nbsp;
					<input type="text" id="userPhone3" name="userPhone3" class = "join" required>
            	<td>
            </tr>
          
         </table>
         <br><br><br>
         <div class="joinBtn">
            <button id = "joinBtn" type="submit">가입하기</button>
         </div>
      </form>
   </div>
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
         
            if(userId1.val().length == 0){
               $("#checkId").html('');
            }else{
               $.ajax({
                  url:"idcheck.do",
                  data:{userId:userId.val()},
                  success:function(data){
                     if(data == "true"){
                        $("#checkId").html('');
                        $("#checkId").html("아이디가 중복됩니다").css("color", "red");
                        idUsable = false;
                     }else{
                        $("#checkId").html('');
                        $("#checkId").html("아이디 사용 가능합니다").css("color", "green");
                        idUsable = true;
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
      
      <%--
      
      // 가입 버튼 클릭했을 때
      $(function(){
         $("#joinBtn").click(function(){
            return invalidJoin();
         })
      });
      
      // 가입버튼 클릭했을 때 실행 함수
      function invalidJoin(){
         var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
          var pattern2 = /(\w)\1\1\1/;
          
         if($("#userId1").val().length == 0){
            alert("아이디를 입력하세요");
            $("#userId1").focus();
            return false;
         }
         
         if($("#pwd").val().length == 0){
            alert("비밀번호를 입력하세요");
            $("#pwd").focus();
            return false;
         }
         
         if($("#pwd").val().length < 8){
            alert("비밀번호는 8자 이상이어야 합니다");
            $("#pwd").focus();
            return false;
         }
         
         if($("#pwd").val().length > 25){
            alert("비밀번호는 25자 이하여야 합니다");
            $("#pwd").focus();
            return false;
         }
         
         if($("#checkPwd").val().length == 0){
            alert("비밀번호 확인을 입력하세요");
            $("#checkPwd").focus();
            return false;
         }
         
         if($("#nickname").val().length == 0){
            alert("별명을 입력하세요");
            $("#nickname").focus();
            return false;
         }
         
         if(idUsable == false){
            alert("아이디가 중복됩니다");
            $("#userId1").focus();
            return false;
         }
         
         if($("#pwd").val() != $("#checkPwd").val()){
            alert("비밀번호가 일치하지 않습니다");
            $("#checkPwd").focus();
            return false;
         }
         
         if(nickUsable == false){
            alert("별명이 중복됩니다");
            $("#nickname").focus();
            return false;
         }
         
         if(!/^[a-zA-Z0-9]*$/.test($("#userId1").val())){
            alert("아이디에 한글 및 특수문자는 입력하실 수 없습니다");
            $("#userId1").focus();
            return false;
         }
         
         if($("#userId1").val().indexOf(" ") >= 0){
            alert("아이디에 공백은 입력할 수 없습니다");
            $("#userId1").focus();
            return false;
         }
         
         if($('#pwd').val().indexOf(" ") >= 0){
            alert("비밀번호에 공백은 입력할 수 없습니다");
            $('#pwd').focus();
            return false;
         }
         
         if($('#checkPwd').val().indexOf(" ") >= 0){
            alert("비밀번호 확인에 공백은 입력할 수 없습니다");
            $('#checkPwd').focus();
            return false;
         }
         
         if(!pattern1.test($("#pwd").val())){            
            alert("비밀번호는 영문, 숫자 8자 이상 조합을 사용해야 합니다");
             $("#pwd").focus();
             return false;
          }
         
         if(pattern2.test($("#pwd").val())){
            alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다");
             $("#pwd").focus();
             return false;
          }
         
         if($("#pwd").val().search($("#userId1").val()) > -1 && $("#userId1").val().length > 3){
            alert("비밀번호에 아이디가 포함되어 있습니다");
             $("#pwd").focus();
             return false;
          }
         
         if($("#nickname").val().indexOf(" ") >= 0){
            alert("별명에 공백은 입력할 수 없습니다");
            $("#nickname").focus();
            return false;
         }
         
         if(!/^[a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#nickname").val())){
            alert("별명은 한글, 영문, 숫자만 입력 가능합니다");
            $("#nickname").focus();
            return false;
         }
         
         if($("#nickname").val().length > 15){
             alert("별명은 15자 이하여야 합니다");
             $("#nickname").focus();
             return false;
          }
         
         return true;
      } --%>
   </script>


</body>
</html>