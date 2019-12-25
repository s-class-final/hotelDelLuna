package com.kh.hotelDelLuna.room.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.room.model.vo.Room;
import com.kh.hotelDelLuna.room.model.vo.StatusCount;

@Repository
public class RoomStatusDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//룸 상태 카드 리스트
	public ArrayList selectRoomCardList() {
		//System.out.println("DAO : " + (ArrayList)sqlSession.selectList("roomMapper.selectRcList"));
		return (ArrayList)sqlSession.selectList("roomMapper.selectRcList");
	}
	//ajax용 타입별 룸 리스트
	//슈페리어 룸 카드 리스트
	public ArrayList selectSPRoomCardList() {
		return (ArrayList)sqlSession.selectList("roomMapper.selectSURcList");
	}
	public ArrayList selectDUXRoomCardList() {
		return (ArrayList)sqlSession.selectList("roomMapper.selectDUXRoomCardList");
	}
	public ArrayList selectSUIRoomCardList() {
		return (ArrayList)sqlSession.selectList("roomMapper.selectSUIRoomCardList");
	}
	

	


	//슈페리어 룸 카운트
	public int selectSPWaitingCount() {
		return sqlSession.selectOne("roomMapper.selectSPWaitingCount");
	}
	public int selectSPCleaningCount() {
		return sqlSession.selectOne("roomMapper.selectSPCleaningCount");
	}
	public int selectSPStayingCount() {
		return sqlSession.selectOne("roomMapper.selectSPStayingCount");
	}
	
	//디럭스 룸 카운트
	public int selectDeluxeWaitingCount() {
		return sqlSession.selectOne("roomMapper.selectDeluxeWaitingCount");
	}
	public int selectDeluxeCleaningCount() {
		return sqlSession.selectOne("roomMapper.selectDeluxeCleaningCount");
	}
	public int selectDeluxeStayingCount() {
		return sqlSession.selectOne("roomMapper.selectDeluxeStayingCount");
	}

	//스위트 룸 카운트
	public int selectSUWaitingCount() {
		return sqlSession.selectOne("roomMapper.selectSUWaitingCount");
	}
	public int selectSUCleaningCount() {
		return sqlSession.selectOne("roomMapper.selectSUCleaningCount");
	}
	public int selectSUStayingCount() {
		return sqlSession.selectOne("roomMapper.selectSUStayingCount");
	}
	
	public Room selectRoomcard(int roomNum) {
		return sqlSession.selectOne("roomMapper.selectClickRoomcard",roomNum);
	}
	public int updateR(Room rm) {
		return sqlSession.update("roomMapper.updateR" , rm);
	}
	public int updateCon(Room rm) {
		return sqlSession.update("roomMapper.updateCon" , rm);
	}
	public int updateReq(Room rm) {
		return sqlSession.update("roomMapper.updateReq" , rm);
	}
	public int checkOut(Room rm) {
		return  sqlSession.update("roomMapper.checkOut" , rm);
	}
	public ArrayList checkInlist() {
		return (ArrayList)sqlSession.selectList("roomMapper.checkInlist");
	}
	public ArrayList checkOutist() {
		return (ArrayList)sqlSession.selectList("roomMapper.checkOutist");
	}
}
	


	
