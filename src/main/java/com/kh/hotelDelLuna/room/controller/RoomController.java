package com.kh.hotelDelLuna.room.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {

	@RequestMapping(value="overView.do", method = RequestMethod.GET)
	public String overView(Locale locale, Model model) {
		System.out.println("overView서블릿 실행");
		return "room/overView";
	}
	
	@RequestMapping(value="roomView.do", method = RequestMethod.GET)
	public String roomView(Model model, String room) {
		System.out.println("roomView서블릿 실행");
		return "room/roomView";
	}
}
