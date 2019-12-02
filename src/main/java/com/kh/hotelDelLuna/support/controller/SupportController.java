package com.kh.hotelDelLuna.support.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SupportController {
	
	//사용자 예약페이지 이동
	@RequestMapping(value="entireResListGuest.do", method = RequestMethod.GET)
	public String entireResListGuest(Locale locale, Model model) {
		System.out.println("entireResListGuest서블릿 실행");
		return "support/entireResListGuest";
	}
	
	
	//소개 호텔소개 이동
	@RequestMapping(value="hotelDelLunar.do", method = RequestMethod.GET)
	public String hotelDelLunar(Model model, String room) {
		System.out.println("location서블릿 실행");
		return "support/hotelDelLunar";
	}
	
	//소개 오시는길 이동
	@RequestMapping(value="location.do", method = RequestMethod.GET)
	public String location(Model model, String room) {
		System.out.println("location서블릿 실행");
		return "support/location";
	}
	
	//호텔 룸 오버뷰 이동
	@RequestMapping(value="overView.do", method = RequestMethod.GET)
	public String overView(Locale locale, Model model) {
		System.out.println("overView서블릿 실행");
		return "support/overView";
	}
	
	//호텔 룸 상세보기 이동
	@RequestMapping(value="roomView.do", method = RequestMethod.GET)
	public String roomView(Model model, String room) {
		System.out.println("roomView서블릿 실행");
		return "support/roomView";
	}
	
	
	
	
	//다이닝 전체 이동
	@RequestMapping(value="dining.do", method = RequestMethod.GET)
	public String dining(Model model, String room) {
		System.out.println("dining서블릿 실행");
		return "support/dining";
	}
	
	
	//다이닝 레스토랑 이동
	@RequestMapping(value="restaurant.do", method = RequestMethod.GET)
	public String restaurant(Model model, String room) {
		System.out.println("restaurant서블릿 실행");
		return "support/restaurant";
	}
	
	//다이닝 카페 이동
	@RequestMapping(value="cafe.do", method = RequestMethod.GET)
	public String cafe(Model model, String room) {
		System.out.println("cafe서블릿 실행");
		return "support/cafe";
	}
		
		

	//고객센터 공지사항 이동
	@RequestMapping(value="notice.do", method = RequestMethod.GET)
	public String notice(Model model, String room) {
		System.out.println("notice서블릿 실행");
		return "support/notice";
	}
	
	//고객센터 공지사항 이동
	@RequestMapping(value="voc.do", method = RequestMethod.GET)
	public String voc(Model model, String room) {
		System.out.println("notice서블릿 실행");
		return "support/voc";
	}
}
