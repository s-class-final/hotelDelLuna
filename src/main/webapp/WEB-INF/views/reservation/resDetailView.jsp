<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
	
	
	<!-------------------- 컨텐츠 영역-------------------->
	<section id="container">
	
	<!---------------------------- reservationWrap ---------------------------->
	<div class="reservationWrap">
	
		<div class="reservationBox">
			<img src="https://www.p-city.com/upload_file/201901/1547624304295.jpg" alt="MAIN_IMG" />
			<div class="reservationInfoWrap">
				<h1>호텔 방 이름</h1>
				<p>객실 타입 정보</p>
				<a href="#detailPop1" class="btn small" onclick="popModal()"><span>자세히 보기</span></a>
			</div>
				
			<div class="selectChoice clearFixed">
				<dl>
					<dt>체크인 &amp; 체크아웃</dt>
					<dd>
						<div id="TA0000010" class="inp calendar">
							<input type="text" value="" readonly="readonly" />
							<button class="btnCalendar">달력</button>
						</div>
					</dd>
				</dl>
				<dl>
					<dt>성인</dt>
					<dd><select class="selectBox aCnt"><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></dd>
				</dl>
				<dl>
					<dt>
						어린이<button class="tooltipLink" data-tooltip="tip0"></button>
						<div class="tooltipBox" id="tip0"><p>어린이 기준 : 37개월 ~ 13세(초등학생) 이하</p></div>
					</dt>
					<dd><select class="selectBox cCnt" ><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></dd>
				</dl>
				<dl>
					<dt>유아</dt>
					<dd><select class="selectBox bCnt" ><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select></dd>
				</dl>
			</div>
			

			<div class="optionSelectBox clearFixed" style="display:none" data-key="BREAKFAST">
				<h2>추가옵션</h2>
				
				<p class="img"><img src="/pcPub/static/images/sample/sample_optionimg1.jpg" alt="" /></p>
				<div class="optionInfo">
					<h3>Fine Dining Breakfast</h3>
					<p>유럽, 뉴욕, 상해의 최신 Trend를 반영, 다섯가지 Station으로 구성된 Premium Buffet Restaurant</p>
				
					<p class="casy">
						
						<span class="aRpoAmt">성인 : 50,000 원</span>
						
						
						<span class="cRpoAmt">어린이 : 29,000 원</span>
						
					</p>
					
					<div class="optionSelect clearFixed">
						<dl>
							<dt>성인</dt>
							<dd><select class="selectBox aCnt disabled"></select></dd>
						</dl>
						<dl>
							<dt>기간</dt>
							<dd><select class="selectBox aDay disabled"></select></dd>
						</dl>
					</div>
					
					
					<div class="optionSelect clearFixed">
						<dl>
							<dt>어린이</dt>
							<dd><select class="selectBox cCnt disabled"></select></dd>
						</dl>
						<dl>
							<dt>기간</dt>
							<dd><select class="selectBox cDay disabled"></select></dd>
						</dl>
					</div>
					
				</div>
			</div>

			<div class="cautionBox">
				<h2 class="cautionH2">고객 요청사항</h2>

			</div>
			
			
			
			<input type="hidden" class="itemDtlData" data-std_adult_cnt="2" data-std_child_cnt="2" data-addable_adult_cnt="1" data-addable_child_cnt="1" data-adult_rpo_amt="55000" data-child_rpo_amt="33000" data-salestype_seq="442296" data-salestype="HPHP1911007" data-adult_add_roseq="221" data-child_add_roseq="222" data-adult_bf_roseq="162" data-child_bf_roseq="163" data-adult_bf_rpo_amt="50000" data-child_bf_rpo_amt="29000" data-period="1" data-adult_bf_max_cnt="3" data-child_bf_max_cnt="3" />
			
			
		</div>
	
	<input type="hidden" id="BADGE_TYPE2_CNT" value="1"/>
	
	<!---------------------------- 우측 메뉴 ---------------------------->
	<div class="reservationAside">
		<section class="reservationSection">
			<div class="productHeader">
				<h1>
					<span>Summary</span>
				</h1>
				<a href="javascript:jsAllDelFromCart();" class="btnDeleteAll">전체삭제</a>
			</div>
			<div class="productWrap mCustomScrollbar" data-mcs-theme="dark">
				<div class="productNone" style="display: none;">
					담긴 상품이 없습니다.
				</div>
				<div class="productListBox" style="display: none;">
				
					<article class="productItem">
						<div class="productListH">
							<h2>
								<span>EarlyBird: Hotel Paradise</span>
							</h2>
							<a onclick="javascript:jsDelFromCart(this);" class="btnDelete"></a>
						</div>
						<div class="productListC">
							<h3>HOTEL PARADISE</h3>
							
							<p>체크인 / 체크아웃</p>
							
							
							<p>성인 / 어린이 / 유아</p>
							
							
							<p>객실</p>
							
							
							<p>베드타입</p>
							
							<div class="casyBox">
								
								<dl>
									<dt>
										총액
									</dt>
									<dd class="totalAmt">원</dd>
								</dl>
								
								
							</div>
						
						
						</div>
						
						<input type="hidden" class="summaryItemData" data-product_item='{"RP_SEQ":1999,"OFFER_TYPE":"TA","OFFER_TYPE_CD":"000001","OFFER_CONT":{"PRICE_INFO":{"TOTAL_AMT":0,"DISC_AMT":0}},"OFFER_ORD":0,"OFFER_NAME":"EarlyBird: Hotel Paradise"}' />
					</article>
					
				</div>
			</div>
	
			<!-- 토탈 설정 -->
			<div class="productFooter">
				<dl>
					<dt>총액</dt>
					<dd id="f_total">원</dd>
				</dl>
				
				<dl>
					<dt>할인액</dt>
					<dd id="f_discount" class="txtRed">원</dd>
				</dl>
				
				
				
				<dl>
					<dt>포인트</dt>
					<dd id="f_point">P</dd>
				</dl>
			</div>
			
			<div class="productTotal productLen">
				<dl>
					<dt>최종금액</dt>
					<dd id="f_final">
						<span></span>
						원
					</dd>
				</dl>
			</div>
			
			<button class="btn btnFull" disabled="disabled" onclick="javascript:jsPaymentView();">
				<span>결제정보 입력하기</span>
			</button>
			
		</section>
	</div>
	<!---------------------------- //우측 메뉴 ---------------------------->
