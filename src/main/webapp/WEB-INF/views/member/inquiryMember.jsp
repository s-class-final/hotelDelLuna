<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
body {
    position: relative;
    top: 80px;
}
/* 문의내역 버튼 */
button { margin:0; padding:0; border:0; font:inherit; color:inherit; background:transparent; overflow:visible; cursor:pointer; line-height:1; }

/* 답변 글자 css */
.answerBox .text{ overflow:hidden; height:19px; margin:28px 0 28px 0; color:#666666; font-weight:300; text-overflow:ellipsis; white-space:nowrap;}

/* 페이지네이션 클릭된 글자 */
.paginate b {
    display: inline-block;
    width: 24px;
    height: 24px;
    padding: 0 3px;
    font-size: 14px;
    color: #db0000;
    font-weight: 300;
    line-height: 23px;
    vertical-align: top;
    transition: 0.2s;
    box-sizing: unset;
}

/* 문의 내역 없을 때 */
.inquiryList.empty{
	padding: 0;
}

/* 관리자 답변 날짜 위치 */
.inquiryList .answerBox .date1 {
    position: absolute;
    top: 28px;
    right: 20px;
    color: #999;
}

.answerBox .text{
	width: 600px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mypageWrap pos">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1 class="contTitle"><span>1:1 문의</span>회원님께서 문의하신 내역을 <br />확인하실 수 있습니다.</h1>
				<p class="btnInquiry"><a id="mpop" href="#pop1" class="btn small layerPopOpen">1:1 문의</a></p>

				<!-- 상태표시
					.inquiryList > .status, .end : 답변완료
					.inquiryList > .status, .wait : 답변대기
				-->
				<c:if test="${!empty list}">
					<c:forEach var="i" items="${list}" varStatus="status">
						<div class="inquiryList">
							<c:if test="${i.reStatus eq 'N'}">
								<span class="status wait">[답변 대기]</span>
							</c:if>
							<c:if test="${i.reStatus eq 'Y'}">
								<span class="status end">[답변 완료]</span>
							</c:if>
							<button>
								<h2>${i.iTitle}</h2>
								<p class="text">
								${i.iContent}
								</p>
								<p class="date">${i.iCreateDate}</p>
								<c:url var="idelete" value="idelete.do">
									<c:param name="iId" value="${i.iId}"/>
								</c:url>
								<c:if test="${i.reStatus eq 'N'}">
									<a href="${idelete}" onclick="return confirm('정말로 삭제하시겠습니까?');" class="btnDelete" style="background: url('resources/pcPub/static/images/mypage/btn_delete.png') no-repeat 3px center;" >삭제</a>
								</c:if>
								<%-- 
								<c:url var="pop2" value="#pop2">
									<c:param name="iId" value="${i.iId}"/>
									<c:param name="iContent" value="${i.iContent}"/>
								</c:url>
								<a href="${pop2}" class="layerPopOpen" style="top:53px; padding:0">수정</a>
								 --%>
							</button>
							<!-- 답변 영역 -->
							<div class="answerBox">
								<c:if test="${i.reStatus eq 'Y'}">
								<div class="inquiryList on">
									<button>
										<h2>관리자 답변</h2>
										<p class="text">${i.reContent}</p>
										<p class="date1">${i.iModifyDate}</p>
									</button>
								</div>
								</c:if>
							</div>
							<!-- //답변 영역 -->
						</div>
					</c:forEach>
					
				
					<div class='paginate'>
						<tr align="center" height="20">
							<td colspan="6">
								<!-- 처음으로 -->
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="iliststart" value="minquiry.do">
										<c:param name="page" value="${ pi.startPage }"/>
									</c:url>
									<a href="${ iliststart }"><<</a>
								</c:if>
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="ilistBack" value="minquiry.do">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ ilistBack }"><</a>
								</c:if>
								
								<!-- [번호들] -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="red" size="4"><b>${p}</b></font>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="ilistCheck" value="minquiry.do">
											<c:param name="page" value="${p}"/>
										</c:url>
										<a href="${ ilistCheck }">${p}</a>
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="ilistEnd" value="minquiry.do">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<a href="${ ilistEnd }">></a>
								</c:if>
								
								<!-- 끝으로 -->
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="ilistend" value="minquiry.do">
										<c:param name="page" value="${ pi.maxPage }"/>
									</c:url>
									<a href="${ ilistend }">>></a>
								</c:if>
							</td>
						</tr>
					<!-- <a href='#' class='num active'>1</a> -->
					</div>
				</c:if>
				<c:if test="${empty list}">
					<div class="inquiryList empty">
					<br><br><br>
						<h2 align="center" style="font-size:1.5em;">문의 내역이 없습니다</h2>
					<br><br><br>
					</div>
				</c:if>
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"/>

<script>
var title = "1:1 문의";

$(window).load(function(){
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$("#mpop").click(function(){
    // 팝업 제목 설정
    $(".popHeaderInq").text(title);
    
    $("#PI_VOC_CN").val("");   //에러 발생 시 에러 메시지 출력칸
});

// 1:1 문의 submit 함수
function jsSave() {
    
    rtn = $("#form_inquiry").validate();
    
    if (rtn.isValid == false) {
        var sub_fix = "을 입력하세요.";
        if (rtn.chkType == "type") {
            sub_fix = "형식이 올바르지 않습니다.";
        }
        
        if (rtn.msg != "") {
            alert(rtn.msg + sub_fix);
        } else {
            alert(sub_fix);
        }
        
        return;     
    }
    
    $("#PI_REG_EMPNO").val($("#PI_CUST_NM").val());
    
    $("#form_inquiry").submit();
}

</script>

<div class="layerPopWrap normalLayer" id="pop1">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
        <h1 class="popHeader popHeaderInq"></h1>
        <div class="inquiryPopCont">
        
            <form action="iInsert.do" method="post" id="form_inquiry" name="form_inquiry">
               <input type="hidden" name="iWriter" value="${loginUser.userId}">
                <div class="formInquiryWrap">
                    <dl class="title">
                        <dt>
                            <label for="iTitle">제목 <span class="color">*</span></label>
                            <p class="imp"><span class="color">*</span> 필수 입력 항목</p>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" id="iTitle" name="iTitle" required title="제목">
                                <button class="btnDelete">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="iContent">내용 <span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="iContent" name="iContent" required title="내용"></textarea>
                        </dd>
                    </dl>
               </div>
            </form>
            
            <div class="btnGroup">
                <a href="javascript:jsSave();" class="btn btnFull small"><span>등록</span></a>
            </div>
        </div>
        <a href="#" class="layerPopClose btnPopClose" style="background: url('resources/pcPub/static/images/common/btn/btn_pop_close.png') no-repeat;">레이어 팝업 닫기</a>
    </div>
</div>


</body>
</html>