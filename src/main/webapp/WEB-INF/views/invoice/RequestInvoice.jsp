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
	
	/* Button styles */
.btn {
  box-sizing:border-box;
   -moz-box-sizing:border-box;
   -webkit-box-sizing:border-box;
  
  position: relative;
  display: inline-block;
  overflow: hidden;
  height: 53px;
  
  border-radius: 6px;
  -moz-border-radius: 6px;
  -webkit-border-radius: 6px;
    
  line-height: 30px;
  font-size: 16px;
  font-weight: bold;
}

  .btn span.icon, .btn span.title {
    display: block;
    position: relative;
    line-height: 50px;
    padding: 0 30px;  
    
    border-radius: 6px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;  
  }
    
  .btn span.icon {
    font-size: 23px;
    background-color: #00967f;    
    
    -webkit-box-shadow: 0 3px 0 0 #007261;
    box-shadow: 0 3px 0 0 #007261;
  }
  .btn span.title {        
    -webkit-box-shadow: 0 3px 0 0 #1275b7;
    box-shadow: 0 3px 0 0 #1275b7;
    background-color: #1e88ce;
  }
  
  .btn:active,
  .btn.active {
    height: 51px;
  }

.btn-small {
  height: 30px;
  font-size: 12px;
  line-height: 10px;
}
  a.btn-small span.btn {
    height: 30px;
  }


.btn-slide {
  position: relative;
  display: inline-block;
  height: 50px;
  width: 200px;
  line-height: 50px;
  padding: 0 20px;

  border-radius: 50px;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;  

  transition: .5s;
  -webkit-transition: .5s;

  border: 2px solid #1275b7;
}
  .btn-slide:hover {
    background-color: #1275b7;
  }
    .btn-slide:hover span.circle {
      left: 100%;
      margin-left: -45px;
      background-color: #36a7f3;
    }
    .btn-slide:hover span.title {
      left: 40px;
      opacity: 0;
    }
    .btn-slide:hover span.title-hover {
      opacity: 1;
      left: 40px;
    }

  .btn-slide span.circle {
    display: block;
    background-color: #1275b7;
    position: absolute;
    float: left;
    margin: 5px;
    line-height: 42px;
    height: 40px;
    width: 40px;
    top: 0;
    left: 0;

    transition: .5s;
    -webkit-transition: .5s;

    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
  }

  .btn-slide span.title,
  .btn-slide span.title-hover { 
    position: absolute;
    left: 80px;
    transition: .5s;
    -webkit-transition: .5s;
  }

  .btn-slide span.title-hover {
    left: 80px; 
    opacity: 0;
    color:#ffffff;
  }
   #returnpage {
  
  height: 100%;
  width: 100%;
  text-align: center;
  
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
			<td>${i.price }</td>
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


<div id="returnpage">
	 <a href="${blistCheck }" class="btn-slide">
      <span class="circle"><span class="icon-long-arrow-right "></span></span>
      <span class="title">밀어서 잠금 해제</span>
      <span class="title-hover">메인 화면으로 돌아가기</span>
    </a>

</div>




</body>
</html>