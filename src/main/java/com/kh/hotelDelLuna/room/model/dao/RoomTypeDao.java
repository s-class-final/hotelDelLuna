package com.kh.hotelDelLuna.room.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Repository
public class RoomTypeDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertRoom(RoomType r) {

		return sqlSession.insert("roomtypeMapper.insertRoom",r);
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("roomtypeMapper.insertAttachment",a);
	}

}
