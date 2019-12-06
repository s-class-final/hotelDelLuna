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



	public int insertRtype(RoomType rt) {
	
		System.out.println("DAO rt : " + rt);
		return sqlSession.insert("roomtypeMapper.insertRtype",rt);
	
	}


	public int insertRimgs(Attachment at) {
		System.out.println("DAO at : " + at);
		return sqlSession.insert("roomtypeMapper.insertRimgs",at);
	}
	


}
