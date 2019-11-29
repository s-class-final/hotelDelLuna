/*******************************************************************************
 * 각종 체크 함수
 ******************************************************************************/

/**
 * 법인번호 체크
 *
 * @param	str
 * @return	boolean
 */
function checkCorporate(str) {
	var checkNum = new Array("1","2","1","2","1","2","1","2","1","2","1","2");

	//등기관서별 분류번호, 법인종류별 분류번호 및 일련번호를 차례로 연결한 12자리
	//의 숫자를 만든다.
	var newNum = new Array();
	for(var i = 0; i < str.length -1; i++) {
		newNum[i] = str.charAt(i);
	}

	//각 숫자에 차례로 1과 2를 곱한 다.값을 모두 더하여 합을 구한다.
	var multiNum = new Array();
	for(var k = 0; k < newNum.length; k++) {
		multiNum[k] = checkNum[k] * newNum[k];
	}

	//alert("각 숫자에 차례로 1과 2를 곱한 다: "+ multiNum[11]);
	//곱한 값을 모두 더하여 합을 구한다.
	var addNum = 0;
	for(var y = 0; y < multiNum.length; y++) {
		addNum = addNum + Number(multiNum[y]);
	}

	//alert("곱한 값을 모두 더하여 합을 구한다: "+ addNum);
	//합을 10으로 나누어 몫과 나머지를 구한다.
	var remainder;
	var quota;
	remainder = Number(addNum) % 10;
	quota = Number(addNum) / 10;
	//10에서 나머지를 뺀 값을 오류검색번호로 한다. 다만, 10에서 나머지를 뺀 값이
	//10인 때에는 0을 오류검색번호로 한다.
	var failCheckNum;
	if( (10 - Number(remainder)) == 10 ) {
		failCheckNum = 0;
	} else {
		failCheckNum = 10 - Number(remainder);
	}
	//alert("오류검색번호: "+ failCheckNum);
	if(failCheckNum != str.charAt(12)) {
		return false;
	}

	return true;
}

/**
 * 이메일 체크
 *
 * @param	email
 * @return	boolean
 */
function checkEmail(email) {
	re = /[^@]+@[A-Za-z0-9_-]+[.]+[A-Za-z]+/;

	if (re.test(email)) {
		return	true;
	}

	return	false;
}

/**
 * 날짜 체크
 *
 * @param	date	YYYYMMDD or YYMMDD
 * @return	boolean
 */
function checkDate(date) {
	
	var re = LENGTH_DATE == 8 ? /^[0-9]{8,8}$/ : /^[0-9]{6,6}$/;
	if (!re.test(date)) {
		return	false;
	}

	var year = eval(date.substring(0, LENGTH_DATE - 4));
	var month = eval(date.substring(LENGTH_DATE - 4, LENGTH_DATE - 2));
	var day = eval(date.substring(LENGTH_DATE - 2, LENGTH_DATE));

	// 월 12달 체크
	if (month < 1 || month > 12) {
		return	false;
	}

	// 연도를 끝 두자리로 표시할 경우 앞 두자리를 붙인다.
	if (LENGTH_DATE == 6) {
		if (year < 51) {
			year += 2000;
		} else {
			year += 1900;
		}
	}

	// 해당 월의 일수 체크
	var endDays = totalDays(year, month);
	if (day > endDays || day < 1) {
		return	false;
	}

	return	true;
}

/**
 * 시간 체크
 *
 * @param	time	HH24MI
 * @return	boolean
 */
function checkTime(time) {
	re = /^(([0-1][0-9])|(2[0-3]))[0-5][0-9]$/;

	if (re.test(time)) {
		return	true;
	}

	return	false;
}

/**
 * 초 체크
 *
 * @param	sec	SS
 * @return	boolean
 */
function checkSecond(sec) {
	re = /^[0-5][0-9]$/;

	if (re.test(sec)) {
		return	true;
	}

	return	false;
}


function checkNumber(){ 
   var key = event.keyCode;
   if (!(key==8||key==9||key==13||key==46||key==144||(key>=48&&key<=57)||key==110||key==190)){ 
        alert('숫자만 입력 가능합니다'); 
        event.returnValue = false; 
   } 
}

