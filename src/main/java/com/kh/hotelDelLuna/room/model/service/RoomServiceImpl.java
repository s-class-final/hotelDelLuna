package com.kh.hotelDelLuna.room.model.service;

import java.sql.Date;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.room.model.dao.RoomStatusDao;
import com.kh.hotelDelLuna.room.model.dao.RoomTypeDao;
import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.Room;
import com.kh.hotelDelLuna.room.model.vo.RoomType;
import com.kh.hotelDelLuna.room.model.vo.StatusCount;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Resource
	RoomTypeDao rtDao;
	@Resource
	RoomStatusDao rsDao;
	
	//룸 타입 텍스트 등록
	@Override
	public int updateRtype(RoomType rt) {
		return rtDao.updateRtype(rt);
	}
	//룸 타입 사진등록
	@Override
	public int updateImgs(Attachment at) {
		return rtDao.updateImgs(at);
	}
	//룸 상태 카드 리스트
	@Override
	public ArrayList selectRoomCardList() {
		return rsDao.selectRoomCardList();
	}
	// ---- ajax용 타입별 리스트
	//슈페리어 카드 리스트
	@Override
	public ArrayList selectSPRoomCardList() {
		return rsDao.selectSPRoomCardList();
	}
	//디럭스 카드 리스트
	@Override
	public ArrayList selectDUXRoomCardList() {
		return rsDao.selectDUXRoomCardList();
	}
	//스위트 카드리스트
	@Override
	public ArrayList selectSUIRoomCardList() {
		return rsDao.selectSUIRoomCardList();
	}

	//슈페리어 룸 카운트
	@Override
	public int selectSPWaitingCount() {
		return rsDao.selectSPWaitingCount();
	}
	@Override
	public int selectSPCleaningCount() {
		return rsDao.selectSPCleaningCount();
	}
	@Override
	public int selectSPStayingCount() {
		return rsDao.selectSPStayingCount();
	}
	
	//디럭스 룸 카운트
	@Override
	public int selectDeluxeWaitingCount() {
		return rsDao.selectDeluxeWaitingCount();
	}
	@Override
	public int selectDeluxeCleaningCount() {
		return rsDao.selectDeluxeCleaningCount();
	}
	@Override
	public int selectDeluxeStayingCount() {
		return rsDao.selectDeluxeStayingCount();
	}

	//스위트 룸 카운트
	@Override
	public int selectSUWaitingCount() {
		return rsDao.selectSUWaitingCount();
	}
	@Override
	public int selectSUCleaningCount() {
		return rsDao.selectSUCleaningCount();
	}
	@Override
	public int selectSUStayingCount() {
		return rsDao.selectSUStayingCount();
	}
	@Override
	public Room selectRoomcard(int roomNum) {
		return rsDao.selectRoomcard(roomNum);
	}
	@Override
	public int updateR(Room rm) {
		return rsDao.updateR(rm);
	}
	@Override
	public Date selectcheckinDate(Room rm) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int changeCon(Room rm) {
		return rsDao.updateCon(rm);
	}
	@Override
	public int modireq(Room rm) {
		return rsDao.updateReq(rm);
	}
	@Override
	public int checkOut(Room rm) {
		return rsDao.checkOut(rm);
	}
	@Override
	public ArrayList checkInlist() {
		return rsDao.checkInlist();
	}
	@Override
	public ArrayList checkoutist() {
	
		return rsDao.checkOutist();
	}
	
	

	







	

}
