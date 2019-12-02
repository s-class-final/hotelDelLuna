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



<script type="text/javascript">
$(document).ready(function(){
});
function jsSearch(PAGE_NO, SBU_CD) {
	if (SBU_CD) {
		$("#SBU_CD").val(SBU_CD);
	}
	$("#PAGE_SIZE").val(10);
	$("#PAGE_NO").val(PAGE_NO);
	$("#form1").attr("method", "get");
	$("#form1").attr("action", "/front/notice");
	$("#form1").submit();
}

function jsViewDtl(N_SEQ) {
	$("#N_SEQ").val(N_SEQ);
	$("#form1").attr("action", "/front/notice/detail");
	$("#form1").attr("method", "post");
	$("#form1").submit();
}

</script>
<style>
div.noticeList table tbody tr.fixed{background-color: #f9f9f9;}
div.noticeList table tbody tr.fixed td.link a{font-weight:300; color:#333;}
div.noticeList table tbody tr.fixed:hover > *{background-color: rgba(0, 0, 0, 0.03);}
.noticeWrap ul.reserveCategory li.active:after {content: '';display: block;bottom: 0;left: 0;right: 0;height: 1px;background: #9c836a;}
</style>

<section id="container">

	<div class="noticeWrap">
		<h1 class="contTitle"><span>공지사항</span>파라다이스시티의 다양한 소식을<br />확인 해보세요.</h1>
		
		<form id="form1" name="form1">
			<input type='hidden' id='PAGE_NO' name='PAGE_NO' value='1' /><input type='hidden' id='PAGE_SIZE' name='PAGE_SIZE' value='10' /><input type='hidden' id='BLOCK_SIZE' name='BLOCK_SIZE' value='10' />
			<input type="hidden" name="SBU_CD" id="SBU_CD" value="000002" />
			<input type="hidden" name="N_SEQ" id="N_SEQ" value="" />
		</form>
		
		
		
		<div class="noticeList">
			<table>
				<colgroup>
					<col width="232px" />
					<col width="" />
					
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>제목</th>
						
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>HOTEL PARADISE</td>
						<td class="link"><a href="javascript:jsViewDtl('145')" class="ellipsis">호텔 파라다이스 수영장 상세 운영 일정 안내</a></td>
						
					</tr>
					
					<tr>
						<td>HOTEL PARADISE</td>
						<td class="link"><a href="javascript:jsViewDtl('21')" class="ellipsis">호텔 파라다이스 수영장 이용 안내사항</a></td>
						
					</tr>
					
				</tbody>
			</table>
		</div>
		
		<div class='paginate'><a href='#' class='num active'>1</a></div>

	</div>
</section>
</body>
</html>