</div>
<!---------------------------- //reservationWrap ---------------------------->
</section>
<!-------------------- //컨텐츠 영역-------------------->

<!-------------------- 팝업창  ---------------------->
<form>
<div class="layerPopWrap" id="loginPop">
	<div class="bg"></div>
	<!-- layerPopCont -->
	<div class="layerPopCont">
		<div class="loginWrap">
			<h1><span>로그인</span>로그인을 하시고<br/>더 편리하게 이용하세요.</h1>
			<div class="loginBox">
				<div class="inp">
					<input type="text" id="USER_ID" name="USER_ID" onKeyPress="if(event.keyCode=='13') jsLogin();" placeholder="아이디" title="아이디">
					<button class="btnDelete">삭제</button>
				</div>
				
				<div class="inp">
					<input type="password" id="USER_PWD" name="USER_PWD" onKeyPress="if(event.keyCode=='13') jsLogin();" placeholder="비밀번호" title="비밀번호">
					<button class="btnDelete">삭제</button>
				</div>
				<div class="loginSave">
					<div class="checkbox">
						<input type="checkbox" id="loginchk" name="loginchk"/><label for="check">로그인 상태 유지</label>
					</div>
					<p class="findPWD"><a href="#">아이디/비밀번호 찾기</a></p>
				</div>
				
				
				<div class="btnLoginGroup">
					<button id="btnPaymentLogin" class="btn btnFull btnLogin" onclick="#">로그인</button>
					<button id="btnPaymentGuest" class="btn btnLogin" onclick="#">비회원 구매</button>
				</div>
				
			</div>
			
			<div class="popJoinBox">
				<div class="wrap">
					<p>파라다이스 리워즈 회원이 되시면 <br />더 많은 혜택을 누리실 수 있습니다. </p>
					<a href="#" class="btn small2"><span>회원가입</span></a>
				</div>
			</div>
		</div>
		<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
	</div>
	<!-- //layerPopCont -->
</div>
</form>
<!-------------------- //팝업창  ---------------------->
<script>

	function popModal(){
		
		layerPopOpen("#loginPop");
	};

</script>
</body>
</html>