<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>

<script>
$(document).ready(function() {
	
});

function jsList() {
	$("#form1").attr("action", "noticeListA.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

function jsList1() {
	$("#form1").attr("action", "noticeList.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

function jsDelete(nId) {
	//정말로 삭제하시겠습니까?
	$("#form1").attr("action", "noticeDelete.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

</script>

<!-- 컨텐츠 영역 -->
<section id="container">
	<form id="form1" name="form1">
		<input type="hidden" id="nId" name="nId" value="${notice.nId }">
	</form>
	
	
	<div class="noticeViewWrap">
		<h1>공지사항</h1>
		<h2>${notice.nTitle}</h2> 
		<div class="cont">
			<p>${notice.nContent }</p>
		</div>
		<div style="text-align:center;">
			<c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 1 || empty sessionScope.loginUser}">
				<a href="javascript:jsList1();" class="btn btnFull"><span>목록</span></a>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 2}">
				<a href="javascript:jsList();" class="btn btnFull"><span>목록</span></a>
				<a href="#pop1" class="btn btnFull layerPopOpen"><span>수정</span></a>
				<a href="javascript:jsDelete('${notice.nId }');" onclick="return confirm('공지사항을 삭제하시겠습니까?')" class="btn btnFull"><span>삭제</span></a>
			</c:if>
		</div>
	</div>
</section>
<!-- //컨텐츠 영역 -->



<script>
var title = "공지사항 수정하기";

$(window).load(function(){
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
    
});

$(document).ready(function(){
    // 팝업 제목 설정
    $(".popHeaderInq").text(title);
    
    $("#PI_VOC_CN").val("");	//에러 발생 시 에러 메시지 출력칸
});


function jsSave() {
    
    rtn = $("#form_inquiry").validate();
    
    if (rtn.isValid == false) {
        var sub_fix = "항목을 입력하세요.";
        if (rtn.chkType == "type") {
            sub_fix = "형식이 올바르지 않습니다.";
        }
        
        if (rtn.msg != "") {
            alert(rtn.msg + " " + sub_fix);
        } else {
            alert(sub_fix);
        }
        
        return;     
    }
    
    if($("#nStatus").is(":checked") == false) {
        alert("작성하신 글은 비공개로 게시됩니다.");
        $("#nStatus").val('N');
    }
    
    $("#PI_REG_EMPNO").val($("#PI_CUST_NM").val());
    
    var nId = $("#nId").val();
    var user_T = $("#user_T").val();
	var nTitle = $("#nTitle").val();
	var nContent = $("#nContent").val();
	var nStatus = $("#nStatus").val();
	
	
  	$.ajax({
        url : "noticeUpdate.do",
        method : "post",
        data : {nId:nId, user_T:user_T, nTitle:nTitle, nContent:nContent, nStatus:nStatus},
        success : function(data, status, xhr) {
            if (status == "success") {
            	alert("공지사항 작성 완료");
               location.href="noticeListA.do";
            }
        },
		error:function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+"message: " + request.responseText
					+"error: " + errorData);
		}
    });
}

</script>

<!-- 공지사항 작성 (레이어 팝업) -->
<div class="layerPopWrap normalLayer" id="pop1">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
        <h1 class="popHeader popHeaderInq"></h1>
        <div class="inquiryPopCont">
        
            <form id="form_inquiry" name="form_inquiry">
            	<input type="hidden" id="user_T" name="user_T" value="<%-- ${loginUser.userT } --%>2" />
                <div class="formInquiryWrap">
                    <dl class="title">
                        <dt>
                            <label for="nTitle">제목 <span class="color">*</span></label>
                            <p class="imp"><span class="color">*</span>필수 입력 항목</p>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" id="nTitle" name="nTitle" required title="제목" value="${notice.nTitle}">
                                <button class="btnDelete">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="nContent">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="nContent" name="nContent" required title="내용">${notice.nContent}</textarea>
                        </dd>
                    </dl>
                    <div class="checkbox">
                    	<c:if test="${notice.nStatus eq 'N'}">
                    		<input type="checkbox" id="nStatus" name="nStatus" value="Y"><label for="nStatus">공개</label>
                    	</c:if>
                    	<c:if test="${notice.nStatus eq 'Y'}">
                    		<input type="checkbox" id="nStatus" name="nStatus" value="Y" checked><label for="nStatus">공개</label>
                    	</c:if>
                    </div>
            	</div>
            </form>
            
            <div class="btnGroup">
                <a href="javascript:jsSave();" class="btn btnFull small"><span>등록</span></a>
            </div>
        </div>
        <a href="#" class="layerPopClose btnPopClose" style="background: url('resources/pcPub/static/images/common/btn/btn_pop_close.png') no-repeat;">레이어 팝업 닫기</a>
    </div>
    <!-- //layerPopCont -->
</div>
<!-- //1:1 문의 (레이어 팝업) -->



</section>
<!-- //컨텐츠 영역 -->

<jsp:include page="../../common/footer.jsp"/>
		
</body>
</html>