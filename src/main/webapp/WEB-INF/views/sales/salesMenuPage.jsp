<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#page-wrap {
	 width: 1000px; 			
	 margin: 0 auto; 
	 height: 500px;
	}
	body { 
	font: 14px/1.4 Georgia; 
	font-family:sans-serif;
	}

	.imgBoxDiv{
		width:300px;
		height:300px;
		position:relative;
		overflow:hidden;
		box-shadow: 2px 2px 8px 0px #000;
		margin-top:400px;
		display:inline-block;
	}
	
	.imgDiv{
		width:100%;
		height:100%;
		position:absolute;
		background:lightblue;
		z-index:1;
		-webkit-transition:all .5s ease;
		transition:all .5s ease;
		bottom:0px;
		overflow:hidden;
	}
	.imgBoxDiv:hover .imgDiv{
		bottom:60px;
	}
	.imgBoxDiv:hover .imgDiv{
		bottom:60px;
	}
	
	.imgDescDiv{
		width:100%;
		height:50px;
		padding:10px;
		color:#ffffff;
		background:#F2CB61;
		position:absolute;
		bottom:0px;
	}
	
	.imgBoxDiv2{
		width:300px;
		height:300px;
		position:relative;
		overflow:hidden;
		box-shadow: 2px 2px 8px 0px #000;
		margin-left:30px;
		display:inline-block;
	}
	
	.imgDiv2{
		width:100%;
		height:100%;
		position:absolute;
		background:lightblue;
		z-index:1;
		-webkit-transition:all .5s ease;
		transition:all .5s ease;
		bottom:0px;
		overflow:hidden;
	}
	
	
	.imgDescDiv2{
		width:100%;
		height:50px;
		padding:10px;
		color:#ffffff;
		background:#F2CB61;
		position:absolute;
		bottom:0px;
	}
	
	.imgBoxDiv2:hover .imgDiv2{
		bottom:60px;
	}
	
	.imgBoxDiv3{
		width:300px;
		height:300px;
		position:relative;
		overflow:hidden;
		box-shadow: 2px 2px 8px 0px #000;
		margin-left:30px;
		display:inline-block;
	}
	
	.imgDiv3{
		width:100%;
		height:100%;
		position:absolute;
		background:lightblue;
		z-index:1;
		-webkit-transition:all .5s ease;
		transition:all .5s ease;
		bottom:0px;
		overflow:hidden;
	}
	
	
	.imgDescDiv3{
		width:100%;
		height:50px;
		padding:10px;
		color:#ffffff;
		background:#F2CB61;
		position:absolute;
		bottom:0px;
	}
	
	.imgBoxDiv3:hover .imgDiv3{
		bottom:60px;
	}
	




</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/> 


<div id="page-wrap">
<c:url var="sumSales" value="sumSales.do"/>
<c:url var="yearSales" value="yearSales.do"/>
<c:url var="rTypeSales" value="rTypeSales.do"/>

<div class="imgBoxDiv">
	<div class="imgDiv"><img id="image" src="resources/images/111.jpg" style="width:300px; height:300px;"/></div>
	<div class="imgDescDiv"><a href="${sumSales }">2019년 월간 매출</a></div>
</div>

<div class="imgBoxDiv2">
<div class="imgDiv2"><img id="image" src="resources/images/222.jpg" style="width:300px; height:300px;"/></div>
	<div class="imgDescDiv2"><a href="${yearSales }">연간 매출</a></div>
</div>

<div class="imgBoxDiv3">
<div class="imgDiv3"><img id="image" src="resources/images/333.jpg" style="width:300px; height:300px;"/></div>
	<div class="imgDescDiv3"><a href="${rTypeSales }">룸 타입 별 매출</a></div>
</div>


</div>


</body>
</html>