<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

</style>
</head>
<body>
   
   <div class = "outer">
      <br>
      <h2 align = "center">회원가입</h2>

      <form id="joinForm" action="minsert.do" method="post" onsubmit = "toEnabled()">
         <table align = "center">
            <tr>
               <td><h3>* 아이디(이메일)</h3></td>
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
               <td><h3>* 비밀번호</h3></td>
            </tr>
            <tr>
               <td class = "check">8자 이상 영문, 숫자를 조합하여 입력하세요</td>
            </tr>
            <tr>
               <td><input id="userPwd" name="userPwd" class = "join" type="password" placeholder = "비밀번호" required></td>
            </tr>
               <tr><td><div id = "pwdTest" class = "check"></div></td></tr>
            <tr>
               <td><h3>* 비밀번호 확인</h3></td>
            </tr>
            <tr>
               <td><input id="checkPwd" name="checkPwd" class = "join" type="password" placeholder = "비밀번호 확인" required></td>
            </tr>
               <tr><td><div id = "pwdTF" class = "check"></div></td></tr>
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
					<input type="text" id="userPhone2" name="userPhone2" class = "join" oninput="this.value=this.value.replace(/[^0-9]/g,'');" required>&nbsp;
					<input type="text" id="userPhone3" name="userPhone3" class = "join" oninput="this.value=this.value.replace(/[^0-9]/g,'');" required>
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
      
      // 비밀번호 및 비밀번호 확인 일치 체크
      $(function() {
         $('#userPwd').keyup(function() {
               $("#pwdTF").html('');
         });

         $('#checkPwd').keyup(function() {
            if($('#userPwd').val() != $('#checkPwd').val()) {
               $("#pwdTF").html('');
               $("#pwdTF").html("비밀번호 불일치").css("color", "red");
            } else {
               $("#pwdTF").html('');
               $("#pwdTF").html("비밀번호 일치").css("color", "green");
            }
         });
      });
      
      // 비밀번호 유효성 검사
      $(function(){
         $("#userPwd").blur(function(){
            checkPassword($('#userPwd').val(),$('#userId1').val());   // 유효성 검사 함수 실행
            
            if($('#userPwd').val() != $('#checkPwd').val() && $('#checkPwd').val() != "") {   // 비밀번호를 다 썼으면 일치 불일치 뜨게
               $("#pwdTF").html('');
               $("#pwdTF").html("비밀번호 불일치").css("color", "red");
            }
         });
      });
      
      // 비밀번호 유효성 검사 실행 함수
      function checkPassword(password,id){
          var checkNumber = password.search(/[0-9]/g);
          var checkEnglish = password.search(/[a-z]/ig);
          var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
          var pattern2 = /(\w)\1\1\1/;
          
          if(password.length > 16){
             $("#pwdTest").html("비밀번호는 16자 이하만 가능합니다").css("color", "red");
             
          }else if(!pattern1.test(password)){
             $("#pwdTest").html("영문, 숫자 8자 이상 조합을 사용해야 합니다").css("color", "red");
             
          }else if(pattern2.test(password)){
             $("#pwdTest").html("같은 문자를 4번 이상 사용하실 수 없습니다").css("color", "red");
             
          }else if(password.search(id) > -1 && id.length > 3){
             $("#pwdTest").html("비밀번호에 아이디가 포함되어 있습니다").css("color", "red");
             
          }else{
             $("#pwdTest").html('');
          }
      }
      
      // 가입 버튼 클릭했을 때 유효성 검사 함수 실행
      $(function(){
         $("#joinBtn").click(function(){
            return invalidJoin();
         })
      });
      
      // 가입버튼 클릭했을 때 유효성 검사
      function invalidJoin(){
         var pattern1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
         var pattern2 = /(\w)\1\1\1/;
          
         if($("#userId1").val().length == 0){
            alert("아이디를 입력하세요");
            $("#userId1").focus();
            return false;
         }
         
         if($("#userPwd").val().length == 0){
            alert("비밀번호를 입력하세요");
            $("#userPwd").focus();
            return false;
         }
         
         if($("#userPwd").val().length < 8){
            alert("비밀번호는 8자 이상이어야 합니다");
            $("#userPwd").focus();
            return false;
         }
         
         if($("#userPwd").val().length > 16){
            alert("비밀번호는 16자 이하여야 합니다");
            $("#userPwd").focus();
            return false;
         }
         
         if($("#checkPwd").val().length == 0){
            alert("비밀번호 확인을 입력하세요");
            $("#checkPwd").focus();
            return false;
         }
         
         if($("#lastName").val().length == 0){
            alert("성(last name)을 입력하세요");
            $("#lastName").focus();
            return false;
         }
         
         if($("#firstName").val().length == 0){
             alert("이름(first name)을 입력하세요");
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
         
         if(idUsable == false){
            alert("아이디가 중복됩니다");
            $("#userId1").focus();
            return false;
         }
         
         if($("#userPwd").val() != $("#checkPwd").val()){
            alert("비밀번호가 일치하지 않습니다");
            $("#checkPwd").focus();
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
         
         if($('#userPwd').val().indexOf(" ") >= 0){
            alert("비밀번호에 공백은 입력할 수 없습니다");
            $('#userPwd').focus();
            return false;
         }
         
         if($('#checkPwd').val().indexOf(" ") >= 0){
            alert("비밀번호 확인에 공백은 입력할 수 없습니다");
            $('#checkPwd').focus();
            return false;
         }
         
         if(!pattern1.test($("#userPwd").val())){            
            alert("비밀번호는 영문, 숫자 8자 이상 조합을 사용해야 합니다");
             $("#userPwd").focus();
             return false;
          }
         
         if(pattern2.test($("#userPwd").val())){
            alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다");
             $("#userPwd").focus();
             return false;
          }
         
         if($("#userPwd").val().search($("#userId1").val()) > -1 && $("#userId1").val().length > 3){
            alert("비밀번호에 아이디가 포함되어 있습니다");
             $("#userPwd").focus();
             return false;
          }
         
         if($("#lastName").val().indexOf(" ") >= 0){
            alert("이름에 공백은 입력할 수 없습니다");
            $("#lastName").focus();
            return false;
         }
         
         if($("#firstName").val().indexOf(" ") >= 0){
             alert("이름에 공백은 입력할 수 없습니다");
             $("#firstName").focus();
             return false;
          }
         
         if(!/^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#lastName").val())){
            alert("이름은 한글, 영문만 입력 가능합니다");
            $("#lastName").focus();
            return false;
         }
         
         if(!/^[a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/.test($("#firstName").val())){
             alert("이름은 한글, 영문만 입력 가능합니다");
             $("#firstName").focus();
             return false;
          }
         
         return true;
      }
   </script>


</body>
</html>