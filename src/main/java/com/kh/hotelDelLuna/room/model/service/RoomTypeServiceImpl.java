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
	public int insertRtype(RoomType rt) {
		return rtDao.insertRtype(rt);
	}

	@Override
	public int insertImgs(Attachment at) {
		// TODO Auto-generated method stub
		return rtDao.insertRimgs(at);
	}






	

}
