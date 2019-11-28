<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Room insert</h1>
<hr>
	<form action="binsert.do" method="post" enctype="multipart/form-data">
		<table border="1px solidBlack">
			<tr>
				<td>룸 타입</td>
				<td><select name="rType">
						<option value="">룸 타입</option>
						<option value="">슈페리어</option>
						<option value="">디럭스</option>
						<option value="">프리미엄 디럭스</option>
						<option value="">스위트</option>
				</select>
				<td>최대 수용 인원</td>
				<td><input type="number" min=0 max=10 value=2></td>
				<td>배드 추가 여부</td>
				<td><input type="radio" name="add_bed" value="Y">Y <input
					type="radio" name="add_bed" value="N" checked="checked">N</td>
			</tr>
			<tr>
				<td>싱글배드 수</td>
				<td><input type="number" min=0 max=4 value=1></td>
				<td>더블배드 수</td>
				<td><input type="number" min=0 max=4 value=1></td>
				<td>흡연 가능 여부</td>
				<td>
				<input type="radio" name="smoking" value="Y">Y 
				<input type="radio" name="smoking" value="N" checked="checked">N
				</td>
			</tr>
				<tr>
			  <td>판매 시작일</td>
			  <td></td>
			  <td>판매 종료일</td>
			  <td></td>
			</tr>
			<tr>
				<td>주중가</td><td><input type="text"></td><td>주말가</td><td>주중가의 120%</td> <td>어린이 요금</td><td>60%</td>
			</tr>
			<tr>
				<td>대표 사진</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5"><input type="File"></td>
			</tr>
			<tr>
				<td>상세 사진</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5">
				<input type="File"><br> 
				<input type="File"><br> 
				<input type="File"><br>
				<input type="File"><br> 
				<input type="File"></td>
			</tr>
			<tr>
				<td></td><td></td><td></td><td></td><td colspan="2"><input type="submit" value="룸 등록하기"></td>
			</tr>
			
		</table>
	</form>

</body>
</html>