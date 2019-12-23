package com.kh.hotelDelLuna.front.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.admin.model.vo.Sales;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.front.model.exception.SupportException;
import com.kh.hotelDelLuna.front.model.service.SupportService;
import com.kh.hotelDelLuna.front.model.vo.Notice;
import com.kh.hotelDelLuna.member.model.service.MemberService;
import com.kh.hotelDelLuna.member.model.vo.Member;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	@Autowired
	MemberService mService;
	
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
	@RequestMapping(value="ReservationPayment.do", method = RequestMethod.POST)
	public String ReservationPayment(String roomType, String checkIn, String checkOut,
									String adult, String child, String breakfast, String dinner,
									String addbed, String allpay,
									HttpSession session,
									Model model, String room) {
		System.out.println("ReservationPayment서블릿 실행");
		

		String[] arrin = checkIn.split("\\.");
		String[] arrout = checkOut.split("\\.");
		
		checkIn = arrin[0] + "-" + arrin[1] + "-" + arrin[2];
		checkOut = arrout[0] + "-" + arrout[1] + "-" + arrout[2];
		
		Date res_checkIn = Date.valueOf(checkIn);
		Date res_checkOut = Date.valueOf(checkOut);
		
		
		Reservation r = new Reservation();
		r.setRes_roomType(roomType);
		r.setRes_checkIn(res_checkIn);
		r.setRes_checkOut(res_checkOut);
		r.setRes_adult(adult);
		r.setRes_child(child);
		r.setRes_breakfast(Integer.valueOf(breakfast));
		r.setRes_dinner(Integer.valueOf(dinner));
		r.setRes_addBed(addbed);
//		r.setRes_require(require);
		r.setRes_allPay(Integer.valueOf(allpay));
		
		System.out.println(roomType);
		System.out.println(checkIn);
		System.out.println(checkOut);
		System.out.println(adult);
		System.out.println(child);
		System.out.println(breakfast);
		System.out.println(dinner);
		System.out.println(addbed);
//		System.out.println(require);
		System.out.println(allpay);
		
		System.out.println(r);
		
		
		session.setAttribute("r", r);
		
		return "front/reservation/ReservationPayment";
	}
	
	//사용자 예약페이지 이동
	@RequestMapping(value="ReservationTest.do", method = RequestMethod.POST)
	public String ReservationTest(HttpSession session,
								String USER_NM, String USER_TEL1, String USER_TEL2, String USER_TEL3, String USER_EMAIL, String USER_REQUIRE) {
		System.out.println("ReservationTest서블릿 실행");
		
		Reservation r = (Reservation) session.getAttribute("r");
		
		System.out.println(r);
		System.out.println(USER_NM);
		System.out.println(USER_TEL1);
		System.out.println(USER_TEL2);
		System.out.println(USER_TEL3);
		System.out.println(USER_EMAIL);
		System.out.println(USER_REQUIRE);
		
		r.setRes_userId(USER_EMAIL);
		
		//연락처
		String tel = USER_TEL1 + "-" + USER_TEL2 + "-" + USER_TEL3;
		System.out.println(tel);
		
		
		// 1_1. 예약자 아이디가 회원에 있는지 확인!
		System.out.println(r.getRes_userId());
		Member m = new Member(r.getRes_userId());
		m.setUserName(USER_NM);
		m.setUserPhone(tel);
		Member member = mService.findMember(m);		

		int mInsert=1;
		
		// 2. 예약자 아이디가 회원,비회원에 없으면 비회원 테이블에 예약자 정보 삽입
		if(member==null){
			mInsert = mService.insertNonMember(m);
		}
		
		//3. 
		if(mInsert > 0) {
			//예약테이블에 입력할 값들
			r.setRes_userId(USER_EMAIL);
			r.setRes_require(USER_REQUIRE);
			
			//예약 테이블에 예약 정보 입력
			int result1 = sService.insertReservationGst(r);
			
			if(result1 > 0) {
				//인보이스 객체에 정보 입력
				Invoice i = new Invoice();
				
				i.setrType(r.getRes_roomType());
				i.setCkinDate(r.getRes_checkIn());
				i.setUserName(USER_NM);
				i.setQuantity(Integer.valueOf(r.getRes_adult())+Integer.valueOf(r.getRes_child()));
				i.setTotalPrice(r.getRes_allPay());
				i.setUserEmail(USER_EMAIL);
				i.setUserPhone(tel);
				
				//인보이스 테이블에 예약 정보 입력
				int result2 = sService.insertInvoiceGst(i);
				
				if(result2 > 0) {
					//매출 테이블에 예약 정보 입력
					int result3 = sService.insertSalesGst(r);
					
					if(result3 > 0) {
						return "../../main";
					}else {
						throw new SupportException("예약 실패");
					}
				}else {
					throw new SupportException("예약 실패");
				}
				
			}else {
				throw new SupportException("예약 실패");
			}
		}else {
			throw new SupportException("예약 실패");
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
