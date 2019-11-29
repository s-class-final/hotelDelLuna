/*******************************************************************************
 * 폼 관련 함수
 ******************************************************************************/

/**
 * 차례
 *
 * 1. 상수
 * 2. 데이타 타입별 유효성 체크 함수
 * 3. 데이타 타입별로 표시형식을 지정하는 함수
 * 4. 데이타 타입별로 이벤트 핸들러에 지정하는 함수
 */


// 1. 상수
var FORMAT_DATE = "YYYYMMDD";			// 날짜표시형식 (YYYYMMDD, YYMMDD)
var LENGTH_DATE = FORMAT_DATE.length;	// 날짜길이
var DELIMITER_DATE = "-";				// 날짜표시형식 구분자
var DELIMITER_TIME = ":";				// 시간표시형식 구분자
//var COLOR_FOCUS = "#D5EAEE";			// focus 받을 때 오브젝트 색상
var COLOR_FOCUS = "#FFFFFF";			// focus 받을 때 오브젝트 색상
var CHECK_JUMIN = true;					// 주민번호 체크로직 반영여부
var CHECK_SAUP = false;					// 사업자번호 체크로직 반영여부
var CHECK_CORPORATE = true;				// 법인번호 체크로직 반영여부
var CHECK_EMAIL = true;					// 이메일 체크로직 반영여부
var MSG_INVALID_DATATYPE = "형식이 올바르지 않습니다.";	// data type이 올바르지 않을 때


// 2. 데이타 타입별 유효성 체크 함수 START ------------------------------------

/**
 * 날짜 유효성 체크
 *
 * @param	date
 * @return	boolean
 */
function isDate(date) {
	if (!checkDate(date)) {
		return false;
	}

	return	true;
}

/**
 * 시간 형식인지 체크 한다.(HH24MI)
 *
 * @param	code
 * @return	boolean
 */
function isTime(time) {
	if (!checkTime(time)) {
		return false;
	}

	return	true;
}

/**
 * 초 형식인지 체크 한다.(SS)
 *
 * @param	sec
 * @return	boolean
 */
function isSecond(sec) {
	if (!checkSecond(sec)) {
		return false;
	}

	return	true;
}

/**
 * 날짜 시간 형식인지 체크 한다.(YYYYMMDDHH24MI or YYMMDDHH24MI)
 *
 * @param	str
 * @return	boolean
 */
function isDatetime(str) {
	if (str.length != LENGTH_DATE + 4) {
		return	false;
	}

	if (!isDate(str.substring(0, LENGTH_DATE))) {
		return	false;
	}

	if (!isTime(str.substring(LENGTH_DATE))) {
		return	false;
	}

	return	true;
}

/**
 * 날짜 시간 초 형식인지 체크 한다.(YYYYMMDDHH24MISS or YYMMDDHH24MISS)
 *
 * @param	str
 * @return	boolean
 */
function isTimestamp(str) {
	if (str.length != LENGTH_DATE + 6) {
		return	false;
	}

	if (!isDate(str.substring(0, LENGTH_DATE))) {
		return	false;
	}

	if (!isTime(str.substring(LENGTH_DATE, LENGTH_DATE + 4))) {
		return	false;
	}

	if (!isSecond(str.substring(LENGTH_DATE + 4))) {
		return	false;
	}

	return	true;
}

/**
 * 우편번호 형식인지 체크 한다.
 *
 * @param	str
 * @return	boolean
 */
function isZipcode(str) {
	if (str.length != 6) {
		return	false;
	}

	if (!isNum(str)) {
		return	false;
	}

	return true;
}

/**
 * 이메일 형식인지 체크 한다.
 *
 * @param	email
 * @return	boolean
 */
function isEmail(email) {
	if (CHECK_EMAIL && !checkEmail(email)) {
		return false;
	}

	return true;
}

/**
 * 주민번호 형식인지 체크 한다.
 *
 * @param	str
 * @return	boolean
 */
function isJumin(str) {
	if (str.length != 13) {
		return	false;
	}

	if (!isNum(str)) {
		return	false;
	}

	if (CHECK_JUMIN && !checkJumin(str)) {
		return false;
	}

	return true;
}

/**
 * 사업자번호 형식인지 체크 한다.
 *
 * @param	str
 * @return	boolean
 */
function isSaup(str) {
	if (str.length != 10) {
		return	false;
	}

	if (!isNum(str)) {
		return false;
	}

	if (CHECK_SAUP && !checkSaup(str)) {
		return false;
	}

    return true;
}

/**
 * 법인번호 형식인지 체크 한다.
 *
 * @param	str
 * @return	boolean
 */
function isCorporate(str) {
	if (str.length != 13) {
		return	false;
	}

	if (!isNum(str)) {
		return false;
	}

	if (CHECK_CORPORATE && !checkCorporate(str)) {
		return false;
	}

	return	true;
}

/**
 * 전화번호 형식인지 체크한다.
 * 2223333
 *
 * @param	str
 * @return	boolean
 */
function isPhone(str) {
	if (str.length < 9 || str.length > 11) {
		return	false;
	}

	return	isNum(str);
}

function isPassword(str){
	var pw = str;
	
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(pw.length < 8){
		return false;
	}
	
	if(pw.length > 16){
		return false;
	}

	if(pw.search(/₩s/) != -1){
		return false;

	} 
	
	if(num < 0 || eng < 0 || spe < 0 ){
		return false;
	}
	
	return true;
}

// 2. 데이타 타입별 유효성 체크 함수 END --------------------------------------



// 3. 데이타 타입별로 표시형식을 지정하는 함수 START --------------------------

/**
 * 날짜에 구분자를 붙인다. (유효성 체크)
 *
 * @param	obj
 */
function addDateFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteDateFormatStr(value);
	if (!isDate(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}
		
		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();
		
		try {
		$(function(event) {
			event.preventDefault(); 
		});
		} catch (ex) {}
		
		return	false;
	}
	obj.value = addDateFormatStr(value);
}

/**
 * 날짜에 구분자를 붙인다.
 *
 * @param	str
 */
function addDateFormatStr(str) {
	return	str.substring(0, LENGTH_DATE - 4) + DELIMITER_DATE + str.substring(LENGTH_DATE - 4, LENGTH_DATE - 2) + DELIMITER_DATE + str.substring(LENGTH_DATE - 2, LENGTH_DATE);
}

/**
 * 날짜에서 구분자를 없앤다.
 *
 * @param	obj
 */
function deleteDateFormat(obj) {
	obj.value = deleteDateFormatStr(obj.value);
}

/**
 * 날짜에서 구분자를 없앤다.
 *
 * @param	str
 */
function deleteDateFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == DELIMITER_DATE) {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 시간에 구분자를 붙인다.
 *
 * @param	obj
 */
function addTimeFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteTimeFormatStr(value);

	if (!isTime(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addTimeFormatStr(value);
}

/**
 * 시간에 구분자를 붙인다.
 *
 * @param	str
 */
function addTimeFormatStr(str) {
	return	str.substring(0, 2) + DELIMITER_TIME + str.substring(2, 4);
}

/**
 * 시간에서 구분자를 없앤다.
 *
 * @param	obj
 */
function deleteTimeFormat(obj) {
	obj.value = deleteTimeFormatStr(obj.value);
}

/**
 * 시간에서 구분자를 없앤다.
 *
 * @param	str
 */
function deleteTimeFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == DELIMITER_TIME) {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 날짜 시간에 구분자를 붙인다.
 *
 * @param	obj
 */
function addDatetimeFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteDatetimeFormatStr(value);

	if (!isDatetime(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addDatetimeFormatStr(value);
}

/**
 * 날짜 시간에 구분자를 붙인다.
 *
 * @param	str
 */
function addDatetimeFormatStr(str) {
	return	str.substring(0, LENGTH_DATE - 4) + DELIMITER_DATE + str.substring(LENGTH_DATE - 4, LENGTH_DATE - 2) + DELIMITER_DATE + str.substring(LENGTH_DATE - 2, LENGTH_DATE) + " " +
		str.substring(LENGTH_DATE, LENGTH_DATE + 2) + DELIMITER_TIME + str.substring(LENGTH_DATE + 2);
}

/**
 * 날짜 시간에서 구분자를 없앤다.
 *
 * @param	obj
 */
function deleteDatetimeFormat(obj) {
	obj.value = deleteDatetimeFormatStr(obj.value);
}

/**
 * 날짜 시간에서 구분자를 없앤다.
 *
 * @param	str
 */
function deleteDatetimeFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == DELIMITER_DATE) {
			continue;
		} else if (str.charAt(i) == ' ') {
			continue;
		} else if (str.charAt(i) == DELIMITER_TIME) {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 날짜 시간(초)에 구분자를 붙인다.
 *
 * @param	obj
 */
function addTimestampFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteTimestampFormatStr(value);

	if (!isTimestamp(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addTimestampFormatStr(value);
}

/**
 * 날짜 시간(초)에 구분자를 붙인다.
 *
 * @param	str
 */
function addTimestampFormatStr(str) {
	return	str.substring(0, LENGTH_DATE - 4) + DELIMITER_DATE + str.substring(LENGTH_DATE - 4, LENGTH_DATE - 2) + DELIMITER_DATE + str.substring(LENGTH_DATE - 2, LENGTH_DATE) + " " +
		str.substring(LENGTH_DATE, LENGTH_DATE + 2) + DELIMITER_TIME + str.substring(LENGTH_DATE + 2, LENGTH_DATE + 4) + DELIMITER_TIME + str.substring(LENGTH_DATE + 4);
}

/**
 * 날짜 시간(초)에서 구분자를 없앤다.
 *
 * @param	obj
 */
function deleteTimestampFormat(obj) {
	obj.value = deleteTimestampFormatStr(obj.value);
}

/**
 * 날짜 시간(초)에서 구분자 없앤다.
 *
 * @param	str
 */
function deleteTimestampFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == DELIMITER_DATE) {
			continue;
		} else if (str.charAt(i) == ' ') {
			continue;
		} else if (str.charAt(i) == DELIMITER_TIME) {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 숫자에 콤마를 붙인다.
 *
 * @param	obj
 */
function addNumberFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	if (obj.getAttribute("comma") != null) {
		value = deleteCommaStr(value);
	}

	if (!isNum(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		try {
			$(function(event) {
				event.preventDefault(); 
			});
		} catch (ex) { }
		
		return	false;
	}

	if (obj.getAttribute("comma") != null) {
		obj.value = addCommaStr(value);
	}
}

/**
 * 숫자에 콤마를 없앤다.
 *
 * @param	str
 */
function deleteNumberFormat(obj) {
	if (obj.getAttribute("comma") != null) {
		obj.value = deleteCommaStr(obj.value);
	}
}

/**
 * 정수에 콤마를 붙인다.
 *
 * @param	obj
 */
function addIntegerFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	if (obj.getAttribute("comma") != null) {
		value = deleteCommaStr(value);
	}

	if (!isInteger(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	if (obj.getAttribute("comma") != null) {
		obj.value = addCommaStr(value);
	}
}

/**
 * 정수에 콤마를 없앤다.
 *
 * @param	str
 */
function deleteIntegerFormat(obj) {
	if (obj.getAttribute("comma") != null) {
		obj.value = deleteCommaStr(obj.value);
	}
}

/**
 * 유리수에 콤마를 붙인다.
 *
 * @param	obj
 */
function addFloatFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	if (obj.getAttribute("comma") != null) {
		value = deleteCommaStr(value);
	}

	if (!isFloat(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	if (obj.getAttribute("comma") != null) {
		obj.value = addCommaStr(value);
	}
}

/**
 * 유리수에 콤마를 없앤다.
 *
 * @param	str
 */
function deleteFloatFormat(obj) {
	if (obj.getAttribute("comma") != null) {
		obj.value = deleteCommaStr(obj.value);
	}
}

/**
 * 우편번호에 "-"를 붙인다.
 *
 * @param	obj
 */
function addZipcodeFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteZipcodeFormatStr(value);

	if (!isZipcode(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addZipcodeFormatStr(value);
}

/**
 * 우편번호에 "-"를 붙인다.
 *
 * @param	str
 */
function addZipcodeFormatStr(str) {
	return	str.substring(0, 3) + "-" + str.substring(3, 6);
}

/**
 * 우편번호에서 "-"를 없앤다.
 *
 * @param	obj
 */
function deleteZipcodeFormat(obj) {
	obj.value = deleteZipcodeFormatStr(obj.value);
}

/**
 * 우편번호에서 "-"를 없앤다.
 *
 * @param	str
 */
function deleteZipcodeFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 이메일 체크
 *
 * @param obj	Object
 */
function addEmailFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	if (!isEmail(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}
}

/**
 * 주민번호에 "-"를 붙인다.
 *
 * @param obj	Object
 */
function addJuminFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteJuminFormatStr(value);

	if (!isJumin(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addJuminFormatStr(value);
}

/**
 * 주민번호에 "-"를 붙인다.
 *
 * @param	str
 */
function addJuminFormatStr(str) {
	return	str.substring(0, 6) + "-" + str.substring(6, 13);
}

/**
 * 주민번호에서 "-"를 없앤다.
 *
 * @param	obj
 */
function deleteJuminFormat(obj) {
	obj.value = deleteJuminFormatStr(obj.value);
}

/**
 * 주민번호에서 "-"를 없앤다.
 *
 * @param	str
 */
function deleteJuminFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 사업자번호에 "-"를 붙인다.
 *
 * @param	obj
 */
function addSaupFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteSaupFormatStr(value);

	if (!isSaup(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addSaupFormatStr(value);
}

/**
 * 사업자번호에 "-"를 붙인다.
 *
 * @param	str
 */
function addSaupFormatStr(str) {
	return	str.substring(0, 3) + "-"+ str.substring(3, 5) + "-"+ str.substring(5);
}

/**
 * 사업자번호에서 "-"를 없앤다.
 *
 * @param	obj
 */
function deleteSaupFormat(obj) {
	obj.value = deleteSaupFormatStr(obj.value);
}

/**
 * 사업자번호에서 "-"를 없앤다.
 *
 * @param	str
 */
function deleteSaupFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 법인번호에 "-"를 붙인다.
 *
 * @param	obj
 */
function addCorporateFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteCorporateFormatStr(value);

	if (!isCorporate(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addCorporateFormatStr(value);
}

/**
 * 법인번호에 "-"를 붙인다.
 *
 * @param	str
 */
function addCorporateFormatStr(str) {
	return	str.substring(0, 6) + "-" + str.substring(6);
}

/**
 * 법인번호에서 "-"를 없앤다.
 *
 * @param	obj
 */
function deleteCorporateFormat(obj) {
	obj.value = deleteCorporateFormatStr(obj.value);
}

/**
 * 법인번호에서 "-"를 없앤다.
 *
 * @param	str
 */
function deleteCorporateFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}


/**
 * 전화번호에 구분자를 붙인다.
 *
 * @param	obj
 */
function addPhoneFormat(obj) {
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deletePhoneFormatStr(value);

	if (!isPhone(value)) {
		dispName = obj.getAttribute("dispName");

		if (dispName == null) {
			dispName = "";
		}

		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.focus();

		$(function(event) {
			event.preventDefault(); 
		});
		return	false;
	}

	obj.value = addPhoneFormatStr(value);
}

/**
 * 전화번호에 구분자를 붙인다.
 *
 * @param	str
 */
function addPhoneFormatStr(str) {
	if (str.length <= 4) {
		return	str;
	}

	return	str.substring(0, str.length - 4) + "-" + str.substring(str.length - 4);
}

/**
 * 전화번호에서 구분자를 없앤다.
 *
 * @param	obj
 */
function deletePhoneFormat(obj) {
	obj.value = deletePhoneFormatStr(obj.value);
}

/**
 * 전화번호에서 구분자 없앤다.
 *
 * @param	str
 */
function deletePhoneFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}

/**
 * 배경색을 delete.
 *
 */
function addColor(obj) {
	obj.style.backgroundColor = COLOR_FOCUS;
}

/**
 * 배경색을 add.
 *
 */
function deleteColor(obj) {
	obj.style.backgroundColor = "";
}

/**
 * 숫자에 comma를 붙인다. (onkeyup 이벤트 발생시)
 *
 * @param	obj
 */
function addCommaEvent(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement; 
	addComma(obj);
}

/**
 * 숫자에 comma를 붙인다.
 *
 * @param	obj
 */
function addComma(obj) {
	obj.value = trim(obj.value);
	var value = obj.value;

	if (value == "") {
		return;
	}

	var dispName = obj.getAttribute("dispName");
	var dataType = obj.getAttribute("dataType");
	var correct = true;

	if (dispName == null) {
		dispName = "";
	}

	if (dataType == null) {
		dataType = "float";
	}

	value = deleteCommaStr(value);

	if (dataType == "number") {
		correct = isNum(value);
	} else if (dataType == "integer") {
		correct = isInteger(value);
	} else if (dataType == "float") {
		correct = isFloat(value);
	} else {
		correct = isFloat(value);
	}

	if (!correct) {
		alert(dispName + " " + MSG_INVALID_DATATYPE);
		obj.value = "0";
		obj.focus();

		try {
			if (window.event) {
				window.event.returnValue = false;
			}
			return;
		} catch (e) {
			$(function(event) {
				event.preventDefault(); 
			});
			return	false;
		}
	}

	obj.value = addCommaStr(value);
}

/**
 * 숫자에 comma를 붙인다.
 *
 * @param	str
 */
function addCommaStr(str) {
	var num = "";
	var sign = "";

	if (str.charAt(0) == "+" || str.charAt(0) == "-") {
		sign = str.charAt(0);
		str = str.substr(1);
	}

	var index = str.indexOf('.');

	if (index != -1) {
		num = str.substr(index);
	} else {
		index = str.length;
	}

	for (var i = index - 3; i > 0; ) {
		num = ',' + str.substr(i, 3) + num;

		index = i;
		i -= 3;
	}

	num = sign + str.substr(0, index) + num;

	return	num;
}

/**
 * 숫자에서 comma를 없앤다.
 *
 * @param	obj
 */
function deleteComma(obj) {
	obj.value = deleteCommaStr(obj.value);
}

/**
 * 숫자에서 comma를 없앤다.
 *
 * @param	str
 */
function deleteCommaStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == ',') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return	temp;
}



/**
 * onchange 이벤트에 걸린 함수를 호출
 */
function jsOnChangeFunc() {
	if (onChangeFuncName != null && onChangeFuncName != "") {
		if (onChangeFuncName.indexOf("(") != -1) {
			eval(onChangeFuncName.substring(0, onChangeFuncName.indexOf("(")) + "(objInput);");
		} else {
			eval(onChangeFuncName + "(objInput);");
		}
	}
}



// 3. 데이타 타입별로 표시형식을 지정하는 함수 END ----------------------------



// 4. 데이타 타입별로 이벤트 핸들러에 지정하는 함수 START ---------------------

/**
 * dataType : date
 * event : onblur
 */
function blurDate(event) {
	var theEvent = event ? event : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addDateFormat(obj);
}

/**
 * dataType : date
 * event : onfocus
 */
function focusDate(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteDateFormat(obj);
	obj.select();
}

/**
 * dataType : 
 * event : onfocus
 */
function focusCalendar(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteDateFormat(obj);
	obj.select();
	
	// 텍스트박스 클릭시 달력을 띄울려면 이 곳의 주석을 해제
	//popCalendar(obj);
}

/**
 * dataType : 
 * event : onfocus
 */
function focusCalendarMonth(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	obj.select();
}

/**
 * dataType : time
 * event : onblur
 */
function blurTime(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addTimeFormat(obj);
}

/**
 * dataType : time
 * event : onfocus
 */
function focusTime(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteTimeFormat(obj);
	obj.select();
}

/**
 * dataType : datetime
 * event : onblur
 */
function blurDatetime(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addDatetimeFormat(obj);
}

/**
 * dataType : datetime
 * event : onfocus
 */
function focusDatetime(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteDatetimeFormat(obj);
	obj.select();
}

/**
 * dataType : timestamp
 * event : onblur
 */
function blurTimestamp(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addTimestampFormat(obj);
}

/**
 * dataType : timestamp
 * event : onfocus
 */
function focusTimestamp(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteTimestampFormat(obj);
	obj.select();
}

/**
 * dataType : number
 * event : onblur
 */
function blurNumber(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addNumberFormat(obj);
}

/**
 * dataType : number
 * event : onfocus
 */
function focusNumber(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteNumberFormat(obj);
	obj.select();
}

/**
 * dataType : integer
 * event : onblur
 */
function blurInteger(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addIntegerFormat(obj);
}

/**
 * dataType : integer
 * event : onfocus
 */
function focusInteger(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteIntegerFormat(obj);
	obj.select();
}

/**
 * dataType : float
 * event : onblur
 */
function blurFloat(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addFloatFormat(obj);
}

/**
 * dataType : float
 * event : onfocus
 */
function focusFloat(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteFloatFormat(obj);
	obj.select();
}

/**
 * dataType : zipcode
 * event : onblur
 */
function blurZipcode(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addZipcodeFormat(obj);
}

/**
 * dataType : zipcode
 * event : onfocus
 */
function focusZipcode(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteZipcodeFormat(obj);
	obj.select();
}

/**
 * dataType : email
 * event : onblur
 */
function blurEmail(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addEmailFormat(obj);
}

/**
 * dataType : jumin
 * event : onblur
 */
function blurJumin(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addJuminFormat(obj);
}

/**
 * dataType : jumin
 * event : onfocus
 */
function focusJumin(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteJuminFormat(obj);
	obj.select();
}

/**
 * dataType : saup
 * event : onblur
 */
function blurSaup(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addSaupFormat(obj);
}

/**
 * dataType : saup
 * event : onfocus
 */
function focusSaup(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteSaupFormat(obj);
	obj.select();
}

/**
 * dataType : corporate
 * event : onblur
 */
function blurCorporate(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addCorporateFormat(obj);
}

/**
 * dataType : corporate
 * event : onfocus
 */
function focusCorporate(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deleteCorporateFormat(obj);
	obj.select();
}

/**
 * dataType : phone
 * event : onblur
 */
function blurPhone(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);
	addPhoneFormat(obj);
}

/**
 * dataType : phone
 * event : onfocus
 */
function focusPhone(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	addColor(obj);
	deletePhoneFormat(obj);
	obj.select();
}

/**
 * dataType : -
 * event : onblur
 */
function blurEtc(nsEvent) {
	var theEvent = nsEvent ? nsEvent : window.event;
	var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
	deleteColor(obj);

	var strGuide = obj.getAttribute("guide");
	if (strGuide != null && strGuide != "") {
		var val = trim(obj.value);
		if (val == "") {
			obj.value = strGuide;
		}
	}
}

/**
 * dataType : -
 * event : onfocus
 */
function focusEtc(nsEvent) {
	try {
		var theEvent = nsEvent ? nsEvent : window.event;
		var obj = theEvent.target ? theEvent.target : theEvent.srcElement;
		addColor(obj);

		var strGuide = obj.getAttribute("guide");
		if (strGuide != null && strGuide != "") {
			if (obj.value == strGuide) {
				obj.value = "";
			}
		}

		if (obj.tagName == "INPUT") {
			obj.select();
		}
	} catch(e) {
	}
}

// 4. 데이타 타입별로 이벤트 핸들러에 지정하는 함수 END -----------------------



/**
 * 이벤트 핸들러를 등록한다.
 */
function initForm() {
	var objElements = null;
	var dataType = null;

	var objForms = document.forms;
	
	for (i = 0; i < objForms.length; i++) {
		objElements = objForms[i].elements;
		
		for (j = 0; j < objElements.length; j++) {
			// INPUT 객체의 onblur, onfocus 이벤트에 핸들러를 등록한다.
			if (objElements[j].tagName == "INPUT") {
				dataType = objElements[j].getAttribute("dataType");
				if (dataType == "date") {
					objElements[j].onblur = blurDate;
					objElements[j].onfocus = focusDate;
					addDateFormat(objElements[j]);
				} else if (dataType == "time") {
					objElements[j].onblur = blurTime;
					objElements[j].onfocus = focusTime;
					addTimeFormat(objElements[j]);
				} else if (dataType == "datetime") {
					objElements[j].onblur = blurDatetime;
					objElements[j].onfocus = focusDatetime;
					addDatetimeFormat(objElements[j]);
				} else if (dataType == "timestamp") {
					objElements[j].onblur = blurTimestamp;
					objElements[j].onfocus = focusTimestamp;
					addTimestampFormat(objElements[j]);
				} else if (dataType == "number") {
					objElements[j].onblur = blurNumber;
					objElements[j].onfocus = focusNumber;
					addNumberFormat(objElements[j]);
					if (objElements[j].getAttribute("comma") != null) {
						objElements[j].onkeypress = checkNumber;
						objElements[j].onkeyup = addCommaEvent;
					}
				} else if (dataType == "integer") {
					objElements[j].onblur = blurInteger;
					objElements[j].onfocus = focusInteger;
					addIntegerFormat(objElements[j]);
					if (objElements[j].getAttribute("comma") != null) {
						objElements[j].onkeypress = checkInteger;
						objElements[j].onkeyup = addCommaEvent;
					}
				} else if (dataType == "float") {
					objElements[j].onblur = blurFloat;
					objElements[j].onfocus = focusFloat;
					addFloatFormat(objElements[j]);
					if (objElements[j].getAttribute("comma") != null) {
						objElements[j].onkeypress = checkNumber;
						objElements[j].onkeyup = addCommaEvent;
					}
				} else if (dataType == "zipcode") {
					objElements[j].onblur = blurZipcode;
					objElements[j].onfocus = focusZipcode;
					addZipcodeFormat(objElements[j]);
				} else if (dataType == "email") {
					objElements[j].onblur = blurEmail;
					objElements[j].onfocus = focusEtc;
					addEmailFormat(objElements[j]);
				} else if (dataType == "jumin") {
					objElements[j].onfocusout = blurJumin;
					objElements[j].onfocus = focusJumin;
					addJuminFormat(objElements[j]);
				} else if (dataType == "saup") {
					objElements[j].onblur = blurSaup;
					objElements[j].onfocus = focusSaup;
					addSaupFormat(objElements[j]);
				} else if (dataType == "corporate") {
					objElements[j].onblur = blurCorporate;
					objElements[j].onfocus = focusCorporate;
					addCorporateFormat(objElements[j]);
				} else if (dataType == "phone") {
					objElements[j].onblur = blurPhone;
					objElements[j].onfocus = focusPhone;
					addPhoneFormat(objElements[j]);
				} else if (dataType == "calendar") {	// 달력
					// 달력 버튼 생성
					/*var calendarIcon = document.createElement('img');
					calendarIcon.setAttribute('src', '/com/images/btn/btn_calendar.gif');
					calendarIcon.setAttribute('name', objElements[j].name);
					calendarIcon.style.marginBottom = '-1px';
					calendarIcon.style.marginLeft = '3px';
					calendarIcon.style.cursor = 'pointer';
					calendarIcon.onclick = function() {
						popCalendarFromBtn(this.name);
					}
					insertAfter(calendarIcon, objElements[j]);

					// 이벤트 핸들러 지정
					objElements[j].onblur = blurDate;
					objElements[j].onfocus = focusCalendar;
					
					// 달력 그리기
					addDateFormat(objElements[j]);
					drawCalendar(objElements[j]);*/
					
					$('#' + objElements[j].name).datepicker({
					      autoclose: true
					      ,format: "yyyy-mm-dd"
					      ,language: "kr"
					});					
				} else if (dataType == "calendar_month") {	// 달력 (월단위)
					// 달력 버튼 생성
					
					var calendarIcon = document.createElement('img');
					calendarIcon.setAttribute('src', '/com/images/btn/btn_calendar.gif');
					calendarIcon.setAttribute('name', objElements[j].name);
					calendarIcon.setAttribute('formname', document.forms(i));
					calendarIcon.style.marginBottom = '-1px';
					calendarIcon.style.marginLeft = '3px';
					calendarIcon.style.cursor = 'pointer';
					
					el = objElements[j];
					calendarIcon.onclick = popCalendarMonthFromBtn;
//						document.forms(i)[objElements[j].name].onfocus = popCalendarMonthFromBtn;

					insertAfter(calendarIcon, objElements[j]);
					
					// 달력 (월단위) 그리기
					drawCalendarMonth(objElements[j], document.forms(i));					
				} else if (dataType == "checkbox") {	// 이미지 체크박스
					// 객체에 ID 생성
					objElements[j].id = objElements[j].name + "_" + document.getElementsByName(objElements[j].name).length;
						
					// 이미지 체크박스 생성	
					var checkboxIcon = document.createElement('img');
					checkboxIcon.setAttribute('src', '/images/button/btn_check_' + (objElements[j].value == '1' ? '1' : '0') + '.gif');
					checkboxIcon.setAttribute('name2', objElements[j].name);
					checkboxIcon.style.marginBottom = '-8px';
					checkboxIcon.style.marginLeft = '0px';
					checkboxIcon.onclick = function() {
						btnCheck(this);
						document.getElementById(this.getAttribute("name2") + "_" + document.getElementsByName(this.getAttribute("name2")).length).value = btnChecked(this) ? "1" : "0";
					}
					insertAfter(checkboxIcon, objElements[j]);
				} else if (dataType == "checkboxU") {	// 이미지 체크박스 (반대로)
					// 객체에 ID 생성
					objElements[j].id = objElements[j].name + "_" + document.getElementsByName(objElements[j].name).length;
						
					// 이미지 체크박스 생성	
					var checkboxIcon = document.createElement('img');
					checkboxIcon.setAttribute('src', '/images/button/btn_check_' + (objElements[j].value == '1' ? '0' : '1') + '.gif');
					checkboxIcon.setAttribute('name2', objElements[j].name);
					checkboxIcon.style.marginBottom = '-8px';
					checkboxIcon.style.marginLeft = '0px';
					checkboxIcon.onclick = function() {
						btnCheck(this);
						document.getElementById(this.getAttribute("name2") + "_" + document.getElementsByName(this.getAttribute("name2")).length).value = btnChecked(this) ? "0" : "1";
					}
					insertAfter(checkboxIcon, objElements[j]);
				} else {
					objElements[j].onblur = blurEtc;
					objElements[j].onfocus = focusEtc;

					var strGuide = objElements[j].getAttribute("guide");
					if (strGuide != null && strGuide != "" && (objElements[j].value == null || objElements[j].value == "")) {
						objElements[j].value = strGuide;
					}
				}
			} else { // INPUT 객체가 아닐 때
				objElements[j].onblur = blurEtc;
				objElements[j].onfocus = focusEtc;
			}
		}
	}
}

/**
 * 이벤트 핸들러를 등록한다. (특정 폼에 한함)
 */
function initForm1(f) {
	var objElements = null;
	var dataType = null;

	objElements = f.elements;
	
	for (j = 0; j < objElements.length; j++) {
		// INPUT 객체의 onblur, onfocus 이벤트에 핸들러를 등록한다.
		if (objElements[j].tagName == "INPUT") {
			dataType = objElements[j].getAttribute("dataType");
			if (dataType == "date") {
				objElements[j].onblur = blurDate;
				objElements[j].onfocus = focusDate;
				addDateFormat(objElements[j]);
			} else if (dataType == "time") {
				objElements[j].onblur = blurTime;
				objElements[j].onfocus = focusTime;
				addTimeFormat(objElements[j]);
			} else if (dataType == "datetime") {
				objElements[j].onblur = blurDatetime;
				objElements[j].onfocus = focusDatetime;
				addDatetimeFormat(objElements[j]);
			} else if (dataType == "timestamp") {
				objElements[j].onblur = blurTimestamp;
				objElements[j].onfocus = focusTimestamp;
				addTimestampFormat(objElements[j]);
			} else if (dataType == "number") {
				objElements[j].onblur = blurNumber;
				objElements[j].onfocus = focusNumber;
				addNumberFormat(objElements[j]);
				if (objElements[j].getAttribute("comma") != null) {
					objElements[j].onkeypress = checkNumber;
					objElements[j].onkeyup = addCommaEvent;
				}
			} else if (dataType == "integer") {
				objElements[j].onblur = blurInteger;
				objElements[j].onfocus = focusInteger;
				addIntegerFormat(objElements[j]);
				if (objElements[j].getAttribute("comma") != null) {
					objElements[j].onkeypress = checkInteger;
					objElements[j].onkeyup = addCommaEvent;
				}
			} else if (dataType == "float") {
				objElements[j].onblur = blurFloat;
				objElements[j].onfocus = focusFloat;
				addFloatFormat(objElements[j]);
				if (objElements[j].getAttribute("comma") != null) {
					objElements[j].onkeypress = checkNumber;
					objElements[j].onkeyup = addCommaEvent;
				}
			} else if (dataType == "zipcode") {
				objElements[j].onblur = blurZipcode;
				objElements[j].onfocus = focusZipcode;
				addZipcodeFormat(objElements[j]);
			} else if (dataType == "email") {
				objElements[j].onblur = blurEmail;
				objElements[j].onfocus = focusEtc;
				addEmailFormat(objElements[j]);
			} else if (dataType == "jumin") {
				objElements[j].onfocusout = blurJumin;
				objElements[j].onfocus = focusJumin;
				addJuminFormat(objElements[j]);
			} else if (dataType == "saup") {
				objElements[j].onblur = blurSaup;
				objElements[j].onfocus = focusSaup;
				addSaupFormat(objElements[j]);
			} else if (dataType == "corporate") {
				objElements[j].onblur = blurCorporate;
				objElements[j].onfocus = focusCorporate;
				addCorporateFormat(objElements[j]);
			} else if (dataType == "phone") {
				objElements[j].onblur = blurPhone;
				objElements[j].onfocus = focusPhone;
				addPhoneFormat(objElements[j]);
			} else if (dataType == "calendar") {	// 달력
				// 달력 버튼 생성
				var calendarIcon = document.createElement('img');
				calendarIcon.setAttribute('src', '/com/images/btn/btn_calendar.gif');
				calendarIcon.setAttribute('name', objElements[j].name);
				calendarIcon.style.marginBottom = '-1px';
				calendarIcon.style.marginLeft = '3px';
				calendarIcon.style.cursor = 'pointer';
				calendarIcon.onclick = function() {
					popCalendarFromBtn(this.name);
				}
				insertAfter(calendarIcon, objElements[j]);

				// 이벤트 핸들러 지정
				objElements[j].onblur = blurDate;
				objElements[j].onfocus = focusCalendar;
				
				// 달력 그리기
				addDateFormat(objElements[j]);
				drawCalendar(objElements[j]);
			} else if (dataType == "calendar_month") {	// 달력 (월단위)
				// 달력 버튼 생성
				
				var calendarIcon = document.createElement('img');
				calendarIcon.setAttribute('src', '/com/images/btn/btn_calendar.gif');
				calendarIcon.setAttribute('name', objElements[j].name);
				calendarIcon.setAttribute('formname', document.forms(i));
				calendarIcon.style.marginBottom = '-1px';
				calendarIcon.style.marginLeft = '3px';
				calendarIcon.style.cursor = 'pointer';
				
				el = objElements[j];
				calendarIcon.onclick = popCalendarMonthFromBtn;
//					document.forms(i)[objElements[j].name].onfocus = popCalendarMonthFromBtn;

				insertAfter(calendarIcon, objElements[j]);
				
				// 달력 (월단위) 그리기
				drawCalendarMonth(objElements[j], document.forms(i));					
			} else if (dataType == "checkbox") {	// 이미지 체크박스
				// 객체에 ID 생성
				objElements[j].id = objElements[j].name + "_" + document.getElementsByName(objElements[j].name).length;
					
				// 이미지 체크박스 생성	
				var checkboxIcon = document.createElement('img');
				checkboxIcon.setAttribute('src', '/images/button/btn_check_' + (objElements[j].value == '1' ? '1' : '0') + '.gif');
				checkboxIcon.setAttribute('name2', objElements[j].name);
				checkboxIcon.style.marginBottom = '-8px';
				checkboxIcon.style.marginLeft = '0px';
				checkboxIcon.onclick = function() {
					btnCheck(this);
					document.getElementById(this.getAttribute("name2") + "_" + document.getElementsByName(this.getAttribute("name2")).length).value = btnChecked(this) ? "1" : "0";
				}
				insertAfter(checkboxIcon, objElements[j]);
			} else if (dataType == "checkboxU") {	// 이미지 체크박스 (반대로)
				// 객체에 ID 생성
				objElements[j].id = objElements[j].name + "_" + document.getElementsByName(objElements[j].name).length;
					
				// 이미지 체크박스 생성	
				var checkboxIcon = document.createElement('img');
				checkboxIcon.setAttribute('src', '/images/button/btn_check_' + (objElements[j].value == '1' ? '0' : '1') + '.gif');
				checkboxIcon.setAttribute('name2', objElements[j].name);
				checkboxIcon.style.marginBottom = '-8px';
				checkboxIcon.style.marginLeft = '0px';
				checkboxIcon.onclick = function() {
					btnCheck(this);
					document.getElementById(this.getAttribute("name2") + "_" + document.getElementsByName(this.getAttribute("name2")).length).value = btnChecked(this) ? "0" : "1";
				}
				insertAfter(checkboxIcon, objElements[j]);
			} else {
				objElements[j].onblur = blurEtc;
				objElements[j].onfocus = focusEtc;
			}
		} else { // INPUT 객체가 아닐 때
			objElements[j].onblur = blurEtc;
			objElements[j].onfocus = focusEtc;
		}
	}
}

/**
 * Element를 뒤에 붙임
 * @param newElement	새 element
 * @param targetElement	대상 element
 * @return
 */
function insertAfter(newElement, targetElement) {
	var parent = targetElement.parentNode;
	if (parent == targetElement) {
		parent.appendChild(newElement);
	} else {
		parent.insertBefore(newElement, targetElement.nextSibling);
	}
}


function checkLength(form) {
	
	try {
	
		var obj;
		var dispName;
		var dataType;
		var value;
		
		var objElements = form.elements;
	
		for (i = 0; i < objElements.length; i++) {
			obj = objElements[i];
			if(obj.tagName.toUpperCase() != "OBJECT") {
				dispName = obj.getAttribute("dispName");
				dataType = obj.getAttribute("dataType");
				value = obj.value;
				
				if (obj.type == "text" || obj.type == "textarea") {
					// 데이터 타입 체크
					if (dataType == null) {
						var maxLength = parseInt(obj.maxLength);
						
						if (isNaN(maxLength) == true) {
							maxLength = obj.getAttribute("maxLength");
						}
						
						if (obj.readOnly == false && maxLength > 0 && getByteLength(value) > maxLength) {
							alert(dispName + " 길이가 " + maxLength + "(한글 " + (maxLength / 2) + "자) 을(를) 넘습니다.");
							obj.focus();
							
							$(function(event) {
								event.preventDefault(); 
							});
							return	false;
						}
					}
				}
			}
		}
	
		return	true;

	} catch (e) {
		return false;
	}
}
	

/**
 * 데이터 유효성을 체크한다.
 *
 * @param	form
 */
function checkValidate(form) {
	try {
		var obj;
		var dispName;
		var dataType;
		var minValue;
		var maxValue;
		var isValid;
		var value;
		
		var objElements = form.elements;
	
		for (i = 0; i < objElements.length; i++) {
			obj = objElements[i];
			if(obj.tagName.toUpperCase() != "OBJECT") {
				obj.value = trim(obj.value);
				dispName = obj.getAttribute("dispName");
				dataType = obj.getAttribute("dataType");
				minValue = obj.getAttribute("minValue");
				maxValue = obj.getAttribute("maxValue");
				len = obj.getAttribute("len");
				value = obj.value;
				//value = jsGetValue(obj);
								
				if (dispName == null) {
					dispName = obj.name;
				}
				
				// 필수 입력 항목 체크
				if (obj.getAttribute("notNull") != null) {
					isValid = false;
					if (obj.type == "radio" || obj.type == "checkbox" || obj.type == "checkboxU") {
						//var objs = document.getElementsByName(obj.name);
						var objs = $("input[name='"+obj.name+"']");
						if (objs.length > 1) {
							for (j = 0; j < objs.length; j++) {
								if (objs[j].checked) {
									isValid = true;
									break;
								}
							}
						} else {
							if (obj.checked) {
								isValid = true;
							}
						}
					} else if (obj.type == "text" || obj.type == "textarea") {
						if (obj.getAttribute("editor") == "true") {
							obj.value = eval("CKEDITOR.instances." + obj.name).getData();
							
							value = obj.value;
						}
						
						if (value != "") {
							var strGuide = obj.getAttribute("guide");
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
							if (obj.getAttribute("comma") != null) {
								obj.value = 0;
								isValid = true;
							}
						}
					}
					
					if (!isValid) {
						alert(dispName + "을(를) 입력하십시오.");
						obj.focus();
						
						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
				}
				
				// 데이터 길이 체크
				if (len != null) {
					if (jsGetValue(obj).length != 0 && getByteLength(jsGetValue(obj)) != eval(len)) {
						alert(dispName + "은(는) " + len + "자리를 입력해야 합니다.");
						obj.focus();
						
						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
				}
				
				if (obj.type == "text" || obj.type == "textarea") {
					if (obj.getAttribute("editor") == "true") {						
						obj.value = eval("CKEDITOR.instances." + obj.name).getData();
					}
					
					obj.value = obj.value.replace(unescape("%uFEFF"), "");
					
					// 데이터 타입 체크
					if (dataType == null) {
						var maxLength = parseInt(obj.maxLength);
						
						if (isNaN(maxLength) == true) {
							maxLength = obj.getAttribute("maxLength");
						}
						
						if (obj.readOnly == false && maxLength > 0 && getByteLength(value) > maxLength) {
							alert(dispName + " 길이가 " + maxLength + "(한글 " + (maxLength / 2) + "자) 을(를) 넘습니다.");
							obj.focus();
							
							$(function(event) {
								event.preventDefault(); 
							});
							return	false;
						}
					} else if ((value != "") && (dataType != null)) {
						isValid = true;
						checkValue = false;
						
						if (dataType == "date") {
							value = deleteDateFormatStr(value);
							isValid = isDate(value);
							checkValue = true;
						} else if (dataType == "email") {
							isValid = isEmail(value);
						} else if (dataType == "float") {
							value = deleteCommaStr(value);
							isValid = isFloat(value);
							checkValue = true;
						} else if (dataType == "integer") {
							value = deleteCommaStr(value);
							isValid = isInteger(value);
							checkValue = true;
						} else if (dataType == "number") {
							value = deleteCommaStr(value);
							isValid = isNum(value);
							checkValue = true;
						} else if (dataType == "zipcode") {
							value = deleteZipcodeFormatStr(value);
							isValid = isZipcode(value);
						} else if (dataType == "time") {
							value = deleteTimeFormatStr(value);
							isValid = isTime(value);
							checkValue = true;
						} else if (dataType == "jumin") {
							value = deleteJuminFormatStr(value);
							isValid = isJumin(value);
						} else if (dataType == "saup") {
							value = deleteSaupFormatStr(value);
							isValid = isSaup(value);
						} else if (dataType == "corporate") {
							value = deleteCorporateFormatStr(value);
							isValid = isCorporate(value);
						} else if (dataType == "datetime") {
							value = deleteDatetimeFormatStr(value);
							isValid = isDatetime(value);
							checkValue = true;
						} else if (dataType == "phone") {
							value = deletePhoneFormatStr(value);
							isValid = isPhone(value);
						} else if (dataType == "timestamp") {
							value = deleteTimestampFormatStr(value);
							isValid = isTimestamp(value);
							checkValue = true;
						}
						
						if (!isValid) {
							alert(dispName + " " + MSG_INVALID_DATATYPE);
							if (dataType == "float" || dataType == "integer" || dataType == "number") {
								obj.value = "0";
							}
							obj.focus();
							
							$(function(event) {
								event.preventDefault(); 
							});
							return	false;
						}
						
						if (checkValue) {
							if (minValue != null) {
								if (eval(minValue) > eval(value)) {
									alert(dispName + " 값은 최소값(" + minValue + ") 이상이여야 합니다.");
									obj.focus();
									
									$(function(event) {
										event.preventDefault(); 
									});
									return	false;
								}
							}
							
							if (isValid && (maxValue != null)) {
								if (eval(maxValue) < eval(value)) {
									alert(dispName + " 값이 최대값(" + maxValue + ")을 미만이여야 합니다.");
									obj.focus();
									
									$(function(event) {
										event.preventDefault(); 
									});
									return	false;
								}
							}
						}
					}
				}
			}
		}
		
		var file_flag = true;
		$(form).find(".planb_file_upload").each(function (i) {
	        if ($(this).attr("notNull") + "" == "") {
	        	if ($(this).attr("FILE_CNT") * 1 == 0) {
	        		var ELE_TEXT = $(this).attr("ELE_TEXT");
	        		if (ELE_TEXT + "" == "undefined") {
	        			alert("파일첨부를 하여 주시기 바랍니다.");	
	        		} else {
	        			alert(ELE_TEXT + " 첨부를 하여 주시기 바랍니다.");
	        		}
	        		
	        		file_flag = false;
	        		return false;
	        	}
	        }
		});
		
		if (file_flag) {
			return	true;
		} else {
			return	false;
		}
	} catch (e) {
		return false;
	}
}

/**
 * 실명인증후 작성되는 게시물의 데이터 유효성을 체크한다.
 * 
 * @param	form
 */
function checkValidate2(form) {
		
	try {
	
		var obj;
		var dispName;
		var dataType;
		var minValue;
		var maxValue;
		var isValid;
		var value;
		
		var objElements = form.elements;
		
		for (i = 0; i < objElements.length; i++) {
			obj = objElements[i];
			obj.value = trim(obj.value);
			dispName = obj.getAttribute("dispName");
			dataType = obj.getAttribute("dataType");
			minValue = obj.getAttribute("minValue");
			maxValue = obj.getAttribute("maxValue");
			len = obj.getAttribute("len");
			value = obj.value;
			//value = jsGetValue(obj);
	
			if (dispName == null) {
				dispName = obj.name;
			}
	
			// 필수 입력 항목 체크
			if (obj.getAttribute("notNull") != null) {
				isValid = false;
				if (obj.type == "radio" || obj.type == "checkbox" || obj.type == "checkboxU") {
					var objs = document.getElementsByName(obj.name);
					if (objs.length > 1) {
						for (j = 0; j < objs.length; j++) {
							if (objs[j].checked) {
								isValid = true;
								break;
							}
						}
					} else {
						if (obj.checked) {
							isValid = true;
						}
					}
				} else {
					if (value != "") {
						isValid = true;
					} else {
						if (obj.getAttribute("comma") != null) {
							obj.value = 0;
							isValid = true;
						}
					}
				}
	
				if (!isValid && dispName == "작성자 이름") {
					alert(dispName + "이 유효하지 않습니다. 다시 실명인증을 해주세요.");
					obj.focus();
					
					$(function(event) {
						event.preventDefault(); 
					});
					return	false;
				}
				else if(!isValid){
					alert(dispName + "을(를) 입력하십시오.");
					obj.focus();
					
					$(function(event) {
						event.preventDefault(); 
					});
					return	false;
				}
			}
	
			// 데이터 길이 체크
			if (len != null) {
				if (jsGetValue(obj).length != 0 && getByteLength(jsGetValue(obj)) != eval(len)) {
					alert(dispName + "은(는) " + len + "자리를 입력해야 합니다.");
					obj.focus();

					$(function(event) {
						event.preventDefault(); 
					});
					return	false;
				}
			}
	
			if (obj.type == "text" || obj.type == "textarea") {
				// 데이터 타입 체크
				if (dataType == null) {
					if (obj.readOnly == false && obj.maxLength > 0 && getByteLength(value) > obj.maxLength) {
						alert(dispName + " 길이가 " + obj.maxLength + "(한글 " + (obj.maxLength / 2) + "자) 을(를) 넘습니다.");
						obj.focus();

						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
				} else if ((value != "") && (dataType != null)) {
					isValid = true;
					checkValue = false;
	
					if (dataType == "date") {
						value = deleteDateFormatStr(value);
						isValid = isDate(value);
						checkValue = true;
					} else if (dataType == "email") {
						isValid = isEmail(value);
					} else if (dataType == "float") {
						value = deleteCommaStr(value);
						isValid = isFloat(value);
						checkValue = true;
					} else if (dataType == "integer") {
						value = deleteCommaStr(value);
						isValid = isInteger(value);
						checkValue = true;
					} else if (dataType == "number") {
						value = deleteCommaStr(value);
						isValid = isNum(value);
						checkValue = true;
					} else if (dataType == "zipcode") {
						value = deleteZipcodeFormatStr(value);
						isValid = isZipcode(value);
					} else if (dataType == "time") {
						value = deleteTimeFormatStr(value);
						isValid = isTime(value);
						checkValue = true;
					} else if (dataType == "jumin") {
						value = deleteJuminFormatStr(value);
						isValid = isJumin(value);
					} else if (dataType == "saup") {
						value = deleteSaupFormatStr(value);
						isValid = isSaup(value);
					} else if (dataType == "corporate") {
						value = deleteCorporateFormatStr(value);
						isValid = isCorporate(value);
					} else if (dataType == "datetime") {
						value = deleteDatetimeFormatStr(value);
						isValid = isDatetime(value);
						checkValue = true;
					} else if (dataType == "phone") {
						value = deletePhoneFormatStr(value);
						isValid = isPhone(value);
					} else if (dataType == "timestamp") {
						value = deleteTimestampFormatStr(value);
						isValid = isTimestamp(value);
						checkValue = true;
					}
	
					if (!isValid) {
						alert(dispName + " " + MSG_INVALID_DATATYPE);
						if (dataType == "float" || dataType == "integer" || dataType == "number") {
							obj.value = "0";
						}
						obj.focus();

						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
	
					if (checkValue) {
						if (minValue != null) {
							if (eval(minValue) > eval(value)) {
								alert(dispName + " 값은 최소값(" + minValue + ") 이상이여야 합니다.");
								obj.focus();

								$(function(event) {
									event.preventDefault(); 
								});
								return	false;
							}
						}
	
						if (isValid && (maxValue != null)) {
							if (eval(maxValue) < eval(value)) {
								alert(dispName + " 값이 최대값(" + maxValue + ")을 미만이여야 합니다.");
								obj.focus();

								$(function(event) {
									event.preventDefault(); 
								});
								return	false;
							}
						}
					}
				}
			}
		}
		
		return	true;

	} catch (e) {
		return false;
	}
}	

/**
 * 데이터 유효성을 체크한다.
 * 하나의 오브젝트에 대한 것임.
 *
 * @param 	form
 * @param	obj
 */
function checkValidateObj(form, obj) {

	var dispName;
	var dataType;
	var minValue;
	var maxValue;
	var isValid;
	var value;

	obj.value = trim(obj.value);
	dispName = obj.getAttribute("dispName");
	dataType = obj.getAttribute("dataType");
	minValue = obj.getAttribute("minValue");
	maxValue = obj.getAttribute("maxValue");
	len = obj.getAttribute("len");
	value = obj.value;
	//value = jsGetValue(obj);

	if (dispName == null) {
		dispName = obj.name;
	}

	// 필수 입력 항목 체크
	if (obj.getAttribute("notNull") != null) {
		isValid = false;

		if (obj.type == "radio" || obj.type == "checkbox" || obj.type == "checkboxU") {
			if (form.elements(obj.name).length) {
				for (j = 0; j < form.elements(obj.name).length; j++) {
					if (form.elements(obj.name)[j].checked) {
						isValid = true;
						break;
					}
				}
			} else {
				if (obj.checked) {
					isValid = true;
				}
			}
		} else if (obj.type == "input" || obj.type == "textarea") {
			if (value != "") {
				var strGuide = obj.getAttribute("guide");
				if (strGuide != null && strGuide != "") {
					if (value == strGuide) {
						isValid = false;
					} else {
						isValid = true;
					}
				} else {
					isValid = true;
				}
//			} else {
//				if (obj.getAttribute("comma") != null) {	// 속성으로 comma를 갖는 경우, 값을 입력하지 않았더라도 0을 자동으로 입력해 줌
//					obj.value = 0;
//					isValid = true;
//				}
			}
		} else {
			if (value != "") {
				isValid = true;
			} else {
				if (obj.getAttribute("comma") != null) {
					obj.value = 0;
					isValid = true;
				}
			}
		}

		if (!isValid) {
			alert(dispName + "을(를) 입력하십시오.");
			obj.focus();

			$(function(event) {
				event.preventDefault(); 
			});
			return	false;
		}
	}

	// 데이터 길이 체크
	if (len != null) {
		if (value.length != eval(len)) {
			alert(dispName + "은(는) " + len + "자리를 입력해야 합니다.");
			obj.focus();

			$(function(event) {
				event.preventDefault(); 
			});
			return	false;
		}
	}

	if (obj.type == "text") {
		// 데이터 타입 체크
		if ((value != "") && (dataType != null)) {
			isValid = true;
			checkValue = false;

			if (dataType == "date") {
				value = deleteDateFormatStr(value);
				isValid = isDate(value);
				checkValue = true;
			} else if (dataType == "email") {
				isValid = isEmail(value);
			} else if (dataType == "float") {
				value = deleteCommaStr(value);
				isValid = isFloat(value);
				checkValue = true;
			} else if (dataType == "integer") {
				value = deleteCommaStr(value);
				isValid = isInteger(value);
				checkValue = true;
			} else if (dataType == "number") {
				value = deleteCommaStr(value);
				isValid = isNum(value);
				checkValue = true;
			} else if (dataType == "zipcode") {
				value = deleteZipcodeFormatStr(value);
				isValid = isZipcode(value);
				checkValue = true;
			} else if (dataType == "time") {
				value = deleteTimeFormatStr(value);
				isValid = isTime(value);
				checkValue = true;
			} else if (dataType == "jumin") {
				value = deleteJuminFormatStr(value);
				isValid = isJumin(value);
				checkValue = true;
			} else if (dataType == "saup") {
				value = deleteSaupFormatStr(value);
				isValid = isSaup(value);
				checkValue = true;
			} else if (dataType == "corporate") {
				value = deleteCorporateFormatStr(value);
				isValid = isCorporate(value);
				checkValue = true;
			} else if (dataType == "datetime") {
				value = deleteDatetimeFormatStr(value);
				isValid = isDatetime(value);
				checkValue = true;
			} else if (dataType == "phone") {
				value = deletePhoneFormatStr(value);
				isValid = isPhone(value);
				checkValue = true;
			} else if (dataType == "timestamp") {
				value = deleteTimestampFormatStr(value);
				isValid = isTimestamp(value);
				checkValue = true;
			}

			if (!isValid) {
				alert(dispName + " " + MSG_INVALID_DATATYPE);
				if (dataType == "float" || dataType == "integer" || dataType == "number") {
					obj.value = "0";
				}
				obj.focus();

				$(function(event) {
					event.preventDefault(); 
				});
				return	false;
			}

			if (checkValue) {
				if (minValue != null) {
					if (eval(minValue) > eval(value)) {
						alert(dispName + " 값이 최소값(" + minValue + ") 이상이여야 합니다.");
						obj.focus();

						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
				}

				if (isValid && (maxValue != null)) {
					if (eval(maxValue) < eval(value)) {
						alert(dispName + " 값이 최대값(" + maxValue + ") 미만이여야 합니다.");
						obj.focus();

						$(function(event) {
							event.preventDefault(); 
						});
						return	false;
					}
				}
			}
		}
	}

	return	true;
}

/**
 * 숫자형식에서 comma를 없애고, 날짜형식에서 구분자를 없앤다.
 *
 * @param	form
 */
function makeValue(form) {
	var objElements = form.elements;
	for (i = 0; i < objElements.length; i++) {
		obj = objElements[i];

		if (obj.tagName == "INPUT") {
			dataType = obj.getAttribute("dataType");

			if (dataType == "date" || dataType == "calendar") {
				//deleteDateFormat(obj);
			} else if (dataType == "number" || dataType == "integer" || dataType == "float") {
				if (obj.getAttribute("comma") != null) {
					deleteComma(obj);
				}
			} else if (dataType == "zipcode") {
				deleteZipcodeFormat(obj);
			} else if (dataType == "time") {
				deleteTimeFormat(obj);
			} else if (dataType == "jumin") {
				deleteJuminFormat(obj);
			} else if (dataType == "saup") {
				deleteSaupFormat(obj);
			} else if (dataType == "corporate") {
				deleteCorporateFormat(obj);
			} else if (dataType == "datetime") {
				deleteDatetimeFormat(obj);
			} else if (dataType == "phone") {
				deletePhoneFormat(obj);
			} else if (dataType == "timestamp") {
				deleteTimestampFormat(obj);
			} else {
				var strGuide = obj.getAttribute("guide");
				if (strGuide != null && strGuide != "" && obj.value == strGuide) {
					obj.value = "";
				}
			}
		}
	}
}

/**
 * 숫자형식에서 comma를 없애고, 날짜형식에서 구분자를 없앤다.
 * 하나의 오브젝트에 대한 것임.
 *
 * @param	form
 * @param	obj
 */
function makeValueObj(form, obj) {
	if (obj.tagName == "INPUT") {
		dataType = obj.getAttribute("dataType");

		if (dataType == "date" || dataType == "calendar") {
			deleteDateFormat(obj);
		} else if (dataType == "time") {
			deleteTimeFormat(obj);
		} else if (dataType == "datetime") {
			deleteDatetimeFormat(obj);
		} else if (dataType == "timestamp") {
			deleteTimestampFormat(obj);
		} else if (dataType == "number" || dataType == "integer" || dataType == "float") {
			if (obj.getAttribute("comma") != null) {
				deleteComma(obj);
			}
		} else if (dataType == "zipcode") {
			deleteZipcodeFormat(obj);
		} else if (dataType == "jumin") {
			deleteJuminFormat(obj);
		} else if (dataType == "saup") {
			deleteSaupFormat(obj);
		} else if (dataType == "corporate") {
			deleteCorporateFormat(obj);
		} else if (dataType == "phone") {
			deletePhoneFormat(obj);
		} else {
			var strGuide = obj.getAttribute("guide");
			if (strGuide != null && strGuide != "" && obj.value == strGuide) {
				obj.value = "";
			}
		}
	}
}

/**
 * obj의 value값을 얻는다. comma나 구분자는 제거된다.
 *
 * @param	obj
 * @return	value
 */
function jsGetValue(obj) {
	if (obj == null) {
		return	null;
	}

	var value = obj.value;
	dataType = obj.getAttribute("dataType");

	if (dataType == "date") {
		value = deleteDateFormatStr(obj.value);

		if (!isDate(value)) {
			value = "";
		}
	} else if (dataType == "time") {
		value = deleteTimeFormatStr(obj.value);

		if (!isTime(value)) {
			value = "";
		}
	} else if (dataType == "datetime") {
		value = deleteDatetimeFormatStr(obj.value);

		if (!isDatetime(value)) {
			value = "";
		}
	} else if (dataType == "timestamp") {
		value = deleteTimestampFormatStr(obj.value);

		if (!isTimestamp(value)) {
			value = "";
		}
	} else if (dataType == "number") {
		if (obj.getAttribute("comma") != null) {
			value = deleteCommaStr(obj.value);
		}

		if (!isNum(value)) {
			value = "0";
		}
	} else if (dataType == "integer") {
		if (obj.getAttribute("comma") != null) {
			value = deleteCommaStr(obj.value);
		}

		if (!isInteger(value)) {
			value = "0";
		}
	} else if (dataType == "float") {
		if (obj.getAttribute("comma") != null) {
			value = deleteCommaStr(obj.value);
		}

		if (!isFloat(value)) {
			value = "0";
		}
	} else if (dataType == "zipcode") {
		value = deleteZipcodeFormatStr(obj.value);

		if (!isZipcode(value)) {
			value = "";
		}
	} else if (dataType == "jumin") {
		value = deleteJuminFormatStr(obj.value);

		var isValid = false;
		isValid = isJumin(value);
		if (!isValid) {
			value = "";
		}
	} else if (dataType == "saup") {
		value = deleteSaupFormatStr(obj.value);

		var isValid = false;
		isValid = isSaup(value);
		if (!isValid) {
			value = "";
		}
	} else if (dataType == "corporate") {
		value = deleteCorporateFormatStr(obj.value);

		var isValid = false;
		isValid = isCorporate(value);
		if (!isValid) {
			value = "";
		}
	} else if (dataType == "phone") {
		value = deletePhoneFormatStr(obj.value);

		if (!isPhone(value)) {
			value = "";
		}
	}
	return	value;
}



/****************************** 기타 함수 START *******************************/


/**
 * Get 방식의 submit.
 *
 * @param f	전송할 폼 객체
 */
function submitGet(f) {
	f.method = "get";
	f.submit();
}

/**
 * Post 방식의 submit.
 *
 * @param f	전송할 폼 객체
 */
function submitPost(f) {
	f.method = "post";
	f.submit();
}

/**
 * radio button의 체크된 값을 얻는다.
 *
 * @param obj
 * @return value
 */
function getRadioValue(obj) {
	if (obj) {
		if (obj.length) {
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].checked) {
					return obj[i].value;
				}
			}
		} else {
			if (obj.checked) {
				return obj.value;
			}
		}
	}

	return null;
}

/**
 * 가장 첫번째 element를 체크표시한다. 
 * (checkbox, radio) disabled된 것은 제외, 이미 체크된 것이 있으면 SKIP
 *
 * @param obj	Object
 */
function checkFirstElement(obj) {
	var firstIndex = 0;
	if (obj.length) {
		for ( var i = 0; i < obj.length; i++) {
			if (!obj[i].disabled && obj[i].checked) {
				return;
			}
		}
		for ( var i = 0; i < obj.length; i++) {
			if (!obj[i].disabled) {
				firstIndex = i;
				break;
			}
		}
		obj[firstIndex].checked = true;
	} else {
		if (!obj.disabled && obj.checked) {
			return;
		}
		obj.checked = true;
	}
}

/**
 * SELECT object의 option을 추가
 *
 * @param obj	SELECT object
 * @param val	OPTION value
 * @param txt	OPTION text
 */
function addOption(objSelect, val, txt) {
	
	
	var newOption = document.createElement("option");
	newOption.setAttribute("value", val);
	var newOptionText = document.createTextNode(txt);
	newOption.appendChild(newOptionText);
	var container = document.getElementById(""+objSelect+"");	
	//container.removeChild(document.getElementById(""+objSelect+""));
	container.appendChild(newOption);

	return true;
}

/**
 * SELECT object의 option을 추가 (추가 후 디폴트 값 선택)
 *
 * @param obj	SELECT object
 * @param val	OPTION value
 * @param txt	OPTION text
 */
function addOptionSelected(objSelect, val, txt) {
	var newOption = document.createElement("<option selected>");
	newOption.setAttribute("value", val);
	var newOptionText = document.createTextNode(txt);
	newOption.appendChild(newOptionText);
	objSelect.appendChild(newOption);

	return true;
}

function removeOption(obj){
	val = obj.length;
	for(var i=0; i<val; i++){
		for(var j=0; j<obj.options.length; j++){
			if(obj.options[j].selected == true){
				obj.remove(j);
				break;
			}
		}
	}
}

function removeOptionAndAdd(obj, val, txt){
	try {
	removeOption(obj);
	} catch (e) {}
	addOptionSelected(obj, val, txt);
}

/**
 * Object에 값을 세팅한다.
 *
 * @param obj	Object
 * @param value	값
 */
function setValue(obj, value) {
	if (obj) {
		//alert ( obj.type +"-----------" + value +"-----------"+ typeof(obj)  );
		if (obj.type == "text") {
			obj.value = value;
		} else if ((obj.type == "radio") || (obj.type == "checkbox")) {
			if (obj.value == value) {
				obj.checked = true;
			} else {
				obj.checked = false;
			}
		} else if (obj.tagName == "SELECT") {
			for ( var i = 0; i < obj.length; i++) {
				if (obj.options[i].value == value) {
					obj.options[i].selected = true;
					break;
				}
			}
		} else if (obj.tagName == "TEXTAREA") {
			obj.value = value;
		} else if (obj.length) { // 배열
			for ( var i = 0; i < obj.length; i++) {
				if ((obj[i].type == "radio") || (obj[i].type == "checkbox")) {
					if (obj[i].value == value) {
						obj[i].checked = true;
					}
				}
			}
		}
	}
}

function getValue(obj) {
	var value= "";
	if (obj) {
		if (obj.tagName == "SELECT") {
			for ( var i = 0; i < obj.length; i++) {
				if (obj.options[i].selected == true) {
					value =  obj.options[i].value;
					break;
				}
			}
		}
	}
	
	return value;
}

/**
 * Object의 개수를 구한다.
 *
 * @param obj	Object
 */
function getObjCount(obj) {
	var cnt = 0;
	if (obj) {
		if (obj.length) {
			cnt = obj.length;
		} else {
			cnt = 1;
		}
	}
	return cnt;
}

// 원본 이미지 팝업을 띄움.
function jsShowImagePopup(img) {
	window.open(img, "", "");
}

/**
 * 체크박스 전체 선택 및 전체 해제
 *
 * @param obj	String 
 */
function jsAllCheckedByName(obj){
	
	$("input[type='checkbox']").attr('checked', $('#'+obj).is(':checked'));
	
}
/**
 * 체크박스 전체 선택 및 전체 해제
 *
 */
function jsAllChecked(){
	jsAllCheckedByName('allCheck');
	
	
}

/**
 * 체크박스 단일 해제시 체크 값 변경
 * @param value: 상태값
 * @param obj : 컨트롤명
 */
function jsCheckByName(value, obj){
	
	if($('input[name=check]:checkbox:checked').length == $('input[name=check]').length){
		$('#'+obj).prop('checked', 'checked');
	}

	if (!value.checked){
		$('#'+obj).prop('checked', '');
	}
}

function jsCheckByName2(value, obj){
	
	if($('input[name=check]:checkbox:checked').length == $('input[name=check]').length){
		$('#'+obj).prop('checked', 'checked');
	}

	if (!value.checked){
		$('#'+obj).prop('checked', '');
	}
}

/**
 * 체크박스 단일 해제시 체크 값 변경
 * @param value: 상태값
 */
function jsCheck(value){
	
	jsCheckByName(value, 'allCheck');
	
}

jQuery.fn.intVal = function(){
	return $(this).val().replace(/,/gi, '') * 1;
}

Number.prototype.numberFormat = function(round_decimal) {
	if(!round_decimal) round_decimal = 0;

	return this.toFixed(round_decimal).replace(/(\d)(?=(\d{3})+$)/g, "$1,");
};