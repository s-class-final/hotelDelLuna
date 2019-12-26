package com.kh.hotelDelLuna.room.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.Room;
import com.kh.hotelDelLuna.room.model.vo.RoomType;
import com.kh.hotelDelLuna.room.model.vo.StatusCount;

public interface RoomService {

	//룸 타입 데이터
	public int updateRtype(RoomType rt);
	//룸타입 사진 등록
	public int updateImgs(Attachment at);

	//룸 리스트
	public ArrayList<Room> selectRoomCardList();
	//ajax용 타입별 리스트
	//슈페리어 룸 리스트
	public ArrayList<Room> selectSPRoomCardList();
	//디럭스 룸 리스트
	public ArrayList<Room> selectDUXRoomCardList();
	//스위트 룸 리스트
	public ArrayList<Room> selectSUIRoomCardList();
	
	//슈페리어 룸 컨디션 카운트
	public int selectSPWaitingCount();
	public int selectSPCleaningCount();
	public int selectSPStayingCount();
	
	//디럭스 룸 컨디션 카운트
	public int selectDeluxeWaitingCount();
	public int selectDeluxeCleaningCount();
	public int selectDeluxeStayingCount();

	//스위트 룸 컨디션 카운트
	public int selectSUWaitingCount();
	public int selectSUCleaningCount();
	public int selectSUStayingCount();
	
	//룸 카드 선택시 가져올 룸 vo
	public Room selectRoomcard(int roomNum);
	
	//체크 인 업데이트 
	public int updateR(Room rm);
	
	
	public Date selectcheckinDate(Room rm);
	
	//업데이트 컨디션 waiting으로
	public int changeCon(Room rm);

	
	
	public int modireq(Room rm);
	
	public int checkOut(Room rm);
	
	public ArrayList<Room> checkInlist();
	
	public ArrayList<Room> checkoutist();
	
	
	
	
	
	
}
