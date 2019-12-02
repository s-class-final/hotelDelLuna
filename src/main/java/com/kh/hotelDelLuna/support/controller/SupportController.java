package com.kh.hotelDelLuna.support.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SupportController {
	@RequestMapping(value="entireResList.do", method = RequestMethod.GET)
	public String entireResList(Locale locale, Model model) {
		System.out.println("entireRes서블릿 실행");
		return "reservation/entireResView";
	}
}
