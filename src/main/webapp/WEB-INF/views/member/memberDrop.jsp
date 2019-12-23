<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
body {
    position: relative;
    top: 80px;
}
#dropBtn{
	cursor: pointer;
}
</style>
</head>
<body onkeydown="javascript:confirmPwd();">
<jsp:include page="../common/menubar.jsp"/>

<script type="text/javascript">

function confirmPwd(){
	var keyCode = window.event.keyCode;
		if (keyCode == 13) {
			$("#dropBtn").click();
		}
}

$(document).ready(function(){
	$("#userPwd").focus();
	jsSecessionLyInitialize();
});

// 탈퇴 버튼 클릭 시
function jsValidationPwd() {
	var userId = $("#userId").val();
	var userPwd = $("#userPwd").val();

	if (userPwd == null || userPwd == "") {
		alert("비밀번호를 입력하시기 바랍니다.");
		$('#userPwd').focus();
	} else {
		$.ajax({
			url : "mypageLogin.do",
			data : {userId : userId, userPwd : userPwd},
			success : function(data) {
				if (data == "true") {
					layerPopOpen("#SECESSION_USER");
				} else {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPwd").focus();
				}
			},
			error : function(request, status, errorData) {
				alert("error code: " + request.status
						+ "\n" + "message: "
						+ request.responseText + "error: "
						+ errorData);
			}
		})
	}
}

//회원 탈퇴 프로세스 실행
function jsMemberDrop() {
	//로딩바 활성화
	fullLoding($("#container"));
	
	var userId = $("#userId").val();
	
	$.ajax({
		url:"mdelete.do",
		data:{userId:userId},
		success:function(data){
			alert("회원탈퇴 되었습니다.");
			location.href="main.jsp";
		},
		error : function(request, status, errorData) {
			alert("error code: " + request.status + "\n"
					+ "message: " + request.responseText
					+ "error: " + errorData);
		}
	})
}

//탈퇴하기 레이어 팝업 초기화



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

	<!-- 컨텐츠 영역 -->
	<section id="container">
		<div class="loginWrap">
			<div class="innerBox">
				<h1><span>탈퇴 신청</span>호텔델루나에서 탈퇴하시겠습니까?</h1>
			</div>
			<div class="fullBg">
				<div class="innerBox bg">
					<div class="loginBox">
						<div class="inp">
							<h3 style="padding: 10px;">아이디(이메일)</h3>
							<input type="text" id="userId" name="userId" disabled="disabled" placeholder="member02.txt_05" title="member02.txt_05" value="${loginUser.userId}" />
						</div>
						
						<div class="inp">
							<h3 style="padding: 10px;">비밀번호</h3>
							<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" title="member02.txt_07" >
						</div>
						<button id="dropBtn" class="btn btnFull btnLogin" onclick="jsValidationPwd();">탈퇴신청</button>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- //컨텐츠 영역 -->
	<jsp:include page="../common/footer.jsp"/>




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