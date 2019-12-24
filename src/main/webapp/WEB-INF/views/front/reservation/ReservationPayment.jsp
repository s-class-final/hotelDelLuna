<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제정보 입력하기</title>
</head>
	<script src="resources/pcPub/static/js/slick.min.js"></script>
	
	<link href="resources/pcPub/static/css/slick-theme.css" rel="stylesheet" />
	<link href="resources/pcPub/static/css/slick.css" rel="stylesheet" />

<style>

#pTotal {
    display: inline-block;
    width: 100%;
    height: 48px;
    border: 1px solid #e6e3df;
    padding: 0 39px 0 15px;
    line-height: 48px;
    font-size: 15px;
    }
    
.meal {
    position: relative;
    padding: 40px 0;
    border-top: 1px dotted #e6e3df;
	}
	
.meal .info {
    font-size: 12px;
    color: #666666;
    margin-left: 6px;

.requirement {
    position: relative;
    padding: 40px 0;
    border-top: 1px dotted #e6e3df;
	}
	
.requirement .info {
    font-size: 12px;
    color: #666666;
    margin-left: 6px;
    }
    
</style>

<script>
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();">
	<jsp:include page="../../common/menubar.jsp"/> 
	

	<!-- 컨텐츠 영역 -->
	<section id="container">
		<!-- reservationWrap -->
		<div class="reservationWrap">
	
			<!-- //우측메뉴 -->

			<div class="reservationBox">
				<div class="paymentWrap">
					<!-- 회원정보 -->
					<c:if test="${ empty sessionScope.loginUser }">
					<form id="resPayment" name="resPayment" method="post" action="ReservationTest.do">
					<div class="paymentForm clearFixed" id="paymentForm">
						<h2>회원 정보</h2>
						<p class="sub">예약 정보 관리와 예약자 확인을 위하여 아래의 필수 항목을 입력해주세요.</p>
						<p class="formImportant"><span class="color">*</span> 필수입력항목</p>
						<div class="clearFixed">
							<div class="left">
								
								<dl class="nameType1">
									<dt><label for="USER_NM">이름 <span class="color">*</span></label></dt>
									<dd>
										<div class="inp" style="width:180px;">
											<input type="text" id="lastName" name="lastName" value="" maxlength="50" placeholder="Last Name(성)" title="Last Name(성)" oninput="inputId();">
										</div>
										<div class="inp" style="width:180px;">
											<input type="text" id="firstName" name="firstName" value="" maxlength="50" placeholder="First Name(이름)" title="First Name(이름)" oninput="inputId();">
										</div>
										<input type="hidden" id="USER_NM" name="USER_NM" required value="" maxlength="20" title="이름">
										
										<div class="errorText"><!-- errorMsg --></div>
									</dd>
								</dl>
							</div>
							<div class="right">
								<dl class="phone">
									<dt><label for="Phone">휴대폰 번호<span class="color">*</span></label></dt>
									<dd>
										<select class="selectBox" id="USER_TEL1" name="USER_TEL1" required >
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<div class="inp" style="width:122px;">
											<input type="tel" id="USER_TEL2" name="USER_TEL2" value="" required maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대폰 가운데 자리">
											<button class="btnDelete"></button>
										</div>
										<span>-</span>
										<div class="inp" style="width:122px;">
											<input type="tel" id="USER_TEL3" name="USER_TEL3" value="" required maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대폰 끝 자리">
											<button class="btnDelete"></button>
										</div>
										<div class="errorText"></div>
									</dd>
								</dl>
								
							</div>
						</div>
						<div>
							<dl class="email">
								<dt><label for="USER_EMAIL">이메일 <span class="color">*</span></label></dt>
								<dd>
									<div class="inp">
										<input type="text" id="USER_EMAIL" name="USER_EMAIL" required value="" placeholder="" title="이메일">
										<button class="btnDelete"></button>
									</div>
									<div class="errorText"></div>
								</dd>
							</dl>
							
							<dl class="request">
								<dt><label>요청사항</label></dt>
								<dd>
									<div class="inp">
										<textarea id="requireText" id="USER_REQUIRE" name="USER_REQUIRE" value="" placeholder="" title="요청사항" style="resize: none; width:100%; height:100%;"></textarea>
										<button class="btnDelete"></button>
									</div>
									<div class="errorText"></div>
								</dd>
							</dl>
						</div>
					</div>
					</form>
					</c:if>
					
					<c:if test="${ !empty sessionScope.loginUser }">
					<form id="form1" name="form1" method="post" action="ReservationTest.do">
					<div class="paymentForm clearFixed" id="paymentForm">
						<h2>회원 정보</h2>
						<p class="sub">예약 정보 관리와 예약자 확인을 위하여 아래의 필수 항목을 입력해주세요.</p>
						<p class="formImportant"><span class="color">*</span> 필수입력항목</p>
						<div class="clearFixed">
							<div class="left">
								
								<dl class="nameType1">
									<dt><label for="USER_NM">이름 <span class="color">*</span></label></dt>
									<dd>
										<c:forTokens var="userName" items="${loginUser.userName}" delims=" " varStatus="status">
											<c:if test="${status.index eq 0}">
												<div class="inp" style="width:180px;">
													<input type="text" id="lastName" name="lastName" value="${userName}" maxlength="50" placeholder="Last Name(성)" title="Last Name(성)">
												</div>
											</c:if>
											<c:if test="${status.index eq 1}">
												<div class="inp" style="width:180px;">
													<input type="text" id="firstName" name="firstName" value="${userName}" maxlength="50" placeholder="First Name(이름)" title="First Name(이름)">
												</div>
											</c:if>
										</c:forTokens>
										<input type="hidden" id="USER_NM" name="USER_NM" required value="" maxlength="20" title="이름">
										<div class="errorText"><!-- errorMsg --></div>
									</dd>
								</dl>
							</div>
							<div class="right">
								<dl class="phone">
									<dt><label for="Phone">휴대폰 번호<span class="color">*</span></label></dt>
									<dd>
										<c:forTokens var="userPhone" items="${loginUser.userPhone}" delims="-" varStatus="status">
										<c:if test="${status.index eq 0}">
										<select class="selectBox" id="USER_TEL1" name="USER_TEL1" required >
											<c:if test="${userPhone eq 010}">
												<option value = "010" selected>010</option>
												<option value = "011">011</option>
												<option value = "016">016</option>
												<option value = "017">017</option>
												<option value = "019">019</option>
											</c:if>
											<c:if test="${userPhone eq 011}">
												<option value = "010">010</option>
												<option value = "011" selected>011</option>
												<option value = "016">016</option>
												<option value = "017">017</option>
												<option value = "019">019</option>
											</c:if>
											<c:if test="${userPhone eq 016}">
												<option value = "010">010</option>
												<option value = "011">011</option>
												<option value = "016" selected>016</option>
												<option value = "017">017</option>
												<option value = "019">019</option>
											</c:if>
											<c:if test="${userPhone eq 017}">
												<option value = "010">010</option>
												<option value = "011">011</option>
												<option value = "016">016</option>
												<option value = "017" selected>017</option>
												<option value = "019">019</option>
											</c:if>
											<c:if test="${userPhone eq 019}">
												<option value = "010">010</option>
												<option value = "011">011</option>
												<option value = "016">016</option>
												<option value = "017">017</option>
												<option value = "019" selected>019</option>
											</c:if>
										</select>
										</c:if>
										<c:if test="${status.index eq 1}">
											<div class="inp" style="width:122px;">
												<input type="tel" id="USER_TEL2" name="USER_TEL2" value="${userPhone}" required maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대폰 가운데 자리">
												<button class="btnDelete"></button>
											</div>
											<span>-</span>
										</c:if>
										<c:if test="${status.index eq 2}">
											<div class="inp" style="width:122px;">
												<input type="tel" id="USER_TEL3" name="USER_TEL3" value="${userPhone}" required maxlength="4" placeholder="" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="휴대폰 끝 자리">
												<button class="btnDelete"></button>
											</div>
											<div class="errorText"></div>
										</c:if>
										</c:forTokens>
									</dd>
								</dl>
								
							</div>
						</div>
						<div>
							<dl class="email">
								<dt><label for="USER_EMAIL">이메일 <span class="color">*</span></label></dt>
								<dd>
									<div class="inp">
										<input type="text" id="USER_EMAIL" name="USER_EMAIL" required value="${loginUser.userId}" placeholder="" title="이메일">
										<button class="btnDelete"></button>
									</div>
									<div class="errorText"></div>
								</dd>
							</dl>
							
							<dl class="request">
								<dt><label>요청사항</label></dt>
								<dd>
									<div class="inp">
										<textarea id="requireText" id="USER_REQUIRE" name="USER_REQUIRE" value="" placeholder="" title="요청사항" style="resize: none; width:100%; height:100%;"></textarea>
										<button class="btnDelete"></button>
									</div>
									<div class="errorText"></div>
								</dd>
							</dl>
						</div>
					</div>
					</form>
					</c:if>
					<!-- //회원정보 -->
	
					<!-- 보유 멤버십 + 할인정보 -->
					
	
					<!-- 포인트 -->
					
					<!-- //포인트 -->
	
					<!-- 결제방법 -->
					<div class="paymentOption clearFixed" id="paymentOption">
						
						<h2>결제 방법</h2>
						<div class="clearFixed">
							<div class="radioBox">
								<input type="radio" id="PAYMENT_TYPE1" name="PAYMENT_TYPE" value="11"><label for="PAYMENT_TYPE1">신용카드</label>
							</div>
							<div class="radioBox">
								<input type="radio" id="PAYMENT_TYPE2" name="PAYMENT_TYPE" value="21"><label for="PAYMENT_TYPE2">실시간 계좌이체</label>
							</div>
						</div>
						
						
					</div>
					<!-- //결제방법 -->
	
					<!-- 약관동의 -->
					<div class="paymentTerm clearFixed">
						<h2>약관 동의</h2>
						<div class="termArea">
							<div>
								<h3>개인정보 수집 및 이용에 대한 동의<span class="txtRed">(필수)</span></h3>
								<!-- <div class="termTxt" tabindex="0">개인정보 수집 및 이용에 대한 동의 문구</div> -->
								
								<!-- 1. 개인정보 필수적 수집 및 이용에 대한 동의 -->
								<div class="termTxt" tabindex="0">
								    <p class="title1">파라다이스시티는 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.</p>
								    <p class="title1">[개인정보 수집 및 이용 동의]</p>
								    <ul class="termListNum">
								        <li>1. 수집 및 이용 목적 : 회원제 서비스에 따른 본인 확인 절차, 고객 공지 사항 전달 및 불만 처리 등</li>
								        <li>2. 수집 항목
								            <ul class="termListDash">
								                <li>필수항목 : 아이디, 비밀번호, 이름, 생년월일, 휴대폰번호, Email</li>
								                <li>선택항목 : 주소, 직업, 결혼기념일, 관심 시설, 관심 분야</li>
								            </ul>
								        </li>
								        <li>3. 개인정보 휴면처리 회원의 개인정보 이용 기준에 대한 유효기간을 아래와 같이 정하며, 최종 이용 시점을 기산일로 하여 유효기간 경과 이후 회원의 개인정보를 분리 저장/관리 또는 파기합니다.
								            <ul class="termListNum">
								                <li>1) 유효기간: 1년</li>
								                <li>2) 서비스 이용 기준: 멤버십 서비스 이용(회원인증, 홈페이지 로그인, 포인트 조회, 포인트 적립, 포인트 사용, 포인트 조정, 포인트 전환 등), 카드 발급, 호텔 상품 및 서비스 구매, 정보 변경 등</li>
								                <li>3) 유효기간 경과 이후: 분리 저장 및 관리 <br>가. 분리 저장 및 관리: 파기에 준하는 조치의 일환으로, 장기 미 이용자의 개인정보를 일반회원의 개인정보 DB와 분리하여 별도 저장/관리하고, 일반 직원의 접근 권한을 제한합니다.<br />나. 유효기간 도래 통지: 유효기간 만료 30일 전까지 e-mail, SMS 등으로 개인정보가 파기 또는 분리 및 보관되는 사실 및 일시, 개인정보 항목을 해당 회원에게 통지합니다.<br />다. 유효기간 경과 이후 회원이 멤버십 서비스를 이용할 경우, 이를 재이용 요청으로 간주하여 분리 저장/관리 상태에서 정상 이용 상태로 원복합니다.</li>
								                <li></li>
								            </ul>
								        </li>
								        <li>4. 개인정보 보유 기간 및 파기시점 회원의 개인정보는 개인정보처리방침 제 2조 개인정보 수집 및 이용 목적의 보유기간이 달성되거나, 고객이 별도 요청할 경우 파기하는 것을 원칙으로 합니다. 다만 아래의 경우 관련 근거에 의해 개인 정보를 보존합니다.
								            <ul class="termListDash">
								                <li>보유ㆍ이용 기간: 상거래이력</li>
								                <li>보존 근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률</li>
								                <li>보존기간 <br>ㆍ계약 또는 청약 철회 등에 관한 기록 : 5년<br />ㆍ소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래 등의 소비자 보호에 관한 법률)<br />ㆍ신용정보의 수집처리 및 이용 등에 관한 기록: 3년(신용정보의 이용 및 보호에 관한 법률)<br />ㆍ요금의 과납 또는 미납이 있을 경우와 분쟁이 있을 경우 해결시 까지 보유합니다. <br>ㆍ소송이나 법적 분쟁 관련 사항의 근거 자료에 관한 기록: 10년</li>
								            </ul>
								        </li>
								        <li>5. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 회원가입에 제한이 있을 수 있음을 알려드립니다.</li>
								    </ul>
								</div>
								
								<div class="checkbox">
									<input type="checkbox" id="agree2" /><label for="agree2">동의합니다</label>
								</div>
							</div>
							<div>
								<h3>취소 환불 수수료에 관한 동의 <span class="txtRed">(필수)</span></h3>
								
								<!-- 11. 취소환불 규정 및 수수료 정책 -->                           
								<div class="termTxt" tabindex="0">
								    <p class="title1">파라다이스시티의 각 상품에 대한 취소/환불 규정 및 수수료 정책은 아래와 같습니다.</p>
								    <ul class="termListNum">
								        <li>1. 입장권/이용권의 취소/환불 규정 및 수수료 정책
								            <ul class="termListDash">
								                <li>씨메르, 크로마, 원더박스, 아트스페이스 등 시설의 입장권/이용권의 경우 이용 하루 전까지 (23시 59분) 취소가능하며 이 때 취소 수수료는 부과되지 않습니다.  </li>
								                <li>비투숙 결합상품(호텔을 제외한 여러개의 시설이 결합된 상품 또는 시설 내 여러 서비스를 결합하여 하나의 상품으로 구성/판매하는 상품)의 경우 입장권/이용권 취소/환불 규정 및 수수료 정책에 해당됩니다.</li>
								                <li>당일 취소는 불가하며 부득이한 취소 사유 발생 시 유선 연락 바랍니다. </li>
								                <li>단, 입장권/이용권과 타 혜택이 결합되어 하나의 상품으로 구성된 경우, 아래 2항의 정책에 따라 처리됩니다. </li>
								            </ul>
								        </li>
								        <li>2. 입장권/이용권을 제외한 상품의 취소/환불 규정 및 수수료 정책
								            <ul class="termListDash">
								                <li>호텔객실 포함 상품, 씨메르 카바나/선베드, 크로마 테이블 등의 취소 규정은 아래와 같습니다. 
								                    <ul class="termListNum">
								                        <li>ㆍ이용 예정일자 1일 전 15시 이전: 취소 수수료 없이 취소 가능</li>
								                        <li>ㆍ이용 예정일자 1일 전 15시 이후: 상품 요금의 50%를 수수료로 부과 (객실 포함 상품의 경우 1박 요금 기준) </li>
								                        <li>ㆍ홈페이지 상에서의 당일 취소는 불가 <br>단, 부득이한 사유로 인한 당일 취소 및 No-Show 발생 시 유선 연락 바라며 별도의 증빙 서류 미존재 시 상품 요금의 90%를 수수료로 부과합니다. (객실 포함 상품의 경우 1박 요금 기준) </li>
								                    </ul>
								                </li>
								                <li>크로마 테이블의 경우 홈페이지 예약 시 판매 금액의 20%를 예약금으로 결제하므로 홈페이지에서 결제된 금액을 기준으로 수수료율을 적용합니다. </li>
								                <li>홈페이지 내 수수료 부과는 취소수수료 결제 후 예약 시 결제한 금액을 전액 환불하는 순서로 진행됩니다. </li>
								            </ul>
								            <!-- 2019.10.07 [김병철] 환불 약정 변경 -->
								            <ul class="termListNum" style="font-style:italic;">
								                <li>※ 객실 투숙상품 취소규정이 2019년 12월 1일 투숙부터 아래와 같이 변경됩니다.
								                	<ul class="termListDash">
								                        <li>이용 예정일자 2일 전 15시 이전: 취소 수수료 없이 취소 가능</li>
								                        <li>이용 예정일자 2일 전 15시 이후~1일전 15시 이전: 상품 요금의 50%를 수수료로 부과</li>
								                        <li>이용 예정일자 1일 전 15시 이후: 홈페이지상에서의 취소는 불가</li>
								                    </ul>
								                </li>
								                <li>단, 부득이한 사유로 인한 당일 취소 및 No-Show 발생 시 유선 연락바라며 별도의 증빙서류 미존재 시 상품 요금의 100%의 수수료가 부과됩니다.</li>
								            </ul>
								            <!-- //2019.10.07 [김병철] 환불 약정 변경 -->
								        </li>
								        <li>3. 홈페이지를 통한 결제 상품에 대한 부분 취소 불가 안내
								            <ul class="termListDash">
								                <li>홈페이지를 통하여 2개 이상의 상품을 동시에 결제한 후에는 부분취소(결제한 상품 중 일부 취소) 및 변경이 불가합니다.</li>
								                <li>일부 상품의 취소 및 변경이 필요한 경우 일괄 취소 후 재결제를 원칙으로 합니다.</li>
								            </ul>
								        </li>
								        <li>4. 일부 얼리버드/프로모션 상품 및 그룹예약링크를 통한 별도 예약의 취소/환불 규정 및 수수료 정책은 상이할 수 있으며 이에 대한 상세한 내역은 상품 상세 페이지의 안내를 우선으로 합니다.</li>
								    </ul>
								</div>
								
								<div class="checkbox">
									<input type="checkbox" id="agree3" /><label for="agree3">동의합니다</label>
								</div>
							</div>
						</div>
					</div>
					<!-- //약관동의 -->
					
					
					<!-- 우측메뉴 -->
					<div class="reservationAside">
						<section class="reservationSection">
							<div class="productHeader">
								<h1>
									<span>Summary</span>
								</h1>
								<!-- <a href="javascript:jsAllDelFromCart();" class="btnDeleteAll">전체삭제</a> -->
							</div>
							
							<div class="productWrap mCustomScrollbar" data-mcs-theme="dark" style="height:380px;!important">
							<div class="productListBox">
								<article class="productItem">
									<div class="productListH">
										<h2>
											<span>상품명 : Hotel Delluna</span>
										</h2>
								
									</div>
									<div class="productListC">
										<h3 id="hotelName">HOTEL DELLUNA</h3>		
										<p id="checkInOut"> ${r.res_checkIn } ~ ${r.res_checkOut } </p>			
										<p id="total">성인 ${r.res_adult } / 어린이 ${r.res_child }</p>			
										<p id="room">${r.res_roomType }</p>	
										<p id="mealtext">조식 ${r.res_breakfast } / 석식 ${r.res_dinner }</p>
										<p id="res_addBed"></p>
										
									</div>
								</article>
							</div>
						</div>
							<div class="casyBox">
								<dl>
									<dt>
										총액
									</dt>
									<dd class="totalAmt">${r.res_allPay }원</dd>
								</dl>
							</div>	
							
							<button class="btn btnFull" type="button" onclick="javascript:valueChecker();">
								<span>상품 결제 하기</span>
							</button>
						</section>
					</div>
						
						
						<!-- 결제값 폼 있던 자리 -->		
					
				</div>
			</div>
			
		</div>
	</section>
	<!-- //컨텐츠 영역 -->
	
