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


#ab {
  transition: .3s;
  background-position: top left;
  background-image: url(http://www.blueb.co.kr/SRC2/_image/linkbg.png);
  color: #fff;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  position: relative;
  display: inline-block;
  white-space: nowrap;
  
}


#ab:before {
  position: absolute;
  content: '';
  background: #4A90E2;
  left: 0;
  right: 0;
  bottom: -3px;
  height: 5px;
  transition: .3s .1s;
  
}
#ab:hover {
  transition: .6s .1s;
  background-position: bottom right;
  font-size:36px;
}
#ab:hover:before {
  transition: .3s;
  transform: translateY(-100%) scaleY(0);
  opacity: 0;
}
#left {
	position:relative;
	left:300px;
	top:70px;
	width:500px;
	height:400px;
	margin:300px 0px;
	text-align:center;	
	
	
}


#b li{
	float:left;
	display:block;
	position:relative;
	width:220px;
	height:90px;
	margin-right:100px;
}

#b li:before{
	border-radius: 12px;
	box-shadow: 1px 1px 1px rgba(255,255,255,0.7) inset, 0 0 5px 1px
	rgba(0,0,0,0.2);
	content: "";
	position:absolute;
	top:-12px;
	right:-12px;
	width:24px;
	height:24px;
	z-index:30;
}

#b li:nth-child(1):before{
	background:#cc0000;
}
#b li:nth-child(2):before{
	background:#335599;
}
#b li:nth-child(3):before{
	background:#e6e600;
}

#b li div:before{
	display:inline-block;
	content:"";
	height:100%;
	vertical-align:middle;
}

#b li div{
	position:absolute;
	height:70px;
	width:200px;
	display:block;
	position:absolute;
	top:0;
	border-radius:50px 0 50px 0;
	box-shadow: 0 0 10px 5px #fff inset;
	-webkit-transform-origin: 98% 0;
	transform-origin:98% 0;
	-webkit-transition: all 0.5s ease-out;
	transition:all 0.5s ease-out;
}


#b li:nth-child(1) div{
	border: 10px solid #cc0000;
	background:#cc0000;
	color:#f7f7f7;
}

#b li:nth-child(2) div{
	border:10px solid #335599;
	background:#335599;
	color:#f7f7f7;
}

#b li:nth-child(3) div{
	border:10px solid #e6e600;
	background:#e6e600;
	color:#f7f7f7;
}

#b li:hover div{
	-webkit-transform:rotate(-80deg);
	transform:rotate(-80deg);
	z-index:10;
}

span:before{
	display:inline-block;
	content:"";
	height:100%;
	vertical-align:middle;
}

span{
	display:inline-block;
	height:100%;
	vertical-align:middle;
	font-size:30px;
	font-weight:bold;	
}

#b li p:before{
	display:inline-block;
	content:"";
	height:100%;
	vertical-align:middle;
}

#b li p{
	display:inline-block;
	vertical-align:middle;
	border: 10px solid #ffffff;
	border-radius: 50px 0 50px 0;
	box-shadow: 0 0 7px rgba(0,0,0,0.2);
	color:#ffffff;
	text-align:center;
	text-shadow:1px 1px 0 rgba(0,0,0,0.5);
	width:180px;
	height:50px;
	padding:10px;
}

#b li:nth-child(1) p{
	background:#cc0000;
}

#b li:nth-child(2) p{
	background:#335599;
}

#b li:nth-child(3) p{
	background:#e6e600;
}




</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/> 


<div id="page-wrap">
<c:url var="sumSales" value="sumSales.do"/>
<c:url var="yearSales" value="yearSales.do"/>
<c:url var="rTypeSales" value="rTypeSales.do"/>
<div id="left">
	<ul id="b">
		<li>
			<div id="a">
				<span>2019년 월간 매출</span>
			</div>
				<a href="${sumSales}"><p>확인하러 가기</p></a>
		</li>
	
		<li>
			<div id="a">
				<span>연간 매출</span>
			</div>
				<a href="${yearSales }"><p>확인하러 가기</p></a>
		</li>
		
		<li>
			<div id="a">
				<span>룸 타입별 매출</span>
			</div>
			<a href="${rTypeSales }"><p>확인하러 가기</a>
		</li>
	</ul>
</div>


</div>


</body>
</html>