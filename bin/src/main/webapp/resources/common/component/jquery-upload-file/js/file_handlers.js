function jsCheckCss() {
	var uploadify_css = $( "#uploadfile_css" ).attr("href");
	uploadify_css = uploadify_css + "";
	
	if (uploadify_css == "undefined") {
		$("head").append("<link id='uploadfile_css' href='/common/component/jquery-upload-file/css/uploadfile.css' rel='stylesheet'>");
		$("head").append("<script src='/common/component/jquery-upload-file/js/jquery.uploadfile.min.js'></script>");
	}
}

function jsDrawMultiUpload(ELEMENT_ID, FILE_EXTS, FILE_SIZE_LIMIT) {
	$(document).ready(function() {
		jsCheckCss();
				
		$("#" + ELEMENT_ID + "_FILE").uploadFile({
			url:"/file/upload/",
			formData: {"F_DIVISION":ELEMENT_ID},
			allowedTypes:FILE_EXTS,
			fileName:ELEMENT_ID,
			dragDropStr: "<span><b>마우스로 파일을 끌어오세요</b></span>",
		    abortStr:"취소",
			cancelStr:"취소",
			doneStr:"완료",
			multiDragErrorStr: "여러파일을 끌어오시면 안됩니다.",
			extErrorStr:"업로드가 불가능 합니다. 업로드 가능 확장자 : ",
			sizeErrorStr:"업로드가 불가능 합니다. 업로드 가능 파일크기 : ",
			uploadErrorStr:"업로드시 오류가 발생하였습니다.",
			uploadStr:"파일선택",
			maxFileSize:FILE_SIZE_LIMIT*1024*1024,
			onSuccess:function(files, data, xhr, pd) {
				data = data.replace(/^[ /\n/\r]/g,"");
				var result = eval( "("+ data + ")" );
				
				var dispFileNM = decodeURIComponent(result.DISP_FILE_NM);
				
				if (dispFileNM != null && dispFileNM != "") {
					jsAddFile(ELEMENT_ID, dispFileNM, result.FILE_NM, result.FILE_SIZE, result.FILE_TYPE);
				}
				
				pd.statusbar.fadeOut("slow");
			}
		});
	});
}

function jsDrawSingleUpload(ELEMENT_ID, FILE_EXTS, FILE_SIZE_LIMIT) {
	$(document).ready(function() {
		jsCheckCss();
		
		$("#" + ELEMENT_ID + "_FILE").uploadFile({
			url:"/file/upload/",
			formData: {"F_DIVISION":ELEMENT_ID},
			allowedTypes:FILE_EXTS,
			fileName:ELEMENT_ID,
			dragDropStr: "<span><b>마우스로 파일을 끌어오세요</b></span>",
		    abortStr:"취소",
			cancelStr:"취소",
			doneStr:"완료",
			multiDragErrorStr: "여러파일을 끌어오시면 안됩니다.",
			extErrorStr:"업로드가 불가능 합니다. 업로드 가능 확장자 : ",
			sizeErrorStr:"업로드가 불가능 합니다. 업로드 가능 파일크기 : ",
			uploadErrorStr:"업로드시 오류가 발생하였습니다.",
			uploadStr:"파일선택",
			maxFileCountErrorStr: " 업로드가 불가능 합니다. 최대 업로드 수량 : ",
			multiple:false,
			dragDrop:false,
			maxFileCount:1,
			maxFileSize:FILE_SIZE_LIMIT*1024*1024,
			onSuccess:function(files, data, xhr, pd) {
				data = data.replace(/^[ /\n/\r]/g,"");
				var result = eval( "("+ data + ")" );
				
				var dispFileNM = decodeURIComponent(result.DISP_FILE_NM);
				
				if (dispFileNM != null && dispFileNM != "") {
					jsAddFile(ELEMENT_ID, dispFileNM, result.FILE_NM, result.FILE_SIZE, result.FILE_TYPE);
				}
				
				pd.statusbar.fadeOut("slow");
			}
		});
	});
}

function jsAddFile(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number) {
	$("#" + ELEMENT_ID + "_NO_ROW").hide();
	
	jsDrawFile(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number);
	
	jsAddInput(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number);
}

