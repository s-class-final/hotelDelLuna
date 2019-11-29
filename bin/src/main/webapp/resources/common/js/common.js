var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?4b47cbd74fc60910d3e399da479cb0b7";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();

function otos(obj) {
    var str = '';
    for (var p in obj) {
        if (obj.hasOwnProperty(p)) {
            str += p + '::' + obj[p] + '\n';
        }
    }
    return str;
}

function jsCheckMobileDevice() {
    var mobileKeyWords = new Array('Android', 'iPhone', 'iPod', 'BlackBerry', 'Windows CE', 'SAMSUNG', 'LG', 'MOT', 'SonyEricsson');
    
    for (var info in mobileKeyWords) {
        if (navigator.userAgent.match(mobileKeyWords[info]) != null) {
        	return true;
        }
    }
    
    return false;
}

function jsAddRow(obj) {
	var $dynamicRowTable = $("#" + obj);
	var $defineRow = $("#" + obj + " tr.define-row");
		
	var $lastTr = $dynamicRowTable.find('tr:last');
	
	var $clonedDefineRow = $defineRow.clone();
	$clonedDefineRow.removeClass('define-row');

	$lastTr.after($clonedDefineRow);
	
	jsCalcRow($dynamicRowTable);
	
	$dynamicRowTable.find("[dataType=calendar]").each(function(i) {
		if (i > 0) {
			if ($(this).attr("id").indexOf("DTP_") == -1) {
				$(this).attr("id", "DTP_" + $(this).attr("id") + i);
				
				$(this).datepicker({
				      autoclose: true
				      ,format: "yyyy-mm-dd"
				      ,language: "kr"
				});	
			}
		}
	});
}

function jsDeleteRow(objTbl, obj) {
	var $dynamicRowTable = $("#" + objTbl);
	
	$(obj).parent().parent().remove();
	
	jsCalcRow($dynamicRowTable);
}

function jsCalcRow($dynamicRowTable) {
	var i = 0;
	
	$dynamicRowTable.find('.no').each(function (i) {
		$(this).text(i++);
	});
	
	var trCount = $dynamicRowTable.find('tr').size();
		
	if (trCount > $dynamicRowTable.attr("default-row")) {
		$dynamicRowTable.find('tr.no-row').hide();
	} else {
		$dynamicRowTable.find('tr.no-row').show();
	}
}

jQuery.loadScript = function (url, callback) {
    jQuery.ajax({
        url: url,
        dataType: 'script',
        success: callback,
        async: true
    });
}

jQuery.loadCSS = function (url, callback) {
    jQuery.ajax({
        url: url,
        dataType: 'css',
        success: callback,
        async: true
    });
}

function jsSearchAddress($post, $addr1, $addr2) {
	var iWidth = 500; //팝업의 너비
	var iHeight = 600; //팝업의 높이
	var iLeft = ($(window).width() / 2) - (iWidth / 2);
	var iTop = ($(window).height() / 2) - (iHeight / 2);
	
	if (typeof someObject == 'undefined') $.loadScript('http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false', function(){
		daum.postcode.load(function(){
		    new daum.Postcode({
		    	width: iWidth, //생성자에 크기 값을 명시적으로 지정해야 합니다.
		        height: iHeight,
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullAddr = ''; // 최종 주소 변수
		            var extraAddr = ''; // 조합형 주소 변수
		
		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                fullAddr = data.roadAddress;
		
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                fullAddr = data.jibunAddress;
		            }
		
		            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		            if(data.userSelectedType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            $post.val(data.zonecode); //5자리 새우편번호 사용
		            $addr1.val(fullAddr);
		
		            // 커서를 상세주소 필드로 이동한다.
		            $addr2.focus();
		        }
		    }).open({
		        left: iLeft,
		        top: iTop
		    });
		});
	});
}

function UvColorBoxAdd(sUrl, sWidth, sHeight, sTitle) {
	var colorbox_css = $( "#colorbox_css" ).attr("href");
	colorbox_css = colorbox_css + "";

	if (colorbox_css == "undefined") {
		$("head").append("<link id='colorbox_css' href='/common/component/colorbox/colorbox.css' rel='stylesheet'>");
		$("head").append("<script src='/common/component/colorbox/jquery.colorbox.js'></script>");
	}
	
	$.colorbox({
		href:sUrl, 
		iframe:true, 
		frastIframe: false,
		innerWidth:sWidth, 
		innerHeight:sHeight,
		title: function(){
            return sTitle;
        }  
	});
}

