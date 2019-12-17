<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    position: relative;
    top: 130px;
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
				<h1 class="contTitle"><span>문의 내역 관리</span>회원님께서 문의하신 내역을 <br />관리자가 확인 및 답변할 수 있는 페이지입니다.</h1>
				
				<p class="btnInquiry"><a href="noreply.do" class="btn small">[답변 대기]만 보기</a></p>

				<!-- 상태표시
					.inquiryList > .status, .end : 답변완료
					.inquiryList > .status, .wait : 답변대기
				-->
				<c:forEach var="i" items="${list}">
					<div class="inquiryList">
						<c:if test="${i.reStatus eq 'N'}">
							<span class="status wait">[답변 대기]</span>
						</c:if>
						<c:if test="${i.reStatus eq 'Y'}">
							<span class="status end">[답변 완료]</span>
						</c:if>
						<button>
							<h2>${i.iTitle}</h2>
							<p class="location">
								작성자 : ${i.iWriter}
							</p>
							<p class="text">
							${i.iContent}
							</p>
							<p class="date">${i.iCreateDate}</p>
							<c:url var="idelete" value="idelete.do">
								<c:param name="iId" value="${i.iId}"/>
							</c:url>
							<a href="${idelete}" onclick="return confirm('정말로 삭제하시겠습니까?');" class="btnDelete" style="background: url('resources/pcPub/static/images/mypage/btn_delete.png') no-repeat 3px center;">삭제</a>
							
							<c:url var="reinquiry" value="reinquiry.do">
								<c:param name="iId" value="${i.iId}"/>
								<c:param name="page" value="${pi.currentPage}"/>
							</c:url>
							<c:if test="${i.reStatus eq 'N'}">
								<a href="${reinquiry}" style="top:53px; padding:0">답변 등록</a>
							</c:if>
							
							<c:url var="upreinquiry" value="upreinquiry.do">
								<c:param name="iId" value="${i.iId}"/>
								<c:param name="page" value="${pi.currentPage}"/>
							</c:url>
							<c:if test="${i.reStatus eq 'Y'}">
								<a href="${upreinquiry}" style="top:53px; padding:0">답변 수정</a>
							</c:if>
						</button>
						<!-- 답변 영역 -->
						<div class="answerBox">
							<c:if test="${i.reStatus eq 'Y'}">
								<div class="inquiryList on">
									<button>
										<h2>관리자 답변</h2>
										<p class="text">${i.reContent}</p>
									</button>
									<p class="date1">${i.iModifyDate}</p>
								</div>
							</c:if>
						</div>
						<!-- //답변 영역 -->
					</div>
				</c:forEach>
				
			
				<div class='paginate'>
					<tr align="center" height="20">
						<td colspan="6">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								<&nbsp;
							</c:if>
							
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="ilistBack" value="allinquiry.do">
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
									<c:url var="ilistCheck" value="allinquiry.do">
										<c:param name="page" value="${p}"/>
									</c:url>
									<a href="${ ilistCheck }">${p}</a>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								&nbsp;>
							</c:if>
							
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="ilistEnd" value="allinquiry.do">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url>
								<a href="${ ilistEnd }">></a>
							</c:if>
						</td>
					</tr>
				<!-- <a href='#' class='num active'>1</a> -->
				</div>

			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"/>


</body>
</html>