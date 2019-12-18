<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
  font-family: Tahoma;
}
header {
  text-align: center;
}
#calendar {
  width: 100%;
}
#calendar a {
  color: #8e352e;
  text-decoration: none;
}
#calendar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
}
#calendar li {
  display: block;
  float: left;
  width: 14.342%;
  padding: 5px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-right: -1px;
  margin-bottom: -1px;
}
#calendar ul.weekdays {
  height: 40px;
  background: #8e352e;
}
#calendar ul.weekdays li {
  text-align: center;
  text-transform: uppercase;
  line-height: 20px;
  border: none !important;
  padding: 10px 6px;
  color: #fff;
  font-size: 13px;
}
#calendar .days li {
  height: 180px;
}
#calendar .days li:hover {
  background: #d3d3d3;
}
#calendar .date {
  text-align: center;
  margin-bottom: 5px;
  padding: 4px;
  background: #333;
  color: #fff;
  width: 20px;
  border-radius: 50%;
  float: right;
}
#calendar .event {
  clear: both;
  display: block;
  font-size: 13px;
  border-radius: 4px;
  padding: 5px;
  margin-top: 40px;
  margin-bottom: 5px;
  line-height: 14px;
  background: #e4f2f2;
  border: 1px solid #b5dbdc;
  color: #009aaf;
  text-decoration: none;
}
#calendar .event-desc {
  color: #666;
  margin: 3px 0 7px 0;
  text-decoration: none;
}
#calendar .other-month {
  background: #f5f5f5;
  color: #666;
}
/* ============================
                Mobile Responsiveness
   ============================*/
@media (max-width: 768px) {
  #calendar .weekdays, #calendar .other-month {
    display: none;
  }
  #calendar li {
    height: auto !important;
    border: 1px solid #ededed;
    width: 100%;
    padding: 10px;
    margin-bottom: -1px;
  }
  #calendar .date {
    float: none;
  }
}
</style>
</head>
<body>

<%-- <c:forEach var="s" items="${list }">
<c:url var="salesDetail" value="salesDetail.do">
	<c:param name="ckinDate" value="${s.ckinDate }"/>
</c:url>


</c:forEach> --%>

<table id = "request">
	
		<tr>
			<th>체크인 날짜</th>
			<th>룸 타입</th>
			<th>가격</th>
			
		</tr>
	
	
	<c:forEach var="s" items="${list }">
<c:url var="salesDetail" value="salesDetail.do">
	<c:param name="ckinDate" value="${s.ckinDate }"/>
</c:url>
		<tr >
			<td><a href="${salesDetail}">${s.ckinDate }</a></td>
			<td>${s.rType }</td>
			<td>${s.price }</td>
		</tr>
	</c:forEach>

<!-- 페이징 부분 -->
 			<tr align="center" height="20">
 				<td colspan="7">
 				<!-- [이전] -->
 				<c:if test="${pi.currentPage == 1 }">
 					<a href="#" class="previous">[이전]&nbsp;</a>
 				</c:if>
 				
 				<c:if test="${pi.currentPage > 1 }">
 					<c:url var="plistBack" value="plist.do">
 						<c:param name="page" value="${pi.currentPage - 1 }"/>
 					</c:url>
 					<a href="${plistBack }" class="previous">[이전]</a>
 				</c:if>
 				
 				<!-- [번호들] -->
 				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
 					<c:if test="${p eq pi.currentPage }">
 						<font color="red" size="4"><b>[${p}]</b></font>
 					</c:if>
 					
 					<c:if test="${p ne pi.currentPage }">
 						<c:url var="plistCheck" value="plist.do">
 							<c:param name="page" value="${p }"/>
 						</c:url>
 						<a href="${plistCheck }">${p }</a>
 					</c:if>
 				</c:forEach>
 				
 				<!-- [다음] -->
 				<c:if test="${pi.currentPage == pi.maxPage }">
 					<a href="#" class="next">&nbsp;[다음]</a>
 				</c:if>
 				
 				<c:if test="${pi.currentPage < pi.maxPage }">
 					<c:url var="plistEnd" value="plist.do">
 						<c:param name="page" value="${pi.currentPage + 1 }"/>
 					</c:url>
 					<a href="${plistEnd }" class="next">&nbsp;[다음]</a>
 				</c:if>
 				</td>
 			</tr>




</table>
<script type="text/javascript">

$(function(){

    $("#date1").datepicker();

});

$date = $_POST['datepicker'];

</script>


<h5>매출 조회할 날짜를 선택해 봐요</h5>
<form action="salesDetail" method="post">
<input type="text" name="date" id="date1" size="12" value=${s.ckinDate } />

<button type="submit" value="확인"></button>
</form>


</body>
</html>