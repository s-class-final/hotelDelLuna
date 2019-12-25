package com.kh.hotelDelLuna.room.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.reservation.model.service.ReservationService;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.service.RoomService;
import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.Room;
import com.kh.hotelDelLuna.room.model.vo.RoomType;
import com.kh.hotelDelLuna.room.model.vo.StatusCount;



@Controller
public class RoomController {

	@Resource
	RoomService rmService;
	@Resource
	ReservationService rService;


	//insertRoom.jsp 페에지로 이동
	@RequestMapping("iRoomtypeView.do")
	public String  iRoomtypeView() {
		return "roomstatus/insertRoomType";
	} 

	/*
	 * @RequestMapping("roomstatus.do") public String roomStatusView() { return
	 * "roomstatus/roomStatus"; }
	 */
	
	
	@RequestMapping("Roomtypeinsert.do")
	public String iRoomtype(MultipartHttpServletRequest mpsr ,RoomType rt, Attachment at) throws IllegalStateException, IOException {
		
		int resultImg = 0;
		
		List<MultipartFile> mf = (List<MultipartFile>)mpsr.getFiles("file");
		
		if(mf.size() == 0 && mf.get(0).getOriginalFilename().equals("")) {
			
		}else {
			
			//저장될 위치
			String root = mpsr.getSession().getServletContext().getRealPath("resources");
			
			String realFolder = root + File.separator+"pcPub"+File.separator+"static"+File.separator+"images"+File.separator+"room"+File.separator;
			
			System.out.println(mpsr.getParameter("type"));
			
			File folder = new File(realFolder);
			// nuploadFiles가 없으면 생성해라.
			if(!folder.isDirectory()) {
				folder.mkdirs();
			}
			
			for(int i = 0 ; i <mf.size() ; i++){
				
				//중복 방지를 위한 UUID랜덤값 생성
				//원래 파일명
				String originFileName = mf.get(i).getOriginalFilename();
				
				if(originFileName == "") {
					//걍 넘기고
				}else {
				
					//파일 저장
					
					if(i == 0) {
						
						//바뀔 파일 네임
						String genId = UUID.randomUUID().toString();
						String saveFileName = genId + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
						String savePath = realFolder + saveFileName;
						mf.get(i).transferTo(new File(savePath));
					
						
						
						at.setOriginalName(originFileName);
						at.setChangeName(saveFileName);
						at.setPath(savePath);
						at.setRoomType(mpsr.getParameter("type"));
						at.setImgLv(0);
						
						resultImg = rmService.updateImgs(at);
						
						
					}
				}
				
				 				 
			}
				
			int resultRt = rmService.updateRtype(rt); 
			
			
			if(resultRt == 1 && resultImg == 1) {
				System.out.println("룸 타입 업데이트 성공");
				return "iRoomtypeView.do";
			}
			
		}
		return null;	
	}
	
	
	@RequestMapping("roomstatus.do")
	public ModelAndView RcList(ModelAndView mv , @RequestParam(value = "page", required = false) Integer page) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage  = page;
		}
		
		ArrayList<Room> RClist = rmService.selectRoomCardList();
		ArrayList<StatusCount> sclist = new ArrayList<StatusCount>();
		ArrayList<Room> checkInlist = rmService.checkInlist();
		ArrayList<Room> checkOutlist = rmService.checkoutist();
		
		int awCC = 0; 
		int acCC = 0;
		int asCC = 0;
		
				//슈페리어 룸 컨디션 별 카운트
				int SPW = rmService.selectSPWaitingCount();
				int SPC = rmService.selectSPCleaningCount();
				int SPS = rmService.selectSPStayingCount();
				//디럭스 룸 컨디션 별 카운트 카운트
				int DW = rmService.selectDeluxeWaitingCount();
				int DC = rmService.selectDeluxeCleaningCount();
				int DS = rmService.selectDeluxeStayingCount();
				//스위트 룸 컨디션 별 카운트 카운트
				int SUW = rmService.selectSUWaitingCount();
				int SUC = rmService.selectSUCleaningCount();
				int SUS = rmService.selectSUStayingCount();
				
				awCC = SPW+DW+SUW;
				acCC = SPC+DC+SUC;
				asCC = SPS+DS+SUS;
				
				
				StatusCount sc1 = new StatusCount();
				StatusCount sc2 = new StatusCount();
				StatusCount sc3 = new StatusCount();
				
				sc1.setRoomType("SUPERIOR");
				sc1.setWaitingCount(SPW);
				sc1.setCleaningCount(SPC);
				sc1.setStayingCount(SPS);
				sclist.add(sc1);
				

				sc2.setRoomType("DELUXE");
				sc2.setWaitingCount(DW);
				sc2.setCleaningCount(DC);
				sc2.setStayingCount(DS);
				sclist.add(sc2);
				
				sc3.setRoomType("SUITE");
				sc3.setWaitingCount(SUW);
				sc3.setCleaningCount(SUC);
				sc3.setStayingCount(SUS);
				sclist.add(sc3);
				
				//예약 테이블 가져오기
				int listCount = rService.getSysdateListCount();
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				ArrayList<Reservation> rlist = rService.selectSysdateResList(pi);

				
				
				
				
		if(RClist != null) {
			//룸 카드 리스트
			mv.addObject("RClist" , RClist);
			//룸 컨디션 리스트
			mv.addObject("SClist", sclist);
			//예약 리스트
			mv.addObject("rlist", rlist);
			mv.addObject("checkInlist", checkInlist);
			mv.addObject("checkOutlist", checkOutlist);
			//페에지 인포
			mv.addObject("pi", pi);
			
			mv.addObject("awCC",awCC);
			mv.addObject("acCC",acCC);
			mv.addObject("asCC",asCC);
			
			mv.setViewName("roomstatus/roomStatus");
			
		}else {
			System.out.println("에러남");
		}
		
		return mv;
		
	}
	@RequestMapping("RoomTypeClick.do")
	public void SUPERIORROOMLIST(HttpServletResponse response,
									@RequestParam(value ="roomType" , required = false)String roomType) throws JsonIOException, IOException {
	
		response.setContentType("application/json;charset=utf-8");
		System.out.println(roomType);
		
		Gson gson = new Gson();
		
		ArrayList<Room> SUPlist = rmService.selectSPRoomCardList();
		ArrayList<Room> DUXlist = rmService.selectDUXRoomCardList();
		ArrayList<Room> SUIlist = rmService.selectSUIRoomCardList();
		ArrayList<Room> RClist = rmService.selectRoomCardList();
		
		if(roomType.equals("SUPERIOR")) {	
			gson.toJson(SUPlist , response.getWriter());
		}else if(roomType.equals("DELUXE")) {
			gson.toJson(DUXlist , response.getWriter());
		}else if(roomType.equals("SUITE")) {
			gson.toJson(SUIlist , response.getWriter());
		}else if(roomType.equals("ALL")){
			gson.toJson(RClist , response.getWriter());
		}
	}
	
	@RequestMapping("selectRs.do")
	public void selectRs(HttpServletResponse response,
									@RequestParam(value ="rsNumber" , required = false) int res_no) throws JsonIOException, IOException{
		
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println("선택한 select tr의 예약번호" + res_no);
		
		Gson gson = new Gson();
	
		Reservation rsinfo = rService.selectResOne(res_no);
		
		System.out.println("예약번호로 뽑아온 데이터  : " + rsinfo);
	
		
		gson.toJson(rsinfo, response.getWriter());
	}
	
	@RequestMapping("selectRoomcard.do")
	public void selectRoomcard(HttpServletResponse response,
									@RequestParam(value ="roomNum" , required = false) int roomNum) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println(roomNum);
		
		Gson gson = new Gson();
		
		Room rinfo = rmService.selectRoomcard(roomNum);
		
		System.out.println("클릭으로 뽑아온 card vo 객체" + rinfo);
		
		gson.toJson(rinfo,response.getWriter());
		
		
	}

	@RequestMapping("checkIn.do")
	public String checkIn(HttpServletResponse response, Reservation rs, Room rm){
		System.out.println("체크인 클릭으로 뽑아온 rs" + rs);
		
		System.out.println("체크인 클릭으로 받아온 룸 넘버 " + rm);
		
		int resultUpdateCheckIn = 0;
		
		int resultUpdatePs = 0;
		
		//입금 상태 업데이트 용
		rs.setRes_no(rs.getRes_no());
		
		
		//룸 업데이트 
		rm.setRes_No(rs.getRes_no());
		rm.setM_userName(rs.getRes_userName());
		rm.setRoomNo(rm.getRoomNo());
	
		
		
		
		resultUpdateCheckIn = rmService.updateR(rm);
		
		resultUpdatePs = rService.updatePS(rs);
		
		System.out.println("체크인 관련 업데이트 " + resultUpdateCheckIn);
		
		System.out.println("입금 대기 상태  업데이트 " + resultUpdatePs);
		
		if(resultUpdateCheckIn == 1 && resultUpdatePs == 1) {
			
			System.out.println("체크인 완료");
			return "redirect:roomstatus.do";
		}else {
			System.out.println("체크인 실패 ");
			
			
		}
		return null;
	
		
		
	}
	
	@RequestMapping("CheckOut.do")
	public String CheckOut(HttpServletResponse response, Room rm) {
		System.out.println("체크 아웃 버튼 "+rm);
		
		rm.setRoomNo(rm.getRoomNo());
		
		int CheckOut = rmService.checkOut(rm);
		
		if (CheckOut == 1) {
			System.out.println("체크아웃 완료");
			
			return "redirect:roomstatus.do";
		}
		
		return null;
		
	}
	@RequestMapping("watingChange.do")
	public String watingChange(HttpServletResponse response, Room rm) {
		System.out.println("청소 종료 버튼 "+rm);
		
		rm.setRoomNo(rm.getRoomNo());
		
		int waitingChange = rmService.changeCon(rm);
		
		if (waitingChange == 1) {
			System.out.println("청소 완료");
			
			return "redirect:roomstatus.do";
		}else {
			System.out.println("청소 완료 실패");
		}
		return null;
	}
	
	@RequestMapping("modireri.do")
	public String modireri(HttpServletResponse response, Room rm) {
		System.out.println("요청 사항 수정버튼 "+rm);
		rm.setRoomNo(rm.getRoomNo());
		rm.setRequirement(rm.getRequirement());
		
		int modireri = rmService.modireq(rm);
		
		if(modireri == 1) {
			System.out.println("요청사항 수정 완료");
			
			return "redirect:roomstatus.do";
		}
		
		return null;
		
	}
	
}
	
	
	



