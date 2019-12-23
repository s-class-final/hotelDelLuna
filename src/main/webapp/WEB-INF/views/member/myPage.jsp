<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
body {
    position: relative;
    top: 80px;
}
.btnChangePWD button{
	cursor: pointer;
}
</style>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<div class="loginWrap">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1><span>마이 페이지</span>호텔델루나 회원님의 개인 정보를 <br />확인 및 수정 하실 수 있습니다.</h1>
			</div>
			
			<div class="fullBg">
				<div class="innerBox formJoinWrap">
				<c:if test="${empty loginUser.kakao}">
					<!-- 아이디 및 비밀번호 -->
					<form name="form1" id="form1">
					<div class="formJoin" onkeydown="javascript:confirmPwd();">
						<h2>아이디 및 비밀번호</h2>
						<dl class="id">
							<dt><label for="userId">아이디 (이메일)</label></dt>
							<dd>
								<div class="inp">
									<input type="email" id="userId" name="userId" title="아이디" value="${loginUser.userId}" disabled>
									
									<c:forTokens var="userId" items="${loginUser.userId}" delims="@" varStatus="status">
										<c:if test="${status.index eq 0}">
											<input type="hidden" id="userId1" value="${userId}">
										</c:if>
									</c:forTokens>
								</div>
							</dd>
						</dl>
						
						<dl class="pwd">
							<dt><label for="userPwd">비밀번호</label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="inp">
									<input type="password" id="userPwd" name="userPwd" maxlength="16" title="비밀번호" placeholder="영문, 숫자 조합 8~16자 이내">
								</div>
							</dd>
						</dl>
						<dl class="pwd">
							<dt><label for="checkPwd">비밀번호 확인</label></dt>
							<!-- 에러시 dd의 error 클래스 추가 -->
							<dd>
								<div class="inp">
									<input type="password" id="checkPwd" name="checkPwd" maxlength="16" title="비밀번호 확인">
								</div>	
							</dd>
						</dl>
						
						<div class="btnChangePWD">
							<!-- <a href="javascript:jsModifyPwd();" class="btn small"><span>비밀번호 수정</span></a> -->
							<button id="changePwd" type="button" class="btn small"><span>비밀번호 수정</span></button>
						</div>
					</div>
					</form>
					<!-- //아이디 및 비밀번호 -->
					<br><br><hr><br><br>
				</c:if>
					<form id="form2" name="form2">
					
					<!-- 회원정보 -->
					<div class="formInfo clearFixed" onkeydown="javascript:confirmInfo();">
						<h2>회원 정보</h2>
						
						<div class="left">
							<dl class="nameType2">
								<dt><label for="userName">이름</label></dt>
								<dd>
									<c:forTokens var="userName" items="${loginUser.userName}" delims=" " varStatus="status">
										<c:if test="${status.index eq 0}">
											<div class="inp">
												<input type="text" id="lastName" name="lastName" value="${userName}" maxlength="50" placeholder="Last Name(성)" title="Last Name(성)">
											</div>
										</c:if>
										<c:if test="${status.index eq 1}">
											<div class="inp">
												<input type="text" id="firstName" name="firstName" value="${userName}" maxlength="50" placeholder="First Name(이름)" title="First Name(이름)">
											</div>
										</c:if>
									</c:forTokens>
								</dd>
							</dl>
							<dl class="namyType2" style="width:50%">
								<dt><label for="point">나의 포인트</label></dt>
								<dd>
									<div class="inp">
										<input type="text" id="point" name="point" value="${loginUser.point}" maxlength="50" readonly>
									</div>
									<span style="position:absolute; top:50%; right: 16px; transform: translateY(-50%); font-size: 14px; font-weight:600;">P	</span>
								</dd>
							</dl>
						</div>
						
						<div class="right">
							<dl class="phone">
								<dt><label for="Phone">휴대폰 번호</label></dt>
								<dd>
									<c:forTokens var="userPhone" items="${loginUser.userPhone}" delims="-" varStatus="status">
									<c:if test="${status.index eq 0}">
									<select class="selectBox" id="userPhone1" name="userPhone1" title="휴대 전화 앞자리 선택">
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
									</select>
									</c:if>
									<c:if test="${status.index eq 1}">
									<div class="inp">
										<input type="tel" id="userPhone2" name="userPhone2" value="${userPhone}" maxlength="4" oninput="confirmInfo(); nextPhone(); this.value=this.value.replace(/[^0-9]/g,'');" title="휴대 전화 가운데 번호">
									</div>
									<span>-</span>
									</c:if>
									<c:if test="${status.index eq 2}">
									<div class="inp">
										<input type="tel" id="userPhone3" name="userPhone3" value="${userPhone}" maxlength="4" oninput="confirmInfo(); nextPhone(); this.value=this.value.replace(/[^0-9]/g,'');" title="휴대 전화 마지막 번호">
									</div>
									</c:if>
									</c:forTokens>
								</dd>
							</dl>
						</div>
						
					</div>
					<!-- //회원정보 -->
					
					</form>
					
				</div>
				<div class="btnChangePWD">
					<button id="changeInfo" type="button" class="btn small"><span>회원정보 변경</span></button>
				</div>
				<div class="innerBox">
					<div class="memberLeave">
						<h2>회원탈퇴</h2>
						<p>‘회원 탈퇴’ 버튼을 클릭하시면 호텔델루나 회원탈퇴가 이루어집니다.</p>
						
						<c:if test="${empty loginUser.kakao}">
							<a href="mdrop.do" class="btn small2"><span>회원탈퇴</span></a>
						</c:if>
						<c:if test="${!empty loginUser.kakao}">
							<a id="dropBtn" onclick="jsValidationPwd();" class="btn small2"><span>회원탈퇴</span></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br><br><br>
		<jsp:include page="../common/footer.jsp"/>
		
	<script>
	function confirmPwd(){
		var keyCode = window.event.keyCode;
			if (keyCode == 13) {
				$("#changePwd").click();
			}
	}
	
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
		var conChange = confirm("비밀번호를 변경하시겠습니까?");
		if(conChange){
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
		}
	};
	
	function confirmInfo(){
		var keyCode = window.event.keyCode;
			if (keyCode == 13) {
				$("#changeInfo").click();
			}
	}
	
	// 회원정보 함수 실행
	$(function(){
		$("#changeInfo").click(function(){
			return checkInfo();
		});
	});
	
	// 회원정보 유효성 검사 및 회원정보 변경
	function checkInfo(){
		var userId = $("#userId").val();
		var userName = $("#lastName").val() + " " + $("#firstName").val();
		var userPhone = $("#userPhone1").val() + "-" + $("#userPhone2").val() + "-" + $("#userPhone3").val(); 
		
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
		var conChange = confirm("회원정보를 변경하시겠습니까?");
		if(conChange){
			$.ajax({
				url:"changeInfo.do",
				data:{userName:userName, userPhone:userPhone},
				success:function(data){
					if(data == "true"){
						var conPwd = confirm("회원정보가 변경되었습니다. 메인으로 돌아가시겠습니까?");
						if(conPwd == true){
							location.href="index.jsp";
						}
					}else{
						alert("회원정보 변경에 실패했습니다.");
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
	
	// 전화번호 4글자 입력 시 다음 칸 넘어가게
	function nextPhone() {
		if ($("#userPhone2").val().length >= 4) {
			$("#userPhone3").focus();
		}
	};
	
	// 탈퇴 버튼 클릭 시
	function jsValidationPwd() {
		layerPopOpen("#SECESSION_USER");
	}
	
	$(function(){
		jsSecessionLyInitialize();
	})
	
	//카카오회원 탈퇴 프로세스 실행
	function jsMemberDrop() {
		//로딩바 활성화
		fullLoding($("#container"));
		
		var userId = "${loginUser.userId}";
		
		$.ajax({
			url:"mdelete.do",
			data:{userId:userId},
			success:function(data){
				alert("회원탈퇴 되었습니다.");
				location.href="index.jsp";
			},
			error : function(request, status, errorData) {
				alert("error code: " + request.status + "\n"
						+ "message: " + request.responseText
						+ "error: " + errorData);
			}
		})
	}
	
	var cTxtIqr = "문의 <span class='fw500'>1577-1577</span> (월~금 03:30 ~ 22:00)";

	function jsSecessionLyInitialize() {
		//레이어 팝업 초기화 설정값 변수 선언
		var title   = "탈퇴신청";
		var ctxtArr = ["그동안 호텔 델루나를 이용해주셔서 감사합니다."    //1
					  ,"탈퇴신청 시 호텔 델루나 홈페이지에서 탈퇴 처리되며"    //2
					  ,"기존에 보유하고 계신 포인트 내역은 유지됩니다."    //3
					  ,"홈페이지 이용의 혼선을 방지하고자"    //4
					  ,"동일한 아이디로는 재가입하실 수 없습니다."    //5
					  ,cTxtIqr                                        //6
					  ,"해당 내용에 동의하였으며, 호텔 델루나 탈퇴를 신청합니다."];  //7 
		var tClsArr = ["fw500 pd0i tc"   //1
					  ,"fw500 pd0i tc"   //2
					  ,"fw500 tc"        //3
					  ,"pd0i tc"         //4
					  ,"tc"              //5
					  ,"tc"              //6
					  ,"fw500 fs16p tc"];//7
		var btnObj  = new Object();
		btnObj.leftBtnNm  = "확인";
		btnObj.leftBtnAct = "javascript:jsLeftBtnAction();";
		btnObj.rightBtnNm = "취소";
		btnObj.rightBtnAct= "javascript:jsRightBtnAction();";
		btnObj.btnTrId    = "#btnTwoTr"; 
		
		//레이어 팝업 초기화
		jsInitInfoPop(true, "#SECESSION_USER", title, ctxtArr, tClsArr, btnObj);
	}

	//레이어 팝업 좌측 버튼 클릭 이벤트
	function jsLeftBtnAction() {
		//레이어 팝업 닫기
		$(".btnPopClose").click();
		//회원 탈퇴 프로세스 진행
		jsMemberDrop();
	}

	//레이어 팝업 우측 버튼 클릭 이벤트 (취소)
	function jsRightBtnAction() {
		//레이어 팝업 닫기
		$(".btnPopClose").click();
	}
	</script>
	
	<style>
	.pd0i{padding: 0px !important;}
	p.astBefore{color: #999; font-size: 12px !important; margin-left: 12px;}
	p.astBefore::before {content: "*"; left: 66px; position: absolute; top: 163px;}
	.fs12p{font-size:12px;}
	.fs13p{font-size:13px;}
	.fs16p{font-size:16px;}
	</style>
	<script type="text/javascript">
	
	
	function setCookie(cname, cvalue, exdays) {
	    console.log("overiding setCookie Pc");
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+d.toUTCString();
	    document.cookie = cname + "=" + cvalue + "; " + expires;
	}
	
	/**
	 * 레이어 팝업 초기화
		offFlag : 레이어 팝업 기본이벤트 제거 여부 (바탕 눌렀을 때 닫기처리 방지)
		title   : 레이어 팝업 타이틀
		ctxtArr : 레이어 팝업 컨텐츠 TEXT
		tClsArr : 레이어 팝업 컨텐츠 TEXT Class 추가
		**주의** > ctxtArr, tClsArr의 길이는 동일하게 구성
		btnObj  : 레이어 팝업 버튼 정보
	 */
	function jsInitInfoPop(offFlag, popId, title, ctxtArr, tClsArr, btnObj) {
		//레이어 팝업 기본이벤트 제거
		if (offFlag) {
			$(document).off('click','.btnPopClose, .layerPopWrap .bg');
		//레이어 팝업 기본이벤트 복원
		} else {
			$(document).on('click','.btnPopClose, .layerPopWrap .bg', function(){
				return jsLayerEventDefault(this);
			});
		}
		
		//레이어 팝업 닫기 버튼 이벤트 설정
		$(document).on('click','.btnPopClose',function(){
			return jsLayerEventDefault(this);
		});
		
		//레이어 타이틀 지정
		$(popId).find(".layerTitleText").text(title);
		
		//레이어 컨텐츠 초기화
		$(popId).find("div.loginBox").find("p.pb15i").remove();
		//레이어 컨텐츠 지정
		for (var i = ctxtArr.length - 1; i >= 0; i--) {
			//컨텐츠 기본 클래스
			var clsDef = "pb15i";
			//클래스 지정시 지정 클래스 추가
			if (!isNullOrEmpty(tClsArr[i])) {
				clsDef = clsDef + " " + tClsArr[i];
			}
			$(popId).find("div.loginBox").prepend($("<p>").addClass(clsDef).html(ctxtArr[i]));
		}
		
		//버튼 정보 설정
		if (!isNullOrEmpty(btnObj)) {
			//버튼 갯수 확인
			var btnTrId = btnObj.btnTrId;
			$(popId).find("tr.btnAreaTr").empty();
			$(popId).find("tr.btnAreaTr").append($(btnTrId).html())
			
			if ($(popId).find(".LayerbtnLeft").length > 0) {
				//레이어 좌측 버튼 설정(버튼명, 이벤트)
				$(popId).find(".LayerbtnLeft").text(btnObj.leftBtnNm);
				$(popId).find(".LayerbtnLeft").closest("a").attr("onclick", btnObj.leftBtnAct);
				
				//레이어 팝업 닫기 버튼 이벤트 재설정
				if (toNotNull(btnObj.btnUnionYn) == "Y") {
					$(document).off('click','.btnPopClose');
					$(document).on ('click','.btnPopClose', function(){
						jsLayerEventDefault(this);
						//현재 활성화되고 클릭된 레이어 팝업이 알림 팝업일 경우만 이벤트 설정
						if ($(this).closest(popId).length > 0) {
							$(popId).find(".LayerbtnLeft").click();
						}
						return false;
					});
				}
			}
			
			if ($(popId).find(".LayerbtnRight").length > 0) {
				//레이어 우측 버튼 설정(버튼명, 이벤트)
				$(popId).find(".LayerbtnRight").text(btnObj.rightBtnNm);
				$(popId).find(".LayerbtnRight").closest("a").attr("onclick", btnObj.rightBtnAct);
			}
		}
	}
	
	//레이어 팝업 기본 이벤트, ui.js > function layerPopClose()
	function jsLayerEventDefault(obj) {
		$(obj).closest('.layerPopWrap').removeClass('on');
		$('body').removeClass('hidden');
		return false;
	}
	</script>
	
	
	
	<div class="layerPopWrap" id="SECESSION_USER">
		<div class="bg"></div>
		<div class="layerPopCont">
			<div class="loginWrap">
				<h1 class="pt15i pb15i">
					<span class="layerTitleText fw500"></span> 
				</h1>
				<div class="loginBox">
					<div class="termTxt pb15i">
						<table class="bdNone">
							<tbody>
								<tr class="btnAreaTr bdNone"></tr> 
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<a href="javascript:void(0);" class="layerPopClose btnPopClose"></a>
		</div>
	</div>
	
	
	
	<table style="display:none;">
		<tbody>
			<tr id="btnOneTr">
				<td colspan="2" class="bdNone">
					<a href="javascript:void(0);" class="dpi btn small full btnFull">
						<span class="LayerbtnLeft"></span>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table style="display:none;">
		<tbody>
			<tr id="btnTwoTr">
				<td class="bdNone">
					<a href="javascript:void(0);" class="dpi btn small full btnFull">
						<span class="LayerbtnLeft"></span>
					</a>
				</td>
				<td class="bdNone">
					<a href="javascript:void(0);" class="dpi btn small full btnFull">
						<span class="LayerbtnRight"></span>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>