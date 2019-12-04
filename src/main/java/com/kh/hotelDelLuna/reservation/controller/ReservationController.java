package com.kh.hotelDelLuna.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

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
