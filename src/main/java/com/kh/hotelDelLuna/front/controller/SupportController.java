package com.kh.hotelDelLuna.front.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.hotelDelLuna.front.model.exception.SupportException;
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
		System.out.println("roomView서블릿 실행 : " + type);
		
		if(type!=null) {
			switch(type) {
			case "superior" : return "front/hotels/superior/superior"; 
			case "superior_terrace" :  return "front/hotels/superior/superior_terrace"; 
			case "deluxe" : return "front/hotels/deluxe/deluxe"; 
			case "grand_deluxe" : return "front/hotels/deluxe/grand_deluxe"; 
			case "premium_deluxe" : return "front/hotels/deluxe/premium_deluxe"; 
			case "premium_deluxe_terrace" : return "front/hotels/deluxe/premium_deluxe_terrace"; 
			case "junior_suite" : return "front/hotels/suite/junior_suite"; 
			case "deluxe_suite" : return "front/hotels/suite/deluxe_suite"; 
			case "grand_deluxe_suite" : return "front/hotels/suite/grand_deluxe_suite"; 
			case "royal_suite" : return "front/hotels/suite/royal_suite"; 
			default : throw new SupportException("잘못된 접근");
			}
		}else {
			throw new SupportException("잘못된 접근");
		}
	}
	
	
	
	
	
	
	
	// 즐길거리 주변 즐길거리 이동
	@RequestMapping(value="around.do", method = RequestMethod.GET)
	public String around(Model model, String room) {
		System.out.println("around서블릿 실행");
		return "front/entertainment/around";
	}
	
	
	
	//다이닝 전체, 레스토랑, 카페 메뉴 리스트 페이지 이동
	@RequestMapping(value="dining.do", method = RequestMethod.GET)
	public String dining(String CATE) {
		System.out.println("dining서블릿 실행 : "+ CATE);
		
		if(CATE!=null) {
			switch(CATE) {
			case "dining" : return "front/dining/dining"; 
			case "restaurant" :  return "front/dining/restaurant"; 
			case "cafe" : return "front/dining/cafe"; 
			default : throw new SupportException("잘못된 접근");
			}
		}else {
			throw new SupportException("잘못된 접근");
		}
	}
	
	//다이닝 상세페이지 이동
	@RequestMapping(value="diningView.do", method = RequestMethod.GET)
	public String support(String type) {
		System.out.println("diningView 서블릿 실행 type : " + type);
		if(type!=null) {
			switch(type) {
			case "OnThePlate" : return "front/dining/r/onThePlate"; 
			case "LaScala" :  return "front/dining/r/laScala"; 
			case "Raku" : return "front/dining/r/raku"; 
			case "ImperialTreasure" : return "front/dining/r/imperialTreasure"; 
			case "Rubik" : return "front/dining/c/rubik"; 
			case "LoungeParadise" : return "front/dining/c/loungeParadise"; 
			case "GardenCafe" : return "front/dining/c/gardenCafe"; 
			case "TheEmperor" : return "front/dining/r/theEmperor"; 
			case "Cafe9" : return "front/dining/r/cafe9"; 
			case "Bar21" : return "front/dining/c/bar21"; 
			default : throw new SupportException("잘못된 접근");
			}
		}else {
			throw new SupportException("잘못된 접근");
		}
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
