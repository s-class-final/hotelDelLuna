package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.reservation.model.dao.ReservationDao;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDao rDao;

	@Override
	public int getListCount() {
		
		return rDao.getListCount();
	}
	
	@Override
	public ArrayList<Reservation> selectEntireResList() {

		return rDao.selectEntireResList();
	}


}