function UvColorBoxClose() {
	try {
		$.colorbox.close();
	} catch(e) {}
}

function toNotNull(oStr) {
	return toNotNull(oStr, null);
}

function toNotNull(oStr, def) {
	
	if (def == null || typeof def == 'undefined') {
		def = "";
	}
	
	if (typeof oStr == "object") {
		return def;
	} else {
		if (oStr == null || oStr == 'null' || typeof oStr == 'undefined') {
			oStr = def;
		}
	}
	
	return oStr;
}

function isNullOrEmpty(obj) {

	if (typeof obj == "undefined") {
		return true;
	}
	
	if (obj == undefined || obj == null || obj === "") {
		return true;
	}
	
	return jQuery.isEmptyObject(obj);
}

function showMsg(sCtnt, sTitle, sBtnTitle, sWidth, sHeight, sCallback) {
	var colorbox_css = $( "#colorbox_css" ).attr("href");
	colorbox_css = colorbox_css + "";
	
	if (colorbox_css == "undefined") {
		$("head").append("<link id='colorbox_css' href='/resource/front/inc/css/colorbox.css' rel='stylesheet'>");
		//$("head").append("<script src='/resource/front/inc/js/jquery.colorbox.js'></script>");
	}
	
	sCallback = sCallback + "";
	if (sCallback == "undefined") {
		sCallback = "javascript:closeMsg();";
	}
	
	var html = "";
	
	html = html  + '<style>';
	html = html  + 'img {';
	html = html  + 'max-width: 100%;';
	html = html  + '} ';
	html = html  + '</style>';
	html = html  + '<div>';
	html = html  + '	<div id="inline_content" style="background:#fff;">';
	html = html  + '		<div class="ly_pop_wrap open">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont">';
	html = html  + '					<div class="bx_line">';
	html = html  + sCtnt;
	html = html  + '					</div>';
	html = html  + '					<div class="btn_area">';
	html = html  + '						<a href="' + sCallback + '" class="btns btn_orange">';
	html = html  + '							<span>' + sBtnTitle + '</span>';
	html = html  + '						</a>';
	html = html  + '					</div>';
	html = html  + '				</div>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	$.getScript("/resource/front/inc/js/jquery.colorbox.js", function( data, textStatus, jqxhr ) {
		$.colorbox({
			html:html,
			innerWidth:sWidth, 
			innerHeight:sHeight,
			maxHeight:'80%',
			maxWidth:'95%',
			title: function(){
				return sTitle;
	        },
	        onComplete : function() {
	            jQuery(this).colorbox.resize();
	        }        
		});	
	});
	
	
	jQuery(window).resize(function() {
        jQuery.colorbox.resize({width:sWidth});
    });
}

function showWindow(sCtnt, sTitle, sWidth, sHeight) {
	var colorbox_css = $( "#colorbox_css" ).attr("href");
	colorbox_css = colorbox_css + "";
	
	if (colorbox_css == "undefined") {
		$("head").append("<link id='colorbox_css' href='/resource/front/inc/css/colorbox.css' rel='stylesheet'>");
		//$("head").append("<script src='/resource/front/inc/js/jquery.colorbox.js'></script>");
	}
			
	var html = "";
	html = html  + '<div>';
	html = html  + '	<div id="inline_content" style="background:#fff;">';
	html = html  + '		<div class="ly_pop_wrap open">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont" style="height:' + sHeight + ';overflow-y:inherit;max-height:auto">';
	html = html  + '					<iframe src="' + sCtnt + '" frameborder="0" width="100%" height="95%" style="margin: 0px">';
	html = html  + '				</div>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	$.getScript("/resource/front/inc/js/jquery.colorbox.js", function( data, textStatus, jqxhr ) {
		$.colorbox({
			html:html,
			innerWidth:sWidth, 
			innerHeight:sHeight,
			maxHeight:'80%',
			maxWidth:'95%',
			title: function(){
				return sTitle;
	        },
	        onComplete : function() {
	            jQuery(this).colorbox.resize();
	        }        
		});
	});
	
	jQuery(window).resize(function() {
        jQuery.colorbox.resize({width:sWidth});
    });
}
//pullsize layer center popup
function showCentLayer(obj, sCtnt, sTitle, sBtnTitle, sCallback) {
	var html = "";
	
	if(sCallback == null || sCallback == 'undefined') {
		sCallback = "javascript:smallLayerPopup.confirmClose();";

	}
	html = html  + '<div id="cboxOverlay" style="opacity:.9"></div>';
	html = html  + '<div class="ui_pop_layer center">';
	html = html  + '	<div id="inline_content">';
	html = html  + '		<div class="ly_pop_wrap open">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont">';
	html = html  + '					<div class="bx_line">';
	html = html  + sCtnt;
	html = html  + '					</div>';
	html = html  + '					<div class="btn_area center">';
	html = html  + '						<a href="' + sCallback + '" class="btns btn_orange">';
	html = html  + '							<span>' + sBtnTitle + '</span>';
	html = html  + '						</a>';
	html = html  + '					</div>';
	html = html  + '				</div>';
	html = html  + '				<a href="#" class="ly_close"><span class="hide_txt">닫기</span></a>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	$('body').append(html);
	smallLayerPopup.init(obj);
	//close function => smallLayerPopup.confirmClose();
	
}

