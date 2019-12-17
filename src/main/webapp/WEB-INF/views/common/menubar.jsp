<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>

</head>
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 		<script src="/resources/resource/front/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script> -->
		<script src="resources/common/component/jquery-upload-file/js/file_handlers.js"></script>
		<script src="resources/common/js/check.js"></script>
		<script src="resources/common/js/form.js"></script>
		<script src="resources/common/js/string.js"></script>
 		<script src="resources/common/js/common.js"></script>
 
		<!-- S : 1-2 js -->	
		<script type="text/javascript" src="resources/pcPub/static/js/common.js"></script>
		<script src="resources/common/component/jquery-session/jquery.session.js"></script>
		
		<!-- S : 1-2 css -->
		<link href="resources/pcPub/static/css/reset.css" rel="stylesheet" />	
		<link href="resources/pcPub/static/css/common.css" rel="stylesheet" />
		<link href="resources/pcPub/static/css/contents.css" rel="stylesheet" />
		
		<script type="text/javascript" src="resources/pcPub/static/js/ui.js"></script>
		<script src="resources/front/js/front.js"></script>
		
	<!-- <link href="resources/pcPub/static/css/lib/swiper2.css" rel="stylesheet"/>  -->
<body>

<div id="main">

<header id="headerWrap">
   <h1 style="margin-left:90px"><a href="index.jsp">HOTEL DELLUNA</a></h1>
   <nav class="gnb">
      <ul>
         <li>
            <a href="#">introduce</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="hotelDelLunar.do"><span>INTRODUCTION</span>소개</a></h2>
                  <ul>
                     <li><a href="instruction.do">호텔 소개</a></li>
                     <li><a href="location.do">오시는 길</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">hotels</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="overView.do"><span>DELLUNA</span>객실안내</a></h2>
                  <ul>
	                  <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="superior"/>
	                  </c:url>
	                     <li class="on"><a href="${roomView }">슈페리어</a></li>
	                    <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="superior_terrace"/>
	                  </c:url>
	                     <li><a href="${roomView }">슈페리어 테라스</a></li>
	                  </ul>
               </div>
               <div>
               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
	               <ul>
	                  <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="deluxe"/>
	                  </c:url>
                     <li class="on"><a href="${roomView }">디럭스</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="grand_deluxe"/>
	                  </c:url>
                     <li><a href="${roomView }">그랜드 디럭스</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="premium_deluxe"/>
	                  </c:url>
                     <li><a href="${roomView }">프리미엄 디럭스</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="premium_deluxe_terrace"/>
	                  </c:url>
                     <li><a href="${roomView }">프리미엄 디럭스 테라스</a></li>
                  </ul>	
               </div>
               <div>
               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
	               <ul>
	                  <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="junior_suite"/>
	                  </c:url>
                     <li class="on"><a href="${roomView }">주니어 스위트</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="deluxe_suite"/>
	                  </c:url>
                     <li><a href="${roomView }">디럭스 스위트</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="grand_deluxe_suite"/>
	                  </c:url>
                     <li><a href="${roomView }">그랜드 디럭스 스위트</a></li>
                     <c:url var="roomView" value="roomView.do">
	                  	<c:param name="type" value="royal_suite"/>
	                  </c:url>
                     <li><a href="${roomView }">로열 스위트</a></li>
                  </ul>	
               </div>
            </div>
         </li>   
         <li>
            <a href="#">entertainment</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="#"><span>entertainment</span>즐길거리</a></h2>
                  <ul>
                     <li class="on"><a href="facility.do">부대시설</a></li>
                     <li><a href="casino.do">CASINO</a></li>
                     <li><a href="plaza.do">PLAZA</a></li>
                     <li><a href="around.do">주변 즐길거리</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">dine &amp; drink</a>
            <div class="gnbDepth2">
               <div>
                  <c:url var="dining" value="dining.do">
	                  	<c:param name="CATE" value="dining"/>
	                  </c:url>
                  <h2><a href="${dining }"><span>dine &amp; drink</span>다이닝</a></h2>
                  <ul>
                     <c:url var="dining" value="dining.do">
	                  	<c:param name="CATE" value="restaurant"/>
	                  </c:url>
                     <li><a href="${dining }">RESTRAUNT</a></li>
                        <c:url var="dining" value="dining.do">
	                  	<c:param name="CATE" value="cafe"/>
	                  </c:url>
                     <li><a href="${dining }">DRINK &amp; BAR</a></li>
                  </ul>
               </div>
            </div>
         </li>
         <li>
            <a href="#">service center</a>
            <div class="gnbDepth2">
               <div>
                  <h2><a href="support.do"><span>Service Center</span>고객센터</a></h2>
                  <ul>
                     <c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 2}">
                     	<li><a href="noticeListA.do">공지사항</a></li>
                     	<li><a href="allinquiry.do">1:1문의</a></li>
                     </c:if>
                     <c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 1 || empty sessionScope.loginUser}">
                     	<li><a href="noticeList.do">공지사항</a></li>
                     	<li><a href="minquiry.do">1:1문의</a></li>
                     </c:if>
                  </ul>
               </div>
            </div>
         </li>
         <li>
				<a href="entireResList.do">관리자 페이지</a>
				<div class="gnbDepth2">
					<div>
						<h2><a href="#"><span>Admin page</span>관리자 페이지</a></h2>
						<ul>
							<li><a href="iRoomtypeView.do">방 등록</a></li>
							<li><a href="roomstatus.do">방 상태</a></li>
						</ul>
					</div>
					<div>
	               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
	               	<h2>&nbsp;<span>&nbsp;</span>&nbsp;&nbsp;</h2>
		               <ul>
	                     <li><a href="entireResList.do">예약 내역 관리</a></li>
	                  </ul>	
	               </div>
				</div>
			</li>
      </ul>
   </nav>
   
   <div class="topLink">
      <div class="more">
         <a href="#" class="topMore">LANGUAGE</a>
         <ul>
            <li><a href="#">KR</a></li>
            <li><a href="#">EN</a></li>

         </ul>
      </div>

   <!------------------------ 언어 선택 부분 ------------------------>
   
   <!--       
      <div class="language">
         <a href="#">         
      
         KR

         </a>
      </div> 
   -->
   <!----------------------- //언어 선택 부분 ------------------------>
   </div>
   
   <div class="bgDepth"></div>
