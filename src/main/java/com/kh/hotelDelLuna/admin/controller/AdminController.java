package com.kh.hotelDelLuna.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hotelDelLuna.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService aService;

}
