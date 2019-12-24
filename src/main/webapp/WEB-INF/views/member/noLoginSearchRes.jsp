<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 예약 내역 조회</title>
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
	
	<form id="findForm" action="scmyres.do">
		<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>예약 내역 조회</span>호텔 델루나에 오신 것을 환영합니다!<br />예약 내역을 조회하실 수 있습니다.</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox bg"> <!-- 가로값이 1280으로 설정되어진 아이 -->
					<div class="loginBox">
						<div class="inp">
							<h3 style="padding: 10px;">이메일</h3>
							<input type="text"	id="findMail" name="findMail" placeholder="Email">
						</div>
						
						<div class="inp" style="width:220px; padding-right:12px; margin-top:0;">
							<h3 style="padding: 10px;">이름</h3>
							<input type="text"	id="findName1" name="findName1" placeholder="성 (last name)">
						</div>
						<div class="inp" style="width:220px; padding-left:12px;">
							<input type="text"	id="findName2" name="findName2" placeholder="이름 (first name)">
						</div>
						
						<br>
						
						<div class="phone">
							<h3 style="padding: 10px;">전화번호</h3>
							<select class="selectBox" id = "findPhone1" name = "findPhone1" style="width:145px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<div class="inp" style="width:145px;">
								<input type="text" id="findPhone2" name="findPhone2" class = "join" maxlength="4" oninput="nextPhone(); this.value=this.value.replace(/[^0-9]/g,'');" required>
							</div>
							<div class="inp" style="width:145px; margin-top:0px;">
								<input type="text" id="findPhone3" name="findPhone3" class = "join" maxlength="4" this.value=this.value.replace(/[^0-9]/g,'');" required>
							</div>
							<input type="hidden" id="randomPwd" name="randomPwd"> <br>
							
						</div>
						<br>
						<button type="button" id="findBtn" class="btn btnFull btnLogin">예약 내역 조회</button>
					</div>
				</div>
				
			</div>
		</div>
	</form>
	
	<br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	   
		// 전화번호 4글자 입력 시 다음 칸 넘어가게
		function nextPhone() {
			if ($("#findPhone2").val().length >= 4) {
				$("#findPhone3").focus();
			}
		};

      $(function(){
         $("#findBtn").click(function(){
            return find();
         });
      	 
      	 $("#findMail").focus();
      });
      
      // 유효성 검사
      function find(){
		var userId = $("#findMail");
		var lastName = $("#findName1");
  		var firstName = $("#findName2");
  		var userPhone = $("#findPhone1").val() + "-" + $("#findPhone2").val() + "-" + $("#findPhone3").val();
    	  
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
		
    	  $.ajax({
			  url : "searchRes.do",
              data:{
              	userId:userId.val(),
              	lastName:lastName.val(),
              	firstName:firstName.val(),
              	userPhone:userPhone
              },
              success:function(data){
                   if(data == "true"){
                     $("#findForm").submit();
                   }else{
                  	 alert("예약 정보가 존재하지 않습니다.");
                  	 return false;
                   }
                },
                error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
				 }
            });
         
      }
      
    //엔터 입력 시 버튼 클릭
	function confirmMail(){
	   var keyCode = window.event.keyCode;
	   if (keyCode == 13) {
	      $("#findBtn").click();
	   }
	}
      
   </script>

</body>
</html>