//pullsize layer popup
function showMsgMob(obj, sCtnt, sTitle, sBtnTitle, sCallback) {
	
	if(sCallback == null || sCallback == 'undefined') {
		sCallback = "javascript:fullLayerPopup.confirmClose();";
	}
	var html = "";
	
	html = html  + '<div class="ui_pop_fullLayer" style="display:none;position:absolute;width:100%;height:100%;top:0;left:0;z-index:300">';
	html = html  + '	<div id="inline_content">';
	html = html  + '		<div class="ly_pop_wrap open">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont">';
	html = html  + '					<div class="bx_line">';
	html = html  + sCtnt;
	html = html  + '					</div>';
	html = html  + '					<div class="btn_area center">';
	html = html  + '						<a href="' + sCallback + '" class="btns btn_orange">';
	html = html  + '							<span>' + sBtnTitle + '</span>';
	html = html  + '						</a>';
	html = html  + '					</div>';
	html = html  + '				</div>';
	html = html  + '				<a href="#" class="ly_close"><span class="hide_txt">닫기</span></a>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	$('body').append(html);
	fullLayerPopup.init(obj);
	//close function => fullLayerPopup.confirmClose();
	
}

//도면보기
function drawMapMob(obj, sCtnt, sTitle, sBtnTitle, sCallback){
		
	var html = "";
	
	html = html  + '<div class="ui_pop_drawing" style="display:none;position:absolute;width:100%;height:100%;top:0;left:0;z-index:300">';
	html = html  + '	<div id="inline_content">';
	html = html  + '		<div class="ly_pop_wrap open">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont">';
	html = html  + '					<div class="bx_line">';
	html = html  + sCtnt;
	html = html  + '					</div>';
	html = html  + '				</div>';
	html = html  + '				<a href="#" class="ly_close"><span class="hide_txt">닫기</span></a>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	$('body').append(html);
	drawingPopup.init(obj);
	/*drawingPopup.confirmClose();*/
}

//pullsize iframe popup
function showWindowMob(obj, sCtnt, sTitle) { 

	var html = "";
	html = html  + '';
	html = html  + '<div class="ui_pop_iframe" style="display:none;position:absolute;width:100%;height:100%;top:0;left:0;z-index:300">';
	html = html  + '	<div id="inline_content">';
	html = html  + '		<div class="ly_pop_wrap ly_pop_full">';
	html = html  + '			<div class="ly_pop">';
	html = html  + '				<div class="ly_head">' + sTitle + '</div>';
	html = html  + '				<div class="ly_cont" style="-webkit-overflow-scrolling : touch">';
	html = html  + '					<iframe src="' + sCtnt + '" frameborder="0" width="100%" style="visibility:hidden"></iframe>';
	html = html  + '				</div>';
	html = html  + '				<a href="#" class="ly_close"><span class="hide_txt">닫기</span></a>';
	html = html  + '			</div>';
	html = html  + '		</div>';
	html = html  + '	</div>';
	html = html  + '</div>';
	
	
	$('body').append(html);
	iframePopup.init(obj);
	
}

