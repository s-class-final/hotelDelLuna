package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

public interface ReservationService {

	
	/* 전체 예약 리스트 갯수 불러오기 */
	int getListCount();

	/* 전체 예약 리스트 불러오기 */
	ArrayList<Reservation> selectEntireResList();

	/* 페이지당 예약 리스트 불러오기 */
	ArrayList<Reservation> selectResList(PageInfo pi);

	/* 검색한 내용의 예약 리스트 갯수 불러오기 */
	int getSearchResultListCount(ResSearchCondition sc);

	/* 검색한 내용의 페이지당 예약 리스트 불러오기 */
	ArrayList<Reservation> selectSearchResultList(ResSearchCondition sc, PageInfo pi);

	/* 예약 상세 가져오기 */
	Reservation selectResOne(int res_no);

	/* 예약 내역 삽입 */
	int resInsert(Reservation res);

	/* 예약 내역 삭제 */
	int resDelete(int res_no);

	/* 예약 내역 수정 */
	int resModify(Reservation res);

	/* 방 종류별 개수 */
	int getRoomCount(String string);

	
	/* 날짜와 방 종류별 개수 */
	int getSuperiorResCount(String date);

	int getDeluxeResCount(String date);

	int getSuiteResCount(String date);

	/* 방 종류 이름별로 모두 뽑기 */
	List<String>  selectRoomTypeList();

	/* 방 사진 받아오기 */
	String getRoomFileName(String res_roomType);

	/* 날짜 예약 정보 삽입 */
	int resRoomStatusInsert(Reservation res);

	/* 예약한 정보로 예약번호 가져오기 */
	int getResNo(Reservation res);

	/* 입금 완료 하기 */
	int payStatusCheck(int res_no);

	/* 방 상태 정보 삭제하기 */
	int roomStatusDelete(int resNo);

	/* 방 타입별 개수 구하기 */
	List<Integer> selectRoomTypeCount();

	/* 방 타입, 개수 한번에 구하기 */
	List<Map<String, Object>> getRoomList();

	/* 날짜별 예약할 방타입 예약된 개수 구하기 */
	int getResRoomCount(Reservation searchRes);

	/* 방타입 리스트 전부 받기 */
	ArrayList<RoomType> selectRoomList();

	/* 룸타입 정보 골라서 받기 */
	RoomType getRoomType(String res_roomType);


	
}
