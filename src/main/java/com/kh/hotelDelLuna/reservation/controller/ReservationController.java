package com.kh.hotelDelLuna.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

		System.out.println(listCount);
		System.out.println(rlist);

		if (rlist != null && rlist.size() > 0) { // 게시글이 있다면
			mv.addObject("list", rlist);
			mv.addObject("pi", pi);

			mv.setViewName("reservation/tabResMenu");
		
		} else {
			throw new ReservationException("예약 리스트 조회 실패!");
		}

		return mv;
		
	}

	/********** 예약 상세 보기 **********/
	
	@RequestMapping(value = "resDetail.do")
	public ModelAndView resDetail(ModelAndView mv, @RequestParam(value = "res_no", required = false) int res_no) {

		Reservation reservation = rService.selectResOne(res_no);

		System.out.println("가져온 예약 상세 : " + reservation);
		if (reservation != null) {
			mv.addObject("res", reservation);
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
		/*
		 * for(Reply r : rList) { r.setrContent(r.getrContent(),"utf-8"); }
		 */
		/*
		 * System.out.println("세션의 컨디션 : "+session.getAttribute("searchCondition"));
		 * System.out.println("세션의 검색값 : "+session.getAttribute("searchValue"));
		 */

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
			System.out.println("검색값이 있다고 친다고???");
			rList = rService.selectSearchResultList(sc, pi);
		/** 검색 값이 없으면!! **/
		} else {
			System.out.println("여기 실행되긴함???");
			rList = rService.selectResList(pi);
		}
		
		System.out.println("sc에 들어간 정렬값 : "+sc.getSort_no());
		System.out.println(listCount);

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

	
	/********** 예약 내역 생성하기 **********/
	
	@RequestMapping(value = "resInsert.do")
	public ModelAndView resInsert(ModelAndView mv,Reservation res,
			@RequestParam(value = "userName1", required = false) String userName1,
			@RequestParam(value = "userName2", required = false) String userName2,			
			@RequestParam(value = "email1", required = false) String email1,
			@RequestParam(value = "email2", required = false) String email2,
			@RequestParam(value = "phone1", required = false) String phone1,
			@RequestParam(value = "phone2", required = false) String phone2,
			@RequestParam(value = "phone3", required = false) String phone3,
			@RequestParam(value = "checkInOut", required = false) String checkInOut) {


		System.out.println("넘어온 값: "+checkInOut);
		System.out.println("넘어온 값: "+res);
		
		
		// 아이디 합치기
		res.setRes_userId(email1 + '@' + email2);
		// 이름 합치기
		res.setRes_userName(userName1 + " "+userName2);
		
		// 휴대폰 번호 합치기
		String userPhone = phone1 + "-"  + phone2 + "-"  + phone3;
		
		Member m = new Member(email1+'@'+email2,userName1 +" "+userName2,userPhone);
		
		res = settingDate(res,checkInOut);

		System.out.println(res);
		// 1_1. 예약자 아이디가 회원에 있는지 확인!
		Member member = mService.findUser(m);
		// 1_2. 예약자 아이디가 비회원에 있는지 확인!
		/*
		 * if(member==null) {
		 * 
		 * }
		 */
		
		int mInsert=1;
		int result;
		// 2. 예약자 아이디가 회원,비회원에 없으면 비회원 테이블에 예약자 정보 삽입
		
		if(member==null){
			mInsert = mService.insertKMember(m);
		}
		
		
		// 3. 예약 내역 생성
		if(mInsert>0) {
			result = rService.resInsert(res);
			
			if(result>0) {
				System.out.println("예약 삽입 성공!");
			}else {
				throw new ReservationException("예약 내역 생성 실패!");
			}
		}else {
			throw new ReservationException("예약 내역 생성할 비회원 정보 생성 실패!");
		}


		mv.setView(new RedirectView("entireResList.do"));
		return mv;
	}
	
	/********** 생성할 예약내역 유저 검사 **********/
	@RequestMapping(value = "resIdCheck.do")
	public void resIdCheck(HttpServletResponse response, HttpSession session,String userId)
			throws JsonIOException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		System.out.println(userId);
		
		Member m = new Member(userId);
		
		// 아이디 찾기
		Member member = mService.findUser(m);
		Gson gson = new Gson();

		if(member!=null) {
			gson.toJson(member, response.getWriter());
		}else {
			response.getWriter().print(false);
		}
		

	}

	
	/********** 예약 내역 삭제하기 **********/
	@RequestMapping(value = "resDelete.do")
	public ModelAndView resDelete(ModelAndView mv, @RequestParam(value = "res_no", required = false) String res_no) {

		System.out.println("넘어온 res_no : "+res_no);
		
		int resNo = Integer.valueOf(res_no);
		int result = rService.resDelete(resNo);
		if(result>0) {
			System.out.println("예약 내역 삭제 성공!");
		}else {
			throw new ReservationException("예약 내역 삭제 실패!!");
		}

		mv.setView(new RedirectView("entireResList.do"));
		return mv;

	}
	
	
	/********** 예약 내역 수정 **********/
	@RequestMapping(value = "resModify.do")
	public ModelAndView resModify(ModelAndView mv,Reservation res,
			@RequestParam(value = "checkInOut", required = false) String checkInOut) {
		
		res = settingDate(res,checkInOut);

		System.out.println(res);
		
		int result = rService.resModify(res);
		
		if(result>0) {
			mv.addObject("res_no", res.getRes_no());
			mv.setView(new RedirectView("resDetail.do"));
		}else {
			throw new ReservationException("예약 내역 수정 실패!!");
		}
		return mv;

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
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else if(i<today_info.get("today")) {
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "before_date");
			}else if(today_info.get("today")==-1) {
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "before_date");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
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
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		if(type==false) {
			gson.toJson(today_info, response.getWriter());			
		}else {
			gson.toJson(dateList,response.getWriter());
		}
		 
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
}
