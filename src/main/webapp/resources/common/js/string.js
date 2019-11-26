/*******************************************************************************
 * 문자열 관련 함수
 ******************************************************************************/

/**
 * Object Array의 값을 지정한 구분자로 구분한 문자열로 리턴
 *
 * @param obj	Object
 * @param delimiter	구분자
 */
function getArrayString(obj, delimiter) {
	var str = "";
	var cnt = getObjCount(obj);
	if (cnt > 0) {
		if (cnt == 1) {
			str = obj.value;
		} else {
			var tmpArr = new Array(cnt);
			for ( var i = 0; i < cnt; i++) {
				tmpArr[i] = obj[i].value;
			}
			str = tmpArr.join(delimiter);
		}
	}
	return str;
}

/**
 * 문자열의 byte length를 얻는다.
 *
 * @param str	문자열
 * @return byte length
 */
function getByteLength(str) {
	if (str == "") {
		return 0;
	}

	var len = 0;

	for ( var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 128) {
			len++;
		}
		len++;
	}

	return len;
}

/**
 * 값의 왼쪽 공백을 제거한다.
 *
 * @param str	문자열
 * @return 문자열
 */
function ltrim(str) {
	var s = new String(str);

	if (s.substr(0, 1) == " ")
		return ltrim(s.substr(1));
	else
		return s;
}

/**
 * 값의 오른쪽 공백을 제거한다.
 *
 * @param str	문자열
 * @return 문자열
 */
function rtrim(str) {
	var s = new String(str);
	if (s.substr(s.length - 1, 1) == " ")
		return rtrim(s.substring(0, s.length - 1))
	else
		return s;
}

/**
 * 값의 좌우 공백을 제거한다.
 *
 * @param str	문자열
 * @return 문자열
 */
function trim(str) {
	return ltrim(rtrim(str));
}

/**
 * 자리수 만큼 왼쪽에 지정한 문자를 넣는다.
 * 
 * @param str		원 문자열
 * @param strSize	문자열 사이즈
 * @param char		채울 문자
 * @return	문자열
 */
function lpad(str, strSize, char1) {
	str = str.toString();
	var numPad = strSize - str.length;
	for (var i = 0; i < numPad; i++) {
		str = char1 + str;
	}
	return str;
}

/**
 * replace 메소드 정의
 */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/gi, "");
}
String.prototype.replaceAll = function(str1, str2) {
	var temp_str = "";
	if (this.trim() != "" && str1 != str2) {
		temp_str = this.trim();
		while (temp_str.indexOf(str1) > -1) {
			temp_str = temp_str.replace(str1, str2);
		}
	}
	return temp_str;
}

