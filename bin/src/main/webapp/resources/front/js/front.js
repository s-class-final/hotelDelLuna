var screen_position;
$(document).bind('cbox_open', function() {
	screen_position = $('body').scrollTop();
	$('body').css({
		overflow : 'hidden'
	});
	$('body').scrollTop(0);
}).bind('cbox_closed', function() {
	$('body').css({
		overflow : 'auto'
	});
	$('body').scrollTop(screen_position);
});

jQuery(function($) {
	jQuery.fn.intVal = function() {
		return $(this).val().replace(/,/gi, '') * 1;
	}
	
	jQuery.fn.validate = function() {
		try {
			var rtn = {};
			var dispName;
			var dataType;
			var minValue;
			var maxValue;
			var isValid;
			var value;
			var value_org;
			
			isValid = true;
			
			rtn.isValid = isValid;
			
			$.each($(this)[0].elements, function(i, o) {
				var _this = $(o);
				
				dataType = _this.attr("type");
				
				dispName = _this.attr("title");
				dispName = dispName + "";
				
				if (dispName == "undefined") {
					dispName = "";
				}
				
				if (dispName == "null") {
					dispName = "";
				}
				
				rtn.msg = dispName;
				rtn.obj = _this;
				
				if(_this.get(0).tagName.toUpperCase() != "OBJECT") {
					rtn.chkType = "req";
					
					value_org = _this.val();
					
					_this.val($.trim(_this.val()));
					
					value = _this.val();
					value = value + "";
					
					if (value == "null") {
						_this.val(value_org);
						value = _this.val();
					}
					
					if (_this.attr("required") != null) {
						isValid = false;
						
						if (_this.is(":radio") || _this.is(":checkbox")) {
							var objs = $("input[name='" + _this.attr("name") + "']");
							if (objs.length > 1) {
								for (j = 0; j < objs.length; j++) {
									if (objs[j].checked) {
										isValid = true;
										break;
									}
								}
							} else {
								if (_this.is(":checked")) {
									isValid = true;
								}
							}
						} else if (_this.is(":text") || _this.is("textarea") || _this.is(":password")) {
							if (_this.attr("editor") == "true") {
								_this.val(eval("CKEDITOR.instances." + _this.attr("name")).getData());
								
								value = _this.val();
							}
							
							if (value != "") {
								var strGuide = _this.attr("guide");
								if (strGuide != null && strGuide != "") {
									if (value == strGuide) {
										isValid = false;
									} else {
										isValid = true;
									}
								} else {
									isValid = true;
								}
							}
						} else {
							if (value != "") {
								isValid = true;
							} else {
								if (_this.attr("comma") != null) {
									_this.val(0);
									isValid = true;
								}
							}
						}
						
						if (!isValid) {
							_this.focus();
							return false;
						}
					}
					
					if (dataType == "email" || dataType == "password"||dataType == "tel") {
						rtn.chkType = "type";
						
						if (dataType == "email") {
							if (_this.attr("required") != null) {
								isValid = isEmail(value);
							}
						} else if (dataType == "password") {
							if (_this.attr("required") != null) {
								isValid = isPassword(value);
							}
						}else if("tel"){
							isValid = isNum(value)
						}
						
						if (!isValid) {
							_this.focus();
							return false;
						}	
					}
				}
				
				/*var maxLength = parseInt(_this.attr("maxlength"));
				
				if (maxLength != "NaN") {
					rtn.chkType = "len";
					
					if (_this.attr("readOnly") == false && maxLength > 0 && getByteLength(value) > maxLength) {
						//alert(dispName + " 길이가 " + maxLength + "(한글 " + (maxLength / 2) + "자) 을(를) 넘습니다.");
						isValid = false;
					}
					
					if (!isValid) {
						_this.focus();
						return false;
					}
				}*/
			});
			
			rtn.isValid = isValid;
			return rtn;
		} catch (e) {
			rtn.isValid = false;
			return rtn;
		}
	}
});

function showVOCPopup(CTNT, TITLE) {
	var title = "예약문의";
	var goURL = "/front/inquiry/pop";
	
	if(TITLE != null && TITLE != "") {
		title = TITLE;
	}
	showWindow(goURL+CTNT, title, '700px', '599px' );
}

function showVOCPopupMob(obj, CTNT, TITLE) {
	var title = "예약문의";
	var goURL = "/front/inquiry/pop";
	
	if(TITLE != null && TITLE != "") {
		title = TITLE;
	}
	showWindowMob(obj, goURL+CTNT, title);
}


function jsPrintScreen() {
	$.getScript("/common/component/jqprint/jquery.jqprint-0.3.js", function( data, textStatus, jqxhr ) {
		$("#content").jqprint();
	});
}

function jsPrintRevScreen() {
	$.getScript("/common/component/jqprint/jquery.jqprint-0.3.js", function( data, textStatus, jqxhr ) {
		$(".none_print").hide();
		
		$("#contentRev").jqprint();
	});
}

function jsShareFacebook() {	
	window.open("https://www.facebook.com/sharer/sharer.php?u=" + $("meta[property='og\\:url']").attr("content"), "", "width=500, height=400");
}

function jsShareTwitter() {
	window.open("https://twitter.com/intent/tweet?text=" + $("meta[property='og\\:title']").attr("content") + " " + $("meta[property='og\\:description']").attr("content") + "&url=" + $("meta[property='og\\:url']").attr("content"), "", "width=500, height=400");
}

function jsShareEmail() {
	window.open("/mailForm/shareEmail?text=" + $("meta[property='og\\:title']").attr("content") + " " + $("meta[property='og\\:description']").attr("content") + "&url=" + $("meta[property='og\\:url']").attr("content"), "", "width=920, height=660");
}

function jsShareEmailMob() {
	window.open("/mailForm/shareEmail?text=" + $("meta[property='og\\:title']").attr("content") + " " + $("meta[property='og\\:description']").attr("content") + "&url=" + $("meta[property='og\\:url']").attr("content"), "");
}
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}