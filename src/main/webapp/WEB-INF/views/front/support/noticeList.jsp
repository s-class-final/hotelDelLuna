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

<style>
div.noticeList table tbody tr.fixed{background-color: #f9f9f9;}
div.noticeList table tbody tr.fixed td.link a{font-weight:300; color:#333;}
div.noticeList table tbody tr.fixed:hover > *{background-color: rgba(0, 0, 0, 0.03);}
.noticeWrap ul.reserveCategory li.active:after {content: '';display: block;bottom: 0;left: 0;right: 0;height: 1px;background: #9c836a;}
</style>


<script type="text/javascript">
$(document).ready(function(){
});

function jsViewDtl(nId, currentPage) {		//게시글 번호를 가지고 디테일 페이지로 이동 하는데 post로 값 넘김(detail은 게시글 번호로 DB에서 게시글 내용 가져와서 보여줍니다.)
	$("#nId").val(nId);
	$("#page").val(currentPage);
	
	$("#form1").attr("action", "noticeDetail.do");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

</script>


<section id="container">
	
	<div class="noticeWrap">
		<h1 class="contTitle"><span>공지사항</span>호텔 델루나의 다양한 소식을<br />확인 해보세요.</h1>
		<c:if test="${loginUser.userT eq 2}">
			<div class="rightButton"><a id="noticePop" href="#pop1" class="btn layerPopOpen small">공지사항 작성하기</a></div>
		</c:if>
		
			<form id="form1" name="form1">
				<input type='hidden' id='nId' name='nId' value=""/>
				<input type='hidden' id='page' name='page' value="" />
			</form>
		<div class="noticeList">
			<table>
				<thead>
					<tr>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list }">
				<tr>
					<td align="center">
						<a href="javascript:jsViewDtl('${n.nId }', '${pi.currentPage }');" class="ellipsis"><span>${n.nTitle }</span></a>
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- 페이지네이션 -->
		<div class='paginate'>
				<c:if test="${pi.currentPage > 1}">
					<c:url var="nlistBack" value="noticeList.do">
						<c:param name="page" value="${pi.currentPage -1 }"/>
					</c:url>
					<a href="${nlistBack }" style="width:60px;">&nbsp;[이전]</a>
				</c:if>
				
				<!-- [번호들] -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<a href='#' class='num active'>[${p}]</a>
					</c:if>
					
					<c:if test="${p ne pi.currentPage }">
						<c:url var="nlistCheck" value="noticeList.do">
							<c:param name="page" value="${p }"/>
						</c:url>
						<a href="${nlistCheck }" class='num'>${p }</a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="nlistEnd" value="noticeList.do">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
					</c:url>
					<a href="${nlistEnd }" style="width:60px;">&nbsp;[다음]</a>
				</c:if>
			</div>

	</div>
</section>

<jsp:include page="../../common/footer.jsp"/>






<script>
var title = "공지사항 작성하기";

$(window).load(function(){
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$("#noticePop").click(function(){
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
    
    var user_T = $("#user_T").val();
	var nTitle = $("#nTitle").val();
	var nContent = $("#nContent").val();
	var nStatus = $("#nStatus").val();
	
	
     $.ajax({
        url : "noticeInsert.do",
        method : "post",
        data : {user_T:user_T, nTitle:nTitle, nContent:nContent, nStatus:nStatus},
        success : function(data, status, xhr) {
            if (status == "success") {
               alert("공지사항 작성 완료");
               location.href="noticeList.do";
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
                                <input type="text" id="nTitle" name="nTitle" required title="제목">
                                <button class="btnDelete">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="nContent">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="nContent" name="nContent" required title="내용"></textarea>
                        </dd>
                    </dl>
                    <div class="checkbox">
                    	<input type="checkbox" id="nStatus" name="nStatus" value="Y"><label for="nStatus">공개</label>
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
		


</body>
</html>