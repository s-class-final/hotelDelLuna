package com.kh.hotelDelLuna.front.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.hotelDelLuna.front.model.service.SupportService;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	//사용자 예약페이지 이동
	@RequestMapping(value="entireResListGuest.do", method = RequestMethod.GET)
	public String entireResListGuest(Locale locale, Model model) {
		System.out.println("entireResListGuest서블릿 실행");
		return "front/entireResListGuest";
	}
	
	
	//소개 메인 이동
	@RequestMapping(value="hotelDelLunar.do", method = RequestMethod.GET)
	public String hotelDelLunar(Model model, String room) {
		System.out.println("location서블릿 실행");
		return "front/introdution/hotelDelLunar";
	}
	
	//소개 호텔소개 이동
	@RequestMapping(value="instruction.do", method = RequestMethod.GET)
	public String instruction(Model model, String room) {
		System.out.println("location서블릿 실행");
		return "front/introdution/instruction";
	}
	
	//소개 오시는길 이동
	@RequestMapping(value="location.do", method = RequestMethod.GET)
	public String location(Model model, String room) {
		System.out.println("location서블릿 실행");
		return "front/introdution/location";
	}
	
	
	
	//호텔 룸 오버뷰 이동
	@RequestMapping(value="overView.do", method = RequestMethod.GET)
	public String overView(Locale locale, Model model) {
		System.out.println("overView서블릿 실행");
		return "front/hotels/overView";
	}
	
	//호텔 룸 상세보기 이동
	@RequestMapping(value="roomView.do", method = RequestMethod.GET)
	public String roomView(String type) {
		System.out.println("roomView서블릿 실행");
		
		if(type.equals("superior")) {
			return "front/hotels/superior";
		}
		return "front/hotels/roomView";
	}
	
	
	
	
	
	
	
	// 즐길거리 주변 즐길거리 이동
	@RequestMapping(value="around.do", method = RequestMethod.GET)
	public String around(Model model, String room) {
		System.out.println("around서블릿 실행");
		return "front/entertainment/around";
	}
	
	
	
	//다이닝 전체 이동
	@RequestMapping(value="dining.do", method = RequestMethod.GET)
	public String dining(Model model, String room) {
		System.out.println("dining서블릿 실행");
		return "front/dining/dining";
	}
	
	
	//다이닝 레스토랑 이동
	@RequestMapping(value="restaurant.do", method = RequestMethod.GET)
	public String restaurant(Model model, String room) {
		System.out.println("restaurant서블릿 실행");
		return "front/dining/restaurant";
	}
	
	//다이닝 카페 이동
	@RequestMapping(value="cafe.do", method = RequestMethod.GET)
	public String cafe(Model model, String room) {
		System.out.println("cafe서블릿 실행");
		return "front/dining/cafe";
	}
		
		
	//고객센터 전체 이동
	@RequestMapping(value="support.do", method = RequestMethod.GET)
	public String support(Model model, String room) {
		System.out.println("support서블릿 실행");
		return "front/support/support";
	}

	//고객센터 공지사항 이동
	@RequestMapping(value="notice.do", method = RequestMethod.GET)
	public String notice(Model model, String room) {
		System.out.println("notice서블릿 실행");
		return "front/support/notice";
	}
	
	//고객센터 공지사항 이동
	@RequestMapping(value="voc.do", method = RequestMethod.GET)
	public String voc(Model model, String room) {
		System.out.println("notice서블릿 실행");
		return "front/support/voc";
	}
}
