<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin || resDetailView</title>
</head>
<style>
#calTotal{
	display: inline-block;
    width: 100%;
    height: 48px;
    border: 1px solid #e6e3df;
    padding: 0 39px 0 15px;
    line-height: 48px;
    font-size: 15px;
}
.cautionBox h3{
	padding: 10px 40px;
}
</style>
<body>
 <jsp:include page="../common/menubar.jsp"/>
	
	
	<!-------------------- 컨텐츠 영역-------------------->
	<section id="container">
	
	<!---------------------------- reservationWrap ---------------------------->
	<div class="reservationWrap">
		<div class="reservationBox">
			<h1 style="margin-bottom:10px;color: #9c836a;font-size: 30px;font-weight: 100" >${res.res_userName}님의 예약 내역</h1>
			<c:if test="${empty fileName }">
				<img src="https://www.p-city.com/upload_file/201901/1547624304295.jpg" alt="MAIN_IMG" />			
			</c:if>
			<c:if test="${!empty fileName }">
				<img src="resources\pcPub\static\images\room\<c:out value='${fileName}'/>" alt="MAIN_IMG" width=736px height=320px/>			

			</c:if>
			<div class="reservationInfoWrap">
				<h1>${res.res_roomType }</h1>
				<br>
				<a href="#detailPop1" class="btn small" onclick="popModal()"><span>자세히 보기</span></a>
				<label>베드 추가</label><input id="addBed" class="check" type="checkbox" name="res_addBed" value="${res.res_addBed}" <c:if test="${res.res_payStatus eq '입금완료' }">  
						 disabled </c:if> >
			</div>
				
			<div class="selectChoice clearFixed">
				<dl>
					<dt>체크인 &amp; 체크아웃</dt>
					<dd>
						<c:if test="${res.res_payStatus eq '입금대기' }">
						<div id="TA0000010" class="inp calendar">
							<input  name="checkInOut" type="text" value="${res.res_checkIn} ~ ${res.res_checkOut}" readonly="readonly">
								<a class="btnCalendar">달력</a>
						</div>
						</c:if>
						<c:if test="${res.res_payStatus eq '입금완료' }">
							<input  name="checkInOut" type="text" value="${res.res_checkIn} ~ ${res.res_checkOut}" readonly="readonly"
							style="height:48px;width:245px;border: 1px solid #e6e3df;background: #f9f9f9">
						</c:if>
					</dd>
				</dl>
				<dl>
					<dt>성인</dt>
					<dd>
						<select name="res_adult" class="selectBox aCnt"<c:if test="${res.res_payStatus eq '입금완료' }">  
						 disabled </c:if>>
							<c:forEach var="i" begin="0" end="8">
								<c:if test="${i ne res.res_adult}">
										<option value="${i}">${i}</option>
								</c:if>
								<c:if test="${i eq res.res_adult}">
										<option value="${i}" selected>${i}</option>
								</c:if>		
							</c:forEach>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>
						어린이<a class="tooltipLink" data-tooltip="tip0"></a>
						<div class="tooltipBox" id="tip0"><p>어린이 기준 : 37개월 ~ 13세(초등학생) 이하</p></div>
					</dt>
					<dd>
						<select name="res_child" class="selectBox cCnt" <c:if test="${res.res_payStatus eq '입금완료' }">  
						 disabled </c:if> >
							<c:forEach var="i" begin="0" end="8">
								<c:if test="${i ne res.res_child}">
										<option value="${i}">${i}</option>
								</c:if>
								<c:if test="${i eq res.res_child}">
										<option value="${i}" selected>${i}</option>
								</c:if>		
							</c:forEach>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>총 인원</dt>
					<dd>
						<input type="text" id="calTotal" value="${res.res_child + res.res_adult} " readonly disabled>
					</dd>
				</dl>
			</div>
			


			<div class="cautionBox">
				<h2 class="cautionH2">고객 요청사항</h2>
				<h3>${res.res_require}</h3>
			</div>

			<input type="hidden" class="itemDtlData" data-std_adult_cnt="2" data-std_child_cnt="2" data-addable_adult_cnt="1" data-addable_child_cnt="1" data-adult_rpo_amt="55000" data-child_rpo_amt="33000" data-salestype_seq="442296" data-salestype="HPHP1911007" data-adult_add_roseq="221" data-child_add_roseq="222" data-adult_bf_roseq="162" data-child_bf_roseq="163" data-adult_bf_rpo_amt="50000" data-child_bf_rpo_amt="29000" data-period="1" data-adult_bf_max_cnt="3" data-child_bf_max_cnt="3" />

		</div>
	
	<input type="hidden" id="BADGE_TYPE2_CNT" value="1"/>
	
	<!---------------------------- 우측 메뉴 ---------------------------->
	<div class="reservationAside">
		<section class="reservationSection" style="margin-top:10px">
			<div class="productHeader">
				<h1>
					<span>Summary</span>
				</h1>
				<a href="resDetail.do?res_no=${res.res_no}" class="btnDeleteAll">초기화</a>
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
							<h3>HOTEL DELLUNA</h3>		
							<p id="checkInOut">${res.res_checkIn} ~ ${res.res_checkOut}</p>			
							<p id="total">성인 ${res.res_adult} / 어린이 ${res.res_child}</p>			
							<p id="meal">조식 ${res.res_breakfast }회 / 디너 ${res.res_dinner}회</p>	
							<p id="res_addBed">베드 추가  ${res.res_addBed}</p>
							<div class="casyBox">
								<dl>
									<dt>
										총액
									</dt>
									<dd id="totalAmt" class="totalAmt"><fmt:formatNumber value="${res.res_allPay}" pattern="#,##0" />원</dd>
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
					<dd id="f_total"><fmt:formatNumber value="${res.res_allPay}" pattern="#,##0" />원</dd>
				</dl>
				
				<dl>
					<dt>할인액</dt>
					<dd id="f_discount" class="txtRed">0원</dd>
				</dl>
		
				<dl>
					<dt>포인트</dt>
					<dd id="f_point">${res.res_allPay *0.01}p</dd>
				</dl>
			</div>
			
			<div class="productTotal productLen">
				<dl>
					<dt>최종금액</dt>
					<dd id="f_final">
						<span><fmt:formatNumber value="${res.res_allPay}" pattern="#,##0" /></span>
						원
					</dd>
				</dl>
				<c:if test="${res.res_payStatus eq '입금대기'}">
					<button id="payBtn" onclick="payPopModal()" class="btn btnFull" style="display: block;width: 100%;border-radius: 5px;margin-bottom: 10px;box-shadow: 3px 3px 15px rgba(0,0,0,0.25)">
					입금 완료</button>
				</c:if>
			</div>
			<c:if test="${res.res_payStatus eq '입금대기'}">
				<button id="modifyBtn" class="btn btnFull"  onclick="resModify()" disabled>
					<span>예약정보 수정</span>
				</button>
			</c:if>
			
		</section>
	</div>
	<!---------------------------- //우측 메뉴 ---------------------------->
