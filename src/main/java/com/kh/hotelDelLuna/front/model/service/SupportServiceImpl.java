package com.kh.hotelDelLuna.front.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.front.model.dao.SupportDao;

@Service("sService")
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	SupportDao sDao;

}
