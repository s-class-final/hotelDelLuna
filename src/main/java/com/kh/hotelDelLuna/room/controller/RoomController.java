package com.kh.hotelDelLuna.room.controller;

import java.io.File;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
			String genId = UUID.randomUUID().toString();
			
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
					
					//바뀔 파일 네임
					String saveFileName = genId + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
					String savePath = realFolder + saveFileName;
					//파일 저장
					mf.get(i).transferTo(new File(savePath));
					
					if(i == 0) {
						at.setOriginalName(originFileName);
						at.setChangeName(saveFileName);
						at.setPath(savePath);
						at.setRoomType(mpsr.getParameter("type"));
						at.setImgLv(0);
						
						resultImg = rmService.insertImgs(at);
						
					}else {
						at.setOriginalName(originFileName);
						at.setChangeName(saveFileName);
						at.setPath(savePath);
						at.setRoomType(mpsr.getParameter("type"));
						at.setImgLv(1);
						
						resultImg = rmService.insertImgs(at);
					}
				}
				
				 				 
			}
				
			int resultRt = rmService.insertRtype(rt); 
			
			
			if(resultRt == 1 && resultImg == 1) {
				System.out.println("룸 타입 등록 성공");
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
				int listCount = rService.getListCount();
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				ArrayList<Reservation> rlist = rService.selectResList(pi);

				
		if(RClist != null) {
			//룸 카드 리스트
			mv.addObject("RClist" , RClist);
			//룸 컨디션 리스트
			mv.addObject("SClist", sclist);
			//예약 리스트
			mv.addObject("rlist", rlist);
			//페에지 인포
			mv.addObject("pi", pi);
			
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


}
	
	
	



