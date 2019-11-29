package com.kh.hotelDelLuna.reservation.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		  
		if(page != null) { 
			currentPage = page; 
		} 
		
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Reservation> rlist = rService.selectResList(pi); 

		System.out.println(listCount);
		System.out.println(rlist);
		
		if(rlist!=null && rlist.size()>0) { // 게시글이 있다면
			mv.addObject("list", rlist);
			mv.addObject("pi",pi);

			mv.setViewName("reservation/entireResView");
			
		}else {
			throw new ReservationException("예약 리스트 조회 실패!");
		}
		
		return mv;

	}
	
	@RequestMapping(value = "searchResList.do", method = RequestMethod.GET)
	public ModelAndView searchResList(ModelAndView mv,HttpSession session,HttpServletRequest request, 
								@RequestParam(value = "page", required = false) Integer page,
								@RequestParam(value="searchCondition", required = false) String searchCondition,
								@RequestParam(value="searchValue", required = false) String searchValue) throws UnsupportedEncodingException {
		
		
		/*
		 * String searchCondition = request.getParameter("searchCondition"); String
		 * searchValue = request.getParameter("searchValue");
		 */
		Enumeration enums = request.getParameterNames();
		 
		 while(enums.hasMoreElements()) {
		 
		  String key = (String)enums.nextElement();
		  String value = request.getParameter(key);
		  System.out.println(key + " : " + value);
		 }


		
		ResSearchCondition sc = new ResSearchCondition();
		if(session.getAttribute("sc")!=null) {
			sc = (ResSearchCondition)session.getAttribute("sc");
			System.out.println("대입 완료");
		}else {
		
			if (searchCondition.equals("userEmail")) {
				sc.setUserEmail(searchValue);
			} else if (searchCondition.equals("userName")) {
				sc.setUserName(searchValue);
			} else if (searchCondition.equals("userPhone")) {
				sc.setUserPhone(searchValue);
			}
	
		}
		System.out.println("searchCondition : "+sc);
	
		int currentPage = 1;

		if(page!=null) {
			currentPage = page;
		}
		
		int listCount = rService.getSearchResultListCount(sc);
		System.out.println("검색 목록 갯수 : "+listCount);
	
		// Pagination의 getPageInfo 메소드로 currentPage, listCount 전달 후 PageInfo 객체 리턴
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		// ********* 2. 검색한 게시글을 DB조회해서 ArrayList에 담자
		ArrayList<Reservation> rlist = rService.selectSearchResultList(sc,pi);
		
		if(rlist!=null) {
			mv.addObject("list", rlist);
			mv.addObject("pi",pi);
			mv.addObject("searchCondition",searchCondition);
			mv.addObject("searchValue",searchValue);
			mv.setViewName("reservation/entireResView");
		}else {
			throw new ReservationException("검색한 예약 리스트 조회 실패!");
		}
		return mv;

	}
	@RequestMapping(value="resDetail.do")
	public ModelAndView resDetail(ModelAndView mv,
							@RequestParam(value = "res_no", required = false) int res_no) {
		
		Reservation reservation = rService.selectResOne(res_no);
		
		System.out.println("가져온 예약 상세 : "+reservation);
		if(reservation!=null) {
			mv.addObject("res",reservation);
			mv.setViewName("reservation/resDetailView");
		}else {
			throw new ReservationException("예약 상세 가져오기 실패!");
		}
		return mv;

	}
}
