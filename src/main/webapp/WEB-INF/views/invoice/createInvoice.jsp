<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL DELLUNA INVOICE</title>

<script type='text/javascript' src='resources/invoice/js/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='resources/invoice/js/example.js'></script>
<style >

	@media print{
		#noPrint{
			display:none;
		}
	}
	 * { 
	margin: 0; 
	padding: 0; 
	} 
	#page-wrap { width: 1000px; margin: 0 auto; }
	body { 
	font: 14px/1.4 Georgia; 
	font-family:sans-serif;
	}
	
	#title{
		margin-top : 25px;
	}

	#logo { 
		text-align: right;
		 float: right;
		 position: relative;
		 margin-top: 10px; 
		 border: 1px solid #fff; 
		 max-width: 540px; 
		 max-height: 100px; 
		 overflow: hidden; 
		 }
	#customer{
	float:left;
	position:relative;
	left:20%;
	margin-top:15px;
	font-size:16px;
	}
	#company{
	float:left;
	position:relative;
	margin-top:15px;
	font-size:16px;
	}
	p{
		margin-top:10px;
		font:bold, Georgia;
		font-size:14px;
		font-family:sans-serif;
		
	}
	#name{
	font-size:18px;
	}
	
	table {
		text-align:left;
		border-top: 0;
		border-collapse: collaps;
		border-style:hidden;
		border-spacing:0;
		width:100%;
	}
	th, td {
		border-bottom: 0;
		padding : 10px;
		
	}
	th{
		background-color:black;
		color:white;
		font-family:sans-serif;
	}
	td{
		background-color:#e3e6e8;
		font-family:sans-serif;
	}
	#iv{
		margin-top:200px;
	}
	
	#note{
		margin-top:30px;
		font-size:21px;
	}
	
	textarea { 
	margin-top:20px;
	border: 0;  
	width:460px; 
	resize:none;}
	
	#total{
	float:right;
	margin-top:30px;
	font-size:21px;
	}
	
</style>
</head>
<body>

<div id="page-wrap">

<div id="title">
<h1>I N V O I C E</h1>
</div>
<div id="logo">
	 <img id="image" src="resources/invoice/images/delluna.png" alt="logo" width="300px" height="100px" />
</div>

<div id="company">
	<h5>FROM</h5>
	<p id="name">Hotel DELLUNA<br></p>
	<p>
		서울 특별시 강남구 역삼동<br>
		남도빌딩 3층<br>
		연락처 : 010-4827-4910<br>
		hchh1016@gmail.com</p>
</div>

<div id="customer">
	<h5>TO</h5>
	<p id="name">${invoice.userName } <br></p>
	<p>	
		${invoice.userPhone } <br>
		${invoice.userEmail }</p>
</div>

<div id="iv">
	<p>
	INVOICE# : INV${invoice.ivId }<br>
	Date : ${invoice.ckinDate}<br>
	</p>
	
	
</div>
<br>
<hr>
<br>
<table id="ivtable" >

<tr>
	<th colspan="5">룸 타입</th>
	<th>가격</th>
	<th>인원</th>
	<th>총가격</th>
</tr>

<tr>
	<td>
	<c:choose>
	<c:when test="${invoice.rType == '1' }">
	Single Room<br>Non-Smoking
	</c:when>
	<c:when test="${invoice.rType== '2' }">
	Single Room<br>Smoking
	</c:when>
	<c:when test="${invoice.rType== '3' }">
	Double Room<br>Non-Smoking
	</c:when>
	<c:when test="${invoice.rType=='4' }">
	Double Room<br>Smoking
	</c:when>
	<c:when test="${invoice.rType=='5' }">
	Twin Room<br>Non-Smoking
	</c:when>
	<c:when test="${invoice.rType=='6' }">
	Twin Room<br>Smoking
	</c:when>
	<c:otherwise>
	룸타입이 선택되지 않았습니다.
	</c:otherwise>
	</c:choose>
	</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td>${invoice.price }원</td>
	<td>${invoice.quantity }명</td>
	<td>${invoice.totalPrice }원</td>
</tr>
</table>


<div id="total">
Total &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${invoice.totalPrice }원

</div>

<div id="note">
	NOTES<br>
	<textarea>환불은 예약일로부터 30 일 이내 90%, 15 일 이내 70%, 7 일 이내 60%, 체크인 전날까진 50%, 당일 환불은 불가능합니다 .</textarea>
</div>








</div>


<div id="noPrint">
<input type="button" value="Print" onclick="window.print()" id="print"/>
</div>

</body>
</html>