<style>
.pd0i{padding: 0px !important;}
p.astBefore{color: #999; font-size: 12px !important; margin-left: 12px;}
p.astBefore::before {content: "*"; left: 66px; position: absolute; top: 163px;}
.fs12p{font-size:12px;}
.fs13p{font-size:13px;}
.fs16p{font-size:16px;}
</style>
	
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">


	function setCookie(cname, cvalue, exdays) {
	    console.log("overiding setCookie Pc");
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+d.toUTCString();
	    document.cookie = cname + "=" + cvalue + "; " + expires;
	}

	//결제하기 버튼 클릭시 값 체크
	function valueChecker() {
		
		$("dd").removeClass("error");
		
		//값이 입력되지 않은 필수 입력 항목에 대해
		var requireChk = checkFormRequired();
		if(!isNullOrEmpty(requireChk)) {
			$(requireChk).closest("dd").addClass("error");
			var target = $(requireChk).closest("dl").find("div.errorText");
			$("#paymentForm")[0].scrollIntoView(); //오류 영역 스크롤 이동
			
			$(target).text($(requireChk).closest("dl").find("label").text() + ": 필수 입력 사항입니다.");
			return false;
		} 
		
		var blank_pattern = /[\s]/g;
		var nameFormat = /^[가-힣a-zA-Z]$/;
		var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if($("#USER_TEL2").length > 0 && $("#USER_TEL2").val().length < 3) {
			$("#USER_TEL2").closest("dd").addClass("error");
			$("#USER_TEL2").closest("div.inp").siblings(".errorText").text("휴대폰 둘째자리는 3자이상 입력해주세요.");
			$("#paymentForm")[0].scrollIntoView(); //오류 영역 스크롤 이동
			return false;
		}
		if($("#USER_TEL3").length > 0 && $("#USER_TEL3").val().length < 4) {
			$("#USER_TEL3").closest("dd").addClass("error");
			$("#USER_TEL3").closest("div.inp").next(".errorText").text("휴대폰 셋째자리는 4자이상 입력해주세요.");
			$("#paymentForm")[0].scrollIntoView(); //오류 영역 스크롤 이동
			return false;
		}
				
		//이메일 입력 여부 확인, 이메일 형식 체크(비어있는지, @ 있는지, 영어@영어.영어 의 형태인지)
		if(blank_pattern.test($('#USER_EMAIL').val()) == true || emailFormat.test($('#USER_EMAIL').val()) == false){
			$("#USER_EMAIL").closest("dd").addClass("error");
			$("#USER_EMAIL").closest("div.inp").next(".errorText").text("이메일 형식이 잘못되었습니다.");
			$("#paymentForm")[0].scrollIntoView(); //오류 영역 스크롤 이동
			return false;
		}
		
		//2. 결제수단 선택 
		$('PAYMENT_TYPE1').val();	//결제수단 둘 중 하나가 선택되어 있는지 확인/ 아무것도 없으면 빨간박스
		if ( $('input:radio[name=PAYMENT_TYPE]').length > 0 &&
				!$('input:radio[name=PAYMENT_TYPE]').is(':checked')) {
				alert("결제방법을 선택해주세요.");
				$("#paymentOption")[0].scrollIntoView(); //오류 영역 스크롤 이동
				return false;
			}
		
		//3. 약관 동의
		//약관 동의 안 되어 있으면 '예약에 필요한 필수 약관의 동의가 누락되었습니다.' 알림박스 팝업 후 약관 동의 하는 곳으로 화면 이동
		if (!$("#agree2").is(":checked")) {
			alert("예약에 필요한 필수 약관의 동의가 누락되었습니다.");
			$("#agree2").closest("div")[0].scrollIntoView(); //오류 영역 스크롤 이동
			return false;
		}
		
		if (!$("#agree3").is(":checked")) {
			alert("예약에 필요한 필수 약관의 동의가 누락되었습니다.");
			$("#agree3").closest("div")[0].scrollIntoView(); //오류 영역 스크롤 이동
			return false;
		} 
		
		
		payment();
		
		
	}
	
	
	//결제
	function payment(){

		//검증값 변수에 입력
		var userName = $('#USER_NM').val();
		var tel1 = $('#USER_TEL1').val();
		var tel2 = $('#USER_TEL2').val();
		var tel3 = $('#USER_TEL3').val();
		var tel = tel1.concat("-",tel2,"-",tel3);
		var email = $('#USER_EMAIL').val();
		console.log("사용자 입력값 검사 완료");
		console.log(userName);
		console.log(tel1);
		console.log(tel2);
		console.log(tel3);
		console.log(tel);
		console.log(email);
		console.log(${r.res_allPay });
		
		//확인 끝나면 결제팝업 띄워주기
		//alert("결제팝업 띄우기");
		
		
		var payment    = $('input:radio[name="PAYMENT_TYPE"]:checked').val();
		//payment 11 = 신용카드 / 21 = 실시간 계좌이체
		
		if(payment == 11){
			//신용카드 결제 체크시 신용카드 결제 실행
			var IMP = window.IMP; // 생략가능
			IMP.init('imp74300715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 1000,
			    //amount : ${r.res_allPay },
			    buyer_email : email,
			    buyer_name : userName,
			    buyer_tel : tel,
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'http://localhost:8881/hotelDelLuna/index.jsp'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;

					$("#resPayment").submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    /* alert(msg); */
			});
		}else if(payment == 21){
			//무통장입금 결제 체크시 신용카드 결제 실행
			var IMP = window.IMP; // 생략가능
			IMP.init('imp74300715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'trans',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 1000,
			  //amount : ${r.res_allPay },
			    buyer_email : email,
			    buyer_name : userName,
			    buyer_tel : tel,
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    //m_redirect_url : 'http://localhost:8881/hotelDelLuna/index.jsp'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
					$("#resPayment").submit();
					
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}else{
			alert("결제 수단이 잘못되었습니다.");
		}
		
		/* 
		$("#form1").attr("action", "ReservationTest.do");
		$("#form1").submit(); */
		
	}
	
	
	//필수값 비어있는지 체크
	function checkFormRequired() {
		var selector = "";
		$(".paymentWrap input:required, .paymentWrap select:required").each(function() {
			if($(this).val() == "") {
				selector = "#"+$(this).attr("id");
				return false;
			}
		});
		return selector;
	}
	
	
	$(function(){
		$("#lastName").keyup(function() {
			console.log("id 체크중");
			$(this).val($(this).val().replace(/[^a-z|A-Z|가-힇]*/gi, ""));
		});
		$("#firstName").keyup(function() {
			console.log("id 체크중");
			$(this).val($(this).val().replace(/[^a-z|A-Z|가-힇]*/gi, ""));
		});
	});
	
	
	function inputId(){
		$("#USER_NM").val( $("#lastName").val() + ' ' + $("#firstName").val());
	};
	

</script>


</body>
</html>