</div>
<!---------------------------- //reservationWrap ---------------------------->
</section>
<!-------------------- //컨텐츠 영역-------------------->

<!-------------------- 팝업창  ---------------------->
<form>
	<div class="layerPopWrap" id="roomDetail">
		<div class="bg"></div>
		<!-- layerPopCont -->
		<div class="layerPopCont">
			<div class="loginWrap">
				<h1><span>${roomType.type } 룸 정보</span></h1>

				<div style="text-align:left;padding-left:40px">
				<p class="pb15i fw500 pd0i " style="display:inline;padding-right:50px">최대 수용 인원 </p>
				<input type="text" value="${roomType.capacity }" style="text-align:right" readonly> 명
				<br>
				<br>
				<p class="pb15i fw500 pd0i " style="display:inline;padding-right:95px">주중가  </p>
				<input type="text" value="<fmt:formatNumber value="${roomType.weekDay}" pattern="#,##0" />" style="text-align:right" readonly> 원
				<br>
				<br>
				<p class="pb15i fw500 pd0i " style="display:inline;padding-right:95px">주말가  </p>
				<input type="text" value="<fmt:formatNumber value="${roomType.weekEnd}" pattern="#,##0" />"style="text-align:right" readonly> 원
				<br>
				<br>
				<p class="pb15i fw500 pd0i " style="display:inline;padding-right:178px">싱글베드    ${roomType.singleBed}개</p>
				<p class="pb15i fw500 pd0i " style="display:inline;">더블베드    ${roomType.doubleBed}개</p>
				</div>
				<div class="popJoinBox">
					<div class="wrap">
						<p>룸 관리 버튼을 누르면 <br />룸 정보 페이지로 이동합니다. </p>
						<a href="iRoomtypeView.do" class="btn small2" style="display:inline;right:65px"><span>룸 관리</span></a>
						<a href="javascript:void(0);" class="btnPopClose btn small2" style="display:inline;right:170px"><span>취소</span></a>
					</div>
				</div>
			</div>
			<a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
		</div>
		<!-- //layerPopCont -->
	</div>
</form>
<!-------------------- //팝업창  ---------------------->
<!-------------------- 팝업창  ---------------------->
<form>
	<div class="layerPopWrap" id="checkPay">
		<div class="bg"></div>
		<!-- layerPopCont -->
		<div class="layerPopCont">
			<div class="loginWrap">
					<div>
						<h1 style="padding-bottom:0px;text-align:center;"><span style="display:inline">입금 총액 </span><input name="r_total" type="text" value="0" style="width:120px;border:0px;text-align:right;" readonly>원</h1>
						<h1 style="padding-bottom:0px">
							<span style="display:inline">적립 예정 포인트 </span>
							<input name="r_point" type="text" value="0" style="width:100px;border:0px;text-align:right;" readonly>p
							<span style="display:inline;padding-left: 50px;padding-right: 15px;">인보이스 발행 </span>
							<input name="r_invoice" class="check" type="checkBox" value="N" style="padding-left: 20px;width: 25px;height: 25px">	
						</h1> 
					</div>
				<div class="popJoinBox">
					<div class="wrap">
						<p>입금 처리를 하면 <br />더 이상 예약정보를 변경할 수 없습니다. </p>
						<a onclick="payStatusCheck()" class="btn small2" style="display:inline;right:65px"><span>입금확인</span></a>
						<a href="javascript:void(0);" class="btnPopClose btn small2" style="display:inline;right:170px"><span>취소</span></a>
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


