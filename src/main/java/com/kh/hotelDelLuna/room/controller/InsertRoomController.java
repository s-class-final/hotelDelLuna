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
	Attachment at;

	//insertRoom.jsp 페에지로 이동
	
	@RequestMapping("iRoomView.do")
	public String  iRoomView() {
		return "roomstatus/insertRoomType";
	} 

	

}

