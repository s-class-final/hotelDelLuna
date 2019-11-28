package com.kh.hotelDelLuna.room.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hotelDelLuna.room.model.exception.RoomException;
import com.kh.hotelDelLuna.room.model.service.RoomTypeService;
import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;


@Controller
public class InsertRoomController {

	@Autowired
	RoomTypeService rtService;
	//insertRoom.jsp 페에지로 이동
	@RequestMapping("iRoomView.do")
	public String  iRoomView() {
		return "roomstatus/insertRoom";
	}
	//insertRoom에 데이터 넘겨주기
	@RequestMapping("InsertRoomType.do")
	public String InsertRoom(HttpServletRequest request, RoomType rt) {
		int result = 0;
		
		result = rtService.insertRoom(rt);
		
		if(result > 0 ) {
			
			return "redirect:iRoomView.do";
		}else {
			throw new RoomException("룸 이미지 등록 실패!");
		}
		
	}
	
	
	//Attchment의 데이터 넘겨주기
	@RequestMapping("inputImg.do")
	public String inputImg(HttpServletRequest request, Attachment a,
			@RequestParam(value="uploadFile", required=false)MultipartFile file) {
				
		if(!file.getOriginalFilename().contentEquals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {	// 파일이 잘 저장된 경우
				System.out.println("오리진 파일 : " + file.getOriginalFilename());
				a.setOriginalName(file.getOriginalFilename());
				a.setChangeName(renameFileName);
			}
		}
		
		int result = 0;
		
		for(int i = 1 ; i <= 2 ; ++i) {
			result += rtService.insertAttachment(a);
			
		}
		System.out.println(result);
		
		if(result > 0) {
			return "redirect:iRoomView.do";
		}else {
			throw new RoomException("룸 이미지 등록 실패!");
		}
		
	}
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드
		// 웹 서버의 contextPath(webapp)을 불러 와서 그 아래 resources 경로를 String으로 뽑자
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/pcPub/static/images";
		
		File folder = new File(savePath);
		
		// images가 없으면 생성해라.
		if(!folder.exists())
		{
			folder.mkdirs();
		}
		
		// 공지사항에서는 파일을 저장할 때 파일명을 올린사람꺼 그대로 썼지만
		// 게시판에서는 파일을 저장할 때 같은 파일명을 올려도 시간을 기준으로 파일명을 변경하자.
//		String filePath = folder + "\\" +file.getOriginalFilename(); // 실제 저장될 파일 경로 + 파일명
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
											+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" +renameFileName;
		try {
			file.transferTo(new File(filePath)); // 이 때 파일이 저장된다.
			// 이게 실행되서 파일이 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야지만 파일이 저장된다!!!!!!!!!!!
			
		}catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return renameFileName;
	}
}

