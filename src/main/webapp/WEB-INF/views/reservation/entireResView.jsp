<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100)
	;

body {
	font-family: "Roboto", helvetica, arial, sans-serif;
	font-weight: 400;
	text-rendering: optimizeLegibility;
}



/*** Table Styles **/
.table-fill {

	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	height: auto;
	margin-right: auto;
	max-width: 600px;
	width: 100%;
	padding: 5px;
	
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

.table-fill  th {
	color: #D5DDE5;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 15px;
	font-weight: 100;
	padding: 10px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

.table-fill  th:first-child {
	border-top-left-radius: 3px;
}

.table-fill  th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

.table-fill  tr {
	border-top: 1px solid #C1C3D1;
	border-bottom-: 1px solid #C1C3D1;
	color: #666B85;
	font-size: 13px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

.table-fill  tr:hover td {
	cursor: pointer;
	background: #4E5066;
	color: #FFFFFF;
	border-top: 1px solid #22262e;
}

.table-fill  tr:first-child {
	border-top: none;
}

.table-fill  tr:last-child {
	border-bottom: none;
}

.table-fill  tr:nth-child(odd) td {
	background: #EBEBEB;
}

.table-fill  tr:nth-child(odd):hover td {
	background: #4E5066;
}

.table-fill  tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

.table-fill  tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

.table-fill  td {
	background: #FFFFFF;
	padding: 8px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 13;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #C1C3D1;
}

.resInsertForm{
	background: lightgray;

}
</style>
<body>
<div id="main">
 <jsp:include page="../common/menubar.jsp"/>
	<!-- 섹션 영역 -->
	<section id="container">
		<div class="reservationWrap">
			<div class="reservationBox">
			<br><br><br><br>
			<table class="table-fill">
				<thead>
					<tr>
						<th class="text-left">예약번호</th>
						<th class="text-left">예약자</th>
						<th>인원</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>입금상태</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<tr>
						<td class="text-left">January</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
					</tr>
					<tr>
						<td class="text-left">February</td>
						<td class="text-left">$ 10,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>					
					</tr>
					<tr>
						<td class="text-left">March</td>
						<td class="text-left">$ 85,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>					
					</tr>
					<tr>
						<td class="text-left">April</td>
						<td class="text-left">$ 56,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>					
					</tr>
					<tr>
						<td class="text-left">May</td>
						<td class="text-left">$ 98,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>
						<td class="text-left">$ 50,000.00</td>					
					</tr>
				</tbody>
			</table>

			</div>
			<div class="reservationAside">
			<section class="reservationSection" style="width:350px">
				<br><br>
				<form class="resInsertForm">
				<table style="margin:30px;">
				<tr>
					<td >예약자: </td>
					<td><input type="text" name="userName"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>이메일: </td>
					<td colspan="3">
					<input type="text" name="email1" size="7" style="display:inline">@
					<input type="text" name="email2" size="7" style="display:inline">
					</td>
				</tr>
				<tr>
					<td>핸드폰: </td>
					<td colspan="3">
						<input type="text" name="phone1" size="1" style="display:inline">
						<input type="text" name="phone2" size="2" style="display:inline">
						<input type="text" name="phone3" size="2" style="display:inline">
					</td>
				</tr>
				<tr>
					<td>객실타입: </td>
					<td>
						<select>
							<option name="res_roomType" value="---">---</option>
							<option name="res_roomType" value="---">---</option>							
							<option name="res_roomType" value="---">---</option>														
						</select>
					</td>
				</tr>
				<tr>
					<td>성인: </td>
					<td><input type="number" id="adult"name="res_adult" min=0 max=10 value=0 style="width:50px;display:inline"></td>
				</tr>
				<tr>
					<td>어린이: </td>
					<td><input type="number" id="child" name="res_child" min=0 max=10 value=0 style="width:50px;display:inline"></td>
				</tr>
				<tr>
					<td>총 인원: </td>
					<td><input type="text" id="totalNum" name="res_totalNum" value="0명" readonly></td>
				</tr>
				<tr>
					<td>체크인: </td>
					<td><input type="date" id="checkIn"  name="res_checkIn"></td>
					<td></td>
				</tr>
				<tr>
					<td>체크아웃: </td>
					<td><input type="date" id="checkOut" name="res_checkOut"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">조식: &nbsp;<input type="checkbox" name="res_breakfast">
					&nbsp;디너: &nbsp;<input type="checkbox" name="res_dinner">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="reset">초기화</button>
					</td>
					<td>
						<button type="submit">예약 입력</button>					
					</td>
				</tr>
			</table>
				
				</form>
			</section>
			</div>
		</div>
	</section>

	<!-- //섹션 영역 -->
	<script>
	$(function(){
		var totalNum=0;
		var nowDate = new Date().toISOString().substring(0, 10);

		/* 체크인 날짜 최소 오늘 */
		$("#checkIn").attr("min",nowDate);
		
		/* 체크아웃 날짜 최소 체크인 날짜 다음날 */
		$("#checkIn").focusout(function(){
			var minDate = new Date($("#checkIn").val());
			minDate.setDate(minDate.getDate()+1);
			minDate = minDate.toISOString().substring(0, 10);
 			$("#checkOut").attr("min",minDate);
		});
		
		
		/* 어른 아이 총 인원수 계산 */
		$("#adult").focusout(function(){
			totalNum = parseInt($("#adult").val()) + parseInt($("#child").val());
			$("#totalNum").val(totalNum+"명");

		});
		
		$("#child").focusout(function(){
			totalNum = parseInt($("#adult").val()) + parseInt($("#child").val());
			$("#totalNum").val(totalNum+"명");		
		});
		
		
		
		
		
	})
	
	</script>
</div>


</body>
</html>