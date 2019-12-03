<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>



<script type="text/javascript">
$(document).ready(function(){
	if( "" != "" ){
	    $(".inquiryList."+  +" button").trigger("click");
	}

});

function jsSearch(PAGE_NO) {
	$("#PAGE_NO").val(PAGE_NO);
	$("#form1").attr("action", "/auth/front/mypage/voc");
	$("#form1").submit();
}

function jsDeleteVoc(SEQ,TYPE) {
	if (confirm("해당 글을 삭제하시겠습니까?")) {
		$("#BBS_SEQ").val(SEQ);
		$("#V_TYPE").val(TYPE);
		
		$.ajax({
			url : '/auth/front/mypage/vocDelete'
	        , method : "post"
			, data : $("#form1").serialize()
			, success : function(data, stat, xhr) {
				if (stat == "success") {
					if (data.result != null) {
						if (data.result == "success") {
							$("." + SEQ).remove();
							return false;
						} else {
							alert("저장을 처리하는데 실패하였습니다.");
						}
					} else {
						alert("저장을 처리하는데 실패하였습니다.");
					}
				} else {
					alert("저장을 처리하는데 실패하였습니다.");
				}
			}
		});
	} else {
		return false;
	}
}
</script>

	<form id="form1" name="form1">
		<input type='hidden' id='PAGE_NO' name='PAGE_NO' value='1' /><input type='hidden' id='PAGE_SIZE' name='PAGE_SIZE' value='10' /><input type='hidden' id='BLOCK_SIZE' name='BLOCK_SIZE' value='10' />
		<input type="hidden" id="DIVISION" name="DIVISION" value="">
		<input type="hidden" id="RECEPT_NO" name="RECEPT_NO">
		<input type="hidden" id="V_TYPE" name="V_TYPE">
		<input type="hidden" id="BBS_SEQ" name="BBS_SEQ">
	</form>
	<!-- 컨텐츠 영역 -->
	<section id="container">
		
		<!-- 디자인이 확정이 아니랍니다 -->
		
		<div class="mypageWrap pos">
			<div class="innerBox"> <!-- 가로값이 1280으로 설정되어진 아이 -->
				<h1 class="contTitle"><span>이용문의</span>회원님께서 문의 하신 내역을 <br />확인하실 수 있습니다.</h1>
				<p class="btnInquiry"><a href="#pop1" class="btn small layerPopOpen">1:1문의 하기</a></p>

				<!-- 상태표시
					.inquiryList > .status, .end : 답변완료
					.inquiryList > .status, .wait : 답변대기
				-->
				
				<div class='paginate'><a href='#' class='num active'>1</a>
</div>

			</div>
		</div>
		
		<!-- 1:1문의 -->
		








<script>
var title = "1:1 문의";

var strFacility1 = "";
var strFacility2 = "";

var fac3HotelParaDining = {
        
        DTL_CD: ["On the Plate", "La Scala", "Raku", "Imperial Treasure", "Rubik", "Lounge Paradise", "Garden Cafe"]
      , DTL_CD_NM: ["ON THE PLATE", "LA SCALA", "RAKU", "Imperial Treasure", "Rubik", "Lounge Paradise", "Garden Café"]
};

var fac3ArtParaDining = {
        DTL_CD: ["Serase", "Lounge & Bar Serase"]
      , DTL_CD_NM: ["SERASÉ", "LOUNGE &amp; BAR SERASÉ"]
};

var fac3GrpWedEstimate = {
        DTL_CD: ["컨벤션/MICE", "웨딩", "가족연회"]
      , DTL_CD_NM: ["컨벤션/MICE", "웨딩", "가족연회"]
};

var emailFormat = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var blank_pattern = /[\s]/g;