var maxCap = ${roomType.capacity};
console.log(maxCap);
$(function(){
	var smoking = "${res.res_smoking}";
	var addBed = "${res.res_addBed}";
	
	
	/*** 체크박스 선택 먼저 지정 ***/
	if(smoking=='Y'){
		$("#smoking").prop("checked",true);
	};
	if(addBed=='Y'){
		$("#addBed").prop("checked",true);
	};

	
 	/**** 날짜 변경 감지 ****/
	$('.date-picker-wrapper').on("change click",function(){
		
		if($('.start-day').text()!="..." && $('.end-day').text()!="..."){
			
			reCalTotal();
		}
	}); 


	/**** 인원수 변경 감지 ****/
	$('.aCnt .ui-select-option').on("click change", function(){			
		var adult = $(this).data('value');
		var child = $("select[name=res_child]").val();
		var total = Number(adult) + Number(child);
		
		$("#calTotal").val(total);
		
		setTimeout(function() {
			reCalTotal();
		}, 100);
		
	})
	
	$('.cCnt .ui-select-option').on("click change", function(){
		var adult = $("select[name=res_adult]").val();
		var child = $(this).data('value');
		var total = Number(adult) + Number(child);
		
		$("#calTotal").val(total);
		setTimeout(function() {
			reCalTotal();
		}, 100);
	})

});

	/***** 베드추가여부 결과창에 담기 *****/
	$(document).on("click",".check",function(){
		if ($(this).is(":checked")){ 
	        $(this).val("Y");
	    }else{
	        $(this).val("N");
	    }

		if($(this).attr("name")=="res_addBed"){
			$("#res_addBed").text("베드 추가  "+$(this).val());
			$("#payBtn").prop("disabled",true);
			$("#modifyBtn").prop("disabled",false);
		}
		
	});


	function payStatusCheck(){
		var res_no = ${res.res_no};
		var invoice = $("input[name=r_invoice]").val()
		location.href="payStatusCheck.do?&res_no="+res_no+"&invoice="+invoice;
		
	}
	
	/**** 수정하기 버튼 ****/
	function resModify(){
		var res_no = ${res.res_no};
		var res_adult = $("select[name=res_adult]").val();
		var res_child = $("select[name=res_child]").val();
		var checkInOut = $("input[name=checkInOut]").val();
		var res_addBed = $("input[name=res_addBed]").val();
		if($("#calTotal").val()==0){
			alert("인원 수가 잘못 되었습니다.\n ")
		}else if($("#calTotal").val()>maxCap){
			alert("최대 수용인원을 넘었습니다.\n 해당 룸의 최대인원은 "+maxCap+"명 입니다.");
		}else{
			location.href="resModify.do?&res_no="+res_no+"&res_adult="+res_adult+"&res_child="+res_child+"&res_addBed="+res_addBed+"&checkInOut="+checkInOut;
		}

	};

	
	function reCalTotal(){
		$("#payBtn").prop("disabled",true);
		$("#modifyBtn").prop("disabled",false);
		var res_no = ${res.res_no};
		var res_roomType = "${res.res_roomType}";
		var res_adult = $("select[name=res_adult]").val();	
		var res_child = $("select[name=res_child]").val();
		var res_breakfast = ${res.res_breakfast};
		var res_dinner = ${res.res_dinner};
 		var checkInOut = $("input[name=checkInOut]").val();
	
		$.ajax({
			url:"reCalRes.do",
			data:{res_no:res_no,
				res_roomType:res_roomType,
				res_adult:res_adult,
				res_child:res_child,
				res_breakfast:res_breakfast,
				res_dinner:res_dinner,
				checkInOut:checkInOut 
			},
			dataType:"json",
			success:function(data){
				if(data!=null){
					console.log(data);
					
					$("#checkInOut").html(data.res_checkIn+" ~ "+data.res_checkOut);
					$("#total").html("성인 "+data.res_adult+" / 어린이 "+data.res_child);
					$("#meal").html("조식 "+data.res_breakfast+"회 / 디너 "+data.res_dinner+"회");
					
					$("#totalAmt").text((data.res_allPay).toLocaleString()+"원");
					$("#f_total").html((data.res_allPay).toLocaleString()+"원");
					$("#f_point").html(Number(data.res_allPay*0.01)+"p");
					$("#f_final").html("");
					$span = $("<span>").text((data.res_allPay).toLocaleString());
					$("#f_final").prepend($span).append("원");
				}else{
					alert("해당 날짜에 방이 가득 찼습니다.");
				}
				
			},error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
		
	};
	
	
	function popModal(){
		layerPopOpen("#roomDetail");
	};
	function payPopModal(){
		$("input[name=r_total]").val($("#f_final span").text());
		$("input[name=r_point]").val(${res.res_allPay *0.01});

		layerPopOpen("#checkPay");
	}

</script>
</body>
</html>