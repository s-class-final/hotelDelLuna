package com.kh.hotelDelLuna.room.model.service;

import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

public interface RoomTypeService {

	int insertRtype(RoomType rt);

	int insertImgs(Attachment at);

}