/**
 * 주민번호 체크
 *
 * @param	str
 * @return	boolean
 */
function checkJumin(str) {
	var obj1 = str.substring(0,6);
	var obj2 = str.substring(6);

	var chk =0;
	var yy = obj1.substring(0,2);
	var mm = obj1.substring(2,4);
	var dd = obj1.substring(4,6);
	var sex = obj2.substring(0,1);

	if ((obj1.length != 6) || (yy <25 || mm <1 || mm>12 ||dd<1) ) {
    		return false;
  	}
  	if ((sex != 1 && sex !=2 )|| (obj2.length != 7)) {
	    	return false;
  	}

  	for (var i = 0; i <=5 ; i++) {
		chk = chk + ((i%8+2) * parseInt(obj1.substring(i,i+1)))
 	}
  	for (var i = 6; i <=11 ; i++) {
        	chk = chk + ((i%8+2) * parseInt(obj2.substring(i-6,i-5)))
 	}

	chk = 11 - (chk %11);
	chk = chk % 10;

  	if (chk != obj2.substring(6,7)) {
		return false;
  	}

  	return true;
}

/**
 * 사업자번호 체크
 *
 * @param	str
 * @return	boolean
 */
function checkSaup(str) {
	var sum = 0;
	var getlist =new Array(10);
	var chkvalue =new Array("1","3","7","1","3","7","1","3","5");

	for(var i=0; i<10; i++) {
		getlist[i] = str.substring(i, i+1);
	}
	for(var i=0; i<9; i++) {
		sum += getlist[i]*chkvalue[i];
	}
	sum = sum + parseInt((getlist[8]*5)/10);
	sidliy = sum % 10;
	sidchk = 0;
	if (sidliy != 0) {
		sidchk = 10 - sidliy;
	} else {
		sidchk = 0;
	}
	if (sidchk != getlist[9]) {
		return false;
	}

  	return true;
}

/**
 * IP 체크
 *
 * @param ip
 * @return boolean
 */
function isIP(ip) {
	re = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;

	if (re.test(ip)) {
		return true;
	}

	return false;
}

/**
 * 한글여부 체크. 메시지 비포함 / 다른 메쏘드에서 사용함
 *
 * @param h	문자열
 */
function hangul(h) {
	var code = "";
	var ch = "";

	for (i = 0; i < h.length; i++) {
		code = h.charCodeAt(i);
		ch = h.substr(i, 1).toUpperCase();
		code = parseInt(code);

		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z")
				&& ((code > 255) || (code < 0)))
			return true;
	}
	return false;
}

/**
 * 한글여부 체크 예) var f=window.self.document.forms[0]; if(!chkNull('이름',f.mem_nm)) ; //
 * 이름이한글이아닐때 else {f.submit();} // 이름이한글일때
 *
 * @param item	문자열
 * @param obj	Object
 */
function han(item, obj) {
	var code = "";
	var ch = "";

	for (i = 0; i < obj.value.length; i++) {
		code = obj.value.charCodeAt(i);
		ch = obj.value.substr(i, 1).toUpperCase();
		code = parseInt(code);

		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z")
				&& ((code > 255) || (code < 0))) {
			return true;
		}
	}
	alert('[' + item + ']에 한글만 입력하세요.');
	setFocus(obj);
	return false;
}

/**
 * E-Mail 주소 체크 함수 예) var f=window.self.document.forms[0];
 * if(!email(f.mem_email)) ; // 이메일형식이틀릴때 else {f.submit();} // 이메일형식이맞을때
 *
 * @param f_obj	Object
 */
