package com.kh.hotelDelLuna.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

@Repository("rDao")
public class ReservationDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.getListCount");
	}
	
	public ArrayList<Reservation> selectEntireResList() {

		return (ArrayList)sqlSession.selectList("reservationMapper.selectEntireResList");
	}


}
