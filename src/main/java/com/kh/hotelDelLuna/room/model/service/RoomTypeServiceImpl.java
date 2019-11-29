package com.kh.hotelDelLuna.room.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.room.model.dao.RoomTypeDao;
import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Service
public class RoomTypeServiceImpl implements RoomTypeService {
	
	@Autowired
	RoomTypeDao rtDao;
	

}
