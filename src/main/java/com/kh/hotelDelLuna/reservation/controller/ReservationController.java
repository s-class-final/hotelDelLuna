package com.kh.hotelDelLuna.reservation.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@RequestMapping(value="entireResList.do", method = RequestMethod.GET)
	public String entireResList(Locale locale, Model model) {
		System.out.println("entireRes서블릿 실행");
		return "reservation/entireResView";
	}
	
	
	@RequestMapping(value="entireResListGuest.do", method = RequestMethod.GET)
	public String entireResListGuest(Locale locale, Model model) {
		System.out.println("entireResListGuest서블릿 실행");
		return "reservation/entireResListGuest";
	}
	
}
