package com.kh.hotelDelLuna.room.model.service;

import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;


public interface RoomTypeService {


	public int insertRoom(RoomType rt);

	public int insertAttachment(Attachment a);

}
