package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

public interface ReservationService {

	
	/* 전체 예약 리스트 갯수 불러오기 */
	int getListCount();

	/* 전체 예약 리스트 불러오기 */
	ArrayList<Reservation> selectEntireResList();


	
}
