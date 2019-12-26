<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<title>Insert title here</title>
        <style>

       #rtInsertTitle{
       font-size : 30px;
       text-align : center;
       margin-top : 120px;
       }
        .rtTable{
        margin : auto;
        width : 1000px;
          font-weight: 400;
        }
        
       .nameTd{
       text-align: center;
       width:100px;
       }
        #addinput{
             margin-top: 7px;
            margin-bottom: 7px;
        }
        .tdsize{
           width: 240px;
           height : 60px;
        }
      
        </style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp"/>
<h1 id ="rtInsertTitle">Update Room</h1>
<hr>
   <form action="Roomtypeinsert.do" id="insertForm" method="post" enctype="multipart/form-data">
      <table class= "rtTable" border = "1px solid black;">
         <tr class = "trH">
            <td class="nameTd">룸 타입</td>
            <td class="tdsize"><select name="type">
                  <optgroup label="슈페리어">
                     <option value="SUPERIOR_DOUBLE">슈페리어 더블</option>
                     <option value="SUPERIOR_TWIN">슈페리어 트윈</option>
                     <option value="SUPERIOR_TERRACE_DOUBLE">슈페리어 테라스 더블</option>
                     <option value="SUPERIOR_TERRACE_TWIN">슈페리어 테라스 트윈</option>
                  </optgroup>
                  <optgroup label="디럭스">
                     <option value="DELUXE">디럭스</option>
                     <option value="DELUXE_GRAND_DOUBLE">그랜드 디럭스 더블</option>
                     <option value="DELUXE_GRAND_TWIN">그랜드 디럭스 트윈</option>
                     <option value="DELUXE_PREMIUM">프리미엄 디럭스</option>
                     <option value="DELUXE_PREMIUM_TERRACE">프리미엄 디럭스 테라스</option>
                  </optgroup>
                  <optgroup label="스위트">
                     <option value="SUITE_JUNIOR">주니어 스위트</option>
                     <option value="SUITE_DELUXE">디럭스 스위트</option>
                     <option value="SUITE_GRAND_DELUXE">그랜드 디럭스 스위트</option>
                     <option value="SUITE_ROYAL">로열 스위트</option>
                  </optgroup>
               </select>
            <td class="nameTd" >최대 수용 인원</td>
            <td class="tdsize"><input type="number" min=1 max=10 value=2 name="capacity"></td>
            <td class="nameTd" >배드 추가 여부</td>
            <td ><input type="radio" name="addBed" value="Y">Y 
               <input type="radio" name="addBed" value="N" checked="checked">N</td>
         </tr>
         <tr class = "trH">
            <td class="nameTd" >싱글배드 수</td>
            <td><input type="number" min=0 max=4 value=1 name="singleBed"></td>
            <td class="nameTd" >더블배드 수</td>
            <td colspan = "3"><input type="number" min=0 max=4 value=1 name="doubleBed"></td>
            
         </tr>
         <tr class = "trH">
           <td class="nameTd" >판매 시작일</td>
           <td class="tdsize"><input type="text" id="onSaleDate"  name="startDay" readonly>  </td>
           <td class="nameTd" >판매 종료일</td>
           <td class="tdsize" colspan ="3"><input type="text" id="offSaleDate"  name="endDay" readonly></td>
         </tr>
         <tr class = "trH">
            <td class="nameTd" >주중가</td><td class="tdsize"><input type="text" id="payment" name ="weekDay">원</td>
            <td class="nameTd" >주말가</td><td colspan ="3"><input type="text" id="weekendPay" value = "0" name ="weekEnd" style="background-color:#c8c8c8;" readonly >원</td> 
            
         </tr>
         <tr class = "trH">
            <td class="nameTd">대표 사진</td>
            <td colspan ="5" class="tdsize"></td>
         </tr>
         <tr class = "trH">
            <td class="nameTd" >첨부파일</td>
            <td colspan="5" class="tdsize"><input type="File" name = "file" id = "mainImg" onchange="fileTypeCheck(this)"></td>
         </tr>
         
         <tr >
            <td colspan="5" class="tdsize"></td><td colspan="1"> <input type="submit" id="submit" value="룸 업데이트" style= "float : right;"></td>
         </tr>
         
      </table>
   </form>

   <script>
      
      //주중가로 주말가 어린이 요금 계싼
      $( "#payment" ).keyup(function() {
         //weekendPay 주중가의 120% 가격 후 1의 자리 반올림 
         //childrenPay 주중가의 60% 가격 후 1의 자리 반올림
         var weekendPay =   Math.round((120/100)*$("#payment").val()/10)*10;
         var childrenPay =  Math.round((60/100)*$("#payment").val()/10)*10;
         
         $("#weekendPay").val(weekendPay);
         $("#childPay").val(childrenPay);
      
         });
   
      //캘린더 DATEPICKER 사용
        $(function() {
                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                // 시작일(onSaleDate)은 종료일(offSaleDate) 이후 날짜 선택 불가
                // 종료일(offSaleDate)은 시작일(onSaleDate) 이전 날짜 선택 불가
                //시작일.
                $('#onSaleDate').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                    buttonImage: "resources/images/calendarIcon.png", // 버튼 이미지
                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                    //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(onSaleDate) datepicker가 닫힐때
                        // 종료일(offSaleDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#offSaleDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });
                //종료일
                $('#offSaleDate').datepicker({
                    showOn: "both", 
                    buttonImage: "resources/images/calendarIcon.png", 
                    buttonImageOnly : true,
                    // buttonText: "날짜선택",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(offSaleDate) datepicker가 닫힐때
                        // 시작일(onSaleDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#onSaleDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
      //NULL값  제외 스크립트 
      $(document).ready(function(){
         $('#insertForm').bind('submit',function(){
            //대표사진 필수 등록
            if($('#onSaleDate').val() == ""){
               alert("판매 시작일을 선택 해주세요.");
               return false;
            //상세사진 1장이상 등록
            }else if($('#offSaleDate').val() == ""){
               alert("판매 종료일을 선택 해주세요.")
               return false;
            //판매 시작일
            }else if($('#payment#onSaleDate').val() == ""){
               alert("주중가를 입력해주세요.")
               return false;
            //판매 종료일
            }else if($('#mainImg').val() == ""){
               alert("대표사진을 등록해주세요.")
               return false;
            //주중가 입력
            }
         
         });
      });
      //인풋 이미지파일 필터
      function fileTypeCheck(f){
         // files 로 해당 파일 정보 얻기.
         var file = f.files;
         // file[0].name 은 파일명 입니다.
         // 정규식으로 확장자 체크
         if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

         // 체크를 통과했다면 종료.
         else return;

         // 체크에 걸리면 선택된  내용 취소 처리를 해야함.
         // 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
         // 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
         f.outerHTML = f.outerHTML;
      }
   </script>
   

   
</body>
</html>