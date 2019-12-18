package com.kh.hotelDelLuna.front.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.front.model.vo.Notice;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

public interface SupportService {

	//공지글 조회 - 전체 공지사항 갯수 확인
	public int getListCount();

	//공지글 조회 - 화면에 보여줄 공지글만 불러오기
	public ArrayList<Notice> selectList(PageInfo pi);

	//공지글 상세보기 - 선택한 공지사항 상세보기
	public Notice selectNotice(int nId);

	public int insertNotice(Notice n);

	public int updateNotice(Notice n);

	public int deleteNotice(int nId);


	
	
	//////////////////////////////////////////////////////////////////////
	//예약 페이지 이동 전에 3개월 내에 예약 가능한 방이 남아있는지 먼저 확인, 예약 가능한 방이 있는 일자만 뽑아냄.
	public ArrayList<RoomType> selectReservationGst(Reservation res);


	
	
}