function email(f_obj) {
	if (f_obj.value.length == 0) {
		alert("E-Mail 주소를 입력해주세요.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	var email_num = f_obj.value.length;

	for ( var l = 0; l <= (email_num - 1); l++) {
		if (f_obj.value.indexOf(" ") >= 0) {
			alert("E-Mail 주소에서 공란을 빼주세요.");
			f_obj.focus();
			f_obj.select();
			return false;
		}
	}

	if (f_obj.value.toLowerCase().indexOf("hanmail.net") >= 0) {
		alert("[한메일]은 사용하실수 없습니다.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	if (hangul(f_obj.value)) {
		alert("E-Mail 주소 입력시 한글은 사용하실 수 없습니다.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	var str_email = f_obj.value;

	if ((str_email.indexOf("/")) == -1) {
	} else {
		alert("E-Mail 주소 형식이 잘못되었습니다.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	if ((str_email.indexOf(";")) == -1) {
	} else {
		alert("E-Mail 주소 형식이 잘못되었습니다.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	if ((f_obj.value.length != 0)
			&& (str_email.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
		alert("E-Mail 주소 형식이 잘못되었습니다.");
		f_obj.focus();
		f_obj.select();
		return false;
	}

	return true;
}

/**
 * 영문 체크 함수
 *
 * @param ps_Item	이름
 * @param ps_Object	Object
 */
function chkEng(ps_Item, ps_Object) {

	vs_str = trim(ps_Object.value);

	for (i = 0; i < vs_str.length; i++) {
		var codeNum = vs_str.charCodeAt(i);
		if (!((codeNum > 64 && codeNum < 91) || (codeNum > 96 && codeNum < 123))) {
			alert('[' + ps_Item + ']는 영문만 입력해야 합니다.');
			ps_Object.value = '';
			ps_Object.focus();
			return false;
		}

	}

	ps_Object.value = vs_str;
	return true;
}


function checkNum(){
var key = event.keyCode;
if (!(key==8||key==9||key==13||key==46||key==144||(key>=48&&key<=57)||key==110||key==190)){
		alert('숫자만 입력 가능합니다');
		event.returnValue = false;
}
}

function checkInteger(){
var key = event.keyCode;
if (!(key==8||key==9||key==13||key==46||key==144||(key>=48&&key<=57)||key==110||key==190||key==107||key==109||key==189)){
		alert('숫자만 입력 가능합니다');
		event.returnValue = false;
}
}

/**
 * 오직 숫자로만 이루어져 있는지 체크 한다.
 *
 * @param num
 * @return boolean
 * @author 김인순
 * @since 2005-12-08
 */
function isNum(num) {
	if (num.match(/[^0-9]/i) == null) {
		return true;
	} else {
		return false;
	}

	/*
	 * re = /[0-9]*[0-9]$/; if (re.test(rtrim(num))) { return true; }
	 *
	 * return false;
	 */
}

/**
 * 정수 체크
 *
 * 1. +, - 부호를 생략하거나 넣을 수 있다 : ^[\+-]? 2. 0에서 9까지 숫자가 0번 이상 올 수 있다 : [0-9]* 3.
 * 마지막은 숫자로 끝나야 한다 : [0-9]$
 *
 * @param num
 * @return boolean
 * @author 김인순
 * @since 2005-12-08
 */
function isInteger(num) {
	re = /^[\+-]?[0-9]*[0-9]$/;

	if (re.test(num)) {
		return true;
	}

	return false;
}

/**
 * 유리수 체크
 *
 * 1. +, - 부호를 생략하거나 넣을 수 있다 : ^[\+-]?
 * 2. 0에서 9까지 숫자가 0번 이상 올 수 있다 : [0-9]*
 * 3. 소수점을 넣을 수 있다 : [.]?
 * 4. 소수점 이하 자리에 0에서 9까지 숫자가 올 수 있다 : [0-9]*
 * 5. 마지막은 숫자로 끝나야 한다 : [0-9]$
 *
 * @param	num
 * @return	boolean
 * @author	김인순
 * @since	2004-06-14
 */
function isFloat(num) {
	//re = /^[\+-]?[0-9]*[.]?[0-9]*[0-9]$/;
	re = /^[\+-]?[0-9]*[.]?[0-9]*/;

	if (re.test(num)) {
		return	true;
	}
	return	false;
}

function isAlphaNumeric(ps_Item, ps_Object) {
	vs_str		= trim(ps_Object.value);
	var		pattern	= /^([a-z0-9-_]+)$/;
	if (!pattern.test(vs_str)) {
		alert('[' + ps_Item + ']는 4 ~ 12자의 영문소문자, 숫자, "_", "-"만 가능합니다.');
		ps_Object.value = '';
		ps_Object.focus();
		return false;
	}
	return	true;
}