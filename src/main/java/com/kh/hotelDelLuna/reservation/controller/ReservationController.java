package com.kh.hotelDelLuna.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotelDelLuna.reservation.model.service.ReservationService;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	ReservationService rService;
	
	@RequestMapping(value="entireResList.do", method = RequestMethod.GET)
	public String entireResList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		/*
		 * int currentPage = 1;
		 * 
		 * ArrayList<Reservation> rlist = rService.selectEntireResList(); if(page !=
		 * null) { currentPage = page; } int listCount = rService.getListCount();
		 * 
		 * 
		 * System.out.println(rlist);
		 */
		
		return "home";
	}
}
