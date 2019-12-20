package com.kh.hotelDelLuna.room.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.room.model.vo.Attachment;
import com.kh.hotelDelLuna.room.model.vo.Room;
import com.kh.hotelDelLuna.room.model.vo.RoomType;
import com.kh.hotelDelLuna.room.model.vo.StatusCount;

public interface RoomService {

	//룸 타입 데이터
	public int insertRtype(RoomType rt);
	//룸타입 사진 등록
	public int insertImgs(Attachment at);

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
	
	
	
	
	
}