function jsGetMultiLang(sbu_code){
	if( (sbu_code < 1 || sbu_code > 12)){
        return;
    }
        
    var hotelMenu = new Array();
    hotelMenu[0] = '객실';
    hotelMenu[1] = '상품/이벤트';
    hotelMenu[2] = '시설'; 
    hotelMenu[3] = '다이닝';
    hotelMenu[4] = '기타';
    
    var casinoMenu = new Array();
    casinoMenu[0] =  '게임';
    casinoMenu[1] =  '상품/이벤트';
    casinoMenu[2] =  '카지노멤버십/포인트';
    casinoMenu[3] =  '기타 서비스';
    
    var cimerMenu = new Array();
    cimerMenu[0] =  '시설이용';
    cimerMenu[1] =  'F&B';
    cimerMenu[2] =  '입장권/요금';
    cimerMenu[3] =  '제휴할인';
    cimerMenu[4] =  '이벤트/액티비티';
    cimerMenu[5] =  '기타';
    
    var chromaMenu = new Array();
    chromaMenu[0] =  '시설이용';
    chromaMenu[1] =  '공연';
    chromaMenu[2] =  '크로마 VIP 멤버십';
    chromaMenu[3] =  '요금';
    chromaMenu[4] =  '기타';
    
    var wonderboxMenu = new Array();
    wonderboxMenu[0] =  '시설이용';
    wonderboxMenu[1] =  '이벤트/액티비티';
    wonderboxMenu[2] =  '입장권/요금';
    wonderboxMenu[3] =  'F&B';
    wonderboxMenu[4] =  '제휴할인';
    wonderboxMenu[5] =  '기타';
    
    var plazaMenu = new Array();
    plazaMenu[0] =  '매장이용';
    plazaMenu[1] =  '입점문의';
    plazaMenu[2] =  '기타';
    
    var spaceMenu = new Array();
    spaceMenu[0] =  '전시';
    spaceMenu[1] =  '입장권/요금';
    spaceMenu[2] =  '이벤트/액티비티';
    spaceMenu[3] =  '기타';
    
    var studioMenu = new Array();
    studioMenu[0] =  '행사/이벤트';
    studioMenu[1] =  '대관';
    studioMenu[2] =  '시설';
    studioMenu[3] =  '기타';
    
    var gwMenu = new Array();
    gwMenu[0] =  '견적';
    gwMenu[1] =  '서비스';
    gwMenu[2] =  '기타';
    
    var memberMenu = new Array();
    memberMenu[0] =  '파라다이스 리워즈  포인트';
    memberMenu[1] =  '파라다이스 시그니처';
    memberMenu[2] =  '크로마 VIP';
    memberMenu[3] =  '카지노';
    
    var etcMenu = new Array();
    etcMenu[0] =  '기타';
    
    var Menu = new Array();
    Menu[1] = hotelMenu;
    Menu[2] = hotelMenu;
    Menu[3] = casinoMenu;
    Menu[4] = cimerMenu;
    Menu[5] = chromaMenu;
    Menu[6] = wonderboxMenu;
    Menu[7] = plazaMenu;
    Menu[8] = spaceMenu;
    Menu[9] = studioMenu;
    Menu[10] = gwMenu;
    Menu[11] = memberMenu;
    Menu[12] = etcMenu;
    
    return Menu[sbu_code];
}

$(window).load(function(){
    //Ajax 대기시간 설정 (IE브라우저 처리시간 문제 대응)
    var timer = setInterval(function() {
        if ($('#FACILITY2').children("option").length > 0) {
            //Ajax 대기시간 초기화
            clearInterval(timer);
            //load 이벤트 시작
            selectVal("#FACILITY2", "");
            $('#FACILITY2').children("option").each(function() {
                if ($(this).is(":selected")) {
                    $(this).trigger("change");
                }
            });
            //'세부시설 유형' 초기값 설정
            selectVal("#FACILITY3", "");
        }
    }, 100);
    
    //최초 로딩시 스크롤바 조정
    $("#FACILITY1").siblings("div.selectBox").find("ul.ui-select-options").eq(0).css("right", "4px");
    
});

