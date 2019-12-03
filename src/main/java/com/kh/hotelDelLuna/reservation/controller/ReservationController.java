package com.kh.hotelDelLuna.reservation.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.reservation.model.exception.ReservationException;
import com.kh.hotelDelLuna.reservation.model.service.ReservationService;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	ReservationService rService;

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

	@RequestMapping(value = "searchResList.do", method = RequestMethod.GET)
	public ModelAndView searchResList(ModelAndView mv, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchValue", required = false) String searchValue)
			throws UnsupportedEncodingException {

		/*
		 * String searchCondition = request.getParameter("searchCondition"); String
		 * searchValue = request.getParameter("searchValue");
		 */
		Enumeration enums = request.getParameterNames();

		while (enums.hasMoreElements()) {

			String key = (String) enums.nextElement();
			String value = request.getParameter(key);
			System.out.println(key + " : " + value);
		}

		ResSearchCondition sc = new ResSearchCondition();
		if (session.getAttribute("sc") != null) {
			sc = (ResSearchCondition) session.getAttribute("sc");
			System.out.println("대입 완료");
		} else {

			if (searchCondition.equals("userEmail")) {
				sc.setUserEmail(searchValue);
			} else if (searchCondition.equals("userName")) {
				sc.setUserName(searchValue);
			} else if (searchCondition.equals("userPhone")) {
				sc.setUserPhone(searchValue);
			}

		}
		System.out.println("searchCondition : " + sc);

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = rService.getSearchResultListCount(sc);
		System.out.println("검색 목록 갯수 : " + listCount);

		// Pagination의 getPageInfo 메소드로 currentPage, listCount 전달 후 PageInfo 객체 리턴
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// ********* 2. 검색한 게시글을 DB조회해서 ArrayList에 담자
		ArrayList<Reservation> rlist = rService.selectSearchResultList(sc, pi);

		if (rlist != null) {
			mv.addObject("list", rlist);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("reservation/entireResView");
		} else {
			throw new ReservationException("검색한 예약 리스트 조회 실패!");
		}
		return mv;

	}

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

	@RequestMapping(value = "calendarResList.do")
	public ModelAndView calendarResList(ModelAndView mv) {

		mv.setViewName("reservation/calendarResView");
		return mv;

	}

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
			listCount = rService.getSearchResultListCount(sc);
			/** 검색 값이 없으면!! **/
		} else {
			listCount = rService.getListCount();
		}

		PageInfo pi = Pagination.getPageInfo(page, listCount);
		/** 검색 값이 있었다면!! **/
		ArrayList<Reservation> rList;
		if (sc != null) {
			rList = rService.selectSearchResultList(sc, pi);
			/** 검색 값이 없으면!! **/
		} else {
			rList = rService.selectResList(pi);
		}

		System.out.println(listCount);
		System.out.println(rList);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());

	}

	@RequestMapping("rPage.do")
	@ResponseBody
	public void getResPage(HttpServletResponse response, HttpSession session, int page, String searchCondition,
			String searchValue,boolean search) throws JsonIOException, IOException {

		response.setContentType("application/json;charset=utf-8");
		/*
		 * for(Reply r : rList) { r.setrContent(r.getrContent(),"utf-8"); }
		 */
		ResSearchCondition sc = new ResSearchCondition();
		int listCount;
		
		
		 System.out.println("넘어온 searchCondition : " + searchCondition);
		 System.out.println("넘어온 searchValue : "+searchValue);
		 System.out.println("검색여부 : "+search);
		
		 //********** 검색했을 때  *********//	
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
				listCount = rService.getSearchResultListCount(sc);
			} else {

				System.out.println("첫 검색!");
				session.removeAttribute("sc");
				listCount = rService.getListCount();
			}
		}
	


		PageInfo pi = Pagination.getPageInfo(page, listCount);

		System.out.println(listCount);
		System.out.println(pi);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pi, response.getWriter());
	}

	public ResSearchCondition checkSearch(String searchCondition, String searchValue) {

		ResSearchCondition sc = new ResSearchCondition();

		if (searchCondition.equals("userEmail")) {
			sc.setUserEmail(searchValue);
		} else if (searchCondition.equals("userName")) {
			sc.setUserName(searchValue);
		} else if (searchCondition.equals("userPhone")) {
			sc.setUserPhone(searchValue);
		}
		return sc;
	}
}
