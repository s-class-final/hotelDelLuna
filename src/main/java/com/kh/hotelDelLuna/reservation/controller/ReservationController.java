package com.kh.hotelDelLuna.reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.util.URLEncoder;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.member.model.service.MemberService;
import com.kh.hotelDelLuna.member.model.vo.Member;
import com.kh.hotelDelLuna.reservation.model.exception.ReservationException;
import com.kh.hotelDelLuna.reservation.model.service.ReservationService;
import com.kh.hotelDelLuna.reservation.model.vo.DateData;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Controller
public class ReservationController {

	@Autowired
	ReservationService rService;
	
	@Autowired
	MemberService mService;
	
	
	/********** 처음 예약 페이지 뿌려줄 때 **********/
	@RequestMapping(value = "entireResList.do", method = RequestMethod.GET)
	public ModelAndView entireResList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}
		
		
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Reservation> rlist = rService.selectResList(pi);

		ArrayList <RoomType> roomList = rService.selectRoomList();
		//룸타입과 타입별 개수 한번에 받기

		if (rlist != null && rlist.size() > 0) { // 게시글이 있다면
			mv.addObject("list", rlist);
			mv.addObject("pi", pi);
			mv.addObject("roomList",roomList);
			
			mv.setViewName("reservation/tabResMenu");
		
		} else {
			throw new ReservationException("예약 리스트 조회 실패!");
		}

		return mv;
		
	}

	/********** 예약 상세 보기 **********/
	

	@RequestMapping(value = "resDetail.do")
	public ModelAndView resDetail(ModelAndView mv, @RequestParam(value = "res_no", required = false) int res_no) {

		Reservation res = rService.selectResOne(res_no);
		
		/****** 객실 타입에 해당하는 사진 가져오기 ******/
		String fileName = rService.getRoomFileName(res.getRes_roomType());
		
		System.out.println(fileName);
		System.out.println("가져온 예약 상세 : " + res);
		
		/*** 룸타입 정보를 가져오자 ***/
		RoomType roomType = rService.getRoomType(res.getRes_roomType());	
		
		if (res != null) {
			mv.addObject("res", res);
			mv.addObject("fileName",fileName);
			mv.addObject("roomType",roomType);
			mv.setViewName("reservation/resDetailView");
		} else {
			throw new ReservationException("예약 상세 가져오기 실패!");
		}
		
		return mv;

	}
	/********** 캘린더로 예약목록 보기 **********/

	@RequestMapping(value = "calendarResList.do")
	public ModelAndView calendarResList(ModelAndView mv) {

		mv.setViewName("reservation/calendarResView");
		return mv;

	}
	
	/********** 테이블에 뿌려줄 예약목록 가져오기 **********/
	@RequestMapping("rList.do")
	@ResponseBody
	public void getResList(HttpServletResponse response, HttpSession session, int page)
			throws JsonIOException, IOException {

		response.setContentType("application/json;charset=utf-8");

		int listCount;
		ResSearchCondition sc = new ResSearchCondition();
		
		/** 검색 값이 있었다면!! **/
		if (session.getAttribute("sc") != null) {
			sc= (ResSearchCondition)session.getAttribute("sc");

			System.out.println("sc의 값 : " + sc);
			listCount = rService.getSearchResultListCount(sc);
		
		/** 검색 값이 없으면!! **/
		} else {
			listCount = rService.getListCount();
		}
		
		PageInfo pi = Pagination.getPageInfo(page, listCount);
		ArrayList<Reservation> rList;
		/** 검색 값이 있었다면!! **/
		if (sc != null) {
			rList = rService.selectSearchResultList(sc, pi);
		/** 검색 값이 없으면!! **/
		} else {
			System.out.println("여기 실행되긴함???");
			rList = rService.selectResList(pi);
		}
		
		System.out.println("sc에 들어간 정렬값 : "+sc.getSort_no());
		System.out.println(rList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());

	}

	/********** 페이징 목록 가져오기 **********/
	@RequestMapping("rPage.do")
	@ResponseBody
	public void getResPage(HttpServletResponse response, HttpSession session, int page, String searchCondition,
			String searchValue,Integer sort_no,boolean search) throws JsonIOException, IOException {

		response.setContentType("application/json;charset=utf-8");
		/*
		 * for(Reply r : rList) { r.setrContent(r.getrContent(),"utf-8"); }
		 */
		ResSearchCondition sc = new ResSearchCondition();
		int listCount;
		
		
		 System.out.println("넘어온 searchCondition : " + searchCondition);
		 System.out.println("넘어온 searchValue : "+searchValue);
		 System.out.println("검색여부 : "+search);
		 System.out.println("정렬여부 : "+sort_no);
		 
		 //********** 검색했을 때  *********//
		 if(sort_no!=null) {
			 sc.setSort_no(sort_no);
		 }
		 if (search) {
			System.out.println("검색 했을 때");
			session.removeAttribute("sc");
			 //********** 검색 값이 있을 때!!!!  **********//
			if (searchCondition != null && searchValue != null && !searchCondition.isEmpty()
					&& !searchValue.isEmpty()) {
				System.out.println("검색 값이 있을 때 !!!!");
				sc = checkSearch(searchCondition, searchValue);
				listCount = rService.getSearchResultListCount(sc);
				session.setAttribute("sc", sc);
			//********** 검색 값이 없을 때!!!! **********//
			}else {
				System.out.println("검색 했지만 제대로 된 값으로 검색한게 아닐 때 !!!!");
				listCount = rService.getListCount();
			}
			//********** 검색 안했을 때 **********//
		} else {
			// 검색한 내용이있다면!!!!
			if (session.getAttribute("sc") != null) {
				System.out.println("세션이 비어있지 않을 때");
				sc = (ResSearchCondition) session.getAttribute("sc");
				if(sort_no!=null) {
					sc.setSort_no(sort_no);
				}
				listCount = rService.getSearchResultListCount(sc);
			} else {
				
				System.out.println("첫 검색!");
				if(sort_no==null) {
					System.out.println("세션 삭제!!!!!!");
					session.removeAttribute("sc");
				}else {
					System.out.println("세션에 정렬값 넣음!!");
					session.setAttribute("sc", sc);
				}
				listCount = rService.getListCount();
			}
		}

		PageInfo pi = Pagination.getPageInfo(page, listCount);

		System.out.println(listCount);
		System.out.println(pi);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pi, response.getWriter());
	}

	
	/********** 예약 내역 생성하기 
	 * @throws IOException **********/
	
	@RequestMapping(value = "resInsert.do")
	public void resInsert(HttpServletResponse response,Reservation res,
			@RequestParam(value = "userName1", required = false) String userName1,
			@RequestParam(value = "userName2", required = false) String userName2,			
			@RequestParam(value = "email1", required = false) String email1,
			@RequestParam(value = "email2", required = false) String email2,
			@RequestParam(value = "phone1", required = false) String phone1,
			@RequestParam(value = "phone2", required = false) String phone2,
			@RequestParam(value = "phone3", required = false) String phone3,
			@RequestParam(value = "checkInOut", required = false) String checkInOut) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

    	PrintWriter out = response.getWriter();

		// 아이디 합치기
		res.setRes_userId(email1 + '@' + email2);
		// 이름 합치기
		res.setRes_userName(userName1 + " "+userName2);	
		// 휴대폰 번호 합치기
		String userPhone = phone1 + "-"  + phone2 + "-"  + phone3;	
		Member m = new Member(email1+'@'+email2,userName1 +" "+userName2,userPhone);
		
		res = settingDate(res,checkInOut);

		
		/*********** 체크인 - 체크아웃 일자 차이 구함! 2일,3일 등등 **************/
		
		String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
		long diffDay = 0;
		java.util.Date startDate = new java.util.Date();
		// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		try {
			startDate = sdf.parse(res.getRes_checkIn().toString());
			java.util.Date endDate = sdf.parse(res.getRes_checkOut().toString());

			// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
			diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println(diffDay + "일");

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		//룸타입과 타입별 개수 한번에 받기
		List<Map<String, Object>> roomList = rService.getRoomList();
		System.out.println("룸타입과 개수 동시 : "+roomList);
		int ftotalCount = searchRoomTypeCount(res.getRes_roomType(),roomList);
	
		java.sql.Date checkIn = new java.sql.Date(4); // 의미없는 초기화
		boolean checkDate = true;
		
		
		// 식사 값 계산
        int totalPay = calTotalMeal(res);

        // 룸타입 요금 받아오기
        RoomType roomType = rService.getRoomType(res.getRes_roomType()); 
        
        
		for(int i=0;i<diffDay;i++) {
			
		    // 날짜 일수만큼 더해오는 함수
			checkIn = addDate(startDate,i);
			 
            Reservation searchRes = new Reservation();

            searchRes.setRes_checkIn(checkIn);
            searchRes.setRes_roomType(res.getRes_roomType());
            // 체크인 날짜. 룸타입으로 roomStatus테이블에서 검색.
            int resRoomCount = rService.getResRoomCount(searchRes);
           
            // 룸타입 총 개수 - 해당날짜 룸타입 개수 . 0일 시 브레이크 하고 예약 입력 취소
            if(ftotalCount-resRoomCount<=0) {
            	     
        		checkDate = false;
        		break;
            }

            
            // 주말 요금
            if(checkIn.getDay()==0||checkIn.getDay()==6) {
            	totalPay += roomType.getWeekEnd();
            }else { // 평일 요금
            	totalPay += roomType.getWeekDay();
            }
           
		}
		
		if(checkDate) {
			// 계산된 요금 합산
			res.setRes_allPay(totalPay);
			System.out.println("예약 내역의 총 요금 "+totalPay);
			
			// 1_1. 예약자 아이디가 회원에 있는지 확인!
			Member member = mService.findMember(m);		

			
			int mInsert=1;
			int result;
			// 2. 예약자 아이디가 회원,비회원에 없으면 비회원 테이블에 예약자 정보 삽입
			
			if(member==null){
				mInsert = mService.insertNonMember(m);
			}

			// 3. 예약 내역 생성
			if(mInsert>0) {
				result = rService.resInsert(res);
				int res_no = rService.getResNo(res);
				res.setRes_no(res_no);
				
	    		for(int i=0;i<diffDay;i++) {
	    			checkIn = addDate(startDate,i);

		            res.setRes_checkIn(checkIn);
		            result= rService.resRoomStatusInsert(res);
	    		}
	    		
				System.out.println("됐나? :"+result);
				if(result>0) {
					System.out.println("예약 생성 성공!");
					out.println("<script>alert('예약 내역 생성 성공!');location.href='entireResList.do'; </script>");
	        		out.flush();
				}else {
					throw new ReservationException("예약 내역 생성 실패!");
				}
			}else {
				throw new ReservationException("예약 내역 생성할 비회원 정보 생성 실패!");
			}

		}else {
    		out.println("<script>alert('해당 "+ checkIn +" 날짜의 예약하려는 룸이 가득찼습니다.');location.href='entireResList.do'; </script>");
    		out.flush();
		}
	
	}
	

	/********** 생성할 예약내역 유저 검사 **********/
	@RequestMapping(value = "resIdCheck.do")
	public void resIdCheck(HttpServletResponse response, HttpSession session,String userId)
			throws JsonIOException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		System.out.println(userId);
		
		Member m = new Member(userId);
		
		// 아이디 찾기
		Member member = mService.findMember(m);
		
		Gson gson = new Gson();

		if(member!=null) {
			gson.toJson(member, response.getWriter());
		}else {
			response.getWriter().print(false);
		}
		

	}

	
	/********** 예약 내역 삭제하기 **********/
	@RequestMapping(value = "resDelete.do")
	public ModelAndView resDelete(ModelAndView mv, @RequestParam(value = "res_no", required = false) String res_no, HttpSession session) {

		System.out.println("넘어온 res_no : "+res_no);
		
		int resNo = Integer.valueOf(res_no);
		int result = rService.resDelete(resNo);
		
		// 해당 예약번호로 roomstatus검색 후 전부 삭제.
		int dResult = rService.roomStatusDelete(resNo);
		
		if(result>0 && dResult>0) {
			System.out.println("예약 내역 삭제 성공!");
		}else {
			throw new ReservationException("예약 내역 삭제 실패!!");
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser.getUserT() == 2) {
			mv.setView(new RedirectView("entireResList.do"));
		}else {
			mv.setView(new RedirectView("mmyres.do"));
		}
		return mv;

	}
	
	
	/********** 예약 내역 수정 
	 * @throws IOException **********/
	@RequestMapping(value = "resModify.do")
	public void resModify(HttpServletResponse response,Reservation res,
			@RequestParam(value = "checkInOut", required = false) String checkInOut) throws IOException {
		
		res = settingDate(res,checkInOut);

		System.out.println("수정될 정보 : "+res);
			
		Reservation nowRes = rService.selectResOne(res.getRes_no());
		
		System.out.println("바꿀 예약찍어본다 : "+nowRes);
		// roomStatus 테이블의 예약 상황도 변경!!!, 같은 예약 번호를 찾아 삭제 후 다시 생성하자.
		// 날짜 변경
			

		String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
		long diffDay = 0;
		java.util.Date startDate = new java.util.Date();
		// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		try {
			startDate = sdf.parse(res.getRes_checkIn().toString());
			java.util.Date endDate = sdf.parse(res.getRes_checkOut().toString());

			// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
			diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println(diffDay + "일");

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		//룸타입과 타입별 개수 한번에 받기
		List<Map<String, Object>> roomList = rService.getRoomList();
		System.out.println("룸타입과 개수 동시 : "+roomList);
		int ftotalCount = searchRoomTypeCount(nowRes.getRes_roomType(),roomList);

		
		java.sql.Date checkIn = new java.sql.Date(4);	
		boolean checkDate = true;
			
		// 식사 값 계산
        int totalPay = calTotalMeal(res);

        // 룸타입 요금 받아오기
        RoomType roomType = rService.getRoomType(nowRes.getRes_roomType()); 
	
        
		for(int i=0;i<diffDay;i++) {
			
			checkIn = addDate(startDate,i);

            Reservation searchRes = new Reservation();
            searchRes.setRes_checkIn(checkIn);
            searchRes.setRes_roomType(nowRes.getRes_roomType());
            // 체크인 날짜. 룸타입으로 roomStatus테이블에서 검색.
            int resRoomCount = rService.getResRoomCount(searchRes);
            System.out.println(i+"번째 : "+resRoomCount);
            // 룸타입 총 개수 - 해당날짜 룸타입 개수 . 0일 시 브레이크 하고 예약 입력 취소
            System.out.println("방 개수 빼기 : "+(ftotalCount - resRoomCount));
            if(ftotalCount-resRoomCount<=0) {
            	     
        		checkDate = false;
        		break;
            }
            
            // 주말 요금
            if(checkIn.getDay()==0||checkIn.getDay()==6) {
            	totalPay += roomType.getWeekEnd();
            }else { // 평일 요금
            	totalPay += roomType.getWeekDay();
            }
           
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(checkDate) {
			// 요금 다시 수정해서 update!
			res.setRes_allPay(totalPay);
			int result = rService.resModify(res);
			
			res.setRes_roomType(nowRes.getRes_roomType());
			// 일단 배정상태에서 삭제
			int dResult = rService.roomStatusDelete(nowRes.getRes_no());
			int iResult=0;
			
    		for(int i=0;i<diffDay;i++) {
    			checkIn = addDate(startDate,i);

	            res.setRes_checkIn(checkIn);
	            iResult= rService.resRoomStatusInsert(res);
    		}
    		
			
			if(result>0&&dResult>0&&iResult>0) {
				
				out.println("<script>alert('예약 내역이 수정되었습니다'); location.href='entireResList.do';</script>");
				out.flush();
			}else {
				throw new ReservationException("예약 내역 수정 실패!!");
			}
			
		}else {
			out.println("<script>alert('수정하려는 날짜에 방이 가득 찼습니다.'); location.href='entireResList.do';</script>");

		}
		

	
		

	} 
	
	/******* ajax로 총액 재계산 하기 *********/

	@RequestMapping(value = "reCalRes.do")
	@ResponseBody

	public void reCalRes(HttpServletResponse response,HttpServletRequest request,Reservation res,
			@RequestParam(value = "checkInOut", required = false) String checkInOut) throws IOException {
		

		checkAllRequest(request);
		response.setContentType("text/html; charset=UTF-8");

		////
		res = settingDate(res,checkInOut);
		
		System.out.println("들어와잇나?:" +res);
		// 식사 값 계산
        int totalPay = calTotalMeal(res);
        
        //////
        // 룸타입 요금 받아오기
        RoomType roomType = rService.getRoomType(res.getRes_roomType()); 
		
        
		String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
		long diffDay = 0;
		java.util.Date startDate = new java.util.Date();
		// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		try {
			startDate = sdf.parse(res.getRes_checkIn().toString());
			java.util.Date endDate = sdf.parse(res.getRes_checkOut().toString());

			// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
			diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
			System.out.println(diffDay + "일");

		} catch (ParseException e) {
			e.printStackTrace();
		
		}
		
		//룸타입과 타입별 개수 한번에 받기
		List<Map<String, Object>> roomList = rService.getRoomList();
		
		int ftotalCount = searchRoomTypeCount(res.getRes_roomType(),roomList);

		/////////////
		java.sql.Date checkIn = new java.sql.Date(4);	
		boolean checkDate = true;
		
		
		for(int i=0;i<diffDay;i++) {
			
			checkIn = addDate(startDate,i);

            Reservation searchRes = new Reservation();
           
            searchRes.setRes_checkIn(checkIn);
            searchRes.setRes_roomType(res.getRes_roomType());
            // 체크인 날짜. 룸타입으로 roomStatus테이블에서 검색.
            int resRoomCount = rService.getResRoomCount(searchRes);

            System.out.println("룸 총개수 : "+ftotalCount);
            System.out.println("남은 개수 : "+resRoomCount);
            System.out.println("뺴면? : "+(ftotalCount-resRoomCount));
            // 룸타입 총 개수 - 해당날짜 룸타입 개수 . 0일 시 브레이크 하고 예약 입력 취소
            if(ftotalCount-resRoomCount<=0) {
            	     
        		checkDate = false;
        		break;
            }
            
            // 주말 요금
            if(checkIn.getDay()==0||checkIn.getDay()==6) {
            	totalPay += roomType.getWeekEnd();
            }else { // 평일 요금
            	totalPay += roomType.getWeekDay();
            }
           
		}
		/////////////

        
        //////
		////

		if(checkDate) {
			res.setRes_allPay(totalPay);
			
			// 총액, 적립 포인트 계산
			System.out.println("계산한 총액 : "+totalPay);
			System.out.println("적립예상 포인트 : "+(int)(totalPay*0.01));
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(res,response.getWriter());
			
		}else {
			
		}
	} 
	
	/******* 달력으로 예약내역 불러오기 *********/

	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public void calendar(ModelAndView mv,HttpServletResponse response, HttpServletRequest request, DateData dateData,
			boolean type) throws JsonIOException, IOException{
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		System.out.println("전달된 year month"+dateData);
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, "before_date");
			dateList.add(calendarData);
		}
		

		// 날짜
		// today_info.get("search_year") , today_info.get("search_month") , i
		String date = today_info.get("search_year")+"";
		if( today_info.get("search_month")<10) {
			date += "0"+today_info.get("search_month");
		}else {
			date += today_info.get("search_month")+"";		
		}

		String yearMonth = date;
		
		//날짜 삽입
		
		
		// 해당 날짜에 남아있는 방 개수를 구해야함
		int superiorRoom = rService.getRoomCount("SUPERIOR");
		int deluxeRoom = rService.getRoomCount("DELUXE");
		int suiteRoom = rService.getRoomCount("SUITE");

		int totalRoomCount = superiorRoom+deluxeRoom+suiteRoom;
		
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			date = yearMonth;
			if(i<10) {
				date += "0"+i;
			}else {
				date += i+"";
			}
			
			// 날짜와 방 종류별 예약된 개수
			int superiorCount = rService.getSuperiorResCount(date);
			int deluxeCount = rService.getDeluxeResCount(date);
			int suiteCount = rService.getSuiteResCount(date);
			
			// 날짜별 예약된 방의 총 개수
			int resRoomCount = superiorCount+ deluxeCount+ suiteCount;
			
			// System.out.println(date + "의 예약된 방 : "+ resRoomCount);
			
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), 
						String.valueOf(dateData.getMonth()), String.valueOf(i), 
						"today",totalRoomCount-resRoomCount,superiorRoom,deluxeRoom,suiteRoom,superiorCount,deluxeCount,suiteCount);
			}else if(i<today_info.get("today")) {
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "before_date");
			}else if(today_info.get("today")==-1) {
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "before_date");
			}else{
		
				calendarData= new DateData(String.valueOf(dateData.getYear()),
						String.valueOf(dateData.getMonth()), String.valueOf(i), 
						"normal_date",totalRoomCount-resRoomCount,superiorRoom,deluxeRoom,suiteRoom,superiorCount,deluxeCount,suiteCount);
			}
			
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, "before_date");
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		System.out.println(type);
		System.out.println(today_info);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		if(type==false) {
			gson.toJson(today_info, response.getWriter());			
		}else {
			gson.toJson(dateList,response.getWriter());
		}
		 
	}
	
	
	/******* 예약 내역 입금 완료로 변경 
	 * @throws IOException *********/
		@RequestMapping(value = "payStatusCheck.do")
		public void payStatusCheck(ModelAndView mv,HttpServletResponse response,
				@RequestParam(value = "res_no", required = false) int res_no) throws IOException {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			System.out.println("예약번호 : "+res_no);
			
			int result = rService.payStatusCheck(res_no);
			
			// 결제 테이블에 내역 생성해주자
			
			
			
			if(result>0) {
				out.println("<script>alert('입금 완료 처리 되었습니다'); location.href='entireResList.do';</script>");

				out.flush();
			}else {
				throw new ReservationException("입금 완료 처리 실패!!");
			}
			
		}
	
	
	
	/**** 날짜 더해서 반환 ****/
		private Date addDate(java.util.Date startDate, int i) {
        
        String strFormat = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(strFormat);

		Calendar cal = Calendar.getInstance();
        
        cal.setTime(startDate);
        cal.add(Calendar.DATE, i);

        String strResult = sdf.format(cal.getTime());
        java.sql.Date checkIn = new java.sql.Date(Date.valueOf(strResult).getTime());
        
        return checkIn;
	}
	
	
	/******* 날짜 데이터 재구성 *******/
	public Reservation settingDate(Reservation res,String checkInOut) {
	    
		checkInOut = checkInOut.replace(".", "-");
		String str_checkIn = checkInOut.substring(0,checkInOut.indexOf(" "));
		String str_checkOut = checkInOut.substring(checkInOut.lastIndexOf(" ")+1);
		Date checkIn = new Date(Date.valueOf(str_checkIn).getTime());
		Date checkOut = new Date(Date.valueOf(str_checkOut).getTime());
		
		res.setRes_checkIn(checkIn);
		res.setRes_checkOut(checkOut);
		
		return res;
	}
	
	
	/******* 검색 필터 ********/
	public ResSearchCondition checkSearch(String searchCondition, String searchValue) {

		ResSearchCondition sc = new ResSearchCondition();

		if (searchCondition.equals("userId")) {
			sc.setUserId(searchValue);
		} else if (searchCondition.equals("userName")) {
			sc.setUserName(searchValue);
		} else if (searchCondition.equals("userPhone")) {
			sc.setUserPhone(searchValue);
		}
		return sc;
	}
	
	
	/***** 식사값 계산 *****/
	public int calTotalMeal(Reservation res) {
		
		int totalPay=0;
		int breakfast= 18000;
		int dinner = 25000;
		
		// 성인 조식 디너 계산
		totalPay += Integer.valueOf(res.getRes_adult())* res.getRes_breakfast() *breakfast;
		totalPay += Integer.valueOf(res.getRes_adult())* res.getRes_dinner() *dinner;
		
		// 유아 조식 디너 계산..
		totalPay += Integer.valueOf(res.getRes_child())* res.getRes_breakfast() *breakfast;
		totalPay += Integer.valueOf(res.getRes_child())* res.getRes_dinner() *dinner;
				
		System.out.println("방 요금 계산 전 요금 : "+totalPay);
		
		return totalPay;
	}
	
	/******** 특정 룸타입의 총 개수 ********/
	public int searchRoomTypeCount(String roomType,List<Map<String, Object>> roomList){
		
		int ftotalCount=0;
		for(int i=0;i<roomList.size();i++){
			if(roomList.get(i).get("ROOMTYPE").equals(roomType)) {
				System.out.println(roomType+"의 개수 : "+roomList.get(i).get("COUNT"));
				ftotalCount = Integer.valueOf(String.valueOf(roomList.get(i).get("COUNT")));
				break;
			}
		}
		
		return ftotalCount;
	}
	
	
	/********** 넘어온 리퀘스트 전부 체크 ************/
	public void checkAllRequest(HttpServletRequest request) {
		//날짜, 성인, 유아
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		System.out.println("----------------------------");

		
	}
}
