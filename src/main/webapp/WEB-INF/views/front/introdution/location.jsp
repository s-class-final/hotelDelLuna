<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp"/>
	



<!-- Google Maps API -->
<!--    
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script>
window.onload = function() {
    var map_div = document.getElementById("map");
    // 표시 위치 결정
    var latlng = new google.maps.LatLng(37.4376655, 126.4537921);
    // 지도 표시
    var gmap = new google.maps.Map(
        map_div, {
            zoom:15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    // 아이콘 표시
    var marker = new google.maps.Marker({
        position: latlng,
        map: gmap,
        title: 'Paradise City'
    });     
};
 -->
<!--  <style>
    .tableList tbody tr.on td {background:#f9f9f9; color:#e66045;}
 </style> -->

<!-- 1-1차 API GoogleMap-->
<!-- <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkcPohXwii_cA1KGytXac10zcd7Kkhq88&callback=initMap&region=KR"></script>
 -->
<script>

/* function initMap() {
    var myLatLng = {lat: 37.435241, lng: 126.456931};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: myLatLng
    });

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Hotel DelLunar'
    });
}  */

// 층별/주차안내 버튼 클릭 시 해당 탭 이동 
function showFloorInfoTab( fmt_dataId ) {
    // 층별안내 상단 메뉴 탭 활성화
    $(".floorMapTab .reserveCategory li").removeClass("active");
    $("#" + fmt_dataId).addClass("active");
    
    // 모든 탭 내용 감추기
    $(".floorMapView").hide();
    $("div .floorMapView").eq("#" + fmt_dataId).show();
    
    // 각 탭에 속한 지도 이미지 감추기
    $(".floorMapView").find(".levelWrap").hide();
    
    // 탭 내용 반복문
    $(".floorMapView").each(function(index, item){
        if ( index != 0 ) {
            var oThis = this;
            var fmv_dataId = $(this).data("id"); // 탭 내용을 담고 있는 div의 data-id 가져오기
            
            // 상단 탭 data-id와 해당 탭 내용을 담고있는 div의 data-id 가 일치할 경우
            if ( fmv_dataId == fmt_dataId ) {
                $(this).css("display","block"); // 일치한 탭 내용 보여주기 
                $(this).find(".floorInfo li").removeClass("on").last().addClass("on"); // 주차안내 li 태그 활성화
                $(this).find(".levelWrap").last().show();
            } else {
                $(".floorMapView").eq(index).find(".floorInfo li a").each(function(index, item){
                    var findOnClass = $(this).parents().hasClass("on");
                    
                    if ( findOnClass ) {
                        var idx = $(this).parents().index();
                        $(oThis).find(".levelWrap").eq(idx).show();
                    }
                    
                });
            }
        }
    });
}

$(document).ready(function(){
    $('#content').addClass("full");
    $('#content_area').show();

    $(".evFloorInfo").bind("click", function(){
        var fmt_dataId = $(this).data("id");
        showFloorInfoTab( fmt_dataId );
    });

    var strTabType = "";
    if (strTabType == "FLOOR") {
        $(".FLOOR").show();
    } else if (strTabType == "ARTMAP") {
        $(".ARTMAP").show();
    } else {
        $(".LOCATION").show();
    }

    //Map 테두리 제거용 Element Attribute 설정, 2019.02.12
    $("area").each(function(){
        $(this).attr({
            onfocus : "blur();"
           ,onclick : "javascript:jsMapView(this);"
        });
    });

    //IMG 사이즈 조정 : MAP, 상세보기 바탕에 대하여 가로,세로 100%
    $("div.map, div.mapView").find("img").each(function() {
        $(this).css("width" , "100%");
        $(this).css("height", "100%");
    });

});

//Map 클릭 이벤트 재호출용 함수
function jsMapView(obj) {
    var target = $(obj).closest('.levelWrap'); 
    var idx = $(obj).index();
    target.find('.detailFloor.on .mapView > div').eq(idx).show().siblings().hide();
    return false;
}
</script>

<!-- 컨텐츠 영역 -->
<section id="container">
    <div class="innerBox">

        <h1 class="contTitle"><span>PARADISE CITY MAP</span>파라다이스시티에 오신 걸 <br>환영합니다.</h1>

        <div class="tapBox">
            <ul>
                <li  class="on"><a href="#">오시는 길</a></li>
                <!-- <li ><a href="#">층별 안내</a></li>
                <li ><a href="#">아트맵</a></li> -->
            </ul>
        </div>


<script type="text/javascript">
$(document).ready(function(){
    //Rowspan Hover Event
    $("td.ursp").hover(function() {
        $el = $(this);
        $el.parent().addClass("hoverRowSpan");
        if ($el.parent().has('td[rowspan]').length == 0) {
            $el.parent().prevAll('tr:has(td[rowspan]):first').find('td[rowspan]').addClass("hoverRowSpan");
        }
        
    }, function() { 
        $el.parent().removeClass("hoverRowSpan").prevAll('tr:has(td[rowspan]):first').find('td[rowspan]').removeClass("hoverRowSpan");
    });
    
    $("p.tit").each(function() {
        $(this).find("span").eq(0).css("padding-top", "5px");
    })
    $(".innTableSd, .innTableCn").css("padding-top", "5px");
});
</script>

<style> 
.hoverRowSpan { background: #F9F9F9; }
.tableList thead th:not(:first-child) { border-left:1px solid #e6e3df; }
.tableList tbody td:not(:first-child) { border-left:1px solid #e6e3df; }
.tableList tbody td.bd1 { border-left:1px solid #e6e3df; }

</style>
        <div class="tapView LOCATION">
            <div class="mapWrap">

                <!-- map start -->
                <div class="mapArea">
                    <div id="map" class="mapBox" ></div>
                </div>
                <!-- map end -->


                <div class="titleArea">
                    <p class="title">언제나 설레는 공항 가는길, 인천공항 바로 옆에 <br>파라다이스시티가 있습니다.</p>
                    <p class="address">인천광역시 중구 영종해안남로 321길 186</p>
                    <!-- <div class="btnGroup">
                        <a href="http://map.naver.com/index.nhn?pinId=38469564&dlevel=10&enc=b64&pinType=site&y=995e0f1892e603ae43e9b6b2f0b59a23&x=3036ebf78a70c5546f717f2012c44ae5" class="btn small"><span>NAVER MAP</span></a>
                        <a href="http://map.daum.net/?urlX=379897&urlY=1094046&itemId=527592042" class="btn small"><span>DAUM MAP</span></a>
                    </div> -->
                </div>

                <div class="tapBox">
                    <ul class="eventTab clearFixed">
                        <li class="on"><a class="bgTransi" href="javascript:void(0);">셔틀버스</a></li>
                        <li class=""><a class="bgTransi" href="javascript:void(0);">자가용</a></li>
                        <li class=""><a class="bgTransi" href="javascript:void(0);">대중교통</a></li>
                    </ul>
                </div>

                <div class="tapView" style="display: block;">
                    <!-- P-CITY MAP 2018.12.06 -->
                    <div class="selectDesignTab">
                        <a href="javascript:void(0);" class="selectDesignTrigger">노선을 선택해주세요.</a>
                        <ul class="selectDesignOptions">
                            <li class=""><a href="javascript:void(0);" class="selectDesignOption">인천국제공항 순환 노선</a></li>
                            <li class=""><a href="javascript:void(0);" class="selectDesignOption">송도/안산 노선</a></li>
                            <li class=""><a href="javascript:void(0);" class="selectDesignOption">청라/대림 노선</a></li>

                        </ul>
                    </div>

                    <div class="selectDesignTabView defaultView">
                        <p class="defaultWay"><span class="defaultWayIcon"><img src="/pcPub/static/images/map/bg_default_way_icon.png" alt=""></span>선택된 노선이 없습니다.</p>
                    </div>

                    <!-- 인천국제공항 순환 노선 -->
                    <div class="selectDesignTabView">
                        <div class="detailWayTitle">
                            <h3>인천국제공항 순환 노선</h3>
                        </div>
                        
                        <div class="detailInfo">
                            <h3>운행일정</h3>
                            <div class="infoDetail">
                                <dl>
                                    <dt>운행요일</dt>
                                    <dd>매일</dd>
                                </dl>
                                <dl>
                                    <dt>배차간격</dt>
                                    <dd>20분</dd>
                                </dl>
                                <dl>
                                    <dt>파라다이스시티 승차 위치</dt>
                                    <dd>호텔 파라다이스 B1F 출입구 앞 버스 스테이션</dd>
                                </dl>
                            </div>
                        </div>

                        <div class="detailSchedule">
                            <h3>첫차/막차 시간</h3>
                            <table class="tableList">
                                <colgroup>
                                    <col style="">
                                    <col style="">
                                    <col style="">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">출발장소</th>
                                        <th scope="col">첫차</th>
                                        <th scope="col">막차</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>파라다이스시티 </td>
                                        <td>05:00</td>
                                        <td>23:00</td>
                                    </tr>
                                    <tr>
                                        <td>인천공항 2터미널 1층 1A</td>
                                        <td>05:25</td>
                                        <td>23:25</td>
                                    </tr>
                                    <tr>
                                        <td>인천공항 1터미널 1층 3C</td>
                                        <td>05:40</td>
                                        <td>23:40</td>
                                    </tr>
                                    <tr>
                                        <td>인천공항 1터미널 1층 14C</td>
                                        <td>05:45</td>
                                        <td>23:45</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="route">
                            <h3>운행노선 및 상세</h3>
                            <!-- 2018.09.28 수정 -->
                            <div class="mapDetailInfo newType6">
                                <img src="resources/pcPub/static/images/map/map_new_route_type6.jpg" alt="">
                                <div class="info1">
                                    <p class="tit">파라다이스시티 <span>매시<br />00분, 20분, 40분</span></p>
                                </div>
                                <div class="info2">
                                    <p class="tit">인천공항 1T<br />1층 3C 정류소<span>하차전용</span></p>
                                </div>
                                <div class="info3">
                                    <p class="tit">인천공항 1T<br />1층 14C 정류소<span>하차전용</span></p>
                                </div>
                                <div class="info4">
                                    <p class="tit">인천공항 2T<br />1층 1A 정류소<span>매시<br />05분, 25분, 45분</span></p>
                                </div>
                                <div class="info5">
                                    <p class="tit">인천공항 1T<br />1층 3C 정류소<span>매시<br />00분, 20분, 40분</span></p>
                                </div>
                                <div class="info6">
                                    <p class="tit">인천공항 1T<br />1층 14C 정류소<span>매시<br />05분, 25분, 45분</span></p>
                                </div>
                                <div class="info7">
                                    <p class="tit">파라다이스시티 </p>
                                </div>
                            </div>
                            <!-- //2018.09.28 수정 -->
                            <p class="wayNotice">도로 사정에 따라 각 승차 장소 별 셔틀버스 정차시간은 변경될 수 있습니다.</p>
                        </div>
                    </div>

                    <!-- 송도/안산 노선 , 2019.04.11-->
                    <div class="selectDesignTabView">
                        <div class="detailWayTitle">
                            <h3>송도/안산 노선</h3>
                        </div>
                        
                        <div class="detailInfo">
                            <h3>운행일정</h3>
                            <div class="infoDetail">
                                <dl>
                                    <dt>운행요일</dt>
                                    <dd>매일</dd>
                                </dl>
                                <dl>
                                    <dt>배차간격</dt>
                                    <dd>60분(단, 안산 직행 제외)</dd>
                                </dl>
                                <dl>
                                    <dt>파라다이스시티 승차 위치</dt>
                                    <dd>플라자 B1F 출입구 앞 버스 스테이션</dd>
                                </dl>
                            </div>
                        </div>

                        <div class="detailSchedule">
                            <h3>첫차/막차 시간</h3>
                            <table class="tableList">
                                <colgroup>
                                    <col style="">
                                    <col style="">
                                    <col style="">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">탑승장소</th>
                                        <th scope="col">출발장소</th>
                                        <th scope="col">첫차</th>
                                        <th scope="col">막차</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="3">파라다이스시티 행</td>
                                        <td class="ursp">안산역 1번출구 건너편 통근버스 정류장</td>
                                        <td class="ursp">09:30</td>
                                        <td class="ursp">11:30</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp bd1">송도 현대 프리미엄 아울렛</td>
                                        <td class="ursp">10:00</td>
                                        <td class="ursp">17:00</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp bd1">드림시티 앞</td>
                                        <td class="ursp">10:07</td>
                                        <td class="ursp">17:07</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp">송도행</td>
                                        <td rowspan="2">파라다이스시티 </td>
                                        <td class="ursp">14:00</td>
                                        <td class="ursp">20:00</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp">안산행</td>
                                        <td class="ursp">20:00</td>
                                        <td class="ursp">24:00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="route">
                            <h3>운행노선 및 상세</h3>
                            <div class="mapDetailInfo newType5">
                                <img src="resources/pcPub/static/images/map/map_new2_route_type5.jpg" alt="">
                                <div class="info1">
                                    <p class="tit">송도/안산 출발</p>
                                </div>
                                <div class="info1-1">
                                    <p class="tit">
                                        안산역 1번출구 건너편<br/>통근버스 정류장<br />
                                        <span>09:30</span>
                                        <span>10:30</span>
                                        <span>11:30</span>
                                        <span>※ 일 3회 한정</span><br />
                                     </p>
                                </div>
                                <div class="info1-2">
                                    <p class="tit">
                                        송도 현대<br/>프리미엄 아울렛<br />
                                        <span>10~17시</span>
                                        <span>매시 00분</span>
                                    </p>
                                </div>
                                <div class="info1-3">
                                    <p class="tit">
                                        드림시티 앞
                                        
                                        <br/><br/>
                                        
                                        <span>10~17시</span>
                                        <span>매시 07분</span>
                                    </p>
                                </div>
                                <div class="info1-4">
                                    <p class="tit">파라다이스시티 </p>
                                </div>
                                <div class="info2">
                                    <p class="tit">파라다이스시티 출발</p>
                                </div>
                                <div class="info2-1">
                                    <p class="tit">
                                        파라다이스시티 <br />
                                    </p>
                                    <div class="innTableSd">
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">송도행</span>
                                            <span class="cellMap col2 color999 tl">14~19시 매시 00분</span>
                                        </div>
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">송도&amp;안산행</span>
                                            <span class="cellMap col2 color999 tl vm">20:00</span>
                                        </div>
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">안산 직행</span>
                                            <span class="cellMap col2 color999 tl vm">22:00,24:00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="info2-2">
                                    <p class="tit">드림시티 앞</p>
                                </div>
                                <div class="info2-3">
                                    <p class="tit">송도 현대<br/>프리미엄 아울렛</p>
                                </div>
                                <div class="info2-4">
                                    <p class="tit">안산역 1번출구</p>
                                </div>
                            </div>
                            <p class="wayNotice">도로 사정에 따라 각 승차 장소 별 셔틀버스 정차시간은 변경될 수 있습니다.</p>
                        </div>
                    </div>

                    <!-- 청라/대림 노선 2019.04.11 -->
                    <div class="selectDesignTabView">
                        <div class="detailWayTitle">
                            <h3>청라/대림 노선</h3>
                        </div>
                        
                        <div class="detailInfo">
                            <h3>운행일정</h3>
                            <div class="infoDetail">
                                <dl>
                                    <dt>운행요일</dt>
                                    <dd>매일</dd>
                                </dl>
                                <dl>
                                    <dt>배차간격</dt>
                                    <dd>60분(단, 대림 직행 제외)</dd>
                                </dl>
                                <dl>
                                    <dt>파라다이스시티 승차 위치</dt>
                                    <dd>플라자 B1F 출입구 앞 버스 스테이션</dd>
                                </dl>
                            </div>
                        </div>

                        <div class="detailSchedule">
                            <h3>첫차/막차 시간</h3>
                            <table class="tableList">
                                <colgroup>
                                    <col style="">
                                    <col style="">
                                    <col style="">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">탑승장소</th>
                                        <th scope="col">출발장소</th>
                                        <th scope="col">첫차</th>
                                        <th scope="col">막차</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="3">파라다이스시티 행</td>
                                        <td class="ursp">대림역(2호선)5번출구</td>
                                        <td class="ursp">09:20</td>
                                        <td class="ursp">11:20</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp bd1">가정역(루원시티)4번출구 앞</td>
                                        <td class="ursp">10:00</td>
                                        <td class="ursp">17:00</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp bd1">롯데마트 건너편(엑슬루타워 쪽)</td>
                                        <td class="ursp">10:08</td>
                                        <td class="ursp">17:08</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp">청라행</td>
                                        <td rowspan="2">파라다이스시티 </td>
                                        <td class="ursp">14:00</td>
                                        <td class="ursp">20:00</td>
                                    </tr>
                                    <tr>
                                        <td class="ursp">대림행</td>
                                        <td class="ursp">20:00</td>
                                        <td class="ursp">24:00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="route">
                            <h3>운행노선 및 상세</h3>
                            <div class="mapDetailInfo newType4">
                                <img src="resources/pcPub/static/images/map/map_new2_route_type5.jpg" alt="">
                                <div class="info1">
                                    <p class="tit">청라/대림 출발</p>
                                </div>
                                <div class="info1-1">
                                    <p class="tit">
                                        대림역(2호선)<br/>5번출구<br />
                                        <span>09:20</span>
                                        <span>10:20</span>
                                        <span>11:20</span>
                                        <span>※ 일 3회 한정</span><br />
                                     </p>
                                </div>
                                <div class="info1-2">
                                    <p class="tit">
                                        가정역(루원시티)<br/>4번출구 앞<br/>
                                        <span>10~17시</span>
                                        <span>매시 00분</span>
                                    </p>
                                </div>
                                <div class="info1-3">
                                    <p class="tit">
                                        롯데마트 건너편<br/>(엑슬루타워 쪽)<br/>
                                        <span>10~17시</span>
                                        <span>매시 08분</span>
                                    </p>
                                </div>
                                <div class="info1-4">
                                    <p class="tit">파라다이스시티 </p>
                                </div>
                                <div class="info2">
                                    <p class="tit">파라다이스시티 출발</p>
                                </div>
                                <div class="info2-1">
                                    <p class="tit">
                                        파라다이스시티 <br />
                                    </p>
                                    <div class="innTableCn">
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">청라행</span>
                                            <span class="cellMap col2 color999 tl">14~19시 매시 00분</span>
                                        </div>
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">청라&amp;대림행</span>
                                            <span class="cellMap col2 color999 tl vm">20:00</span>
                                        </div>
                                        <div class="rowMap">
                                            <span class="cellMap col1 fw300 color333 tr">대림직행</span>
                                            <span class="cellMap col2 color999 tl vm">22:00,24:00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="info2-2">
                                    <p class="tit">롯데마트</p>
                                </div>
                                <div class="info2-3">
                                
                                    <p class="tit">가정역(루원시티)</p>
                                
                                </div>
                                <div class="info2-4">
                                    <p class="tit">대림역</p>
                                </div>
                            </div>
                            <p class="wayNotice">도로 사정에 따라 각 승차 장소 별 셔틀버스 정차시간은 변경될 수 있습니다.</p>
                        </div>
                    </div>

                </div>
                
                <div class="tapView">
                    <div class="route">
                        <div class="mapDetailInfo type2">
                            <img src="resources/pcPub/static/images/map/map_route02_n.jpg" alt="">
                            <div class="info1">
                                <p class="tit">인천국제공항고속도로</p>
                            </div>
                            <div class="info2">
                                <p class="tit">신불 IC</p>
                            </div>
                            <div class="info3">
                                <p class="tit">인천 국제공항공사</p>
                            </div>
                            <div class="info4">
                                <p class="tit">IBC 지하차도</p>
                            </div>
                            <div class="info5">
                                <p class="tit">IBC 월드게이트<br />오피스텔 방향 좌회전</p>
                            </div>
                            <div class="info6">
                                <p class="tit color">파라다이스시티 도착</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="tapView">
                    <div class="route">
                        <h3>지하철 + 자기부상열차</h3>
                        <div class="mapDetailInfo type3">
                            <img src="resources/pcPub/static/images/map/map_route03_1_n.jpg" alt="">
                            <div class="info1">
                                <p class="tit">공항철도 서울역 승차<br />(인천국제공항 방면)</p>
                            </div>
                            <div class="info2">
                                <p class="tit">인천국제공항역 환승</p>
                            </div>
                            <div class="info3">
                                <p class="tit">자기부상열차<br />(용유 방면)</p>
                            </div>
                            <div class="info4">
                                <p class="tit">파라다이스시티역 하차</p>
                            </div>
                            <div class="info5">
                                <p class="tit">파라다이스시티 전용 <br />연결통로로 도보 이동</p>
                            </div>
                            <div class="info6">
                                <p class="tit color">파라다이스시티 도착</p>
                            </div>
                        </div>
                    </div>      
                    <div class="route">
                        <h3>지하철 + 버스</h3>
                        <div class="mapDetailInfo type4">
                            <img src="resources/pcPub/static/images/map/map_route03_2_n.jpg" alt="">
                            <div class="info1">
                                <p class="tit">공항철도 서울역 승차<br />(인천국제공항 방면)</p>
                            </div>
                            <div class="info2">
                                <p class="tit">인천국제공항역 하차</p>
                            </div>
                            <div class="info3">
                                <p class="tit">인천국제공항정류장<br />방면 도보이동(약 8분)</p>
                            </div>
                            <div class="info4">
                                <p class="tit">302, 306A, 306 승차<br />(용유 초등학교 방면)</p>
                            </div>
                            <div class="info5">
                                <p class="tit">하얏트호텔 정류장 하차</p>
                            </div>
                            <div class="info6">
                                <p class="tit">파라다이스시티 방향<br />도보 이동 (약 5분)</p>
                            </div>
                            <div class="info7">
                                <p class="tit color">파라다이스시티 도착</p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>


        <style>
        ul.reserveCategory li a{opacity: 1}
        </style>
        <div class="tapView FLOOR">
            <!-- 층별안내 -->
            <div class="floorMapTab">
                <ul class="reserveCategory clearFixed">
                    <li id="map_pc" class="active"><a href="#"><span class="icon2"></span><div>paradise <br>city</div></a></li>
                    <li id="map_hpc"><a href="#"><span class="icon3"></span><div>hotel paradise<br />&amp; convention</div></a></li>
                    <li id="map_hap"><a href="#"><span class="icon4"></span><div>hotel <br />art PARADISO</div></a></li>
                    <li id="map_ca"><a href="#"><span class="icon5"></span><div>casino</div></a></li>
                    <li id="map_sc"><a href="#"><span class="icon6"></span><div>spa <br />cimer</div></a></li>
                    <li id="map_cr"><a href="#"><span class="icon7"></span><div>club <br />chroma</div></a></li>
                    <li id="map_wb"><a href="#"><span class="icon8"></span><div>THEME PARK<br />WONDERBOX</div></a></li>
                    <li id="map_pl"><a href="#"><span class="icon9"></span><div>SHOPPING <br />PLAZA</div></a></li>
                    <li id="map_as"><a href="#"><span class="icon10"></span><div>art gallery <br />art space</div></a></li>
                    <li id="map_sp"><a href="#"><span class="icon11"></span><div>studio<br />paradise</div></a></li>
                </ul>
            </div>

            <!-- paradise city -->
            <div class="floorMapView" data-id="map_pc" style="display:block;">
                <div class="map type1">
                    <img src="resources/pcPub/static/images/map/img_paradise_map01.jpg" alt="" usemap="#floorMap1" />
                    <map name="floorMap1">
                        <area target="" alt="" title="" href="#" coords="461,147,450,165,548,228,553,342,572,347,576,237,580,224,674,168,668,149,569,201,558,203" shape="poly">
                        <area target="" alt="" title="" href="#" coords="534,294,514,321,519,330,490,348,525,417,556,403,551,395,591,371,603,370,604,376,617,371,632,359,630,314,625,310,625,297,580,294,576,342,555,350,547,291" shape="poly">
                        <area target="" alt="" title="" href="#" coords="449,268,354,268,359,289,448,288,455,281" shape="poly">
                        <area target="" alt="" title="" href="#" coords="571,78,511,164,555,199,646,149,626,112,605,91,587,79" shape="poly">
                        <area target="" alt="" title="" href="#" coords="359,83,360,91,351,92,347,140,354,143,354,162,429,168,428,136,431,118,423,113,424,92,391,91" shape="poly">
                        <area target="" alt="" title="" href="#" coords="363,180,339,187,341,249,371,250,371,185" shape="poly">
                        <area target="" alt="" title="" href="#" coords="437,169,412,199,406,230,406,247,435,251,436,220,441,196,454,185,458,175" shape="poly">
                        <area target="" alt="" title="" href="#" coords="459,293,438,300,416,333,420,345,426,353,476,323" shape="poly">
                        <area target="" alt="" title="" href="#" coords="340,286,316,329,332,337,399,368,410,366,408,350,355,320,341,313,355,308,357,297" shape="poly">
                        <area target="" alt="" title="" href="#" coords="297,107,284,136,273,133,257,161,263,168,258,176,312,197,315,186,308,178,320,157,308,146,320,120" shape="poly">
                        <area target="" alt="" title="" href="#" coords="245,190,222,204,214,250,268,276,287,276,304,236,306,212" shape="poly">
                    </map>
                </div>
                <div class="mapLocation">
                    <ul>
                        <li><span>1</span>Hotel Paradise</li>
                        <li><span>2</span>Convention</li>
                        <li><span>3</span>Hotel Art Paradiso</li>
                        <li><span>4</span>Paradise Casino</li>
                        <li><span>5</span>Cimer</li>
                        <li><span>6</span>Chroma</li>
                        <li><span>7</span>Wonderbox</li>
                        <li><span>8</span>Plaza</li>
                        <li><span>9</span>Paradise Art Space</li>
                        <li><span>10</span>Studio Paradise</li>
                        <li><span>11</span>Culture Park</li>
                    </ul>
                </div>
                <div class="mapView">
                    <div class="box on" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view1.jpg" alt="" /></p>
                        <h2><span>Hotel</span>Paradise</h2>
                        <p class="text">고급스럽고 넓은 공간의 객실과 트렌디한 레스토랑, 클럽라운지를 보유한 세계 정상급 호텔에서 느낄 수 있는 예술적 품격과 여유를  느낄 수 있는 컨템포러리 라이프 스타일의 럭셔리 호텔입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_hpc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/hotel/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view2.jpg" alt="" /></p>
                        <h2><span>Ballroom</span>Convention</h2>
                        <p class="text">국제회의, 기업행사, 전시, 이벤트, 웨딩 등 다양한 행사를 개최할 수 있는 국내 특급호텔 기준 최대 규모의 컨벤션 시설입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_hpc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/convention/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" da-ta-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view3.jpg" alt="" /></p>
                        <h2><span>Hotel</span>Art Paradiso</h2>
                        <p class="text">총 58개의 스위트룸으로 구성된 유러피안 부티크 컨셉의 호텔 아트파라디소는 자유와 즐거움, 그리고 예술적 영감을 선사하는 라이프스타일 디자인 호텔입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_hap" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/artParadiso/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view4.jpg" alt="" /></p>
                        <h2><span>Casino</span>Paradise Casino</h2>
                        <p class="text">품격있는 서비스, 합리적인 게임 운영, 최첨단 시스템을 갖춘 한국 최대 외국인 전용 카지노 파라다이스시티 카지노는 색다른 즐거움을 찾는 성인들을 위한 프리미엄 놀이공간입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_ca" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/casino/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view5.jpg" alt="" /></p>
                        <h2><span>Spa</span>Cimer</h2>
                        <p class="text">유럽의 감성과 한국 고유의 여유로운 찜질방 문화를 접목한 K-STYLE 데스티네이션 스파로, 매주 펼쳐지는 풀파티와 다양한 테마의 휴식 시설을 갖춘 차원 높은 힐링 공간입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_sc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/cimer/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view6.jpg" alt="" /></p>
                        <h2><span>Club</span>Chroma</h2>
                        <p class="text">나이트라이프 데스티네이션 크로마는 글로벌 정상급 DJ들과 다양한 장르의 클러빙을 즐길 수 있는 아시아 최고의 파티  공간입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_cr" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/chroma/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view7.jpg" alt="" /></p>
                        <h2><span>Theme Park</span>Wonderbox</h2>
                        <p class="text">밤의 유원지를 컨셉으로 한 원더박스는 아이들의 순수함과 어른들의 잠재된 동심을 이끌어내는 놀이와 축제가 가득한 가족형 실내 테마파크입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_wb" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/wonderbox/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view8.jpg" alt="" /></p>
                        <h2><span>Shopping</span>Plaza</h2>
                        <p class="text">다양한 레스토랑, 카페, 편집샵, 면세점 등과영감을 주는 이벤트가 어우러진 파라다이스시티의 허브로, 트렌디한 라이프스타일을 창조하는 이벤트형 쇼핑아케이드입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_pl" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/plaza/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view9.jpg" alt="" /></p>
                        <h2><span>Art Gallery</span>Paradise Art Space</h2>
                        <p class="text">국내 유명작가부터 세계적인 스타작가까지,폭넓고 다양한 장르에 걸쳐 격이 다른 문화 체험과 컨텐츠를 제공하는 파라다이스시티만의 예술 전시공간 입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_as" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/artSpace/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view10.jpg" alt="" /></p>
                        <h2><span>Studio</span>Studio Paradise</h2>
                        <p class="text">영화, 드라마, 방송, CF 등 다채로운 컨텐츠가 제작되며 흥미로운 공연과 이벤트가 펼쳐지는 국내 최대 규모의 신개념 다목적 스튜디오입니다.</p>
                        
                        
                        <p class="link">
                            <a href="#" data-id="map_sp" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/studio/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    <div class="box" data-animation="fadeInUp">
                        <p class="img"><img src="/pcPub/static/images/map/img_paradise_view11.jpg" alt="" /></p>
                        <h2><span>Open Space</span>Culture Park</h2>
                        <p class="text">누구에게나 활짝 열려있는 편안한 쉼터이자 다채로운 이벤트와 페스티벌, 각종 엔터테인먼트 콘텐츠가 집약된 복합문화공원입니다. </p>
                    </div>
                </div>
                
                
                <div class="mapViewInfo">
                    <div class="box">
                        <h2><span>Hotel</span>Paradise</h2>
                        <p class="text">고급스럽고 넓은 공간의 객실과 트렌디한 레스토랑, 클럽라운지를 보유한 세계 정상급 호텔에서 느낄 수 있는 예술적 품격과 여유를  느낄 수 있는 컨템포러리 라이프 스타일의 럭셔리 호텔입니다.</p>
                       
                           <p class="link">
                            <a href="#" data-id="map_hpc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/hotel/overview">자세히 보기</a>
                        </p>
                       
                    </div>
                    
                    <div class="box">
                        <h2><span>Ballroom</span>Convention</h2>
                        <p class="text">국제회의, 기업행사, 전시, 이벤트, 웨딩 등 다양한 행사를 개최할 수 있는 국내 특급호텔 기준 최대 규모의 컨벤션 시설입니다.</p>
                        
                       <p class="link">
                            <a href="#" data-id="map_hpc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/convention/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Hotel</span>Art Paradiso</h2>
                        <p class="text">총 58개의 스위트룸으로 구성된 유러피안 부티크 컨셉의 호텔 아트파라디소는 자유와 즐거움, 그리고 예술적 영감을 선사하는 라이프스타일 디자인 호텔입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_hap" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/artParadiso/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Casino</span>Paradise Casino</h2>
                        <p class="text">품격있는 서비스, 합리적인 게임 운영, 최첨단 시스템을 갖춘 한국 최대 외국인 전용 카지노 파라다이스시티 카지노는 색다른 즐거움을 찾는 성인들을 위한 프리미엄 놀이공간입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_ca" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/casino/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Spa</span>Cimer</h2>
                        <p class="text">유럽의 감성과 한국 고유의 여유로운 찜질방 문화를 접목한 K-STYLE 데스티네이션 스파로, 매주 펼쳐지는 풀파티와 다양한 테마의 휴식 시설을 갖춘 차원 높은 힐링 공간입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_sc" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/cimer/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Club</span>Chroma</h2>
                        <p class="text">나이트라이프 데스티네이션 크로마는 글로벌 정상급 DJ들과 다양한 장르의 클러빙을 즐길 수 있는 아시아 최고의 파티  공간입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_cr" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/chroma/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Theme Park</span>Wonderbox</h2>
                        <p class="text">밤의 유원지를 컨셉으로 한 원더박스는 아이들의 순수함과 어른들의 잠재된 동심을 이끌어내는 놀이와 축제가 가득한 가족형 실내 테마파크입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_wb" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/wonderbox/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Shopping</span>Plaza</h2>
                        <p class="text">다양한 레스토랑, 카페, 편집샵, 면세점 등과영감을 주는 이벤트가 어우러진 파라다이스시티의 허브로, 트렌디한 라이프스타일을 창조하는 이벤트형 쇼핑아케이드입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_pl" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/plaza/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Art Gallery</span>Paradise Art Space</h2>
                        <p class="text">국내 유명작가부터 세계적인 스타작가까지,폭넓고 다양한 장르에 걸쳐 격이 다른 문화 체험과 컨텐츠를 제공하는 파라다이스시티만의 예술 전시공간 입니다.</p>
                        
                       <p class="link">
                            <a href="#" data-id="map_as" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/artSpace/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Studio</span>Studio Paradise</h2>
                        <p class="text">영화, 드라마, 방송, CF 등 다채로운 컨텐츠가 제작되며 흥미로운 공연과 이벤트가 펼쳐지는 국내 최대 규모의 신개념 다목적 스튜디오입니다.</p>
                        
                        <p class="link">
                            <a href="#" data-id="map_sp" class="evFloorInfo">층별/주차안내</a>
                            <a href="/front/studio/overview">자세히 보기</a>
                        </p>
                        
                    </div>
                    <div class="box">
                        <h2><span>Open Space</span>Culture Park</h2>
                        <p class="text">누구에게나 활짝 열려있는 편안한 쉼터이자 다채로운 이벤트와 페스티벌, 각종 엔터테인먼트 콘텐츠가 집약된 복합문화공원입니다. </p>
                    </div>
                </div>
            </div>
            <!-- //paradise city -->

            <!-- hotel paradise -->
            <div class="floorMapView" data-id="map_hpc">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">2-3F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">B1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 2~3F -->
                <div class="levelWrap">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_hotelparadise_map2F.jpg" alt="" usemap="#hotelparadise_map2F" />
                        <map name="hotelparadise_map2F">
                            <area target="" alt="" title="" href="" coords="208,268,209,331,319,331,319,284,289,277,281,262,249,265" shape="poly">
                            <area target="" alt="" title="" href="" coords="322,295,321,328,355,329,348,341,428,385,442,369,453,390,482,378,442,312,406,299,402,291" shape="poly">
                            <area target="" alt="" title="" href="" coords="490,196,473,223,510,243,521,235,526,213,508,198,500,193" shape="poly">
                            <area target="" alt="" title="" href="" coords="485,243,464,273,462,291,477,311,487,327,507,326,503,251,505,241" shape="poly">
                            <area target="" alt="" title="" href="" coords="486,145,470,176,514,199,528,175,506,155,505,134,495,130" shape="poly">
                            <area target="" alt="" title="" href="" coords="522,457,517,470,539,513,568,496,554,478,540,481,534,460,531,453" shape="poly">
                            <area target="" alt="" title="" href="" coords="545,354,479,390,514,456,529,452,546,456,560,465,586,448,581,429,589,422" shape="poly">
                            <area target="" alt="" title="" href="" coords="625,362,604,356,594,372,587,383,579,395,587,404,598,403,610,404,624,390,637,384" shape="poly">
                            <area target="" alt="" title="" href="" coords="665,258,659,272,660,294,639,304,626,328,653,377,678,389,722,290" shape="poly">
                            <area target="" alt="" title="" href="" coords="546,42,498,127,507,133,507,155,531,171,591,65" shape="poly">
                        </map>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_1.jpg" alt="" /></p>
                                <h2><span>Facilities</span>The Spa at Paradise</h2>
                                <p class="text">Esthetic Spa &amp; Anti-aging Clinic</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityTheSpaAtParadise">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_2.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Sauna</h2>
                                <p class="text">편안한 휴식을 즐길 수 있는 실내 사우나</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilitySauna">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_3.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Family Lounge</h2>
                                <p class="text">꿈꾸던 가족만의 공간, 즐거움 가득한 Family Lounge</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomFamilyLounge">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_4.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Club Lounge</h2>
                                <p class="text">파라다이스시티에서만 경험할 수 있는 격이 다른 Club Lounge</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomClubLounge">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_5.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Kids Zone</h2>
                                <p class="text">아이가 자라는 시간, Kids Zone</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityKidsZone">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_6.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Fitness</h2>
                                <p class="text">일상의 밸런스를 디자인하는 피트니스</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityFitness">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_7.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Indoor Pool</h2>
                                <p class="text">자연과 하나되는 Relaxation Indoor Pool</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityIndoorPool">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_8.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Outdoor Pool</h2>
                                <p class="text">하늘과 마주한 로맨틱한 Outdoor Pool</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityOutdoorPool">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_9.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Pool Villa</h2>
                                <p class="text">프라이빗하게 즐길 수 있어 자유롭고 힐링 가득한 고급 풀빌라</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomDeluxePoolVilla">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view2F_10.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Safari Park</h2>
                                <p class="text">재미와 짜릿함이 공존하는 엔터테인먼트 공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilitySafariPark">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Facilities</span>The Spa at Paradise</h2>
                                <p class="text">Esthetic Spa &amp; Anti-aging Clinic</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityTheSpaAtParadise">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Sauna</h2>
                                <p class="text">편안한 휴식을 즐길 수 있는 실내 사우나</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilitySauna">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Family Lounge</h2>
                                <p class="text">꿈꾸던 가족만의 공간, 즐거움 가득한 Family Lounge</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomFamilyLounge">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Club Lounge</h2>
                                <p class="text">파라다이스시티에서만 경험할 수 있는 격이 다른 Club Lounge</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomClubLounge">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Kids Zone</h2>
                                <p class="text">아이가 자라는 시간, Kids Zone</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityKidsZone">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Fitness</h2>
                                <p class="text">일상의 밸런스를 디자인하는 피트니스</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityFitness">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Indoor Pool</h2>
                                <p class="text">자연과 하나되는 Relaxation Indoor Pool</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityIndoorPool">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Outdoor Pool</h2>
                                <p class="text">하늘과 마주한 로맨틱한 Outdoor Pool</p>
                                
                              <p class="link">
                                  <a href="/front/hotel/facility/view?FACILITY_NM=FacilityOutdoorPool">자세히 보기</a>
                              </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Pool Villa</h2>
                                <p class="text">프라이빗하게 즐길 수 있어 자유롭고 힐링 가득한 고급 풀빌라</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/room/view?ROOM_NM=RoomDeluxePoolVilla">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Safari Park</h2>
                                <p class="text">재미와 짜릿함이 공존하는 엔터테인먼트 공간</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilitySafariPark">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //2~3F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_hotelparadise_map1F_1.jpg" alt="" usemap="#hotelparadise_map1F_1" />
                        <map name="hotelparadise_map1F_1">
                            <area target="" alt="" title="" href="" coords="280,338,280,390,362,389,363,339,319,318" shape="poly">
                            <area target="" alt="" title="" href="" coords="295,214,318,251,335,241,320,188,306,185" shape="poly">
                            <area target="" alt="" title="" href="" coords="245,149,236,159,219,187,240,219,276,193,264,163,257,149" shape="poly">
                            <area target="" alt="" title="" href="" coords="193,171,184,189,187,207,193,213,207,203,206,180" shape="poly">
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_hotelparadise_map1F_2.jpg" alt="" usemap="#hotelparadise_map1F_2" style="display:none;" />
                        <map name="hotelparadise_map1F_2">
                            <area target="" alt="" title="" href="" coords="526,138,524,153,532,168,601,162,595,187,609,189,618,168,629,163,646,170,649,159,628,147,631,137,620,112,611,110,606,126,595,130,566,130,544,132" shape="poly">
                            <area target="" alt="" title="" href="" coords="530,99,531,106,503,117,512,135,531,127,531,134,557,128,574,129,594,127,603,122,609,108,625,112,631,126,634,134,644,114,637,106,610,100,586,99,588,81,576,74,564,89,562,100,552,94" shape="poly">
                            <area target="" alt="" title="" href="" coords="506,163,512,181,472,222,473,237,492,245,491,259,465,252,462,269,462,278,432,279,430,263,433,245,439,231,443,216,452,202,462,187,474,173,486,164" shape="poly">
                            <area target="" alt="" title="" href="" coords="482,129,493,144,478,157,483,164,468,179,457,191,447,206,441,224,433,243,428,259,404,264,406,242,410,226,419,208,426,193,433,180,438,169,436,162,435,153,436,146,445,140,454,145,461,147" shape="poly">
                            <area target="" alt="" title="" href="" coords="408,166,407,179,426,190,414,213,406,239,402,261,379,265,361,263,360,244,354,228,361,221,344,195,336,177,358,162" shape="poly">
                            <area target="" alt="" title="" href="" coords="584,318,573,328,580,340,575,347,565,348,554,365,571,378,591,389,609,373,616,363,596,339,590,322" shape="poly">
                            <area target="" alt="" title="" href="" coords="553,207,572,244,596,204,575,198,582,183,574,175,563,183,568,198" shape="poly">
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_hotelparadise_map1F_3.jpg" alt="" usemap="#hotelparadise_map1F_3" style="display:none;" />
                        <map name="hotelparadise_map1F_3">
                            <area target="" alt="" title="" href="" coords="521,259,513,271,509,293,532,293,539,288,530,269" shape="poly">
                            <area target="" alt="" title="" href="" coords="545,219,538,230,541,253,536,268,548,273,562,270,564,255,562,238,557,229" shape="poly">
                        </map>
                        
                        <ul>
                            <li class="on"><a href="#">Convention</a></li>
                            <li><a href="#">Dine &amp; Drink</a></li>
                            <li><a href="#">부대시설</a></li>
                        </ul>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_1.jpg" alt="" /></p>
                                <h2><span>CONVENTION</span>Grand Ballroom</h2>
                                <p class="text">대규모 수용시설을 가진 그랜드볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_2.jpg" alt="" /></p>
                                <h2><span>CONVENTION</span>Emerald Ballroom</h2>
                                <p class="text">세련된 기품이 돋보이는 에메랄드볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=emerald">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_3.jpg" alt="" /></p>
                                <h2><span>CONVENTION</span>Sapphire Ballroom</h2>
                                <p class="text">모던한 감각을 자랑하는 사파이어볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=sapphire">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_4.jpg" alt="" /></p>
                                <h2><span>CONVENTION</span>Meeting Rooms</h2>
                                <p class="text">파라다이스시티 컨벤션 시설은 비즈니스를 위한 5개의 미팅룸을 보유하고 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=meetingroom">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>CONVENTION</span>Grand Ballroom</h2>
                                <p class="text">대규모 수용시설을 가진 그랜드볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>CONVENTION</span>Emerald Ballroom</h2>
                                <p class="text">세련된 기품이 돋보이는 에메랄드볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=emerald">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>CONVENTION</span>Sapphire Ballroom</h2>
                                <p class="text">모던한 감각을 자랑하는 사파이어볼룸</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=sapphire">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>CONVENTION</span>Meeting Rooms</h2>
                                <p class="text">파라다이스시티 컨벤션 시설은 비즈니스를 위한 5개의 미팅룸을 보유하고 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/convention/facility?FACILITY=meetingroom">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_5.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>On The Plate</h2>
                                <p class="text">유럽, 뉴욕, 상해의 최신 Trend를 반영, 다섯가지 Station으로 구성된 Premium Buffet Restaurant</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningOnThePlate">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_6.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>La Scala</h2>
                                <p class="text">밀라노의 감성으로 이탈리아 본연의 맛을 추구하는 Italian Gourmet Restaurant</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningLaScala">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_7.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Raku</h2>
                                <p class="text">다양한 장르의 일식을 창의적으로 재해석한 메뉴를 합리적인 가격에 즐길 수 있는 트렌디한 일식의 진수</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningRaku">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_8.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Imperial Treasure</h2>
                                <p class="text">한국 최초로 선보이는 정통 광동식 Fine Dining Cuisine</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningImperialTreasure">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_9.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Rubik</h2>
                                <p class="text">색다른 공연을 만나는 라이브 뮤직 라운지</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningRubik">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_10.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Lounge Paradise</h2>
                                <p class="text">음악이 흐르는 로비라운지</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningLoungeParadise">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_11.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Garden Cafe</h2>
                                <p class="text">유럽의 정취를 지닌 카페</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningGardenCafe">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>On The Plate</h2>
                                <p class="text">유럽, 뉴욕, 상해의 최신 Trend를 반영, 다섯가지 Station으로 구성된 Premium Buffet Restaurant</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningOnThePlate">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>La Scala</h2>
                                <p class="text">밀라노의 감성으로 이탈리아 본연의 맛을 추구하는 Italian Gourmet Restaurant</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningLaScala">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Raku</h2>
                                <p class="text">다양한 장르의 일식을 창의적으로 재해석한 메뉴를 합리적인 가격에 즐길 수 있는 트렌디한 일식의 진수</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningRaku">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Imperial Treasure</h2>
                                <p class="text">한국 최초로 선보이는 정통 광동식 Fine Dining Cuisine</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningImperialTreasure">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Rubik</h2>
                                <p class="text">색다른 공연을 만나는 라이브 뮤직 라운지</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningRubik">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Lounge Paradise</h2>
                                <p class="text">음악이 흐르는 로비라운지</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningLoungeParadise">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Garden Cafe</h2>
                                <p class="text">유럽의 정취를 지닌 카페</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/dining/view?DINING_NM=DiningGardenCafe">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_12.jpg" alt="" /></p>
                                <h2><span>FACILITY</span>Paradise Boutique</h2>
                                <p class="text">호텔 파라다이스의 시그니처 아이템을 만나는 공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityParadiseBoutique">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_hotelparadise_view1F_13.jpg" alt="" /></p>
                                <h2><span>FACILITY</span>Flower Shop</h2>
                                <p class="text">향과 색이 어우러지는 아름다운 공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityFlowerShop">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>FACILITY</span>Paradise Boutique</h2>
                                <p class="text">호텔 파라다이스의 시그니처 아이템을 만나는 공간</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityParadiseBoutique">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>FACILITY</span>Flower Shop</h2>
                                <p class="text">향과 색이 어우러지는 아름다운 공간</p>
                                
                                <p class="link">
                                    <a href="/front/hotel/facility/view?FACILITY_NM=FacilityFlowerShop">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- //1F -->
                
                <!-- B1F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_hotelparadise_mapB1F.jpg" alt="" /></div>
                </div>
                <!-- //B1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_hotelparadise_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>1구역</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //hotel paradise -->
            
            <!-- art paradiso -->
            <div class="floorMapView" data-id="map_hap">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">4F</a></li>
                        <li class="on"><a href="#">3F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 4F -->
                <div class="levelWrap">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_artparadiso_map4F.jpg" alt="" usemap="#artparadiso_map4F" />
                        <map name="artparadiso_map4F">
                            <area target="" alt="" title="" href="" coords="554,427,552,471,597,470,597,427" shape="poly">
                            <area target="" alt="" title="" href="" coords="455,357,445,363,452,381,436,381,428,382,426,416,481,414,481,382,461,379,469,371,464,360" shape="poly">
                            <area target="" alt="" title="" href="" coords="443,428,443,471,482,472,485,446,473,446,473,427" shape="poly">
                        </map>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_artparadiso_view4F_1.jpg" alt="" /></p>
                                <h2><span>Facilities</span> Panache</h2>
                                <p class="text">오직 VIP만을 위한 비밀스럽고 프라이빗한 사교공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityLeBalRoom">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_artparadiso_view4F_2.jpg" alt="" /></p>
                                <h2><span>Facilities</span> Private Spa</h2>
                                <p class="text">몸과 마음이 힐링되는 진정한 휴식 공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityPrivateSpa">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_artparadiso_view4F_3.jpg" alt="" /></p>
                                <h2><span>Facilities</span> GYM</h2>
                                <p class="text">집에서 즐기는 것과 같은 편안한 운동 시설</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityGym">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Facilities</span> Panache</h2>
                                <p class="text">오직 VIP만을 위한 비밀스럽고 프라이빗한 사교공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityLeBalRoom">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span> Private Spa</h2>
                                <p class="text">몸과 마음이 힐링되는 진정한 휴식 공간</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityPrivateSpa">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span> GYM</h2>
                                <p class="text">집에서 즐기는 것과 같은 편안한 운동 시설</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/facility/view?FACILITY_NM=FacilityGym">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //4F -->
                
                <!-- 3F -->
                <div class="levelWrap on">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_artparadiso_map3F.jpg" alt="" usemap="#artparadiso_map3F" />
                        <map name="artparadiso_map3F">
                            <area target="" alt="" title="" href="" coords="587,356,588,378,537,381,538,418,660,415,659,384,608,379,609,358" shape="poly">
                            <area target="" alt="" title="" href="" coords="519,357,501,356,501,378,483,383,483,414,500,418,503,424,536,420,536,383,520,380" shape="poly">
                        </map>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_artparadiso_view3F_1.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span> SERASÉ</h2>
                                <p class="text">기존 한식의 경계를 넘어 모던 한식 다이닝의 새로운 트렌드를 제시하는 레스토랑 새라새</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/dining/view?DINING_NM=DiningSerase">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_artparadiso_view3F_2.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span> LOUNGE BAR SERASÉ</h2>
                                <p class="text">유럽의 식음료와 한국적인 재료의 색다른 퓨전, 라운지&amp;바 새라새</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/dining/view?DINING_NM=DiningBarSerase">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span> SERASÉ</h2>
                                <p class="text">기존 한식의 경계를 넘어 모던 한식 다이닝의 새로운 트렌드를 제시하는 레스토랑 새라새</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/dining/view?DINING_NM=DiningSerase">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span> LOUNGE BAR SERASÉ</h2>
                                <p class="text">유럽의 식음료와 한국적인 재료의 색다른 퓨전, 라운지&amp;바 새라새</p>
                                
                                
                                <p class="link">
                                    <a href="/front/artParadiso/dining/view?DINING_NM=DiningBarSerase">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //3F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_artparadiso_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />아트파라디소 로비</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F A~K</li>
                                    <li>2구역 B2F M~U</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스시티 아트파라디소 로비</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //art paradiso -->
            
            <!-- casino -->
            <div class="floorMapView" data-id="map_ca">
                <div class="floorInfo">
                    <ul>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_casino_map1F_1.jpg" alt="" />
                        <img src="/pcPub/static/images/map/ko/img_casino_map1F_2.jpg" alt="" style="display:none;" usemap="#casino_map1F_2" />
                        <map name="casino_map1F_2">
                            <area target="" alt="" title="" href="" coords="529,77,497,106,514,133,538,137,561,134,569,132,552,105" shape="poly">
                            <area target="" alt="" title="" href="" coords="594,143,563,170,563,201,581,213,602,218,621,207,627,186,625,166" shape="poly">
                            <area target="" alt="" title="" href="" coords="677,140,666,151,673,161,642,174,648,191,665,218,684,216,691,200,717,183,696,152,687,139" shape="poly">
                        </map>
                        <img src="/pcPub/static/images/map/ko/img_casino_map1F_3.jpg" alt="" style="display:none;" usemap="#casino_map1F_3" />
                        <map name="casino_map1F_3">
                            <area target="" alt="" title="" href="" coords="684,228,666,200,657,202,646,223,647,263,684,262,684,228,722,235,753,235,754,381,721,401,722,235" shape="poly">
                            <area target="" alt="" title="" href="" coords="752,383,723,401,701,410,707,430,737,430,743,423,761,423,763,397,768,389" shape="poly">
                        </map>
                        <img src="/pcPub/static/images/map/ko/img_casino_map1F_4.jpg" alt="" style="display:none;" />
                        <ul>
                            <li class="on"><a href="#">편의시설</a></li>
                            <li><a href="#">Dine &amp; Drink</a></li>
                            <li><a href="#">VIP Zone</a></li>
                            <li><a href="#">Gaming Zone</a></li>
                        </ul>
                    </div>
                    
                    <div class="detailFloor on"></div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_casino_view1F_1.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Bar 21</h2>
                                <p class="text">카지노를 한층 더 다이내믹하게 즐길 수 있는 카지노 엔터테인먼트 바</p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_casino_view1F_2.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Cafe 9</h2>
                                <p class="text">게임 속 오아시스, 미식의 즐거움을 경험하는 곳</p>
                                
                                <!--
                                <p class="link">
                                    <a href="#">자세히 보기</a>
                                </p>
                                -->
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_casino_view1F_3.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>The Emperor</h2>
                                <p class="text">최고의 고객에게 최고의 메뉴만을 선보이는 VIP 전용 카지노 레스토랑 THE EMPEROR</p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Bar 21</h2>
                                <p class="text">카지노를 한층 더 다이내믹하게 즐길 수 있는 카지노 엔터테인먼트 바</p>
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Cafe 9</h2>
                                <p class="text">게임 속 오아시스, 미식의 즐거움을 경험하는 곳</p>
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>The Emperor</h2>
                                <p class="text">최고의 고객에게 최고의 메뉴만을 선보이는 VIP 전용 카지노 레스토랑 THE EMPEROR</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_casino_view1F_4.jpg" alt="" /></p>
                                <h2><span>VIP</span>VIP ROOMS</h2>
                                <p class="text">파라다이스시티 카지노의 최상급 서비스를 누릴 수 있는 VIP 전용 게임 공간</p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_casino_view1F_5.jpg" alt="" /></p>
                                <h2><span>VIP</span>Sky Casino</h2>
                                <p class="text">서해의 멋진 노을, 아름다운 예술품이 게이밍과 함께하는 어디에서도 경험할 수 없는 유니크한 VIP 전용 공간</p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>VIP</span>VIP ROOMS</h2>
                                <p class="text">파라다이스시티 카지노의 최상급 서비스를 누릴 수 있는 VIP 전용 게임 공간</p>
                            </div>
                            <div class="box">
                                <h2><span>VIP</span>Sky Casino</h2>
                                <p class="text">서해의 멋진 노을, 아름다운 예술품이 게이밍과 함께하는 어디에서도 경험할 수 없는 유니크한 VIP 전용 공간</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor"></div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_casino_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>1구역</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //casino -->
            
            <!-- spa cimer -->
            <div class="floorMapView" data-id="map_sc">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">4F</a></li>
                        <li><a href="#">3F</a></li>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 4F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_cimer_map4F.jpg" alt="" /></div>
                </div>
                <!-- //4F -->
                
                <!-- 3F -->
                <div class="levelWrap">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_cimer_map3F_1.jpg" alt="" />
                        
                        <img src="/pcPub/static/images/map/ko/img_cimer_map3F_2.jpg" alt="" style="display:none;" usemap="#cimer_map3F_2" />
                        <map name="cimer_map3F_2">
                            <area target="" alt="" title="" href="" coords="403,69,385,69,383,57,368,56,362,66,350,69,349,96,402,98,403,69,510,94,508,113,493,116,494,129,510,135,532,135,576,145,612,143,610,97,558,96,554,80,541,86,510,94" shape="poly">
                            <area target="" alt="" title="" href="" coords="318,147,377,185" shape="rect">
                            <area target="" alt="" title="" href="" coords="377,147,408,213" shape="rect">
                        </map>
                        
                        <ul>
                            <li class="on"><a href="#">Dine &amp; Drink</a></li>
                            <li><a href="#">Aqua Spa Zone</a></li>
                        </ul>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view3F_1.jpg" alt="" /></p>
                                <h2><span>Dine &amp; Drink</span>Infinity Bar 8</h2>
                                <p class="text">인피니티바8만의 특별한 분위기에서 은은한 뮤직과 함께 한잔의 여유를 즐겨보시기 바랍니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Dine &amp; Drink</span>Infinity Bar 8</h2>
                                <p class="text">인피니티바8만의 특별한 분위기에서 은은한 뮤직과 함께 한잔의 여유를 즐겨보시기 바랍니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view3F_2.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Infinity Pool</h2>
                                <p class="text">탁 트인 전망에서 아름다운 노을과 파라다이스시티의 전경을 감상할 수 있는 로맨틱한 포토존입니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view3F_3.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Foot Spa</h2>
                                <p class="text">족욕으로 피로를 풀 수 있는 편안한 공간으로 피부미용, 불면증 완화, 독소 및 노폐물 배출 등의 효과를 볼 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view3F_4.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Elvan Stone Bulgama</h2>
                                <p class="text">녹주산 맥반석을 이용한 곳으로 몸 속에 쌓여있는 독소의 배출을 촉진시켜 스트레스 해소 및 체질 개선에 도움이 되는 공간입니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Infinity Pool</h2>
                                <p class="text">탁 트인 전망에서 아름다운 노을과 파라다이스시티의 전경을 감상할 수 있는 로맨틱한 포토존입니다.</p>
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Foot Spa</h2>
                                <p class="text">족욕으로 피로를 풀 수 있는 편안한 공간으로 피부미용, 불면증 완화, 독소 및 노폐물 배출 등의 효과를 볼 수 있습니다.</p>
                                
                               <p class="link">
                                       <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                               </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Elvan Stone Bulgama</h2>
                                <p class="text">녹주산 맥반석을 이용한 곳으로 몸 속에 쌓여있는 독소의 배출을 촉진시켜 스트레스 해소 및 체질 개선에 도움이 되는 공간입니다.</p>
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- //3F -->
                
                <!-- 2F -->
                <div class="levelWrap">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_cimer_map2F_1.jpg" alt="" usemap="#cimer_map2F_1" />
                        <map name="cimer_map2F_1">
                            <area target="" alt="" title="" href="" coords="418,221,438,260" shape="rect">
                            <area target="" alt="" title="" href="" coords="374,55,414,97" shape="rect">
                            <area target="" alt="" title="" href="" coords="287,327,411,400" shape="rect">
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_cimer_map2F_2.jpg" alt="" style="display:none;" />
                        <img src="/pcPub/static/images/map/ko/img_cimer_map2F_3.jpg" alt="" style="display:none;" />
                        <img src="/pcPub/static/images/map/ko/img_cimer_map2F_4.jpg" alt="" style="display:none;" usemap="#cimer_map2F_4" />
                        <map name="cimer_map2F_4">
                            <area target="" alt="" title="" href="" coords="455,116,507,151" shape="rect">
                            <area target="" alt="" title="" href="" coords="587,84,568,97,570,132,575,123,586,119,602,121,609,133,610,97" shape="poly">
                            <area target="" alt="" title="" href="" coords="337,98,377,144" shape="rect">
                            <area target="" alt="" title="" href="" coords="344,145,377,183" shape="rect">
                            <area target="" alt="" title="" href="" coords="316,135,343,187" shape="rect">
                            <area target="" alt="" title="" href="" coords="321,47,346,107" shape="rect">
                            <area target="" alt="" title="" href="" coords="576,125,572,135,581,140,581,158,610,156,610,139,601,127,594,123,585,123" shape="poly">
                            <area target="" alt="" title="" href="" coords="419,376,455,441" shape="rect">
                            <area target="" alt="" title="" href="" coords="486,377,535,441" shape="rect">
                        </map>
                        <img src="/pcPub/static/images/map/ko/img_cimer_map2F_5.jpg" alt="" style="display:none;" usemap="#cimer_map2F_5" />
                        <map name="cimer_map2F_5">
                            <area target="" alt="" title="" href="" coords="376,246,412,327" shape="rect">
                            <area target="" alt="" title="" href="" coords="454,378,484,443" shape="rect">
                        </map>
                        
                        <ul>
                            <li class="on"><a href="#">Dine &amp; Drink</a></li>
                            <li><a href="#">Aqua Spa Zone</a></li>
                            <li><a href="#">Sauna</a></li>
                            <li><a href="#">JJIMJIL Spa Zone</a></li>
                            <li><a href="#">부대시설</a></li>
                        </ul>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_1.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Juice Bar 2X</h2>
                                <p class="text">직접 착즙하여 제공되는 신선한 과일주스와 건강한 드링크를 즐기실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_2.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Snack Bar 24</h2>
                                <p class="text">한국 고유의 찜질방 스낵을 24시간 즐기실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_3.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>The Restaurant</h2>
                                <p class="text">재료 본연의 맛을 살린 건강한 모던 인터네셔널 퀴진 메뉴를 드실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Juice Bar 2X</h2>
                                <p class="text">직접 착즙하여 제공되는 신선한 과일주스와 건강한 드링크를 즐기실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Snack Bar 24</h2>
                                <p class="text">한국 고유의 찜질방 스낵을 24시간 즐기실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>The Restaurant</h2>
                                <p class="text">재료 본연의 맛을 살린 건강한 모던 인터네셔널 퀴진 메뉴를 드실 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_4.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Infinity Pool</h2>
                                <p class="text">씨메르의 전경을 파노라마로 즐기며 여유를 즐길 수 있는 곳으로 사계절 내내 쾌적하고 여유로운 시간을 만끽할 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Infinity Pool</h2>
                                <p class="text">씨메르의 전경을 파노라마로 즐기며 여유를 즐길 수 있는 곳으로 사계절 내내 쾌적하고 여유로운 시간을 만끽할 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_5.jpg" alt="" /></p>
                                <h2><span>Sauna</span>Sauna</h2>
                                <p class="text">고급스러운 인테리어로 디자인된 사우나는 샤워부스와 다양한 이벤트 탕, 바데시설 등이 마련되어 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=sauna">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Sauna</span>Sauna</h2>
                                <p class="text">고급스러운 인테리어로 디자인된 사우나는 샤워부스와 다양한 이벤트 탕, 바데시설 등이 마련되어 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=sauna">자세히 보기</a>
                                </p>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_6.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Retinispora Room</h2>
                                <p class="text">품질 좋은 편백나무의 고장인 후쿠오카현의 편백나무를 사용한 공간으로, 자연에서의 피톤치드를 느끼며 휴식을 취할 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_7.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Wave Dream</h2>
                                <p class="text">물결이 천정에 반사되어 심해에 머무는 듯한 느낌을 주는 곳으로 명상을 통해 일상의 긴장감을 제거하고 마음의 여유를 회복할 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_8.jpg" alt="" /></p>
                                <h2></h2>
                                <p class="text">북한산 자수정으로 이루어진 공간으로, 질병 예방 뿐만 아니라 전통 핀란드 사우나 방식을 현대화한 로오류 서비스로 피부 생기를 회복할 수 있습니다.</p>
                                
                                
                                <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                               
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_9.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Charcoal Room</h2>
                                <p class="text">강원도 횡성의 굴창나무를 이용한 공간으로 참숯이 산성화된 체질을 회복을 도와 불균형한 신체의 리듬을 되찾을 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_10.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Dry Sauna</h2>
                                <p class="text">녹주산 맥반석을 이용한 곳으로, 몸 속에 쌓여있는 독소 배출을 촉진시켜 스트레스 해소 및 체질 개선에 도움이 되는 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_11.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Ice Room</h2>
                                <p class="text">고온의 찜질 공간에서 오른 몸의 열기를 달래주는 곳으로, 신체 온도의 균형과 몸의 노폐물을 배출하여 피로감을 회복할 수 있는 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_12.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Salt Room</h2>
                                <p class="text">세계적인 청정 소금으로 이루어진 곳으로, 피부 노폐물 제거를 도와 피부 회복 및 노화 방지에 탁월한 효과를 얻을 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_13.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Fitness Room</h2>
                                <p class="text">힐링을 위한 요가부터 서핑, 아쿠아 플로트(Aqua Float)처럼 트렌디한 프로들까지 재미와 건강 모두를 챙기는 일석이조의 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_14.jpg" alt="" /></p>
                                <h2><span>JJIMJIL Spa Zone</span>Community Room</h2>
                                <p class="text">편안하게 휴식을 취할 수 있는 공간입니다. 벽 한 켠에 위치한 모노 라이브러리의 잡지들을 읽으며 한층 깊이 있는 대화를 나눌 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Retinispora Room</h2>
                                <p class="text">품질 좋은 편백나무의 고장인 후쿠오카현의 편백나무를 사용한 공간으로, 자연에서의 피톤치드를 느끼며 휴식을 취할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Wave Dream</h2>
                                <p class="text">물결이 천정에 반사되어 심해에 머무는 듯한 느낌을 주는 곳으로 명상을 통해 일상의 긴장감을 제거하고 마음의 여유를 회복할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Crystal room</h2>
                                <p class="text">북한산 자수정으로 이루어진 공간으로, 질병 예방 뿐만 아니라 전통 핀란드 사우나 방식을 현대화한 로오류 서비스로 피부 생기를 회복할 수 있습니다.</p>


                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Charcoal Room</h2>
                                <p class="text">강원도 횡성의 굴창나무를 이용한 공간으로 참숯이 산성화된 체질을 회복을 도와 불균형한 신체의 리듬을 되찾을 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Dry Sauna</h2>
                                <p class="text">녹주산 맥반석을 이용한 곳으로, 몸 속에 쌓여있는 독소 배출을 촉진시켜 스트레스 해소 및 체질 개선에 도움이 되는 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Ice Room</h2>
                                <p class="text">고온의 찜질 공간에서 오른 몸의 열기를 달래주는 곳으로, 신체 온도의 균형과 몸의 노폐물을 배출하여 피로감을 회복할 수 있는 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Salt Room</h2>
                                <p class="text">세계적인 청정 소금으로 이루어진 곳으로, 피부 노폐물 제거를 도와 피부 회복 및 노화 방지에 탁월한 효과를 얻을 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Fitness Room</h2>
                                <p class="text">힐링을 위한 요가부터 서핑, 아쿠아 플로트(Aqua Float)처럼 트렌디한 프로들까지 재미와 건강 모두를 챙기는 일석이조의 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>JJIMJIL Spa Zone</span>Community Room</h2>
                                <p class="text">편안하게 휴식을 취할 수 있는 공간입니다. 벽 한 켠에 위치한 모노 라이브러리의 잡지들을 읽으며 한층 깊이 있는 대화를 나눌 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=jjimjil">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_15.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Skin &amp; Body</h2>
                                <p class="text">전문 테라피스트들의 섬세한 손길로 몸의 피로를 해소하고 피부 생기를 회복할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=facility">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view2F_16.jpg" alt="" /></p>
                                <h2><span>Facilities</span>Nail Bar</h2>
                                <p class="text">네일, 헤나 등 기분 전환을 위한 서비스를 통해 휴식을 더 빛나게 해드립니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=facility">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Facilities</span>Skin &amp; Body</h2>
                                <p class="text">전문 테라피스트들의 섬세한 손길로 몸의 피로를 해소하고 피부 생기를 회복할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=facility">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Facilities</span>Nail Bar</h2>
                                <p class="text">네일, 헤나 등 기분 전환을 위한 서비스를 통해 휴식을 더 빛나게 해드립니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=facility">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- //2F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_cimer_map1F_1.jpg" alt="" usemap="#cimer_map1F_1" />
                        <map name="cimer_map1F_1">
                            <area target="" alt="" title="" href="" coords="377,247,411,307" shape="rect">
                            <area target="" alt="" title="" href="" coords="288,343,413,443" shape="rect">
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_cimer_map1F_2.jpg" alt="" style="display:none;" usemap="#cimer_map1F_2" />
                        <map name="cimer_map1F_2">
                            <area target="" alt="" title="" href="" coords="549,78,612,148" shape="rect">
                            <area target="" alt="" title="" href="" coords="427,83,534,156" shape="rect">
                            <area target="" alt="" title="" href="" coords="427,172,533,354" shape="rect">
                            <area target="" alt="" title="" href="" coords="412,147,335,58" shape="rect">
                            <area target="" alt="" title="" href="" coords="267,183,377,342" shape="rect">
                        </map>
                        <img src="/pcPub/static/images/map/ko/img_cimer_map1F_3.jpg" alt="" style="display:none;" />
                        
                        <ul>
                            <li class="on"><a href="#">Dine &amp; Drink</a></li>
                            <li><a href="#">Aqua Spa Zone</a></li>
                            <li><a href="#">Sauna</a></li>
                        </ul>
                    </div>
                    
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_1.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Sports Bar X</h2>
                                <p class="text">라스베가스의 스포츠바처럼 에너지 넘치는 분위기에서 스포츠 경기를 관람할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_2.jpg" alt="" /></p>
                                <h2><span>DINE&amp;DRINK</span>Food Plaza</h2>
                                <p class="text">다양한 메뉴를 한공간에서 만날 수 있어 든든한 한끼를 위한 최적의 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Sports Bar X</h2>
                                <p class="text">라스베가스의 스포츠바처럼 에너지 넘치는 분위기에서 스포츠 경기를 관람할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>DINE&amp;DRINK</span>Food Plaza</h2>
                                <p class="text">다양한 메뉴를 한공간에서 만날 수 있어 든든한 한끼를 위한 최적의 공간입니다.</p>
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=dine">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_3.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Virtual Spa</h2>
                                <p class="text">세 벽면을 가득채운 LED의 이미지로 만들어진 몽환적인 공간으로 마치 꿈 속에 있는 듯 편안한 휴식을 취할 수 있는 성인 전용 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_4.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Aqua Club</h2>
                                <p class="text">LED 미디어와 트렌디한 음악이 어우러진 공간으로, 매주 풀파티가 진행되는 씨메르의 시그니처 플레이스입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_5.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Water Plaza</h2>
                                <p class="text">이탈리아 산마르코 광장을 모티브로 디자인한 공간으로 사계절 내내 이국적인 분위기 속에서 편안한 휴식을 즐길 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_6.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Cave Spa</h2>
                                <p class="text">높은 천장과 어두운 조명이 어우러져 동굴에 있는듯한 느낌을 주는 공간으로 외부의 소음으로부터 벗어나 나의 감각에 집중할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_7.jpg" alt="" /></p>
                                <h2><span>Aqua Spa Zone</span>Outdoor Pool</h2>
                                <p class="text">자연을 한층 가까이 느끼며 수영을 즐길 수 있는 곳으로 씨메르만의 싱그러운 낮과 로멘틱한 밤을 느낄 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Virtual Spa</h2>
                                <p class="text">세 벽면을 가득채운 LED의 이미지로 만들어진 몽환적인 공간으로 마치 꿈 속에 있는 듯 편안한 휴식을 취할 수 있는 성인 전용 공간입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Aqua Club</h2>
                                <p class="text">LED 미디어와 트렌디한 음악이 어우러진 공간으로, 매주 풀파티가 진행되는 씨메르의 시그니처 플레이스입니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Water Plaza</h2>
                                <p class="text">이탈리아 산마르코 광장을 모티브로 디자인한 공간으로 사계절 내내 이국적인 분위기 속에서 편안한 휴식을 즐길 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Cave Spa</h2>
                                <p class="text">높은 천장과 어두운 조명이 어우러져 동굴에 있는듯한 느낌을 주는 공간으로 외부의 소음으로부터 벗어나 나의 감각에 집중할 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                            <div class="box">
                                <h2><span>Aqua Spa Zone</span>Outdoor Pool</h2>
                                <p class="text">자연을 한층 가까이 느끼며 수영을 즐길 수 있는 곳으로 씨메르만의 싱그러운 낮과 로멘틱한 밤을 느낄 수 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=aqua">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="detailFloor">
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/img_cimer_view1F_8.jpg" alt="" /></p>
                                <h2><span>Sauna</span>Sauna</h2>
                                <p class="text">

                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=sauna">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2><span>Sauna</span>Sauna</h2>
                                <p class="text">고급스러운 인테리어로 디자인된 사우나는 샤워부스와 다양한 이벤트 탕, 바데시설 등이 마련되어 있습니다.</p>
                                
                                
                               <p class="link">
                                    <a href="/front/cimer/facility?FACILITY=sauna">자세히 보기</a>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_cimer_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1 A~K, B2 A~L</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스시티 씨메르 크로마 고객주차장</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //spa cimer -->
            
            <!-- chroma -->
            <div class="floorMapView" data-id="map_cr">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">4F</a></li>
                        <li><a href="#">3F</a></li>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 4F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_chroma_4F.jpg" alt="" /></div>
                </div>
                <!-- //4F -->
                
                <!-- 3F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_chroma_3F.jpg" alt="" /></div>
                </div>
                <!-- //3F -->
                
                <!-- 2F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_chroma_2F.jpg" alt="" /></div>
                </div>
                <!-- //2F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_chroma_1F.jpg" alt="" /></div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_chroma_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />아트파라디소 로비</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F A~L</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스시티 아트파라디소 로비</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //chroma -->

            
            







            <!-- WONERBOX -->
            <style>
            .textHashIm{color:#999 !important; font-size:12px !important;}
            .mt20      {margin-top:20px;}
            ul.dotList > li.dotDesc{margin:0 !important; font-size:12px !important;padding-left:6px;}
            </style>
            <!-- Wonder box Floor Map view -->
            <div class="floorMapView" data-id="map_wb">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 2F : Attraction, Fnb -->
                <div class="levelWrap">
                    
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_wonderbox_2F_Attraction.png" alt="" usemap="#wonderbox_2F_Attraction"/>
                        <map name="wonderbox_2F_Attraction">
                            <area shape="rect" alt="" title="" coords="287,246,310,283" href="" target="" />
                            <area shape="rect" alt="" title="" coords="332,306,352,336" href="" target="" />
                            <area shape="rect" alt="" title="" coords="390,368,410,397" href="" target="" />
                            <area shape="rect" alt="" title="" coords="477,382,497,413" href="" target="" />
                            <area shape="rect" alt="" title="" coords="582,358,602,388" href="" target="" />
                        </map>
                        <img src="/pcPub/static/images/map/ko/img_wonderbox_2F_Fnb.png" alt="" usemap="#wonderbox_2F_Fnb" style="display:none;" />
                        <map name="wonderbox_2F_Fnb">
                            <area shape="rect" alt="" title="" coords="386,297,406,328" href="" target="" />
                            <area shape="rect" alt="" title="" coords="409,307,430,340" href="" target="" />
                            <area shape="rect" alt="" title="" coords="445,435,468,465" href="" target="" />
                        </map>

                        
                        <ul>
                            <li class="on"><a href="#">어트랙션</a></li>
                            <li><a href="#">F&B / 기프트샵</a></li>
                        </ul>

                    </div>

                    
                    <div class="detailFloor on">
                        
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_hs.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    해피스윙
                                </h2>
                                <p class="text">대형 그네에서 즐기는 하늘로의 짜릿한 비행</p>
                                <br/>
                                <p class="text textHashIm">
                                    #가족
                                    #80cm 이상 탑승
                                    #90cm 미만 보호자 동반
                                    #185cm이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_mb.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    매직바이크
                                </h2>
                                <p class="text">반짝이는 밤하늘을 나는 자전거를 타고 빙글빙글</p>
                                <br/>
                                <p class="text textHashIm">
                                    #스릴
                                    #90cm 이상 탑승
                                    #120cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_mm.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    메가믹스
                                </h2>
                                <p class="text">국내 최초 360도 종/횡 회전하는 아찔한 회전 어트랙션</p>
                                <br/>
                                <p class="text textHashIm">
                                    #스릴
                                    #국내최초
                                    #140cm 이상 탑승
                                    #195cm이상 이용불가
                                    #110kg이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_mg.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    회전목마
                                </h2>
                                <p class="text">멋있는 백마를 타고 떠나는 환상적인 밤의 여행</p>
                                <br/>
                                <p class="text textHashIm">
                                    #가족
                                    #80cm 이상 탑승
                                    #110cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_gs.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    자이언트슬라이드
                                </h2>
                                <div class="text">
                                
                                    12m와 7m높이의 아찔한 빅트리 슬라이드<br/>
                                    
                                
                                    <ul class="dotList">
                                        <li class="dotDesc">자이언트슬라이드(스페셜)</li>
                                    </ul>
                                    
                                
                                    <ul class="dotList">
                                        <li class="dotDesc">자이언트슬라이드</li>
                                    </ul>
                                    
                                
                                </div>
                                <br/>
                                <p class="text textHashIm">
                                    #스릴
                                    #100kg 이하 탑승
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    해피스윙
                                </h2>
                                <p class="text">대형 그네에서 즐기는 하늘로의 짜릿한 비행</p>
                                <p class="text textHashIm mt20">
                                    #가족
                                    #80cm 이상 탑승
                                    #90cm 미만 보호자 동반
                                    #185cm이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    매직바이크
                                </h2>
                                <p class="text">반짝이는 밤하늘을 나는 자전거를 타고 빙글빙글</p>
                                <p class="text textHashIm mt20">
                                    #스릴
                                    #90cm 이상 탑승
                                    #120cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    메가믹스
                                </h2>
                                <p class="text">국내 최초 360도 종/횡 회전하는 아찔한 회전 어트랙션</p>
                                <p class="text textHashIm mt20">
                                    #스릴
                                    #국내최초
                                    #140cm 이상 탑승
                                    #195cm이상 이용불가
                                    #110kg이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    회전목마
                                </h2>
                                <p class="text">멋있는 백마를 타고 떠나는 환상적인 밤의 여행</p>
                                <p class="text textHashIm mt20">
                                    #가족
                                    #80cm 이상 탑승
                                    #110cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    자이언트슬라이드
                                </h2>
                                <div class="text">
                                
                                    12m와 7m높이의 아찔한 빅트리 슬라이드<br/>
                                    
                                
                                    <ul class="dotList">
                                        <li class="dotDesc">자이언트슬라이드(스페셜)</li>
                                    </ul>
                                    
                                
                                    <ul class="dotList">
                                        <li class="dotDesc">자이언트슬라이드</li>
                                    </ul>
                                    
                                
                                </div>
                                <p class="text textHashIm mt20">
                                    #스릴
                                    #100kg 이하 탑승
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                    </div>

                     
                    <div class="detailFloor">
                        
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb04.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    기프트 트롤리
                                </h2>
                                <p class="text">원더박스에서의 특별한 추억을 간직할 수 있는 기념품이 가득!</p>
                                <br/>
                                <p class="text textHashIm">
                                	#베네치안가면 
									#원더야광봉 
									#원더반지
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>                            
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb02.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    캔디 트롤리
                                </h2>
                                <p class="text">전 세계에서 사랑받는 달콤한 사탕과 원더박스의 특별한 만남!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #츄파춥스 
									#멘토스 
									#후르츠텔라
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb05.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    디저트 트럭
                                </h2>
                                <p class="text">아이스크림, 콘, 토핑을 모두 선택해 만드는 이색적인 나만의 DIY 아이스크림!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #비스토핑 
									#DIY아이스크림 
									#시그니처토핑
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    기프트 트롤리
                                </h2>
                                <p class="text">원더박스에서의 특별한 추억을 간직할 수 있는 기념품이 가득!</p>
                                <p class="text textHashIm mt20">
                                	#베네치안가면 
									#원더야광봉 
									#원더반지
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    캔디 트롤리
                                </h2>
                                <p class="text">전 세계에서 사랑받는 달콤한 사탕과 원더박스의 특별한 만남!</p>
                                <p class="text textHashIm mt20">
                                	#츄파춥스 
									#멘토스 
									#후르츠텔라
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    디저트 트럭
                                </h2>
                                <p class="text">아이스크림, 콘, 토핑을 모두 선택해 만드는 이색적인 나만의 DIY 아이스크림!</p>
                                <p class="text textHashIm mt20">
                                    #비스토핑 
									#DIY아이스크림 
									#시그니처토핑
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //2F : Attraction, Fnb -->

                <!-- 1F : Attraction, Carnival, Fnb -->
                <div class="levelWrap on">
                    
                    <div class="map">
                        <img src="/pcPub/static/images/map/ko/img_wonderbox_1F_Attraction.png" alt="" usemap="#wonderbox_1F_Attraction" />
                        <map name="wonderbox_1F_Attraction">
                            <area shape="rect" alt="" title="" coords="573,436,592,466" href="" target="" />
                            <area shape="rect" alt="" title="" coords="391,364,409,392" href="" target="" />
                            <area shape="rect" alt="" title="" coords="300,246,319,273" href="" target="" />
                            <area shape="rect" alt="" title="" coords="358,202,377,230" href="" target="" />
                            <area shape="rect" alt="" title="" coords="300,155,318,183" href="" target="" />
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_wonderbox_1F_Carnival.png" alt="" usemap="#wonderbox_1F_Carnival" style="display:none;" />
                        <map name="wonderbox_1F_Carnival">
                            <area shape="rect" alt="" title="" coords="303,305,323,337" href="" target="" />
                            <area shape="rect" alt="" title="" coords="564,312,582,341" href="" target="" />
                            <area shape="rect" alt="" title="" coords="590,313,608,343" href="" target="" />
                            <area shape="rect" alt="" title="" coords="616,311,635,342" href="" target="" />
                            <area shape="rect" alt="" title="" coords="645,314,664,345" href="" target="" />
                            <area shape="rect" alt="" title="" coords="428,430,442,461" href="" target="" />
                            <area shape="rect" alt="" title="" coords="449,435,463,466" href="" target="" />
                            <area shape="rect" alt="" title="" coords="469,439,484,471" href="" target="" />
                            <area shape="rect" alt="" title="" coords="622,438,642,471" href="" target="" />
                        </map>
                        
                        <img src="/pcPub/static/images/map/ko/img_wonderbox_1F_Fnb.png" alt="" usemap="#wonderbox_1F_Fnb" style="display:none;" />
                        <map name="wonderbox_1F_Fnb">
                            <area shape="rect" alt="" title="" coords="402,251,420,283" href="" target="" />
                            <area shape="rect" alt="" title="" coords="407,319,429,350" href="" target="" />
                            <area shape="rect" alt="" title="" coords="596,389,615,416" href="" target="" />
                        </map>
                        
                        
                        <ul>
                            <li class="on"><a href="#">어트랙션</a></li>
                            <li><a href="#">카니발게임</a></li>
                            <li><a href="#">F&B / 기프트샵</a></li>
                        </ul>
                    </div>
                    
                    
                    <div class="detailFloor on">
                        
                        <div class="mapView">
                            <div id="CCCC" class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fw.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    관람차
                                </h2>
                                <p class="text">반짝이는 원더박스를 한 눈에 즐기는 환상적인 관람차 여행</p>
                                <br/>
                                <p class="text textHashIm">
                                    #가족
                                    #95cm 이상 탑승
                                    #130cm미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_bc.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    범퍼카
                                </h2>
                                <p class="text">멋있는 마스커레이더카를 타고 즐기는 스릴만점 자동차 경주</p>
                                <br/>
                                <p class="text textHashIm">
                                    #가족
                                    #110cm이상 탑승
                                    #120cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_tc.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    티컵
                                </h2>
                                <p class="text">빙글빙글 돌면서 즐기는 짜릿한 즐거움</p>
                                <br/>
                                <p class="text textHashIm">
                                    #가족
                                    #90cm이상 탑승
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_js.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    점핑스타
                                </h2>
                                <p class="text">별똥별과 함께 떨어지는 스릴만점 번지드롭</p>
                                <br/>
                                <p class="text textHashIm">
                                    #스릴
                                    #80cm 이상 탑승
                                    #90cm미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_sr.jpg" alt="" /></p>
                                <h2>
                                    <span>어트랙션</span>
                                    스카이트레일
                                </h2>
                                <p class="text">7M 높이에서 즐기는 다이나믹 공중 브릿지</p>
                                <br/>
                                <p class="text textHashIm">
                                    #스릴
                                    #국내최초
                                    #125cm 이상 탑승
                                    #136kg이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    관람차
                                </h2>
                                <p class="text">반짝이는 원더박스를 한 눈에 즐기는 환상적인 관람차 여행</p>
                                <p class="text textHashIm mt20">
                                    #가족
                                    #95cm 이상 탑승
                                    #130cm미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    범퍼카
                                </h2>
                                <p class="text">멋있는 마스커레이더카를 타고 즐기는 스릴만점 자동차 경주</p>
                                <p class="text textHashIm mt20">
                                    #가족
                                    #110cm이상 탑승
                                    #120cm 미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    티컵
                                </h2>
                                <p class="text">빙글빙글 돌면서 즐기는 짜릿한 즐거움</p>
                                <p class="text textHashIm mt20">
                                    #가족
                                    #90cm이상 탑승
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    점핑스타
                                </h2>
                                <p class="text">별똥별과 함께 떨어지는 스릴만점 번지드롭</p>
                                <p class="text textHashIm mt20">
                                    #스릴
                                    #80cm 이상 탑승
                                    #90cm미만 보호자 동반
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>어트랙션</span>
                                    스카이트레일
                                </h2>
                                <p class="text">7M 높이에서 즐기는 다이나믹 공중 브릿지</p>
                                <p class="text textHashIm mt20">
                                    #스릴
                                    #국내최초
                                    #125cm 이상 탑승
                                    #136kg이상 이용불가
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=ATR">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                    </div>

                    
                    <div class="detailFloor">
                        
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_sg.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    슈팅갤러리
                                </h2>
                                <p class="text">슈팅건으로 과녁을 명중 시키면 경품이 짜잔</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_bl.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    바주카 블라스트
                                </h2>
                                <p class="text">버튼을 눌러 타겟을 향해 로켓을 발사</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_bs.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    벌룬 버스트
                                </h2>
                                <p class="text">공을 던져 알록달록 풍선을 터뜨리는 게임</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_rb.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    롤 어 볼
                                </h2>
                                <p class="text">공을 굴려 우리 말이 빨리 도착하면 승리</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_tt.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    터브토스
                                </h2>
                                <p class="text">공을 던져 바켓에 골인하면 성공!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_cr.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    캣 랙
                                </h2>
                                <p class="text">공을 던져 타겟을 넘어뜨리면 점수 획득</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_sb.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    베스킷볼
                                </h2>
                                <p class="text">농구 골대를 향해 공을 힘껏 던지면 골인!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_gt.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    고블렛 토스
                                </h2>
                                <p class="text">높은 점수를 획득할 수 있는 구멍으로 공을 슛</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_ts.jpg" alt="" /></p>
                                <h2>
                                    <span>카니발게임</span>
                                    탑 스핀
                                </h2>
                                <p class="text">물총을 쏴서 인형이 높이 올라갈수록 선물이 팡팡!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    슈팅갤러리
                                </h2>
                                <p class="text">슈팅건으로 과녁을 명중 시키면 경품이 짜잔</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    바주카 블라스트
                                </h2>
                                <p class="text">버튼을 눌러 타겟을 향해 로켓을 발사</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    벌룬 버스트
                                </h2>
                                <p class="text">공을 던져 알록달록 풍선을 터뜨리는 게임</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    롤 어 볼
                                </h2>
                                <p class="text">공을 굴려 우리 말이 빨리 도착하면 승리</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    터브토스
                                </h2>
                                <p class="text">공을 던져 바켓에 골인하면 성공!</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    캣 랙
                                </h2>
                                <p class="text">공을 던져 타겟을 넘어뜨리면 점수 획득</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    베스킷볼
                                </h2>
                                <p class="text">농구 골대를 향해 공을 힘껏 던지면 골인!</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    고블렛 토스
                                </h2>
                                <p class="text">높은 점수를 획득할 수 있는 구멍으로 공을 슛</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>카니발게임</span>
                                    탑 스핀
                                </h2>
                                <p class="text">물총을 쏴서 인형이 높이 올라갈수록 선물이 팡팡!</p>
                                <p class="text textHashIm mt20">
                                    #전연령이용가능
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=CVL">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                    </div>

                    
                    <div class="detailFloor">
                        
                        <div class="mapView">
                            <div class="box on" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb03.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    원더 푸드트럭
                                </h2>
                                <p class="text">호텔 쉐프가 선사하는 맛있고 재미있는 프리미엄 스트리트 푸드!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #츄러스 
									#떡볶이 
									#와플아이스크림 
									#핫도그
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>		
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb01.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    초콜릿 스트리트
                                </h2>
                                <p class="text">독창적인 초콜릿 아트와 대형 초콜릿 조형물이 펼쳐지는 초콜릿 테마 거리!</p>
                                <br/>
                                <p class="text textHashIm">
                                    #제니스웡 
									#국내1호점
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box" data-animation="fadeInUp">
                                <p class="img"><img src="/pcPub/static/images/map/thumb_wonderbox_fnb04.jpg" alt="" /></p>
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    기프트 트롤리
                                </h2>
                                <p class="text">원더박스에서의 특별한 추억을 간직할 수 있는 기념품이 가득!</p>
                                <br/>
                                <p class="text textHashIm">
                                	#베네치안가면 
									#원더야광봉 
									#원더반지
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="mapViewInfo">  
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    원더 푸드트럭
                                </h2>
                                <p class="text">호텔 쉐프가 선사하는 맛있고 재미있는 프리미엄 스트리트 푸드!</p>
                                <p class="text textHashIm mt20">
                                    #츄러스 
									#떡볶이 
									#와플아이스크림 
									#핫도그
                                </p>
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    초콜릿 스트리트
                                </h2>
                                <p class="text">독창적인 초콜릿 아트와 대형 초콜릿 조형물이 펼쳐지는 초콜릿 테마 거리!</p>
                                <p class="text textHashIm mt20">
                                    #제니스웡 
									#국내1호점
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                            <div class="box">
                                <h2>
                                    <span>F&B / 기프트샵</span>
                                    기프트 트롤리
                                </h2>
                                <p class="text">원더박스에서의 특별한 추억을 간직할 수 있는 기념품이 가득!</p>
                                <p class="text textHashIm mt20">
                                	#베네치안가면 
									#원더야광봉 
									#원더반지
                                </p>
                                <p class="link">
                                    <a href="/front/wonderbox/facility?F_CD=FGS">자세히 보기</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //1F : Attraction, Carnival, Fnb -->

                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_plaza_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />플라자 원더박스 고객 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F L~R</li>
                                    <li>2구역 B2F M~U</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스시티 플라자 <br/>원더박스 고객주차장</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->

            <!-- //Wonder box Floor Map view -->
            </div> 
            <!-- //WONERBOX -->

            <!-- Shopping Plaza -->
            <div class="floorMapView" data-id="map_pl">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">3F</a></li>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                <!-- 3F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_plaza_map3F.png" alt="" /></div>
                </div>
                <!-- //3F -->
                
                <!-- 2F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_plaza_map2F_20190916.png" alt="" /></div>
                </div>
                <!-- //2F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_plaza_map1F_20190916.png" alt="" /></div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_plaza_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />플라자 원더박스 고객 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F L~R</li>
                                    <li>2구역 B2F M~U</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스시티 플라자 <br/>원더박스 고객주차장</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //Shopping Plaza -->
            
            <!-- art gallery -->
            <div class="floorMapView" data-id="map_as">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                
                <!-- 2F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_gallery_2F.jpg" alt="" /></div>
                </div>
                <!-- //2F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_gallery_1F.jpg" alt="" /></div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_gallery_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />플라자 원더박스 고객 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F A~K</li>
                                    <li>2구역 B2F M~U</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스 플라자 원더박스 고객주차장</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //art gallery -->
            
            <!-- studio paradise -->
            <div class="floorMapView" data-id="map_sp">
                <div class="floorInfo">
                    <ul>
                        <li><a href="#">2F</a></li>
                        <li class="on"><a href="#">1F</a></li>
                        <li><a href="#">주차안내</a></li>
                    </ul>
                </div>
                
                
                <!-- 2F -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_studio_2F.jpg" alt="" /></div>
                </div>
                <!-- //2F -->
                
                <!-- 1F -->
                <div class="levelWrap on">
                    <div class="map"><img src="/pcPub/static/images/map/ko/img_studio_1F.jpg" alt="" /></div>
                </div>
                <!-- //1F -->
                
                <!-- 주차안내 -->
                <div class="levelWrap">
                    <div class="map"><img src="/pcPub/static/images/map/img_studio_parking.jpg" alt="" /></div>
                    <div class="detailFloor on">
                        <div class="mapView">
                            <div class="box on parking" data-animation="fadeInUp">
                                <h2>파라다이스시티 <br />플라자 원더박스 고객 주차장</h2>
                                <p class="text">가까운 주차구역</p>
                                <ul class="dotList">
                                    <li>2구역 B1F L~R</li>
                                    <li>2구역 B2F M~U</li>
                                </ul>
                                <p class="text">네비게이션 검색어</p>
                                <ul class="dotList">
                                    <li>파라다이스 플라자 원더박스 고객주차장</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //주차안내 -->
            </div>
            <!-- //studio paradise -->
            
        </div>
        
        
        







<style>
.divMb120{margin-bottom:120px;}
.artMapView div.on.loading {visibility:hidden;}
.artMapView div.on.loadfin {visibility:visible;}
.tabBtmMenu ul {position:absolute; bottom:40px; left:30px;}
.tabBtmMenu ul li {display:inline;}
.tabBtmMenu ul li + li {margin-left:15px;}
.tabBtmMenu ul li a {font-size:16px;color:#999;font-weight:300;}
.tabBtmMenu ul li.on a {color:#9c836a; text-decoration:underline;}
.ARTMAP{margin-bottom:100px}
.artMapArea .firstTab {display:block;}
.artMapTap .btnSPA {position:absolute;top:0px;right:64px;font-size:16px;color:#999999;line-height:40px;font-weight:300;}
.artMapTap .btnSPA.on {color:#9c836a;text-decoration:underline;}
.tapView .artMapTap {padding-top:20px;}
.tapView .artMapTap .btnKART {top:24px;}
.tapView .artMapTap .btnSPA {top:24px;}
.otherArtView .otherArtTab {display:none;}
.otherArtView .otherArtTab.on {display:block;}
.artWorkName{margin:10px 0px 5px 0px;height:44px;position:relative;overflow:hidden;}
.otherArtView .box h2.vCenter{margin:0px;position:absolute;left:0;top:50%;transform:translateY(-50%);}
</style>
<div class="tapView por ARTMAP artMapArea">
	<!-- ART MAP TAB(TOP) MENU START -->
	<div class="artMapTap">
		<ul class="eventTab clearFixed">
			<li class="on"><a href="javascript:void(0);">ART TOUR COURSE Ⅰ</a></li>
			<li><a href="javascript:void(0);">ART TOUR COURSE Ⅱ</a></li>
		</ul>
		<span class="otherTab">
			<a href="javascript:void(0);" class="btnSPA">ARTISTIC SPA</a>
			<a href="javascript:void(0);" class="btnKART">K-ART</a>
		</span>
	</div>
	<!-- ART MAP TAB(TOP) MENU END -->
	
	<!-- ART MAP TAB(TOP) CONTENT1 START-->
	<div class="tapView firstTab">
		
		<!-- ART MAP TAB(BOTTOM) CONTENT1 START-->
		<div class="tabBtmMenu">
			
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - select point START-->
			<div class="artMap btmContents dpb">
				<div class="mark all">
					<a href="#" class="pos1 type1 on"><span>01</span></a>
					<a href="#" class="pos2 type1"><span>02</span></a>
					<a href="#" class="pos3 type1"><span>03</span></a>
					<a href="#" class="pos4 type1"><span>04</span></a>
					<a href="#" class="pos5 type1"><span>05</span></a>
					<a href="#" class="pos6 type1"><span>06</span></a>
					<a href="#" class="pos7 type1"><span>07</span></a>
					<a href="#" class="pos8 type1"><span>08</span></a>
					<a href="#" class="pos9 type1"><span>09</span></a>
					<a href="#" class="pos10 type1"><span>10</span></a>
					<a href="#" class="pos11 type1"><span>11</span></a>
					<a href="#" class="pos12 type1"><span>12</span></a>
					<a href="#" class="pos13 type1"><span>13</span></a>
					<a href="#" class="pos14 type2"><span>14</span></a>
					<a href="#" class="pos15 type2"><span>15</span></a>
					<a href="#" class="pos16 type2"><span>16</span></a>
					<a href="#" class="pos17 type2"><span>17</span></a>
					<a href="#" class="pos18 type2"><span>18</span></a>
					<a href="#" class="pos19 type3"><span>19</span></a>
					<a href="#" class="pos20 type3"><span>20</span></a>
					<a href="#" class="pos21 type3"><span>21</span></a>
					<a href="#" class="pos22 type3"><span>22</span></a>
					<a href="#" class="pos23 type3"><span>23</span></a>
				</div>
			</div>
			<div class="artMap btmContents dpn">
				<div class="mark">
					<a href="#" class="pos1 type1 on"><span>01</span></a>
					<a href="#" class="pos2 type1"><span>02</span></a>
					<a href="#" class="pos3 type1"><span>03</span></a>
					<a href="#" class="pos4 type1"><span>04</span></a>
					<a href="#" class="pos5 type1"><span>05</span></a>
					<a href="#" class="pos6 type1"><span>06</span></a>
					<a href="#" class="pos7 type1"><span>07</span></a>
					<a href="#" class="pos8 type1"><span>08</span></a>
					<a href="#" class="pos9 type1"><span>09</span></a>
					<a href="#" class="pos10 type1"><span>10</span></a>
					<a href="#" class="pos11 type1"><span>11</span></a>
					<a href="#" class="pos12 type1"><span>12</span></a>
					<a href="#" class="pos13 type1"><span>13</span></a>
					<a href="#" class="pos14 type4"><span>14</span></a>
					<a href="#" class="pos15 type4"><span>15</span></a>
					<a href="#" class="pos16 type4"><span>16</span></a>
					<a href="#" class="pos17 type4"><span>17</span></a>
					<a href="#" class="pos18 type4"><span>18</span></a>
					<a href="#" class="pos19 type4"><span>19</span></a>
					<a href="#" class="pos20 type4"><span>20</span></a>
					<a href="#" class="pos21 type4"><span>21</span></a>
					<a href="#" class="pos22 type4"><span>22</span></a>
					<a href="#" class="pos23 type4"><span>23</span></a>
				</div>
			</div>
			<div class="artMap btmContents dpn">
				<div class="mark">
					<a href="#" class="pos1 type4"><span>01</span></a>
					<a href="#" class="pos2 type4"><span>02</span></a>
					<a href="#" class="pos3 type4"><span>03</span></a>
					<a href="#" class="pos4 type4"><span>04</span></a>
					<a href="#" class="pos5 type4"><span>05</span></a>
					<a href="#" class="pos6 type4"><span>06</span></a>
					<a href="#" class="pos7 type4"><span>07</span></a>
					<a href="#" class="pos8 type4"><span>08</span></a>
					<a href="#" class="pos9 type4"><span>09</span></a>
					<a href="#" class="pos10 type4"><span>10</span></a>
					<a href="#" class="pos11 type4"><span>11</span></a>
					<a href="#" class="pos12 type4"><span>12</span></a>
					<a href="#" class="pos13 type4"><span>13</span></a>
					<a href="#" class="pos14 type2 on"><span>14</span></a>
					<a href="#" class="pos15 type2"><span>15</span></a>
					<a href="#" class="pos16 type2"><span>16</span></a>
					<a href="#" class="pos17 type2"><span>17</span></a>
					<a href="#" class="pos18 type2"><span>18</span></a>
					<a href="#" class="pos19 type4"><span>19</span></a>
					<a href="#" class="pos20 type4"><span>20</span></a>
					<a href="#" class="pos21 type4"><span>21</span></a>
					<a href="#" class="pos22 type4"><span>22</span></a>
					<a href="#" class="pos23 type4"><span>23</span></a>
				</div>
			</div>
			<div class="artMap btmContents dpn">
				<div class="mark">
					<a href="#" class="pos1 type4"><span>01</span></a>
					<a href="#" class="pos2 type4"><span>02</span></a>
					<a href="#" class="pos3 type4"><span>03</span></a>
					<a href="#" class="pos4 type4"><span>04</span></a>
					<a href="#" class="pos5 type4"><span>05</span></a>
					<a href="#" class="pos6 type4"><span>06</span></a>
					<a href="#" class="pos7 type4"><span>07</span></a>
					<a href="#" class="pos8 type4"><span>08</span></a>
					<a href="#" class="pos9 type4"><span>09</span></a>
					<a href="#" class="pos10 type4"><span>10</span></a>
					<a href="#" class="pos11 type4"><span>11</span></a>
					<a href="#" class="pos12 type4"><span>12</span></a>
					<a href="#" class="pos13 type4"><span>13</span></a>
					<a href="#" class="pos14 type4"><span>14</span></a>
					<a href="#" class="pos15 type4"><span>15</span></a>
					<a href="#" class="pos16 type4"><span>16</span></a>
					<a href="#" class="pos17 type4"><span>17</span></a>
					<a href="#" class="pos18 type4"><span>18</span></a>
					<a href="#" class="pos19 type3 on"><span>19</span></a>
					<a href="#" class="pos20 type3"><span>20</span></a>
					<a href="#" class="pos21 type3"><span>21</span></a>
					<a href="#" class="pos22 type3"><span>22</span></a>
					<a href="#" class="pos23 type3"><span>23</span></a>
				</div>
			</div>
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - select point END-->
			
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - map image START-->
			<img class="dpb" src="/pcPub/static/images/map/img_artmap1.jpg" alt="" style="width:100%;" usemap="#image-artmap1" />
			<map name="image-artmap1">
				<area shape="poly" coords="435,465,460,465,487,482,497,517,481,544,415,545,397,514,407,483" href="pos1" alt="1">
				<area shape="poly" coords="415,299,441,335,435,303,471,343,471,371,472,430,427,427" href="pos2" alt="2">
				<area shape="poly" coords="339,431,417,388,417,426,339,463" href="pos3" alt="3">
				<area shape="poly" coords="337,383,412,341,418,382,339,425" href="pos4" alt="4">
				<area shape="poly" coords="479,356,520,381,520,432,481,418" href="pos5" alt="5">
				<area shape="poly" coords="480,291,512,311,513,369,481,350" href="pos6" alt="6">	
				<area shape="poly" coords="375,295,408,275,412,324,375,345" href="pos7" alt="7">
				<area shape="poly" coords="445,214,472,243,479,263,477,284,459,301,434,301,417,290,411,272,415,245" href="pos8" alt="8">
				<area shape="poly" coords="437,43,458,44,480,54,490,74,492,95,449,134,403,97,402,73,415,53" href="pos9" alt="9">
				<area shape="poly" coords="282,229,291,211,312,204,329,211,339,225,339,240,351,251,303,283,273,265,282,249" href="pos10" alt="10">
				<area shape="poly" coords="370,169,383,164,398,150,420,162,424,180,424,192,431,204,387,238,361,222" href="pos11" alt="11">
				<area shape="poly" coords="485,174,543,212,544,263,526,274,470,234,468,183" href="pos12" alt="12">
				<area shape="poly" coords="527,103,638,99,638,189,527,187" href="pos13" alt="13">
				<area shape="poly" coords="330,268,350,257,358,298,373,316,339,335,322,322" href="pos14" alt="14">
				<area shape="poly" coords="284,315,318,297,318,348,284,369" href="pos15" alt="15">
				<area shape="poly" coords="255,369,299,395,300,433,254,411" href="pos16" alt="16">
				<area shape="poly" coords="171,321,202,340,232,364,194,410,154,389,149,348" href="pos17" alt="17">
				<area shape="poly" coords="172,252,229,287,227,340,169,304" href="pos18" alt="18">
				<area shape="poly" coords="591,378,608,402,612,433,639,454,640,487,581,506,547,479,559,440,576,424,580,382" href="pos19" alt="19">
				<area shape="poly" coords="617,322,671,354,671,409,617,379" href="pos20" alt="20">
				<area shape="poly" coords="566,297,613,325,613,380,566,351" href="pos21" alt="21">
				<area shape="poly" coords="632,202,666,202,682,230,679,245,700,271,692,304,645,313,600,297,599,263,619,243,617,220" href="pos22" alt="22">
				<area shape="poly" coords="686,309,749,346,749,407,686,370" href="pos23" alt="23">
			</map>
			<img class="dpn" src="/pcPub/static/images/map/img_artmap1_1.jpg" alt="" style="width:100%;" usemap="#image-artmap1_1"/>
			<map name="image-artmap1_1">
				<area shape="poly" coords="435,465,460,465,487,482,497,517,481,544,415,545,397,514,407,483" href="pos1" alt="1">
				<area shape="poly" coords="415,299,441,335,435,303,471,343,471,371,472,430,427,427" href="pos2" alt="2">
				<area shape="poly" coords="339,431,417,388,417,426,339,463" href="pos3" alt="3">
				<area shape="poly" coords="337,383,412,341,418,382,339,425" href="pos4" alt="4">
				<area shape="poly" coords="479,356,520,381,520,432,481,418" href="pos5" alt="5">
				<area shape="poly" coords="480,291,512,311,513,369,481,350" href="pos6" alt="6">	
				<area shape="poly" coords="375,295,408,275,412,324,375,345" href="pos7" alt="7">
				<area shape="poly" coords="445,214,472,243,479,263,477,284,459,301,434,301,417,290,411,272,415,245" href="pos8" alt="8">
				<area shape="poly" coords="437,43,458,44,480,54,490,74,492,95,449,134,403,97,402,73,415,53" href="pos9" alt="9">
				<area shape="poly" coords="282,229,291,211,312,204,329,211,339,225,339,240,351,251,303,283,273,265,282,249" href="pos10" alt="10">
				<area shape="poly" coords="370,169,383,164,398,150,420,162,424,180,424,192,431,204,387,238,361,222" href="pos11" alt="11">
				<area shape="poly" coords="485,174,543,212,544,263,526,274,470,234,468,183" href="pos12" alt="12">
				<area shape="poly" coords="527,103,638,99,638,189,527,187" href="pos13" alt="13">
			</map>
			<img class="dpn" src="/pcPub/static/images/map/img_artmap1_2.jpg" alt="" style="width:100%;" usemap="#image-artmap1_2"/>
			<map name="image-artmap1_2">
				<area shape="poly" coords="330,268,350,257,358,298,373,316,339,335,322,322" href="pos14" alt="14">
				<area shape="poly" coords="284,315,318,297,318,348,284,369" href="pos15" alt="15">
				<area shape="poly" coords="255,369,299,395,300,433,254,411" href="pos16" alt="16">
				<area shape="poly" coords="171,321,202,340,232,364,194,410,154,389,149,348" href="pos17" alt="17">
				<area shape="poly" coords="172,252,229,287,227,340,169,304" href="pos18" alt="18">
			</map>
			<img class="dpn" src="/pcPub/static/images/map/img_artmap1_3.jpg" alt="" style="width:100%;" usemap="#image-artmap1_3"/>
			<map name="image-artmap1_3">
				<area shape="poly" coords="591,378,608,402,612,433,639,454,640,487,581,506,547,479,559,440,576,424,580,382" href="pos19" alt="19">
				<area shape="poly" coords="617,322,671,354,671,409,617,379" href="pos20" alt="20">
				<area shape="poly" coords="566,297,613,325,613,380,566,351" href="pos21" alt="21">
				<area shape="poly" coords="632,202,666,202,682,230,679,245,700,271,692,304,645,313,600,297,599,263,619,243,617,220" href="pos22" alt="22">
				<area shape="poly" coords="686,309,749,346,749,407,686,370" href="pos23" alt="23">
			</map>
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - map image END-->
			
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - btm tab START-->
			<ul class="btmMenuUl">
				<li class="on"><a href="javascript:void(0);">전체</a></li>
				<li><a href="javascript:void(0);">Masters of Paradise</a></li>
				<li><a href="javascript:void(0);">Contemplative Paradise</a></li>
				<li><a href="javascript:void(0);">Splendid Paradise</a></li>
			</ul>
			<!-- ART MAP TAB(BOTTOM) CONTENT1 - btm tab END-->
			
		</div>
		<!-- ART MAP TAB(BOTTOM) CONTENT1 END-->
		
	</div>
	<!-- ART MAP TAB(TOP) CONTENT1 END-->
	
	<!-- ART MAP TAB(TOP) CONTENT2 START-->
	<div class="tapView">
		
		<!-- ART MAP TAB(BOTTOM) CONTENT2 START-->
		<div class="tabBtmMenu">
			
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - select point START-->
			<div class="artMap btmContents dpb">
				<div class="mark all">
					<a href="#" class="pos24 type5 on"><span>24</span></a>
					<a href="#" class="pos25 type5"><span>25</span></a>
					<a href="#" class="pos26 type5"><span>26</span></a>
					<a href="#" class="pos27 type5"><span>27</span></a>
					<a href="#" class="pos28 type5"><span>28</span></a>
					<a href="#" class="pos29 type5"><span>29</span></a>
					<a href="#" class="pos30 type5"><span>30</span></a>
					<a href="#" class="pos31 type5"><span>31</span></a>
					<a href="#" class="pos32 type6"><span>32</span></a>
					<a href="#" class="pos33 type6"><span>33</span></a>
					<a href="#" class="pos34 type6"><span>34</span></a>
					<a href="#" class="pos35 type6"><span>35</span></a>
					<a href="#" class="pos36 type6"><span>36</span></a>
					<a href="#" class="pos37 type6"><span>37</span></a>
				</div>
			</div>
			<div class="artMap btmContents dpn">
				<div class="mark">
					<a href="#" class="pos24 type5 on"><span>24</span></a>
					<a href="#" class="pos25 type5"><span>25</span></a>
					<a href="#" class="pos26 type5"><span>26</span></a>
					<a href="#" class="pos27 type5"><span>27</span></a>
					<a href="#" class="pos28 type5"><span>28</span></a>
					<a href="#" class="pos29 type5"><span>29</span></a>
					<a href="#" class="pos30 type5"><span>30</span></a>
					<a href="#" class="pos31 type5"><span>31</span></a>
					<a href="#" class="pos32 type4"><span>32</span></a>
					<a href="#" class="pos33 type4"><span>33</span></a>
					<a href="#" class="pos34 type4"><span>34</span></a>
					<a href="#" class="pos35 type4"><span>35</span></a>
					<a href="#" class="pos36 type4"><span>36</span></a>
					<a href="#" class="pos37 type4"><span>37</span></a>
				</div>
			</div>
			<div class="artMap btmContents dpn">
				<div class="mark">
					<a href="#" class="pos24 type4"><span>24</span></a>
					<a href="#" class="pos25 type4"><span>25</span></a>
					<a href="#" class="pos26 type4"><span>26</span></a>
					<a href="#" class="pos27 type4"><span>27</span></a>
					<a href="#" class="pos28 type4"><span>28</span></a>
					<a href="#" class="pos29 type4"><span>29</span></a>
					<a href="#" class="pos30 type4"><span>30</span></a>
					<a href="#" class="pos31 type4"><span>31</span></a>
					<a href="#" class="pos32 type6 on"><span>32</span></a>
					<a href="#" class="pos33 type6"><span>33</span></a>
					<a href="#" class="pos34 type6"><span>34</span></a>
					<a href="#" class="pos35 type6"><span>35</span></a>
					<a href="#" class="pos36 type6"><span>36</span></a>
					<a href="#" class="pos37 type6"><span>37</span></a>
				</div>
			</div>
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - select point END-->
			
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - map image START-->
			<img class="dpb" src="/pcPub/static/images/map/img_artmap2.jpg" alt="" style="width:100%;" usemap="#image-artmap2"/>
			<map name="image-artmap2">
				<area shape="poly" coords="511,367,499,393,514,417,529,429,555,435,578,436,601,432,625,419,663,440,663,488,606,522,447,428,451,390,491,355" href="pos24" alt="24">
				<area shape="poly" coords="452,243,473,236,485,268,486,294,494,347,475,364,456,381,418,404,383,396,386,359,428,332,439,291,436,259" href="pos25" alt="25">
				<area shape="poly" coords="318,334,351,337,368,368,367,404,364,439,332,447,301,435,300,376,307,349" href="pos26" alt="26">
				<area shape="poly" coords="204,293,227,302,236,347,243,377,237,401,191,408,181,379,196,310" href="pos27" alt="27">
				<area shape="poly" coords="262,247,280,254,286,274,287,308,305,326,301,358,272,374,244,352,246,312,246,281,221,269,224,255,244,261,263,269" href="pos28" alt="28">
				<area shape="poly" coords="121,175,165,184,168,251,186,274,201,290,140,329,71,295,70,257,102,247,97,199" href="pos29" alt="29">
				<area shape="poly" coords="263,233,256,252,259,263,216,248,201,257,184,226,185,184" href="pos30" alt="30">
				<area shape="poly" coords="295,133,343,166,338,202,345,228,311,247,271,220,267,175,275,146" href="pos31" alt="31">
				<area shape="poly" coords="408,463,450,433,472,453,460,484,483,506,479,542,419,562,378,550,359,523,367,487" href="pos32" alt="32">
				<area shape="poly" coords="517,371,507,391,516,411,534,425,556,429,583,431,625,415,630,395,625,373,608,359,594,348,587,324,570,305,555,294,546,302,547,325,543,353" href="pos33" alt="33">
				<area shape="poly" coords="575,301,591,322,596,341,612,348,656,338,662,314,644,295,619,289,594,289,579,294" href="pos34" alt="34">
				<area shape="poly" coords="526,311,557,289,599,282,621,285,636,287,644,276,641,254,582,231,496,241,491,261,492,289" href="pos35" alt="35">
				<area shape="poly" coords="375,200,385,230,425,256,468,229,503,208,501,176,459,148" href="pos36" alt="36">
				<area shape="poly" coords="714,29,728,69,723,102,757,169,649,237,518,164,637,85,667,41" href="pos37" alt="37">
			</map>
			<img class="dpn" src="/pcPub/static/images/map/img_artmap2_1.jpg" alt="" style="width:100%;" usemap="#image-artmap2_1"/>
			<map name="image-artmap2_1">
				<area shape="poly" coords="511,367,499,393,514,417,529,429,555,435,578,436,601,432,625,419,663,440,663,488,606,522,447,428,451,390,491,355" href="pos24" alt="24">
				<area shape="poly" coords="452,243,473,236,485,268,486,294,494,347,475,364,456,381,418,404,383,396,386,359,428,332,439,291,436,259" href="pos25" alt="25">
				<area shape="poly" coords="318,334,351,337,368,368,367,404,364,439,332,447,301,435,300,376,307,349" href="pos26" alt="26">
				<area shape="poly" coords="204,293,227,302,236,347,243,377,237,401,191,408,181,379,196,310" href="pos27" alt="27">
				<area shape="poly" coords="262,247,280,254,286,274,287,308,305,326,301,358,272,374,244,352,246,312,246,281,221,269,224,255,244,261,263,269" href="pos28" alt="28">
				<area shape="poly" coords="121,175,165,184,168,251,186,274,201,290,140,329,71,295,70,257,102,247,97,199" href="pos29" alt="29">
				<area shape="poly" coords="263,233,256,252,259,263,216,248,201,257,184,226,185,184" href="pos30" alt="30">
				<area shape="poly" coords="295,133,343,166,338,202,345,228,311,247,271,220,267,175,275,146" href="pos31" alt="31">
			</map>
			<img class="dpn" src="/pcPub/static/images/map/img_artmap2_2.jpg" alt="" style="width:100%;" usemap="#image-artmap2_2"/>
			<map name="image-artmap2_2">
				<area shape="poly" coords="408,463,450,433,472,453,460,484,483,506,479,542,419,562,378,550,359,523,367,487" href="pos32" alt="32">
				<area shape="poly" coords="517,371,507,391,516,411,534,425,556,429,583,431,625,415,630,395,625,373,608,359,594,348,587,324,570,305,555,294,546,302,547,325,543,353" href="pos33" alt="33">
				<area shape="poly" coords="575,301,591,322,596,341,612,348,656,338,662,314,644,295,619,289,594,289,579,294" href="pos34" alt="34">
				<area shape="poly" coords="526,311,557,289,599,282,621,285,636,287,644,276,641,254,582,231,496,241,491,261,492,289" href="pos35" alt="35">
				<area shape="poly" coords="375,200,385,230,425,256,468,229,503,208,501,176,459,148" href="pos36" alt="36">
				<area shape="poly" coords="714,29,728,69,723,102,757,169,649,237,518,164,637,85,667,41" href="pos37" alt="37">
			</map>
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - map image END-->
			
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - btm tab START-->
			<ul class="btmMenuUl">
				<li class="on"><a href="javascript:void(0);">전체</a></li>
				<li><a href="javascript:void(0);">Monumental Paradise</a></li>
				<li><a href="javascript:void(0);">Brillant Paradise</a></li>
			</ul>
			<!-- ART MAP TAB(BOTTOM) CONTENT2 - btm tab END-->
			
		</div>
		<!-- ART MAP TAB(BOTTOM) CONTENT2 END-->
		
	</div>
	<!-- ART MAP TAB(TOP) CONTENT2 END-->
	
	<!-- ART MAP DETAIL INFO START -->
	<div class="artMapView">
	
		<div class="box on loading" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/01_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">01</span>GOLDEN CROWN</h2>
			<ul>
				<li><strong>작가</strong>최정화</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>MAIN WATER FEATURE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=307">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/02_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">02</span>GOLDEN LEGEND</h2>
			<ul>
				<li><strong>작가</strong>데미안 허스트</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Hotel Paradise Lobby</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=326">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/03_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">03</span>SERENITY-16102, 16103</h2>
			<ul>
				<li><strong>작가</strong>이강소</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE RECEPTION LOBBY</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=327">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/04_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">04</span>PARADISE LOST Ⅰ-Ⅳ</h2>
			<ul>
				<li><strong>작가</strong>피터 핼리&amp; 로렌 클레이</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE RECEPTION DESK</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=274">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/05_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">05</span>VARIATION</h2>
			<ul>
				<li><strong>작가</strong>오수환</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE LOBBY BAR</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=269">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/06_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">06</span>EVENING BELLS</h2>
			<ul>
				<li><strong>작가</strong>게오르그 바젤리츠</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE LOBBY</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=225">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/07_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">07</span>UNTITLED</h2>
			<ul>
				<li><strong>작가</strong>루돌프 스팅겔</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE LOBBY</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=224">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/08_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">08</span>GREAT GIGANTIC PUMPKIN</h2>
			<ul>
				<li><strong>작가</strong>쿠사마 야요이</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE WOW SPACE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=325">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/09_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">09</span>YOUR CRYSTAL</h2>
			<ul>
				<li><strong>작가</strong>뮌(김민선, 최문선)</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE WOW SPACE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=107">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/10_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">10</span>NINE</h2>
			<ul>
				<li><strong>작가</strong>로버트 인디애나</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE SPRING GARDEN</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=323">자세히 보기</a>
		</div>
		
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/11_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">11</span>LOVE</h2>
			<ul>
				<li><strong>작가</strong>로버트 인디애나</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE SPRING GARDEN</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=323">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/12_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">12</span>MOVING GATE</h2>
			<ul>
				<li><strong>작가</strong>뮌(김민선, 최문선)</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE Casino Entrance</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=108">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/13_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type1"><span class="cycle">13</span>DOG DAYS ARE OVER</h2>
			<ul>
				<li><strong>작가</strong>우고 론디노네</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>WOW</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=289">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/14_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type2"><span class="cycle">14</span>ANNA B. IN BLUE</h2>
			<ul>
				<li><strong>작가</strong>하우메 플렌자</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE CONVENTION</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=381">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/15_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type2"><span class="cycle">15</span>ECRITURE NO. 110326</h2>
			<ul>
				<li><strong>작가</strong>박서보</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>Hotel Paradise Convention Event Meetingroom Corridor</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=279">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/16_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type2"><span class="cycle">16</span>WATERDROPS</h2>
			<ul>
				<li><strong>작가</strong>김창열</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>Hotel Paradise Convention Event Meetingroom Corridor</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=278">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/17_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type2"><span class="cycle">17</span>PARADISE PROUST</h2>
			<ul>
				<li><strong>작가</strong>알레산드로 멘디니</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>HOTEL PARADISE CONVENTION</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=205">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/18_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type2"><span class="cycle">18</span>VALLEY</h2>
			<ul>
				<li><strong>작가</strong>김호득</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE Convention Event Meetingroom Corridor</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=201">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/19_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type3"><span class="cycle">19</span>DAVID</h2>
			<ul>
				<li><strong>작가</strong>박찬걸</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>VIP Casino Entrance</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=101">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/20_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type3"><span class="cycle">20</span>CONTINENTAL SPLASH</h2>
			<ul>
				<li><strong>작가</strong>로버트 라우센버그</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE VIP ENTRANCE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=276">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/21_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type3"><span class="cycle">21</span>UNTITLED</h2>
			<ul>
				<li><strong>작가</strong>딩이</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE VIP ENTRANCE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=288">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/22_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type3"><span class="cycle">22</span>GOLD CAROUSEL</h2>
			<ul>
				<li><strong>작가</strong>뮌(김민선, 최문선)</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>CASINO</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=109">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/23_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type3"><span class="cycle">23</span>BETWEEN RED-016NOV</h2>
			<ul>
				<li><strong>작가</strong>이세현</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>HOTEL PARADISE VIP ENTRANCE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=183">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/24_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">24</span>PARADISE WALK</h2>
			<ul>
				<li><strong>작가</strong>원더미디움</li>
				<li><strong>구분</strong>기타</li>
				
			</ul>
			<a href="/front/paradiseWalk/overview">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/25_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">25</span>ONE</h2>
			<ul>
				<li><strong>작가</strong>김명범</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Plaza Square</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=442">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/26_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">26</span>TOGETHER</h2>
			<ul>
				<li><strong>작가</strong>카우스</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Plaza Square</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=441">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/27_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">27</span>VENUS</h2>
			<ul>
				<li><strong>작가</strong>박승모</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Art Space</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=501">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/28_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">28</span>NIKE</h2>
			<ul>
				<li><strong>작가</strong>박승모</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>ARTSPACE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=461">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/29_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">29</span>GAZING BALL-FARNESE HERCULES</h2>
			<ul>
				<li><strong>작가</strong>제프쿤스</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>ARTSPACE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=463">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/30_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">30</span>AUROUS CYANIDE</h2>
			<ul>
				<li><strong>작가</strong>데미안 허스트</li>
				<li><strong>구분</strong>회화</li>
				<li><strong>위치</strong>ARTSPACE</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=464">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/31_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type5"><span class="cycle">31</span>HITCHCOCKED</h2>
			<ul>
				<li><strong>작가</strong>백남준</li>
				<li><strong>구분</strong>기타</li>
				<li><strong>위치</strong>Hotel Art Paradiso</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=502">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/32_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">32</span>RAY</h2>
			<ul>
				<li><strong>작가</strong>수보드 굽타</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>NORTH ART GARDEN</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=204">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/33_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">33</span>GOETHE</h2>
			<ul>
				<li><strong>작가</strong>이용백</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Sky Park</strong>
			</ul>
			<a href="/front/art/detail?A_SEQ=503">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/34_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">34</span>C-CURVE</h2>
			<ul>
				<li><strong>작가</strong>아니쉬 카푸어</li>
				<li><strong>구분</strong>조각설치</li>
				<li><strong>위치</strong>Art Garden</strong>
			</ul>
			<a href="/front/artGarden/overview">자세히 보기</a>
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/35_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">35</span>ARTECTURE MEDIA FAÇADE</h2>
			<ul>
				<li><strong>작가</strong>.밀</li>
				<li><strong>구분</strong>기타</li>
				
			</ul>
			
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/36_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">36</span>CHROMATIC PARADISE</h2>
			<ul>
				<li><strong>작가</strong>스튜디오 레드(상화)</li>
				<li><strong>구분</strong>기타</li>
				
			</ul>
			
		</div>
		
	
		<div class="box" data-animation="fadeInUp">
			<p class="img"><img src="/pcPub/static/images/map/artmap/37_Artmap_PC.jpg" alt="" /></p>
			<h2 class="type6"><span class="cycle">37</span>ANOTHER TIME ⅩⅩⅠ</h2>
			<ul>
				<li><strong>작가</strong>안토니 곰리</li>
				<li><strong>구분</strong>조각설치</li>
				
			</ul>
			<a href="/front/art/detail?A_SEQ=521">자세히 보기</a>
		</div>
		
	
	</div>
	<!-- ART MAP DETAIL INFO END -->
	
	<!-- ART MAP OTHER(K-ART, A-SPA) START -->
	<div class="otherArtView">
	
		<div class="otherArtTab">
			<div class="otherArtBox">
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/01_ASPA_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">The Surfer</h2>
					</div>
					<ul>
						<li><strong>작가</strong>David Gerstein</li>
						<li><strong>구분</strong>조각설치</li>
						<li><strong>위치</strong>CIMER</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=402" class="btn full small"><span>자세히 보기</span></a>
				</div>
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/02_ASPA_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Wind Surfing</h2>
					</div>
					<ul>
						<li><strong>작가</strong>David Gerstein</li>
						<li><strong>구분</strong>조각설치</li>
						<li><strong>위치</strong>CIMER</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=403" class="btn full small"><span>자세히 보기</span></a>
				</div>
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/03_ASPA_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Prisms and Mirrors, high reliefs, situated works 2016/2017 for São Paulo</h2>
					</div>
					<ul>
						<li><strong>작가</strong>Daniel Buren</li>
						<li><strong>구분</strong>조각설치</li>
						<li><strong>위치</strong>CIMER</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=401" class="btn full small"><span>자세히 보기</span></a>
				</div>
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/04_ASPA_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Coexistence</h2>
					</div>
					<ul>
						<li><strong>작가</strong>Sayaka Ganz</li>
						<li><strong>구분</strong>조각설치</li>
						<li><strong>위치</strong>CIMER</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=421" class="btn full small"><span>자세히 보기</span></a>
				</div>
			
			</div>
		</div>
		<div class="otherArtTab">
			<div class="otherArtBox">
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/05_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">회화의 지층</h2>
					</div>
					<ul>
						<li><strong>작가</strong>이인현, 1958~</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 11F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=143" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/06_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Inner Sight</h2>
					</div>
					<ul>
						<li><strong>작가</strong>이종목</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 10F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=209" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/07_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Inner Sight</h2>
					</div>
					<ul>
						<li><strong>작가</strong>이종목</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 10F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=209" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/07_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">생성공간변수</h2>
					</div>
					<ul>
						<li><strong>작가</strong>이열</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 9F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=208" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/08_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">S20172502 外</h2>
					</div>
					<ul>
						<li><strong>작가</strong>국대호</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 8F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=161" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/09_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Metallica</h2>
					</div>
					<ul>
						<li><strong>작가</strong>김성수</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 7F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=181" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/11_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Secret Garden #824</h2>
					</div>
					<ul>
						<li><strong>작가</strong>문범</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 6F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=241" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/12_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Untitled-transpainting</h2>
					</div>
					<ul>
						<li><strong>작가</strong>장승택</li>
						<li><strong>구분</strong>기타</li>
						<li><strong>위치</strong>Hotel Paradise 5F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=211" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
				<div class="box" data-animation="fadeInUp">
					<p class="img"><img src="/pcPub/static/images/map/artmap/13_KART_PC.jpg" alt="" /></p>
					<div class="artWorkName">
						<h2 class="vCenter">Flâneur in Museum_Duomo, Louvre, Toledo, Catalunya</h2>
					</div>
					<ul>
						<li><strong>작가</strong>김홍식</li>
						<li><strong>구분</strong>회화</li>
						<li><strong>위치</strong>Hotel Paradise 3F</li>
					</ul>
					<a href="/front/art/detail?A_SEQ=146" class="btn full small"><span>자세히 보기</span></a>
				</div>
				
			
			</div>
		</div>
	</div>
	<!-- ART MAP OTHER(K-ART, A-SPA) END -->
</div>

<!-- ART MAP AREA END -->


<script>

$(document).ready(function(){
	//ART MAP TAB(BOTTOM) EVENT SET
	$('.tabBtmMenu li').click(function(){
		var idx = $(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		//map image change
		$(this).parent().siblings('img').hide().eq(idx).show();
		//map point change
		$(this).parent().siblings('div.btmContents').hide().eq(idx).show();
		//map detail change
		var artIdx = $(this).parent().siblings('div.btmContents').eq(idx).find("a.on").index();;
		for (var i =0; i < $('.artMapTap').find("li.on").index(); i++)
			artIdx += $(this).closest('.artMapArea').find('.tapView').eq(i).find(".mark.all").find("a").length;
		$('.artMapView > .box').eq(artIdx).addClass('on').siblings().removeClass('on');
		return false;
	});
	
	//MAP AREA REMOVE LINE
	$(".artMapArea").find("area").each(function(){
		$(this).attr({onfocus:"blur();"});
	});
	
});
$(window).load(function(){
	//ART MAP TAB(BOTTOM) layout
	$("div.on.loading").removeClass("loading").addClass("loadfin");
});
</script>
    </div>
</section>
<!-- //컨텐츠 영역 -->


<!-- 2018.09.03 운영 시간표 -->
<div class="layerPopWrap normalLayer" id="locationTime">
    <div class="bg"></div>
    <!-- layerPopCont -->
    <div class="layerPopCont">
    <h1 class="popHeader">운영 시간표 상세</h1>
        <table class="tableList">
            <colgroup>
                <col style="" />
                <col style="" />
                <col style="" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" colspan="3">
                        <span class="bold">출발위치</span>
                    </th>
                </tr>
                <tr>
                    <th scope="col"><span class="dpb pb3 bold">2터미널</span> 2A</th>
                    <th scope="col"><span class="dpb pb3 bold">1터미널</span> 3C</th>
                    <th scope="col"><span class="dpb pb3 bold">1터미널</span> 14C</th>
                </tr>
            </thead>
            <tbody>
                <tr class="time 5">
                    <td>05:25</td>
                    <td>05:40</td>
                    <td>05:45</td>
                </tr>
                <tr class="time 5">
                    <td>05:45</td>
                    <td>06:00</td>
                    <td>06:05</td>
                </tr>
                <tr class="time 6 on">
                    <td>06:05</td>
                    <td>06:20</td>
                    <td>06:25</td>
                </tr>
                <tr class="time 6 on">
                    <td>06:25</td>
                    <td>06:40</td>
                    <td>06:45</td>
                </tr>
                <tr class="time 6 on">
                    <td>06:45</td>
                    <td>07:00</td>
                    <td>07:05</td>
                </tr>
                <tr class="time 7">
                    <td>07:05</td>
                    <td>07:20</td>
                    <td>07:25</td>
                </tr>

                <tr class="time 7">
                    <td>07:25</td>
                    <td>07:40</td>
                    <td>07:45</td>
                </tr>
                <tr class="time 7">
                    <td>07:45</td>
                    <td>08:00</td>
                    <td>08:05</td>
                </tr>
                <tr class="time 8">
                    <td>08:05</td>
                    <td>08:20</td>
                    <td>08:25</td>
                </tr>
                <tr class="time 8">
                    <td>08:25</td>
                    <td>08:40</td>
                    <td>08:45</td>
                </tr>
                <tr class="time 8">
                    <td>08:45</td>
                    <td>09:00</td>
                    <td>09:05</td>
                </tr>
                <tr class="time 9">
                    <td>09:05</td>
                    <td>09:20</td>
                    <td>09:25</td>
                </tr>

                <tr class="time 9">
                    <td>09:25</td>
                    <td>09:40</td>
                    <td>09:45</td>
                </tr>
                <tr class="time 9">
                    <td>09:45</td>
                    <td>10:00</td>
                    <td>10:05</td>
                </tr>
                <tr class="time 10">
                    <td>10:05</td>
                    <td>10:20</td>
                    <td>10:25</td>
                </tr>
                <tr class="time 10">
                    <td>10:25</td>
                    <td>10:40</td>
                    <td>10:45</td>
                </tr>
                <tr class="time 10">
                    <td>10:45</td>
                    <td>11:00</td>
                    <td>11:05</td>
                </tr>
                <tr class="time 11">
                    <td>11:05</td>
                    <td>11:20</td>
                    <td>11:25</td>
                </tr>

                <tr class="time 11">
                    <td>11:25</td>
                    <td>11:40</td>
                    <td>11:45</td>
                </tr>
                <tr class="time 11">
                    <td>11:45</td>
                    <td>12:00</td>
                    <td>12:05</td>
                </tr>
                <tr class="time 12">
                    <td>12:05</td>
                    <td>12:20</td>
                    <td>12:25</td>
                </tr>
                <tr class="time 12">
                    <td>12:25</td>
                    <td>12:40</td>
                    <td>12:45</td>
                </tr>
                <tr class="time 12">
                    <td>12:45</td>
                    <td>13:00</td>
                    <td>13:05</td>
                </tr>
                <tr class="time 13">
                    <td>13:05</td>
                    <td>13:20</td>
                    <td>13:25</td>
                </tr>

                <tr class="time 13">
                    <td>13:25</td>
                    <td>13:40</td>
                    <td>13:45</td>
                </tr>
                <tr class="time 13">
                    <td>13:45</td>
                    <td>14:00</td>
                    <td>14:05</td>
                </tr>
                <tr class="time 14">
                    <td>14:05</td>
                    <td>14:20</td>
                    <td>14:25</td>
                </tr>
                <tr class="time 14">
                    <td>14:25</td>
                    <td>14:40</td>
                    <td>14:45</td>
                </tr>
                <tr class="time 14">
                    <td>14:45</td>
                    <td>15:00</td>
                    <td>15:05</td>
                </tr>
                <tr class="time 15">
                    <td>15:05</td>
                    <td>15:20</td>
                    <td>15:25</td>
                </tr>

                <tr class="time 15">
                    <td>15:25</td>
                    <td>15:40</td>
                    <td>15:45</td>
                </tr>
                <tr class="time 15">
                    <td>15:45</td>
                    <td>16:00</td>
                    <td>16:05</td>
                </tr>
                <tr class="time 16">
                    <td>16:05</td>
                    <td>16:20</td>
                    <td>16:25</td>
                </tr>
                <tr class="time 16">
                    <td>16:25</td>
                    <td>16:40</td>
                    <td>16:45</td>
                </tr>
                <tr class="time 16">
                    <td>16:45</td>
                    <td>17:00</td>
                    <td>17:05</td>
                </tr>
                <tr class="time 17">
                    <td>17:05</td>
                    <td>17:20</td>
                    <td>17:25</td>
                </tr>
                <tr class="time 17">
                    <td>17:25</td>
                    <td>17:40</td>
                    <td>17:45</td>
                </tr>
                <tr class="time 17">
                    <td>17:45</td>
                    <td>18:00</td>
                    <td>18:05</td>
                </tr>
                <tr class="time 18">
                    <td>18:05</td>
                    <td>18:20</td>
                    <td>18:25</td>
                </tr>
                <tr class="time 18">
                    <td>18:25</td>
                    <td>18:40</td>
                    <td>18:45</td>
                </tr>
                <tr class="time 18">
                    <td>18:45</td>
                    <td>19:00</td>
                    <td>19:05</td>
                </tr>
                <tr class="time 19">
                    <td>19:05</td>
                    <td>19:20</td>
                    <td>19:25</td>
                </tr>

                <tr class="time 19">
                    <td>19:25</td>
                    <td>19:40</td>
                    <td>19:45</td>
                </tr>
                <tr class="time 19">
                    <td>19:45</td>
                    <td>20:00</td>
                    <td>20:05</td>
                </tr>
                <tr class="time 20">
                    <td>20:05</td>
                    <td>20:20</td>
                    <td>20:25</td>
                </tr>
                <tr class="time 20">
                    <td>20:25</td>
                    <td>20:40</td>
                    <td>20:45</td>
                </tr>
                <tr class="time 20">
                    <td>20:45</td>
                    <td>21:00</td>
                    <td>21:05</td>
                </tr>
                <tr class="time 21">
                    <td>21:05</td>
                    <td>21:20</td>
                    <td>21:25</td>
                </tr>

                <tr class="time 21">
                    <td>21:25</td>
                    <td>21:40</td>
                    <td>21:45</td>
                </tr>
                <tr class="time 21">
                    <td>21:45</td>
                    <td>22:00</td>
                    <td>22:05</td>
                </tr>
                <tr class="time 22">
                    <td>22:05</td>
                    <td>22:20</td>
                    <td>22:25</td>
                </tr>
                <tr class="time 22">
                    <td>22:25</td>
                    <td>22:40</td>
                    <td>22:45</td>
                </tr>
                <tr class="time 22">
                    <td>22:45</td>
                    <td>23:00</td>
                    <td>23:05</td>
                </tr>
                <tr class="time 23">
                    <td>23:05</td>
                    <td>23:20</td>
                    <td>23:25</td>
                </tr>

                <tr class="time 23">
                    <td>23:25</td>
                    <td>23:40</td>
                    <td>23:45</td>
                </tr>
            </tbody>
        </table>
        <a href="#" class="layerPopClose btnPopClose">레이어 팝업 닫기</a>
    </div>
    <!-- //layerPopCont -->
</div>
<!-- //2018.09.03 운영 시간표 -->



<!-- DaumMap -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a9de64f8a5c63f5a51187b1bc584488&libraries=services,clusterer,drawing""></script>
<script>

		/* var myLatLng = {lat: 37.435241, lng: 126.456931}; */
		
		var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.4390836,126.4512017), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		setTimeout(function(){ map.relayout(); }, 10);
		

		/* // 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.4376122,126.4550957);  */
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.4363065,126.4567377); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		
</script>
		
</body>
</html>