$(document).ready(function(){
    // 팝업 제목 설정
    
    $(".popHeaderInq").text(title);
    
    $("#PI_VOC_CN").val("");
    
    // '문의 유형' 셀렉트 박스 선택 이벤트
    $("#QUESTION").next().on("mouseup",".ui-select-option", function(e){
        if($(this).attr('data-value')) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
        } else {
            $("#FACILITY1").prop("disabled", true);
            $("#FACILITY1").next("div.selectBox").addClass("disabled");
        }
        $("#FACILITY2").prop("disabled", true);
        $("#FACILITY2").next("div.selectBox").addClass("disabled");
        
        selectVal("#FACILITY1", "");
        selectVal("#FACILITY2", "");
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
        
    });
    
    // '문의 유형' 셀렉트 박스 선택 이벤트
    $("#QUESTION").on("change", function(e){
        if($(this).val()) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
        } else {
            $("#FACILITY1").prop("disabled", true);
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY1").next("div.selectBox").addClass("disabled");
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY1", "");
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
        
    });
    
    // '시설' 셀렉트 박스 선택 이벤트
    $("#FACILITY1").next().on("mouseup",".ui-select-option", function(e){
        if($(this).attr('data-value')) {
            $("#FACILITY2").prop("disabled", false);
            $("#FACILITY2").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").empty();
            
            // '세부시설' 셀렉트 박스 데이터 세팅
            $("#MST_CD").val($(this).attr('data-value'));
            $.ajax({
                url : "/front/inquiry/getCode"
              , method : "post"
              , data : $("#form_inquiry").serialize()
              , success : function(data, stat, xhr) {
                  if(data.result == "success" && data.rsCodeDtl) {
                      
                      var selectIndex = Number($("#FACILITY1").val());
                      data.rsCodeDtl.DTL_CD_NM = jsGetMultiLang(selectIndex);
                      
                      selectRemoveThenMakeForInq("#FACILITY2", data.rsCodeDtl, "세부시설");
                  }
              }
            });
            
        } else {
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
    });
    
    // '시설' 셀렉트 박스 선택 이벤트
    $("#FACILITY1").change(function(){
        if($(this).val()) {
            $("#FACILITY1").prop("disabled", false);
            $("#FACILITY1").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").prop("disabled", false);
            $("#FACILITY2").next("div.selectBox").removeClass("disabled");
            $("#FACILITY2").empty();
            
            // '세부시설' 셀렉트 박스 데이터 세팅
            $("#MST_CD").val($(this).val());
            
            $.ajax({
                url : "/front/inquiry/getCode"
              , method : "post"
              , data : $("#form_inquiry").serialize()
              , success : function(data, stat, xhr) {
                  if(data.result == "success" && data.rsCodeDtl) {
                      
                      var selectIndex = Number($("#FACILITY1").val());
                      data.rsCodeDtl.DTL_CD_NM = jsGetMultiLang(selectIndex);
                      
                      selectRemoveThenMakeForInq("#FACILITY2", data.rsCodeDtl, "세부시설");
                  }
              }
            });
            
        } else {
            $("#FACILITY2").prop("disabled", true);
            $("#FACILITY2").next("div.selectBox").addClass("disabled");
            
            selectVal("#FACILITY2", "");
        }
        
        if($("#FACILITY3").length > 0) {
            $("#FACILITY3").closest(".ui-select-wrapper").remove();
        }
    });
    
    // '세부시설' 셀렉트 박스 선택 이벤트
    $(document).on("mouseup", "#FACILITY2 + .selectBox .ui-select-option", function(e){
        if($("#FACILITY3").length == 0) {
            var html  = "<div class='ui-select-wrapper'>";
                html += "   <select class='selectBox' id='FACILITY3' name='CATEGORY4'>";
                html += "</select></div>";
                
            // 호텔 파라다이스(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000001" && $(this).attr("data-value") == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3HotelParaDining, '세부시설 유형');
            }
            // 아트 파라디소(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000002" && $(this).attr("data-value") == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3ArtParaDining, '세부시설 유형');
            }
            // 그룹스&웨딩스(시설) & 견적(세부시설)
            if($("#FACILITY1").val() == "000010" && $(this).attr("data-value") == "000001") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3GrpWedEstimate, '세부시설 유형');
            }
        } else {
            if(!($("#FACILITY1").val() == "000001" && $(this).attr("data-value") == "000004") && !($("#FACILITY1").val() == "000002" && $(this).attr("data-value") == "000004") && !($("#FACILITY1").val() == "000010" && $(this).attr("data-value") == "000001")) {
                $("#FACILITY3").closest(".ui-select-wrapper").remove();
            }
        }
    });
    
    // '세부시설' 셀렉트 박스 선택 이벤트
    $(document).on("change", "#FACILITY2", function(e){
        if($("#FACILITY3").length == 0) {
            var html  = "<div class='ui-select-wrapper'>";
                html += "   <select class='selectBox' id='FACILITY3' name='CATEGORY4'>";
                html += "</select></div>";
                
            // 호텔 파라다이스(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000001" && $(this).val() == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3HotelParaDining, '세부시설 유형');
            }
            // 아트 파라디소(시설) & 다이닝(세부시설)
            if($("#FACILITY1").val() == "000002" && $(this).val() == "000004") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3ArtParaDining, '세부시설 유형');
            }
            // 그룹스&웨딩스(시설) & 견적(세부시설)
            if($("#FACILITY1").val() == "000010" && $(this).val() == "000001") {
                $("#FACILITY2").closest(".ui-select-wrapper").after(html);
                selectRemoveThenMakeForInq("#FACILITY3", fac3GrpWedEstimate, '세부시설 유형');
            }
        } else {
            if(!($("#FACILITY1").val() == "000001" && $(this).val() == "000004") && !($("#FACILITY1").val() == "000002" && $(this).val() == "000004") && !($("#FACILITY1").val() == "000010" && $(this).val() == "000001")) {
                $("#FACILITY3").closest(".ui-select-wrapper").remove();
            }
        }
    });
    
    try {
        //addInputHandler({input:$("#EMAIL"), dataType:"AP", handler:function() {
        addInputHandler({input:$(".inqEmailValidation"), dataType:"AP", handler:function() {
            //$("#EMAIL").closest("dd").removeClass("error");
            $(".inqEmailValidation").closest("dd").removeClass("error");
        }});
    } catch(e) {
        console.log(e);
    }
    
    if($("#TEL").length > 0) {
        try {
            addInputHandler({input:$("#TEL"), dataType:"N", handler:function() {
                $("#TEL").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    if($("#TEL2").length > 0) {
        try {
            addInputHandler({input:$("#TEL2"), dataType:"N", handler:function() {
                $("#TEL2").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    if($("#TEL3").length > 0) {
        try {
            addInputHandler({input:$("#TEL3"), dataType:"N", handler:function() {
                $("#TEL3").closest("dd").removeClass("error");
            }});
        } catch(e) {
            console.log(e);
        }
    }
    
    selectVal("#QUESTION", "문의");
    selectVal("#FACILITY1", "");
    
    $('#QUESTION').children("option").each(function() {
        if ($(this).is(":selected")) {
            $(this).trigger("change");
        }
    });
    
    $('#FACILITY1').children("option").each(function() {
        if ($(this).is(":selected")) {
            $(this).trigger("change");
        }
    });
    
});


function selectVal(id, val){
    var valueIdx;
    $(id).next().find('li').each(function(){
            if($(this).find('a').attr('data-value') == val){
                valueIdx = $(this).index();
            }
    });
    
    var $select = $(id).next().find('li>a').eq(valueIdx).closest(".ui-select-wrapper").find("select");
    
    $select.val(val);
    $(id).next().find('li>a').eq(valueIdx).addClass("selection").parent().siblings().find(".ui-select-option").removeClass("selection");
    $(id).next().find('li>a').eq(valueIdx).closest('.ui-select-options').hide().siblings(".ui-select-trigger").text($(id).next().find('li>a').eq(valueIdx).text());
}

function selectRemoveThenMakeForInq(selector, list, defaultOpt1){
    var html = "";
    if(defaultOpt1) {
        html += "<option value=''>" + defaultOpt1 + "</option>";
    }
    if(!$.isEmptyObject(list)) {
        for(var i = 0; i < list.DTL_CD.length; i++) {
            html += "<option value='" + list.DTL_CD[i] + "'>" + list.DTL_CD_NM[i] + "</option>";
        }
    }
    $(selector).append(html);
    
    var $select = $(selector);
    $select.next("div.selectBox").remove();
    
    if($select.parents('pre').length < 1){
        $select.css("display", "block");
        $(selector).show();
        
        var classes = $select.attr("class"),
            id      = $select.attr("id"),
            name    = $select.attr("name"),
            style   = $select.attr("style");
            
        var template  = '<div class="' + classes + '" style="' +  style + '">';
            template += '<a href="#" class="ui-select-trigger">' + $select.find(':selected').text() + '</a>';
            template += '<ul class="ui-select-options">';
            $select.find("option").each(function(){
                template += '<li><a href="#" class="ui-select-option" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</a></li>';
            });
            template += '</ul></div>';
      
            $select.hide().after(template);
        if($select.is(':disabled')){
            $select.next('.selectBox').addClass('disabled');
        }
    }
    
    //SELECT BOX 재 생성 시  스크롤바 조정
    var targetUl =$(selector).siblings("div.selectBox").find("ul.ui-select-options").eq(0); 
    if (selector == "#FACILITY2") {
        if (targetUl.length > 0) {
            //2번째 selectBox 추가 처리
            targetUl.css("left" , "4px");
        }
    } else if (selector == "#FACILITY3") {
        var facility2Ul = $("#FACILITY2").siblings("div.selectBox").find("ul.ui-select-options").eq(0);
        //SELECT BOX가 3개일 경우, 추가 처리
        if (facility2Ul.length > 0) {
            //2번째 selectBox 추가 처리
            facility2Ul.css("right" , "4px");
            //3번째 selectBox 추가 처리
            targetUl.css("left" , "4px");
        }
    }
}

function jsSave() {
    
    //if(blank_pattern.test($('#EMAIL').val()) == true || emailFormat.test($('#EMAIL').val()) == false){
    if(blank_pattern.test($('.inqEmailValidation').val()) == true || emailFormat.test($('.inqEmailValidation').val()) == false){
        //alert($("#USER_EMAIL").attr("title") + " 형식이 올바르지 않습니다.");
        //$("#EMAIL").closest("dd").addClass("error");
        //$("#EMAIL").closest("div.inp").next(".errorText").text("이메일 형식이 올바르지 않습니다.");
        //$("#EMAIL").focus();
        $(".inqEmailValidation").closest("dd").addClass("error");
        $(".inqEmailValidation").closest("div.inp").next(".errorText").text("이메일 형식이 올바르지 않습니다.");
        $(".inqEmailValidation").focus();
        return;
    }
    
    
    if($("#TEL").length > 0 && $("#TEL").val().length < 7) {
        $("#TEL").closest("dd").addClass("error");
        $("#TEL").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL").focus();
        return;
    }
    
    if($("#TEL2").length > 0 && $("#TEL2").val().length < 3) {
        $("#TEL2").closest("dd").addClass("error");
        $("#TEL2").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL2").focus();
        return;
    }
    
    if($("#TEL3").length > 0 && $("#TEL3").val().length < 4) {
        $("#TEL3").closest("dd").addClass("error");
        $("#TEL3").closest("div.inp").next(".errorText").text("휴대폰번호를 정확히 입력해 주세요.");
        $("#TEL3").focus();
        return;
    }
    
    rtn = $("#form_inquiry").validate();
    
    if (rtn.isValid == false) {
        var sub_fix = "항목을 입력하세요.";
        if (rtn.chkType == "type") {
            sub_fix = "형식이 올바르지 않습니다.";
        }
        
        if (rtn.msg != "") {
            alert(rtn.msg + " " + sub_fix);
        } else {
            alert(sub_fix);
        }
        
        return;     
    }
    
    if(!$("#FACILITY1").val()) {
        alert("시설을 선택해주세요.");
        return;
    }
    
    if(!$("#FACILITY2").val()) {
        alert("세부시설을 선택해주세요.");
        return;
    }
    
    if($("#FACILITY3").length > 0 && !$("#FACILITY3").val()) {
        alert("세부시설 유형을 선택해주세요.");
        return;
    }
    
    if($("#AGREE").is(":checked") == false) {
        alert("‘필수적 개인정보 수집 및 이용에 대한 동의’에 동의하셔야합니다.");
        $("#AGREE").focus();
        return;
    }
    
    

    if(!isNum($("#TEL2").val())) {
        alert("휴대 전화는 숫자만 입력 가능합니다.");
        $("#TEL2").val("");
        $("#TEL2").focus();
        return;
    } else if(!isNum($("#TEL3").val())) {
        alert("휴대 전화는 숫자만 입력 가능합니다.");
        $("#TEL3").val("");
        $("#TEL3").focus();
        return;
    }
    $('#PI_TELNO').val($('#TEL1').val() + '-' + $('#TEL2').val() + '-' + $('#TEL3').val() );


    if($("#QUESTION").val() == "칭찬" || $("#QUESTION").val() == "불만") {
        $("#CRM_VOC_CONN").val("Y");
    }
    
    addValue("휴대폰 번호", "PI_TELNO");
    addValue("시설", "FACILITY1", "", "", true);
    addValue("세부시설", "FACILITY2", "", "", true);
    if($("#FACILITY3").length > 0) {
        addValue('세부시설 유형', "FACILITY3", "", "", true);
    }
    
    addValue("질문유형", "QUESTION");
    addValue("내용", "CTNT");
    
    $("#PI_REG_EMPNO").val($("#PI_CUST_NM").val());
    
    $("#CATEGORY2").val($("#FACILITY1").next("div.selectBox").find(".ui-select-trigger").text());
    $("#CATEGORY3").val($("#FACILITY2").next("div.selectBox").find(".ui-select-trigger").text());
    
     $.ajax({
        url : "/front/inquiry/register"
        , method : "post"
        , data : $("#form_inquiry").serialize()
        , success : function(data, stat, xhr) {
            if (stat == "success") {
                if (data.result != null) {
                    if (data.result == "success") {
                        alert("문의가 정상적으로 등록되었습니다.");
                        //location.href=document.URL;
                        location.reload();
                    }
                } else {
                    $("#PI_VOC_CN").val("");
                    alert("에러가 발생했습니다!");
                }
            }
        }
    });
}

function addValue(objTitle, objNm1, objNm2, objNm3, isSelectBox) {
    var name1 = $("#"+objNm1).val() != null ? $("#"+objNm1).val() : "";
    var name2 = $("#"+objNm2).val() != null ? $("#"+objNm2).val() : "";
    var name3 = $("#"+objNm3).val() != null ? $("#"+objNm3).val() : "";
    
    if(isSelectBox) {
        name1 = $("#"+objNm1).find(':selected').text() != null ? $("#"+objNm1).find(':selected').text() : "";
        name2 = $("#"+objNm2).find(':selected').text() != null ? $("#"+objNm2).find(':selected').text() : "";
        name3 = $("#"+objNm3).find(':selected').text() != null ? $("#"+objNm3).find(':selected').text() : "";
    }
    
    if($("#PI_VOC_CN").val() != "") {
    $("#PI_VOC_CN").val($("#PI_VOC_CN").val() + "\n"+ objTitle+ " : " + name1 + name2 + name3 );
    } else {
        $("#PI_VOC_CN").val( objTitle+ " : " + name1 + name2 + name3  );
    }
    return;
}
    
</script>

<!-- 1:1 문의 (레이어 팝업) -->
<div class="layerPopWrap normalLayer" id="pop1">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
        <h1 class="popHeader popHeaderInq"></h1>
        <div class="inquiryPopCont">
            <form id="form_inquiry" name="form_inquiry">
                <input type="hidden" id="COMM_CD" name="COMM_CD" value="INQ_FAC"/> <!-- COMM_CD -->
                <input type="hidden" id="MST_CD" name="MST_CD" value=""/> <!-- MST_CD -->
                <input type="hidden" id="CD_TYPE" name="CD_TYPE" value="INQ"/> <!-- CD_TYPE -->
                <input type="hidden" id="PI_TELNO" name="PI_TELNO" value=""/> <!-- 연락처 -->
                
                <input type="hidden" id="PI_VOC_CN" name="PI_VOC_CN" value=""/> <!--VOC 내용 -->
                <input type="hidden" id="BBS_CATE_CD" name="BBS_CATE_CD" value="ONE"/>
                <input type="hidden" id="CRM_VOC_CONN" name="CRM_VOC_CONN" value="N"/> <!-- CRM VOC 연계 여부 -->
                <input type="hidden" id="CATEGORY2" name="CATEGORY2" value=""/>
                <input type="hidden" id="CATEGORY3" name="CATEGORY3" value=""/>
                
                <div class="category">
                    <select class="selectBox" id="QUESTION" name="CATEGORY1"> <!-- 클래스 selectBox 추가 -->
                        <option value="">질문유형</option>
                        <option value="칭찬">칭찬</option>
                        <option value="불만">불만</option>
                        <option value="문의">문의</option>
                        <option value="제안">제안</option>
                        <option value="기타">기타</option>
                    </select>
                    <div class="double clearFixed">
                        <!-- 활성화 풀시 (스크립트로 해당영역 체크 해제 시키는 방법)
                            1. 해당 select박스의 disabled삭제
                            2. <div class="selectBox disabled"> 의  disabled 클래스 삭제
                            ※ 디자인 상에서 select 의 디자인 입히는 버전으로 ui.js에서 해당 클래스를 생성하는 코드가 있습니다.
                            반드시 크롬 관리자 화면에서 변경된 마크업 확인 후 변경하시기 바랍니다.
                         -->
                        <select class="selectBox" id="FACILITY1" name="FACILITY1" disabled="disabled">
                            <option value="">시설</option>
                            <option value='000001' >HOTEL PARADISE</option> <option value='000002' >HOTEL ART PARADISO</option> <option value='000003' >CASINO</option> <option value='000004' >CIMER</option> <option value='000005' >CHROMA</option> <option value='000006' >WONDERBOX</option> <option value='000007' >PLAZA</option> <option value='000008' >PARADISE ART SPACE</option> <option value='000009' >STUDIO PARADISE</option> <option value='000010' >GROUP &amp; WEDDINGS</option> <option value='000011' >MEMBERSHIP</option> <option value='000012' >기타</option> 
                        </select>
                        <script type="text/javascript">
                        $("#FACILITY1").find("option").each(function(){ //STUDIO PARADISE > STUDIO PARADISE / CULTURE PARK (000009)
                            if ($(this).val() == "000009") {
                                $(this).text("STUDIO PARADISE / CULTURE PARK");
                                return;
                            }
                        });
                        </script>
                        <select class="selectBox" id="FACILITY2" name="FACILITY2" disabled="disabled">
                            <option value="">세부시설</option>
                        </select>
                    </div>
                </div>
                
                <div class="formInquiryWrap">
                    <dl class="title">
                        <dt>
                            <label for="TITLE">제목 <span class="color">*</span></label>
                            <p class="imp"><span class="color">*</span>필수 입력 항목</p>
                        </dt>
                        <dd>
                            <div class="inp">
                                <input type="text" id="TITLE" name="TITLE" required title="제목">
                                <button class="btnDelete">삭제</button>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="CTNT">내용<span class="color">*</span></label></dt>
                        <dd>
                            <textarea class="textarea" cols="0" rows="0" id="CTNT" name="CTNT" required title="내용"></textarea>
                        </dd>
                    </dl>
                    <div class="clearFixed">
                        <dl class="name">
                            <dt><label for="PI_CUST_NM">이름 <span class="color">*</span></label></dt>
                            <!-- 에러시 dd의 error 클래스 추가 -->
                            <dd>
                                <div class="inp">
                                    <input type="text" id="PI_CUST_NM" name="PI_CUST_NM" value="강경희" required title="이름">
                                    <button class="btnDelete">삭제</button>
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
                                    <input type="email" class="inqEmailValidation" id="EMAIL" name="EMAIL" value="rud178@naver.com" required title="이메일">
                                    <button class="btnDelete">삭제</button>
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
                                <input type="tel" id="TEL2" name="TEL2" required value="3891" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 가운데자리 입력" maxlength="4">
                                <button class="btnDelete">삭제</button>
                            </div>
                            <span>-</span>
                            <div class="inp">
                                <input type="tel" id="TEL3" name="TEL3" required value="8520" onkeydown="return inputNumCheck(event)" onkeyup="removeChar(event)" title="핸드폰 끝자리 입력" maxlength="4">
                                <button class="btnDelete">삭제</button>
                            </div>
                        
                            <div class="errorText">
                                <!-- 에러 메시지 -->
                            </div>
                        </dd>
                    </dl>
                </div>
                
                <div class="termArea">
                    <div>
                        <h2>필수적 개인정보 수집 및 이용에 대한 동의 <span>(필수)</span></h2>
                        <div class="termTxt" tabindex="0">
                            <p>파라다이스시티는 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.<br />
<br />
[개인정보 수집 및 이용 동의]<br />
1. 수집 및 이용 목적 : 회원제 서비스에 따른 본인 확인 절차, 고객 공지 사항 전달 및 불만 처리 등<br />
2. 수집 항목<br />
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 휴대폰번호, Email<br />
- 선택항목 : 주소, 직업, 결혼기념일, 관심 시설, 관심 분야<br />
<br />
3. 개인정보 휴면처리 회원의 개인정보 이용 기준에 대한 유효기간을 아래와 같이 정하며, 최종 이용 시점을 기산일로 하여 유효기간 경과 이후 회원의 개인정보를 분리 저장/관리 또는 파기합니다.<br />
1) 유효기간: 1년<br />
2) 서비스 이용 기준: 멤버십 서비스 이용(회원인증, 홈페이지 로그인, 포인트 조회, 포인트 적립, 포인트 사용, 포인트 조정, 포인트 전환 등), 카드 발급, 호텔 상품 및 서비스 구매, 정보 변경 등<br />
3) 유효기간 경과 이후: 분리 저장 및 관리<br />
가. 분리 저장 및 관리: 파기에 준하는 조치의 일환으로, 장기 미 이용자의 개인정보를 일반회원의 개인정보 DB와 분리하여 별도 저장/관리하고, 일반 직원의 접근 권한을 제한합니다.<br />
나. 유효기간 도래 통지: 유효기간 만료 30일 전까지 e-mail, SMS 등으로 개인정보가 파기 또는 분리 및 보관되는 사실 및 일시, 개인정보 항목을 해당 회원에게 통지합니다.<br />
다. 유효기간 경과 이후 회원이 멤버십 서비스를 이용할 경우, 이를 재이용 요청으로 간주하여 분리 저장/관리 상태에서 정상 이용 상태로 원복합니다.<br />
<br />
4. 개인정보 보유 기간 및 파기시점 회원의 개인정보는 개인정보처리방침 제 2조 개인정보 수집 및 이용 목적의 보유기간이 달성되거나, 고객이 별도 요청할 경우 파기하는 것을 원칙으로 합니다. 다만 아래의 경우 관련 근거에 의해 개인 정보를 보존합니다.<br />
- 보유&bull;이용 기간: 상거래이력<br />
- 보존 근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률<br />
- 보존기간<br />
ㆍ소송이나 법적 분쟁 관련 사항의 근거 자료에 관한 기록: 10년<br />
ㆍ계약 또는 청약 철회 등에 관한 기록 : 5년<br />
ㆍ소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래 등의 소비자 보호에 관한 법률)<br />
ㆍ신용정보의 수집처리 및 이용 등에 관한 기록: 3년(신용정보의 이용 및 보호에 관한 법률)<br />
요금의 과납 또는 미납이 있을 경우와 분쟁이 있을 경우 해결시 까지 보유합니다.<br />
<br />
5. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 회원가입에 제한이 있을 수 있음을 알려드립니다.</p>

                        </div>
                        <div class="checkbox">
                            <input type="checkbox" id="AGREE" name="AGREE" value="Y"><label for="AGREE">동의함</label>
                        </div>
                    </div>
                </div>
            </form>
            
            <div class="btnGroup">
                <a href="javascript:jsSave();" class="btn btnFull small"><span>등록</span></a>
            </div>
        </div>
        <a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
    </div>
    <!-- //layerPopCont -->
</div>
<!-- //1:1 문의 (레이어 팝업) -->

 
		<!-- //1:1문의 -->
		
	</section>
	<!-- //컨텐츠 영역 -->
	
		
</body>
</html>