function closeMsg() {
	try {
		$.colorbox.close();
	} catch(e) {}
}

function closeMsgMob() {
	iframePopup.confirmClose();
}


function inputNumCheck(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39)
	{
		return;
	}
	else
	{
		return false;
	}
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

function setSession(obj) {        
    if(!$("#hiddenIframe").length)  
    	$("body").append('<iframe name="hiddenIframe" id="hiddenIframe" width="200px" height="200px" style="display:none"></iframe>');
    
    $("#hiddenIframe").load(function() {
    	$(obj).attr("target", "");
    	
        $("#hiddenIframe").remove();
        
        try {
        	parent.jsMakeFinish();
        } catch(e) {}
    });
    
    $(obj).attr("target", "hiddenIframe");
    $(obj).attr("action", "/session");
    $(obj).submit();
}

function setSession2(obj) {        
    if(!$("#hiddenIframe").length)  
    	$("body").append('<iframe name="hiddenIframe" id="hiddenIframe" width="200px" height="200px" style="display:none"></iframe>');
    
    $("#hiddenIframe").load(function() {
    	$(obj).attr("target", "");
    	
        $("#hiddenIframe").remove();
        
        try {
        	jsMakeFinish();
        } catch(e) {}
    });
    
    $(obj).attr("target", "hiddenIframe");
    $(obj).attr("action", "/session");
    $(obj).submit();
}

function addInputHandler(conditions){
    var $input = conditions.input;
    var dataType = conditions.dataType;
    var eventType = conditions.eventType;
    if ((!$input) || (!dataType)) {
        throw {error:"NotEnoughArguments", errorMsg:"required argument is missing " +((!$input)?" target input element":" dataType")}
        return;
    }
    if ($input[0].tagName != "INPUT") {
        throw {error:"IlregalTargetElement", errorMsg:"target element is not input"};
        return;
    }
    if ((!eventType)) {
        eventType = "keyup";
    }
    var handlerFunc = conditions.handler;
    if ((!handlerFunc)) {
        handlerFunc = function(event){
            $("#divKeyCode").empty().html("<span> event key code = "+event.keyCode+"</span>");
            var regEx = null;
            if (dataType == "N") {
                regEx = /[^0-9]/gi;
            } else if (dataType == "AP") {
                regEx = /[^a-z]/gi;
            } else if (dataType == "AN") {
                regEx = /[^a-z0-9]/gi;
            } else if (dataType == "HA") {
                regEx = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
            } else {
                throw {error:"IlregalDataType", errorMsg:"dataType("+dataType+") is incorrect"}     
            }
            remainOnlyTargetValue(regEx, $input,event);
            //return true;
        };  // end of handlerFunc
    } // end of if to check handlerFunc
    $input.on(eventType,handlerFunc);
    
    if (conditions.maxlength) {
        $input.attr("maxlength",conditions.maxlength);
    }
    
}

function remainOnlyTargetValue(regEx, $input,event) {
    if ((!(event.keyCode >=34 && event.keyCode<=40)) && event.keyCode != 16) {
        var inputVal = $input.val();
        if (regEx.test(inputVal)) {
            $input.val(inputVal.replace(regEx,''));    
        }
    }
}

