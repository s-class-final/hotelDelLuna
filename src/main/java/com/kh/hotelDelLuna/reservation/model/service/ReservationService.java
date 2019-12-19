package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

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

	
}
