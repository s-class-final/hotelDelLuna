package com.kh.hotelDelLuna.room.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.hotelDelLuna.room.model.service.RoomTypeService;
import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;



@Controller
public class RoomController {

	@Autowired
	RoomTypeService rtService;


	//insertRoom.jsp 페에지로 이동
	@RequestMapping("iRoomtypeView.do")
	public String  iRoomtypeView() {
		return "roomstatus/insertRoomType";
	} 
	
	@RequestMapping("roomstatus.do")
	public String roomStatusView() {
		return "roomstatus/roomStatus";
	} 

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
						
						resultImg = rtService.insertImgs(at);
						
					}else {
						at.setOriginalName(originFileName);
						at.setChangeName(saveFileName);
						at.setPath(savePath);
						at.setRoomType(mpsr.getParameter("type"));
						at.setImgLv(1);
						
						resultImg = rtService.insertImgs(at);
					}
				}
				
				 				 
			}
				
			int resultRt = rtService.insertRtype(rt); 
			
			
			if(resultRt == 1 && resultImg == 1) {
				System.out.println("룸 타입 등록 성공");
			}
			
		}	
			return null; 
		
	
		
		
	}
}
	
	
	