function jsAppendSelectUi(eleObj, selOpt) {
	var tgtArr = selOpt.TGT;
	for(var i = 0; i < tgtArr.length; i++) {
		// SELECT BOX를 생성할 Ul 태그
		var targetUl = eleObj.find("div.selectBox."+tgtArr[i]).find("ul");
		var targetSelBoxUl = eleObj.find("select.selectBox."+tgtArr[i]);
		// SELECT BOX를 생성할 Ul 초기화
		targetUl.empty();
		targetSelBoxUl.empty();

		// SELECT BOX의 활성화 여부가 TRUE인 경우
		if (selOpt.ABL[i]) {
			// SELECT BOX재생성
			var liLength = (typeof selOpt.LEN === 'object') ? selOpt.LEN[i] : selOpt.LEN;
			var startTxt = (typeof selOpt.STT === 'object') ? selOpt.STT[i] : selOpt.STT;
			
			if (selOpt.ORD == "DESC") {
				for (var j = liLength; j >= selOpt.STR; j--) {
					var optVal = j;
					if (!isNullOrEmpty(startTxt) && j == liLength) {
						//기본값이 없을 경우
						if (selOpt.EMT) {
							optVal = "";
						}
						targetUl.append($("<li>").append($("<a>").addClass("ui-select-option").attr("data-value", optVal).text(startTxt)));
						targetSelBoxUl.append($("<option value="+ optVal +">"+ startTxt +"</option>"));
					} else {
						if (selOpt.PAD) {
							optVal = pad(optVal, selOpt.PAD);
						}
						var optTxt = optVal + selOpt.TXT;
						targetUl.append($("<li>").append($("<a>").addClass("ui-select-option").attr("data-value", optVal).text(optTxt)));
						targetSelBoxUl.append($("<option value="+ optVal +">"+ optTxt +"</option>"));
					}
				}
			} else {
				for (var j = selOpt.STR; j <= liLength; j++) {
					var optVal = j;
					if (!isNullOrEmpty(startTxt) && j == selOpt.STR) {
						//기본값이 없을 경우
						if (selOpt.EMT) {
							optVal = "";
						}
						targetUl.append($("<li>").append($("<a>").addClass("ui-select-option").attr("data-value", optVal).text(startTxt)));
						targetSelBoxUl.append($("<option value="+ optVal +">"+ startTxt +"</option>"));
					} else {
						if (selOpt.PAD) {
							optVal = pad(optVal, selOpt.PAD);
						} 
						var optTxt = optVal + selOpt.TXT;
						targetUl.append($("<li>").append($("<a>").addClass("ui-select-option").attr("data-value", optVal).text(optTxt)));
						targetSelBoxUl.append($("<option value="+ optVal +">"+ optTxt +"</option>"));
					}
				}
			}

			// 선택지가 한개 이상 존재하는 경우 선택된 값을 확인
			if (targetUl.find("a.ui-select-option").length) {
				// 선택된 값이 없으면 첫번째 값을 기본값
				if (isNullOrEmpty(selOpt.SEL[i])) {
					targetUl.find("a.ui-select-option").eq(0).addClass("selection");
					targetUl.siblings("a.ui-select-trigger").text(targetUl.find("a.ui-select-option").eq(0).text());
					targetSelBoxUl.find("option").eq(0).prop("selected", true);
				} else {
					var selVal = selOpt.SEL[i];
					if (selOpt.PAD) {
						selVal = pad(selVal, selOpt.PAD);
					}
					targetUl.find("a.ui-select-option[data-value='"+selVal+"']").addClass("selection");
					targetUl.siblings("a.ui-select-trigger").text(targetUl.find("a.ui-select-option[data-value='"+selVal+"']").text());
					targetSelBoxUl.find("option[value="+selVal+"]").prop("selected", true);
				}
				
				// SELECT BOX 활성화
				eleObj.find("div.selectBox."+tgtArr[i]).removeClass("disabled");
			}
		} else {
			//선택지 초기화
			targetUl.siblings("a.ui-select-trigger").text("");
			
			//SELECT BOX 비활성화
			eleObj.find("div.selectBox."+tgtArr[i]).addClass("disabled");
		}
	}
}

//달력 설정용 정보(MIN : 100년 기준)
function jsCalendarInfo(yyyy, mm, dd) {
	//오늘 날짜
	var today    = new Date();

	//연, 월, 일  : YYYY, MM, DD
	var thisYear = toNotNull(yyyy);
	var thisMonth= toNotNull(mm);
	var thisDay = toNotNull(dd);

	//월별일자 MAX Array
	var monthArray = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
	//연 MIN (-100년 기준)
	var minYear    = today.getFullYear() - 100;
	//월 MAX
	var maxMonth   = "";
	//일 MAX
	var maxDays    = "";
	
	//지정된 연도가 없으면 월, 일에 대한 select Box는 기본값
	if (isNullOrEmpty(thisYear)) {
		maxMonth   = 0;
		maxDays    = 0;
	} else {
		//maxMonth
		maxMonth   = 12;
		//지정된 월이 있으면 해당 월의 MaxDay를 산출
		maxDays    = jsNumber(monthArray[jsNumber(thisMonth)-1]);
		//윤달 확인
		if (thisMonth == 2) { 
			maxDays = (thisYear % 4 == 0 && thisYear % 100 != 0 || thisYear % 400 == 0) ? maxDays : 28;
		}
	}
	
	//반환값용 Object 설정
	var info = { 
		 thisYear  : thisYear
		,thisMonth : thisMonth
		,thisDay   : thisDay
		,minYear   : minYear
		,maxMonth  : maxMonth
		,maxDays   : maxDays
	};
	
	return info;
}