</header>
 <c:if test="${sessionScope.loginUser.userId eq 'admin'}">
 	<!-- 관리자 로그인 시 띄울 메뉴 설정할 부분 -->
 	
 </c:if>
<!-- quick Bar 퀵메뉴 퀵 메뉴 -->
<aside class="quickBar view">
   <div class="quickH">
      <a href="#">
         <h1><img src="resources/pcPub/static/images/common/Reservation_icon_100.png" />reservation</h1>
         <p>호텔 델루나의 시설과 <br />상품을 한번에 예약하세요.</p>
<!--          <span class="newCount">99</span> : PC는 갯수 불요-->
      </a>
   </div>
   <div class="quickC">
      <ul>
      <%--    <c:url var="entireResList" value="entireResList.do"/>
       --%>
        	<c:if test="${ empty sessionScope.loginUser }">
				<li><a href="loginForm.do"><em class="icon1"><i></i></em><p>Login</p></a></li>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<li><a href="logout.do"><em class="icon1"><i></i></em><p>Logout</p></a></li>
			</c:if>
			<c:if test="${ empty sessionScope.loginUser }">
				<li><a href="mjoin.do"><em class="icon2"><i></i></em><p><span>HOTEL</span>JOIN US</p></a></li>
			</c:if>
			<c:if test="${ empty sessionScope.loginUser }">
				<li><a href="void(0);" onclick="alert('로그인 후 이용해 주세요');return false;"><em class="icon3"><i></i></em><p><span>MEMBER</span>MY PAGE</p></a></li>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser and empty loginUser.kakao}">
				<li><a href="mconfirm.do"><em class="icon3"><i></i></em><p><span>MEMBER</span>MY PAGE</p></a></li>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser and !empty loginUser.kakao}">
				<li><a href="mypage.do"><em class="icon3"><i></i></em><p><span>MEMBER</span>MY PAGE</p></a></li>
			</c:if>
         <li><a href="#"><em class="icon4"><i></i></em><p><span>RESERVATION</span>MY RESERVATION</p></a></li>
         <li><a href="#"><em class="icon5"><i></i></em><p><span>MAP</span>DELLUNA MAP</p></a></li>
         <c:if test="${ empty sessionScope.loginUser }">
         	<li><a id="pppop" href="#poppop" class="layerPopOpen"><em class="icon9"><i></i></em><p><span>INQUIRY</span>1:1문의</p></a></li>
         </c:if>
         <c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 2}">
         	<li><a href="allinquiry.do"><em class="icon9"><i></i></em><p><span>INQUIRY</span>1:1문의</p></a></li>
         </c:if>
         <c:if test="${ !empty sessionScope.loginUser and loginUser.userT eq 1}">
         	<li><a href="minquiry.do"><em class="icon9"><i></i></em><p><span>INQUIRY</span>1:1문의</p></a></li>
         </c:if>
      </ul>
   </div>
