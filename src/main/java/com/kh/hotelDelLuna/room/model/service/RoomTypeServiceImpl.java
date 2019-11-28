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
	
	@Override
	public int insertRoom(RoomType rt) {
		return rtDao.insertRoom(rt);
	}

	@Override
	public int insertAttachment(Attachment a) {
		
		return rtDao.insertAttachment(a);
	}

}
