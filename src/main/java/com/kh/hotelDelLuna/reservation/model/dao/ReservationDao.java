package com.kh.hotelDelLuna.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
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

	public ArrayList<Reservation> selectResList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResList",null,rowBounds);
	}

	public int getSearchResultListCount(ResSearchCondition sc) {

		return sqlSession.selectOne("reservationMapper.getSearchResultListCount",sc);
	}

	public ArrayList<Reservation> selectSearchResultList(ResSearchCondition sc, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reservationMapper.selectSearchResultList",sc,rowBounds);
	}

	public Reservation selectResOne(int res_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.selectResOne",res_no);
	}

	public int resInsert(Reservation res) {

		return sqlSession.insert("reservationMapper.resInsert",res);
	}

	public int resDelete(int res_no) {

		return sqlSession.update("reservationMapper.resDelete",res_no);
	}

	public int resModify(Reservation res) {

		return sqlSession.update("reservationMapper.resModify",res);
	}


}