//달력 설정용 정보(생년월일 : MAX : 현재 시점 - 19년)
function jsBirthDayCalInfo(yyyy, mm, dd) {
	//연 MAX (현재 시점 -19년(기본값에 대한 Index +1))
	var maxYear = new Date().getFullYear() - 19 + 1;
	var calInfo = jsCalendarInfo(yyyy, mm, dd);
	calInfo.maxYear = maxYear;
	
	return calInfo;
}

//달력 설정용 정보(공통 : MAX : 현재 시점)
function jsCommonCalInfo(yyyy, mm, dd) {
	//연 MAX (현재 시점 (기본값에 대한 Index +1))
	var maxYear = new Date().getFullYear() + 1;
	var calInfo = jsCalendarInfo(yyyy, mm, dd);
	calInfo.maxYear = maxYear;
	
	return calInfo;
}

//달력 그리기 : PC (YYYY- MM- DD : selectBox)
function jsSelectCalendar(target, txtArr, clsArr, calInfo) {
	//SELECT UI 재생성 (연도)
	var yyInfo = { 
		 LEN : [calInfo.maxYear] 
		,STR : calInfo.minYear
		,TXT : ""
		,TGT : [clsArr[0]]
		,SEL : [calInfo.thisYear]
		,ABL : [true]
		,STT : [txtArr[0]]
		,EMT : true
		,ORD : "DESC"
	};
	jsAppendSelectUi(target, yyInfo);
	
	//SELECT UI 재생성 (월)
	var mmInfo = {
		 LEN : [calInfo.maxMonth]
		,STR : 0
		,TXT : ""
		,TGT : [clsArr[1]]
		,SEL : [calInfo.thisMonth]
		,ABL : [true]
		,STT : [txtArr[1]]
		,EMT : true
		,PAD : 2
	};
	jsAppendSelectUi(target, mmInfo);
	
	//SELECT UI 재생성 (일)
	var ddInfo = {
		 LEN : [calInfo.maxDays]
		,STR : 0
		,TXT : ""
		,TGT : [clsArr[2]]
		,SEL : [calInfo.thisDay]
		,ABL : [true]
		,STT : [txtArr[2]]
		,EMT : true
		,PAD : 2
	};
	jsAppendSelectUi(target, ddInfo);
}

//옵션 추가(전체)
function jsAddSelOptionAll(start, end, id, selOpt) {
	//초기 옵션 Claer
	$(id).empty();

	//옵션 추가 순서 확인 (역방향 확인)
	if (selOpt.ORD == "DESC") {
		for (var i = start; i >= end; i--) {
			jsAddSelOption(id, i, start, selOpt);
		}
	} else {
		for (var i = start; i <= end; i++) {
			jsAddSelOption(id, i, start, selOpt);
		}
	}
	
	//선택된 값이 있으면 선택
	$(id).find("option[value='"+selOpt.SEL+"']").prop("selected", true);
}
//옵션 추가(개별)
function jsAddSelOption(target, idx, start, selOpt) {
	var optVal = "";
	var optTxt = "";
	if (idx == start && !isNullOrEmpty($(target).attr("title"))) {
		optTxt = toNotNull($(target).attr("title"));
	} else {
		if (selOpt.PAD) {
			optVal = pad(idx, selOpt.PAD);
		} else {
			optVal = idx;
		}
		optTxt = optVal;
	}
	$(target).append($("<option value='" + optVal + "'>" + optTxt + "</option>"));
}

//부가세 계산 (amt : 총 판매금액)
function vatCalc(amt) {
	var rInt     = 10        //세율
	var rDecimal = rInt/100  //부가세 적용률
	//10원 단위로 버림 
	var vat   = Math.floor(((amt/(1+rDecimal))*rDecimal)/10) * 10
	var price = Math.round(amt - vat); // 단가(반올림)
	vat       = Math.round(vat);       // 부가세(반올림)
	
	return [price, vat];
}

