package com.kh.hotelDelLuna.reservation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

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

	public int getRoomCount(String string) {
		return sqlSession.selectOne("reservationMapper.getRoomCount",string);
	}

	
	
	public int getSuperiorResCount(String date) {
		return sqlSession.selectOne("reservationMapper.getSuperiorResCount",date);
	}

	public int getDeluxeResCount(String date) {
		return sqlSession.selectOne("reservationMapper.getDeluxeResCount",date);
	}

	public int getSuiteResCount(String date) {
		return sqlSession.selectOne("reservationMapper.getSuiteResCount",date);
	}

	public List<String> selectRoomTypeList() {

		return sqlSession.selectList("reservationMapper.selectRoomTypeList");
	}

	
	public String getRoomFileName(String res_roomType) {
		
		return sqlSession.selectOne("reservationMapper.getRoomFileName",res_roomType);
	}

	public int resRoomStatusInsert(Reservation res) {

		return sqlSession.insert("reservationMapper.resRoomStatusInsert",res);
	}

	public int getResNo(Reservation res) {

		return sqlSession.selectOne("reservationMapper.getResNo",res);
	}

	public int payStatusCheck(int res_no) {

		return sqlSession.update("reservationMapper.payStatusCheck",res_no);
	}

	public int roomStatusDelete(int resNo) {

		return sqlSession.delete("reservationMapper.roomStatusDelete",resNo);
	}

	public List<Integer> selectRoomTypeCount() {

		return sqlSession.selectList("reservationMapper.selectRoomTypeCount");
	}

	public List<Map<String, Object>> getRoomList() {

		return sqlSession.selectList("reservationMapper.getRoomList");
	}

	public int getResRoomCount(Reservation searchRes) {

		return sqlSession.selectOne("reservationMapper.getResRoomCount",searchRes);
	}

	public ArrayList<RoomType> selectRoomList() {

		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomList");
	}

	public RoomType getRoomType(String res_roomType) {

		return sqlSession.selectOne("reservationMapper.getRoomType",res_roomType);
	}


}
