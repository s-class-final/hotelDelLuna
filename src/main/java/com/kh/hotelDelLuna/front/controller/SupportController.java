package com.kh.hotelDelLuna.front.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.front.model.exception.SupportException;
import com.kh.hotelDelLuna.front.model.service.SupportService;
import com.kh.hotelDelLuna.front.model.vo.Notice;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	//사용자 예약페이지 이동
	@RequestMapping(value="ReservationGuest.do", method = RequestMethod.GET)
	public String ReservationGuest(Locale locale, Model model) {
		System.out.println("ReservationGuest서블릿 실행");
		
		
		return "front/reservation/ReservationGuest";
	}
	
	//예약 가능한 방 목록 조회하기
	@RequestMapping(value="roomListGuest.do", method = RequestMethod.POST)
	public void roomListGuest(HttpServletResponse response, String cIn, String cOut) throws IOException {
		response.setContentType("application/json;charset=utf-8");
//		System.out.println("roomListGuest서블릿 실행 cIn : " + cIn + ", cOut : " + cOut);
		
		Reservation res = new Reservation();
		
		String[] arrin = cIn.split("\\.");
		String[] arrout = cOut.split("\\.");
		
		cIn = arrin[0] + "-" + arrin[1] + "-" + arrin[2];
		cOut = arrout[0] + "-" + arrout[1] + "-" + arrout[2];
		
		Date res_checkIn = Date.valueOf(cIn);
		Date res_checkOut = Date.valueOf(cOut);
		
		res.setRes_checkIn(res_checkIn);
		res.setRes_checkOut(res_checkOut);
		
		//결과로 가져오는건 객실 종류만 불러옴 (예약은 한번에 객실 1개만!)
		ArrayList<RoomType> resList = sService.selectReservationGst(res);
		
		System.out.println("roomListGuest.do서블릿 resList : " + resList);
		if(resList != null) {

			Gson gson = new Gson();
			gson.toJson(resList, response.getWriter());
			
		}else {
			throw new SupportException("빈 객실 정보 불러오기 실패");
		}
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
	
	
	
	// 즐길거리 부대시설 이동
	@RequestMapping(value="facility.do", method = RequestMethod.GET)
	public ModelAndView facility(ModelAndView mv, String room
			,@RequestParam (value="focus", required=false) Integer focus) {
		System.out.println("facility서블릿 실행");
		
		if(focus!=null) {
			mv.addObject("focus", focus);			
		}
		mv.setViewName("front/entertainment/facility");
		return mv;
	}
	
	// 즐길거리 부대시설 이동
	@RequestMapping(value="casino.do", method = RequestMethod.GET)
	public String casino(Model model, String room) {
		System.out.println("casino서블릿 실행");
		return "front/entertainment/casino";
	}
		
		
	// 즐길거리 부대시설 이동
	@RequestMapping(value="plaza.do", method = RequestMethod.GET)
	public String plaza(Model model, String room) {
		System.out.println("plaza서블릿 실행");
		return "front/entertainment/plaza";
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

	
	//고객센터 공지사항 이동(공지사항 목록)
	@RequestMapping(value="noticeList.do")
	public ModelAndView noticeList(ModelAndView mv,
							@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = sService.selectList(pi);
		
//		System.out.println(list.get(4));
		
		if(list != null && list.size() > 0) {	// 게시글이 있다면
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("front/support/noticeList");
		}else {
			throw new SupportException("공지사항 조회 실패!!");
		}
		return mv;
//		return "front/support/noticeList";
	}
	
	//고객센터 공지사항 이동(공지사항 목록)(관리자)
		@RequestMapping(value="noticeListA.do")
		public ModelAndView noticeListAdmin(ModelAndView mv,
								@RequestParam(value="page", required=false) Integer page) {
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = sService.getAListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Notice> list = sService.selectAList(pi);
			
//			System.out.println(list.get(4));
			
			if(list != null && list.size() > 0) {	// 게시글이 있다면
				mv.addObject("list",list);
				mv.addObject("pi", pi);
				mv.setViewName("front/support/noticeListAdmin");
			}else {
				throw new SupportException("공지사항 조회 실패!!");
			}
			return mv;
//			return "front/support/noticeList";
		}
	
	
	//고객센터 공지글 작성하기 팝업
	@RequestMapping(value="noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request, int user_T, String nTitle, String nContent, String nStatus) {
		
//		System.out.println("noticeInsert서블릿 실행 user_T : " + user_T + ", nTitle : " + nTitle + ", nContent : " + nContent + ", nStatus : " + nStatus);
		
		Notice n = new Notice(user_T, nTitle, nContent, nStatus);
		
		int result = sService.insertNotice(n);
		
		if(result > 0) {
			
			return "redirect:noticeListA.do";
		}else {
			throw new SupportException("공지사항 등록 실패");
		}
	}
	
	//고객센터 공지글 상세보기 이동(공지사항 내용)
	@RequestMapping(value="noticeDetail.do", method = RequestMethod.POST)
	public ModelAndView noticeDetail(ModelAndView mv, int nId,
								@RequestParam("page") Integer page) {
		
//		System.out.println("noticeDetail서블릿 실행");
		
//		System.out.println("mv : " + mv);
//		System.out.println("nId : " + nId);
//		System.out.println("page : " + page);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
//		sService.addReadCount(nId);		//조회수 올리기 - 공지사항이라서 안 함
		
		Notice notice = sService.selectNotice(nId);
//		System.out.println("noticeDetail.do notice = " + notice);
		
		if(notice != null) {
			//메소드 체이닝 방식
			mv.addObject("notice", notice)
				.addObject("currentPage", currentPage)
				.setViewName("front/support/noticeDetail");	//boardDetailView.jsp 만들러 ㄱㄱ
		}else {
			throw new SupportException("게시글 상세조회 실패!");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="noticeUpdate.do", method = RequestMethod.POST)
	public String noticeUpdateView(HttpServletRequest request, int nId,
									int user_T, String nTitle, String nContent, String nStatus ) {
		
//		System.out.println("noticeUpdate서블릿 실행 nId : " + nId + ", user_T : " + user_T + ", nTitle : " + nTitle + ", nContent : " + nContent + ", nStatus : " + nStatus);
		
		Notice n = new Notice(nId, user_T, nTitle, nContent, nStatus);
		
		
		int result = sService.updateNotice(n);
		
		if(result > 0) {
			return "redirect:noticeListA.do";
		}else {
			throw new SupportException("게시글 수정 실패");
		}
		
	}
	
	
	//고객센터 공지글 내리기(삭제하기) 이동
	@RequestMapping(value="noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete(int nId) {
		System.out.println("noticeDelete서블릿 실행 nId : " + nId);
		
		int result = sService.deleteNotice(nId);
		
		if(result>0) {
			return "redirect:noticeListA.do";
		}else {
			throw new SupportException("공지사항 삭제 실패");
		}
	}
	
	//고객센터 이용문의 이동
	@RequestMapping(value="voc.do", method = RequestMethod.GET)
	public String voc(Model model, String room) {
		System.out.println("voc서블릿 실행");
		return "front/support/voc";
	}
	
	//부대시설1 outdoor pool
	@RequestMapping("fac1.do")
	public String facility1(Model model, String room) {
		
		return "front/entertainment/facilities/facilities1";
	}
	
	//부대시설2 indoor pool
	@RequestMapping("fac2.do")
	public String facility2(Model model, String room) {
		
		return "front/entertainment/facilities/facilities2";
	}
	
	//부대시설3 sauna
	@RequestMapping("fac3.do")
	public String facility3(Model model, String room) {
		
		return "front/entertainment/facilities/facilities3";
	}
	
	//부대시설4 fitness
	@RequestMapping("fac4.do")
	public String facility4(Model model, String room) {
		
		return "front/entertainment/facilities/facilities4";
	}
	
	//부대시설5 kids zone
	@RequestMapping("fac5.do")
	public String facility5(Model model, String room) {
		
		return "front/entertainment/facilities/facilities5";
	}
	
	//부대시설6 spa
	@RequestMapping("fac6.do")
	public String facility6(Model model, String room) {
		
		return "front/entertainment/facilities/facilities6";
	}
	
	//부대시설7 boutique
	@RequestMapping("fac7.do")
	public String facility7(Model model, String room) {
		
		return "front/entertainment/facilities/facilities7";
	}
}