</aside>
<script language="JavaScript">

// 스와이프 관련 오류 해결. 나중에 지울 것
/* 
$(document).ready(function(){
	
	//메인 갤러리 선언
	var galleryMain = new Swiper('.gallery-main', {
		preventClicks: false,
		preventClicksPropagation: false,
		slideToClickedSlide: true,
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev'
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'fraction',
		}
	});
});

 */
$(window).load(function(){
	if ($(".quickBar").length > 0) {
		setTimeout(function() {
			$(".quickBar").removeClass("view");
		}, 100);
	}
	
	
});

</script>

<!-- //quick Bar -->

</div>

<script>
var title1 = "비회원 1:1 문의";

$(window).load(function(){
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$("#pppop").click(function(){
    // 팝업 제목 설정
    $(".popHeaderInq").text(title1);
    
    $("#PI_VOC_CN").val("");   //에러 발생 시 에러 메시지 출력칸
})

// 1:1 문의 submit 함수
function jsSave() {
    
    rtn = $("#nminquiry").validate();
    
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
    
    $("#PI_REG_EMPNO").val($("#PI_CUST_NM1").val());
    // 로딩
    fullLoding($("#container"));
    
    $("#nminquiry").submit();
}

</script>

<div class="layerPopWrap normalLayer" id="poppop">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
        <h1 class="popHeader popHeaderInq"></h1>
        <div class="inquiryPopCont">
        <p>회원가입을 하시면 좀 더 편리하게 문의 및 내역 확인을 하실 수 있습니다.</p>
            <form action="sendinquiry.do" method="post" id="nminquiry" name="form_inquiry">
                <div class="formInquiryWrap">
                    <dl class="title">
                        <dt>
                            <label for="iTitle">제목 <span class="color">*</span></label>
                            <p class="imp"><span class="color">*</span> 필수 입력 항목</p>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" name="iTitle" required title="제목">
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="iContent">내용 <span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" name="iContent" required title="내용"></textarea>
                        </dd>
                    </dl>
                    <div class="clearFixed">
                        <dl class="name">
                            <dt><label for="PI_CUST_NM1">이름 <span class="color">*</span></label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="text" id="PI_CUST_NM1" name="PI_CUST_NM" required title="이름">
                                </div>
                                
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>
                            </dd>
                        </dl>
                        <dl class="pwd">
                            <dt><label for="EMAIL">이메일 <span class="color">*</span></label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="email" class="inqEmailValidation" name="EMAIL" required title="이메일">
                                </div>
                                <div class="errorText">
                                    <!-- 에러 메시지 -->
                                </div>  
                            </dd>
                        </dl>
                    </div>
                    <dl class="phone">
                        
                        <dt><label for="TEL1">휴대폰 번호 <span class="color">*</span></label></dt>
                        <dd>
                            <select class="selectBox" id="TEL1" name="TEL1" required title="핸드폰 첫째자리 선택" >
                                <option value="010">010</option>
                                <option value="011" >011</option>
                                <option value="016" >016</option>
                                <option value="017" >017</option>
                                <option value="018" >018</option>
                                <option value="019" >019</option>
                            </select>
                            <div class="inp">
                                <input type="tel" id="TEL2" name="TEL2" required onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 가운데자리 입력" maxlength="4">
                            </div>
                            <span>-</span>
                            <div class="inp">
                                <input type="tel" id="TEL3" name="TEL3" required onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 끝자리 입력" maxlength="4">
                            </div>
                        
                            <div class="errorText">
                                <!-- 에러 메시지 -->
                            </div>
                        </dd>
                    </dl>
               </div>
            </form>
            
            <div class="btnGroup">
                <a href="javascript:jsSave();" class="btn btnFull small"><span>메일 전송</span></a>
            </div>
        </div>
        <a href="#" class="layerPopClose btnPopClose" style="background: url('resources/pcPub/static/images/common/btn/btn_pop_close.png') no-repeat;">레이어 팝업 닫기</a>
    </div>
</div>


</body>

</html>