function jsAddFileDownload(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number) {
	$("#" + ELEMENT_ID + "_NO_ROW").hide();
	
	jsDrawFileDownload(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number);
}

/**
 * 첨부 파일 정보 그리기
 * 
 * @param dispFileNm
 * @param fileNm
 * @param fileSize
 * @param fileTypeOrg
 * @param fileSeq
 * @return
 */
function jsDrawFile(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number) {var ELE_NAME = fileNm.split('.', 1);
	
	var btn = "";
	//btn = btn + "<a class='btn btn-xs btn-success' onclick='jsDownloadFile(\"" + ELEMENT_ID + "\", \"" + ELE_NAME + "\")';>다운로드</a>";
	
	fileSeq = fileSeq + "";
	
	if (fileSeq != "undefined") {
		btn = btn + "&nbsp;<a class='btn btn-xs btn-danger' onclick='jsDeleteFile(\"" + ELEMENT_ID + "\", \"" + ELE_NAME + "\", \"" + fileSeq + "\")';>삭제</a>";
	} else {
		btn = btn + "&nbsp;<a class='btn btn-xs btn-danger' onclick='jsDeleteTempFile(\"" + ELEMENT_ID + "\", \"" + ELE_NAME + "\", \"" + dispFileNm + "\", \"" + fileNm + "\", \"" + fileType + "\")';>삭제</a>";
	}
	
	if (fileType == "IMG") {
		//btn = btn + "&nbsp;<a class='btn btn-xs btn-primary' onclick='jsShowFile(\"" + ELEMENT_ID + "\", \"" + ELE_NAME + "\")';>미리보기</a>";
	}
	
	if ((number + "") == "undefined") {
		number = "임시";
	}
	
	var strHTML = "";
	strHTML = "<tr id='" + ELEMENT_ID + "_FILE_LIST_" + ELE_NAME + "'><td>" + number + "</td>";
	
	if (number != "임시") {
		strHTML = strHTML + "<td><a href='javascript:jsDownloadFile(\"" + fileSeq + "\");'>" + dispFileNm + "</a></td>";	
	} else {
		strHTML = strHTML + "<td>" + dispFileNm + "</td>";
	}
	
	strHTML = strHTML + "<td>" + formatBytes(fileSize) + "</td><td>" + btn + "</td></tr>";
	
	$("#" + ELEMENT_ID + "_FILE_LIST").append(strHTML);
	
	$("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT", ($("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT") * 1 + 1));
		
	if ($("#" + ELEMENT_ID + "_FILE").attr("multi") == 'N') {
		$("#" + ELEMENT_ID + "_FILE").hide();
	}
	
	$("#" + ELEMENT_ID + "_NO_ROW").hide();
}

/**
 * 첨부 파일 정보 그리기
 * 
 * @param dispFileNm
 * @param fileNm
 * @param fileSize
 * @param fileTypeOrg
 * @param fileSeq
 * @return
 */
function jsDrawFileDownload(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq, number) {
	var ELE_NAME = fileNm.split('.', 1);
	
	var btn = "";
	btn = btn + "<a class='btn btn-xs btn-success' onclick='jsDownloadFile(\"" + fileSeq + "\")';>다운로드</a>";
	
	if (fileType == "IMG") {
		btn = btn + "&nbsp;<a class='btn btn-xs btn-primary' onclick='jsShowFile(\"" + fileSeq + "\")';>미리보기</a>";
	}
	
	$("#" + ELEMENT_ID + "_FILE_LIST").append("<tr id='" + ELEMENT_ID + "_FILE_LIST_" + ELE_NAME + "'><td>" + number + "</td><td>" + dispFileNm + "</td><td>" + formatBytes(fileSize) + "</td><td>" + btn + "</td></tr>");
}

/**
 * 파일 업로드 후 해당 파일 div에 input type=hidden 객체 추가
 * 
 * @param dispFileNm
 * @param fileNm
 * @param fileSize
 * @param fileType 파일의 관리상의 속성(IMG/FILE)
 * @param fileTypeOrg 파일의 근본적인 속성(IMG/FILE)
 * @param fileSeq
 * @return
 */
