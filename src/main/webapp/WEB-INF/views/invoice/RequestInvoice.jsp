<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		text-align:center;
		border-top: 1px solid #444444;
		border-collapse: collaps;
	}
	th, td {
		border-bottom: 1px solid #444444;
		padding : 10px;
	}
	th{
		background-color:#bbdefb;
	}
	td{
		background-color:#e3f2fd;
	}
	
	a{
	padding: 8px 16px;
	text-decoration: none;
	display: inline-block;
	}
	
	a:link{
		color:black; text-decoration:none;
	}
	a:visited{
		color:black; text-decoration:none;
	}
	a:hover{
		color:blue; text-decoration:none;
	}
	

	.round {
  border-radius: 50%;
	}
	
	#page-wrap {
	 width: 1000px; 			
	 margin-top: 350px; 
	 margin-left: 400px;
	 height: 500px;
	}
	

	
	
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/> 

<div id="page-wrap">

<table id = "request">
	
		<tr>
			<th>인보이스 번호</th>
			<th>고객 이름</th>
			<th>룸 타입</th>
			<th>체크인 날짜</th>
			<th>가격</th>
			<th>요청 날짜</th>
		</tr>
	
	
	<c:forEach var="i" items="${list }">
	<c:url var="createinvoice" value="create.do">
		<c:param name="ivId" value="${i.ivId }"/>
	</c:url>
		<tr >
			<td><a href="${createinvoice}">${i.ivId }</a></td>
			<td>${i.userName }</td>
			<td>${i.rType }</td>
			<td>${i.ckinDate }</td>
			<td>${i.totalPrice }</td>
			<td>${i.rqDate }</td>
		</tr>
	</c:forEach>
	
	<!-- 페이징 부분 -->
 			<tr align="center" height="20">
 				<td colspan="6">
 				<!-- [이전] -->
 				<c:if test="${pi.currentPage == 1 }">
 					<a href="#" class="previous">[이전]&nbsp;</a>
 				</c:if>
 				
 				<c:if test="${pi.currentPage > 1 }">
 					<c:url var="blistBack" value="rqlist.do">
 						<c:param name="page" value="${pi.currentPage - 1 }"/>
 					</c:url>
 					<a href="${blistBack }" class="previous">[이전]</a>
 				</c:if>
 				
 				<!-- [번호들] -->
 				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
 					<c:if test="${p eq pi.currentPage }">
 						<font color="red" size="4"><b>[${p}]</b></font>
 					</c:if>
 					
 					<c:if test="${p ne pi.currentPage }">
 						<c:url var="blistCheck" value="rqlist.do">
 							<c:param name="page" value="${p }"/>
 						</c:url>
 						<a href="${blistCheck }">${p }</a>
 					</c:if>
 				</c:forEach>
 				
 				<!-- [다음] -->
 				<c:if test="${pi.currentPage == pi.maxPage }">
 					<a href="#" class="next">&nbsp;[다음]</a>
 				</c:if>
 				
 				<c:if test="${pi.currentPage < pi.maxPage }">
 					<c:url var="blistEnd" value="rqlist.do">
 						<c:param name="page" value="${pi.currentPage + 1 }"/>
 					</c:url>
 					<a href="${blistEnd }" class="next">&nbsp;[다음]</a>
 				</c:if>
 				</td>
 			</tr>

</table>

</div>







</body>
</html>