<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>

@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100)
	;

body {
	font-family: "Roboto", helvetica, arial, sans-serif;
	font-weight: 400;
	text-rendering: optimizeLegibility;
}
/*************** 탭 메뉴 관련 css ***************/
.tabmenu{ 
  max-width:600px; 
  position:relative; 
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input ~ label{
	cursor:pointer;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
/** 탭 메뉴 호버 상태 유지  **/
.btnCon.btn.small.hovered { color:#fff; border-color:#8a7057; background:#8a7057;}
.btnOptionClose {
  border:none;
  width:18px; 
  height:18px; 
  font-size:0; 
  background:url('../hotelDelLuna/resources/pcPub/static/images/reservation/btn_option_close.png')   no-repeat;
  cursor:pointer;
 }
 
 

</style>
</head>
<body>
<div id="main">
 <jsp:include page="../common/menubar.jsp"/>
	<!-- 섹션 영역 -->
	<section id="container">	
	<div class="reservationWrap">
		<div class="tabmenu">
			<ul>
				<li id="tab1" class="btnCon btn small"> 
					<input type="radio" name="tabmenu" id="tabmenu1" onclick="tabMenuCheck()"> 
					<label for="tabmenu1">테이블</label> 
					
				</li>
				<li id="tab1" class="btnCon btn small"> 
					<input type="radio" name="tabmenu" id="tabmenu2" onclick="tabMenuCheck()"> 
					<label for="tabmenu2">달력</label> 

				</li>
			</ul>
		</div>
		<div id="entireRes">
			<c:import url="entireResView.jsp"/>
		</div>
		<div id="calendarRes" hidden="true">
			<c:import url="calendarResView.jsp"/>
		</div>		
	</div>
	</section>
</div>
</body>

<script>

// 탭 메뉴 체크시 변경 기능
function tabMenuCheck(){
	
	for(var i=0;i<$("input[name=tabmenu]").length;i++){
		console.log($("input[name=tabmenu]").eq(i).prop("checked"));
		if($("input[name=tabmenu]").eq(i).prop("checked")==true){
		 $("input[name=tabmenu]").eq(i).parent().toggleClass("hovered");
		 /** 달력 메뉴일 때 **/
		 if(i==1)
		 {
			 $("#entireRes").prop("hidden",true);	
			 $("#calendarRes").prop("hidden",false);

		 }else{
			 $("#entireRes").prop("hidden",false);	
			 $("#calendarRes").prop("hidden",true); 
		 }
		}else{
		 $("input[name=tabmenu]").eq(i).parent().removeClass("hovered");
		}
	}
}	
</script>
</html>