function jsAddInput(ELEMENT_ID, dispFileNm, fileNm, fileSize, fileType, fileSeq) {
	var ELE_NAME = fileNm.split('.', 1);
	
	if ((fileSeq + "") == "undefined") {
		fileSeq = "";
	}
	
	var ele = '';
	ele = ele + '<input type="text" name="PB_F_DIVISION" value="' + ELEMENT_ID + '">';
	ele = ele + '<input type="text" name="PB_F_DISP_NAME" value="' + dispFileNm + '">';
	ele = ele + '<input type="text" name="PB_F_NAME" value="' + fileNm + '">';
	ele = ele + '<input type="text" name="PB_F_SIZE" value="' + fileSize + '">';
	ele = ele + '<input type="text" name="PB_F_TYPE" value="' + fileType + '">';
	ele = ele + '<input type="text" name="PB_F_PK" value="' + fileSeq + '">';
	
	$('#' + ELEMENT_ID + '_FILE_LIST').append('<tr id=' + ELEMENT_ID + '_FILE_ELE_' + ELE_NAME + ' colspan="3" style="display:none"><td>' + ele + '</td></tr>');
}

function jsDownloadFile(fileSeq) {
	location.href = "/file/download?F_SEQ=" + fileSeq;
}

function jsShowFile(fileSeq) {
	UvColorBoxAdd("/file/image?F_SEQ=" + fileSeq, 500, 500, "미리보기");
}

function jsDeleteFile(ELEMENT_ID, ELE_NAME, F_SEQ) {
	if ($("#" + ELEMENT_ID + "_FILE").attr("multi") == 'N') {
		$("#" + ELEMENT_ID + "_FILE").uploadFile().reset();
		jsDrawSingleUpload(ELEMENT_ID, $("#" + ELEMENT_ID + "_FILE").attr("FILE_EXTS"), $("#" + ELEMENT_ID + "_FILE").attr("FILE_SIZE_LIMIT"));
		$("#" + ELEMENT_ID + "_FILE").show();
	}
	
	$("#" + ELEMENT_ID + "_FILE_LIST_" + ELE_NAME).remove();
	$("#" + ELEMENT_ID + "_FILE_ELE_" + ELE_NAME).remove();

	if (F_SEQ != "") {
		var ele = "";
		ele = ele + "<input type='text' name='PB_DELETE_F_SEQ' value='" + F_SEQ + "'>";
		
		$("#" + ELEMENT_ID + "_FILE_LIST").append("<tr id='" + ELEMENT_ID + "_FILE_ELE_" + ELE_NAME + "' colspan='3' style='display:none'><td>" + ele + "</td></tr>");
	}
	
	$("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT", ($("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT") * 1 - 1));
}

function jsDeleteTempFile(ELEMENT_ID, ELE_NAME, dispFileNm, fileNm, fileType) {
	if ($("#" + ELEMENT_ID + "_FILE").attr("multi") == 'N') {
		$("#" + ELEMENT_ID + "_FILE").uploadFile().reset();
		jsDrawSingleUpload(ELEMENT_ID, $("#" + ELEMENT_ID + "_FILE").attr("FILE_EXTS"), $("#" + ELEMENT_ID + "_FILE").attr("FILE_SIZE_LIMIT"));
		$("#" + ELEMENT_ID + "_FILE").show();
	}
	
	$("#" + ELEMENT_ID + "_FILE_LIST_" + ELE_NAME).remove();
	$("#" + ELEMENT_ID + "_FILE_ELE_" + ELE_NAME).remove();

	$.getJSON(
		"/file/removeTemp", 
		{F_NAME:fileNm, F_DISP_NAME:dispFileNm, F_TYPE:fileType}
	);
	
	$("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT", ($("#" + ELEMENT_ID + "_FILE").attr("FILE_CNT") * 1 - 1));
}

function formatBytes(bytes,decimals) {
   if(bytes == 0) return '0 Byte';
   var k = 1000;
   var dm = decimals + 1 || 3;
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
   var i = Math.floor(Math.log(bytes) / Math.log(k));
   return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}