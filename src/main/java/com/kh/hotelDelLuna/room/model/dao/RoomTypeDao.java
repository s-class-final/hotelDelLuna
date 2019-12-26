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



	public int updateRtype(RoomType rt) {
	
		System.out.println("DAO rt : " + rt);
		return sqlSession.update("roomtypeMapper.updateRtype",rt);
	
	}


	public int updateImgs(Attachment at) {
		System.out.println("DAO at : " + at);
		return sqlSession.update("roomtypeMapper.updateImgs",at);
	}
	


}
