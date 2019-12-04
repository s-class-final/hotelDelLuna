<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
       
<title>Insert title here</title>
        <style>
            /*datepicker에서 사용한 이미지 버튼 style적용*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
			}
        
        P{
   			 margin-top: 0px;
  			 margin-bottom: 0px;
        }
        
        </style>
</head>
<body>
<h1>Room insert</h1>
<hr>
	<form action="Roomtypeinsert.do" method="post" enctype="multipart/form-data">
		<table border="1px solidBlack">
			<tr>
				<td>룸 타입</td>
				<td><select name="type">
						<optgroup label="슈페리어">
							<option value="superior">슈페리어</option>
							<option value="superior_terrace">슈페리어 테라스</option>
						</optgroup>
						<optgroup label="디럭스">
							<option value="deluxe">디럭스</option>
							<option value="grand_deluxe">그랜드 디럭스</option>
							<option value="premium_deluxe">프리미엄 디럭스</option>
							<option value="premium_deluxe_terrace">프리미엄 디럭스 테라스</option>
						</optgroup>
						<optgroup label="스위트">
							<option value="junior_suite">주니어 스위트</option>
							<option value="deluxe_suite">디럭스 스위트</option>
							<option value="grand_deluxe_suite">그랜드 디럭스 스위트</option>
							<option value="royal_suite">로열 스위트</option>
						</optgroup>
					</select>
				<td>최대 수용 인원</td>
				<td><input type="number" min=1 max=10 value=2 name="capacity"></td>
				<td>배드 추가 여부</td>
				<td><input type="radio" name="addBed" value="Y">Y 
					<input type="radio" name="addBed" value="N" checked="checked">N</td>
			</tr>
			<tr>
				<td>싱글배드 수</td>
				<td><input type="number" min=0 max=4 value=1 name="singleBed"></td>
				<td>더블배드 수</td>
				<td><input type="number" min=0 max=4 value=1 name="doubleBed"></td>
				<td>흡연 가능 여부</td>
				<td>
				<input type="radio" name="smoking" value="Y">Y 
				<input type="radio" name="smoking" value="N" checked="checked">N
				</td>
			</tr>
				<tr>
			  <td>판매 시작일</td>
			  <td><input type="text" id="onSaleDate"  name="startDay" readonly>  </td>
			  <td>판매 종료일</td>
			  <td><input type="text" id="offSaleDate"  name="endDay" readonly></td>
			</tr>
			<tr>
				<td>주중가</td><td><input type="text" id="payment" name ="weekDay">원</td>
				<td>주말가</td><td><input type="text" id="weekendPay" value = "0" name ="weekEnd" style="background-color:#c8c8c8;" readonly >원</td> 
				<td>어린이 요금</td><td><input type="text" id="childPay" value = "0" name ="childRate" style="background-color:#c8c8c8;" readonly >원</td>
			</tr>
			<tr>
				<td>대표 사진</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5"><input type="File" name = "file"></td>
			</tr>
			<tr>
				<td>상세 사진</td>
				<td><button type="button" onclick="button1_click();">상세 사진 추가</button></td>
			</tr>
			<tr>
				<td>첨부파일</td>
			<td colspan="5" id ="filetd">
				<input type="File" name= "file"><br> 
			</tr>
			<tr>
				<td colspan="4"></td><td colspan="2"> <input type="submit" value="룸 등록하기" style= "float : right;"></td>
			</tr>
			
		</table>
	</form>

	<script>
		var BtnCount = 3;
		
		function button1_click(e){
			//상세 사진 인풋 태그 추가
			//대표 사진이 1번 기존 태그가 2번 ~ 13까지 총 10개
			BtnCount++
			if(BtnCount >= 13){
				alert("상세사진은 10장까지 추가가능합니다");
			}else{
				
			var str = "<p><input type='file' name='file'>"+"<button type='button' onclick='delBtn(this);'>삭제하기</button><br></p>"
			
			$("#filetd").append(str);
			
			}
		}
		//추가된 상세 사진 인풋 태그 삭제
		function delBtn(e){
			e.parentNode.remove();
			//삭제시 file_번호 카운트 내려주기
			BtnCount--
		}
				
		
		$( "#payment" ).keyup(function() {
			//weekendPay 주중가의 120% 가격 후 1의 자리 반올림 
			//childrenPay 주중가의 60% 가격 후 1의 자리 반올림
			var weekendPay =   Math.round((120/100)*$("#payment").val()/10)*10;
			var childrenPay =  Math.round((60/100)*$("#payment").val()/10)*10;
			
			$("#weekendPay").val(weekendPay);
			$("#childPay").val(childrenPay);
		
			});
	
		//캘린더 DATEPICKER 사용
	     $(function() {
                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                
                // 시작일(onSaleDate)은 종료일(offSaleDate) 이후 날짜 선택 불가
                // 종료일(offSaleDate)은 시작일(onSaleDate) 이전 날짜 선택 불가

                //시작일.
                $('#onSaleDate').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                    buttonImage: "resources/images/calendarIcon.png", // 버튼 이미지
                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                    //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(onSaleDate) datepicker가 닫힐때
                        // 종료일(offSaleDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#offSaleDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#offSaleDate').datepicker({
                    showOn: "both", 
                    buttonImage: "resources/images/calendarIcon.png", 
                    buttonImageOnly : true,
                    // buttonText: "날짜선택",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(offSaleDate) datepicker가 닫힐때
                        // 시작일(onSaleDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#onSaleDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });

	</script>
	

	
</body>
</html>