// '공유하기' 주소 설정
function setShareUrl() {
	$(".cpTxt").val(document.URL);
}

// '공유하기' 링크
function jsShareFacebook() {	
	window.open("https://www.facebook.com/sharer/sharer.php?u=" + $("meta[property='og\\:url']").attr("content"), "", "width=500, height=400");
}

function jsShareTwitter() {
	window.open("https://twitter.com/intent/tweet?text=" + $("meta[property='og\\:title']").attr("content") + " " + $("meta[property='og\\:description']").attr("content") + "&url=" + $("meta[property='og\\:url']").attr("content"), "", "width=500, height=400");
}

// '공유하기' 주소 복사
function jsTxtCopy() {
	$(".cpTxt").select();
	document.execCommand("copy");
}

//데이터 타입 변경  : 문자(숫자가 아닌게 포함된경우 제거) -> 숫자
function jsNumber(amtStr) {
	return Number(toNotNull(amtStr).toString().replace(/[^0-9]/g,""));
}

//박수 계산
function jsCalcPerDay(fromDate, toDate) {
	if (isDateLen10(fromDate) && isDateLen10(toDate)) {
		return moment(replaceAll(toDate, ".", "-"),'YYYY-MM-DD').diff(replaceAll(fromDate, ".", "-"),'day');
	}
	return 0;
}

//날짜 형식 확인(YYYY.MM.DD)
function isDateLen10(d) {
	var re = /^(19|20)\d{2}.(0[1-9]|1[012]).(0[1-9]|[12][0-9]|3[0-1])$/;
	return re.test(d);
}

//문자열 치환 
function replaceAll(str, searchStr, replaceStr) {
	return toNotNull(str).split(searchStr).join(replaceStr);
}

//문자열 자릿수 증가 (0 -> 000)
function pad(n, width) {
	n = n + '';
// 	return n;
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

//로딩바(전체 딤 처리 : ID > fullLodingSpan)
function fullLoding(element) {
	var loading = $("<div>").addClass("fullLoding").append($("<span>").attr("id", "fullLodingSpan"));
	$(element).append(loading);
}

//로딩바(전체 딤 해제 : ID > fullLodingSpan)
function fullLodingClose(){
	if ($("#fullLodingSpan").length > 0) {
		var loading = $("#fullLodingSpan").closest("div.fullLoding");
		loading.remove();
	}
}

//모바일 로딩바(전체 딤 처리 : class > loading)
function fullLodingM(element) {
	var loading = $("<div>").addClass("loading zI5000").append($("<div>").addClass("inner")).append($("<img>").attr("src", "/mobilePub/static/images/common/loading.svg"));
	if ($(element).find("div.loading").length == 0) $(element).append(loading);
}

//모바일 로딩바(전체 딤 해제 : class > loading)
function fullLodingCloseM(){
	if ($(".loading").length > 0) {
		var loading = $(".loading");
		loading.remove();
	}
}

//로딩바 : 리스트 없음 : ID > listLodingP
function listLoding(element, message) {
	var loading = $("<div>").addClass("listLoding").append($("<p>").attr("id","listLodingP").text(toNotNull(message)));
	$(element).append(loading);
}

//로딩바 : 리스트 없음 해제 : ID > listLodingP
function listLodingClose(){
	if ($("#listLodingP").length > 0) {
		var loading = $("#listLodingP").closest("div.listLoding");
		loading.remove();
	}
}

function compareDate(startDt, endDt) {
	var startDtArr = startDt.split("-");
	var endDtArr = endDt.split("-");
	var dt1 = new Date(parseInt(startDtArr[0]), parseInt(startDtArr[1])-1, parseInt(startDtArr[2]));
	var dt2 = new Date(parseInt(endDtArr[0]), parseInt(endDtArr[1])-1, parseInt(endDtArr[2]));
	return dt2.getTime() - dt1.getTime();
}


/**
 * 바이트수 반환  
 * 
 * @param obj : tag jquery object
 * @returns {Number}
 */
function byteCheck(obj){
    var codeByte = 0;
    for (var idx = 0; idx < obj.val().length; idx++) {
        var oneChar = escape(obj.val().charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 2;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    
    return codeByte;
}

function capitalizeStr(str) {
	str = toNotNull(str)
	return str.substring(0,1).toUpperCase() + str.substring(1).toLowerCase();
}

