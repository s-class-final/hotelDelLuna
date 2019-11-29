package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.dao.ReservationDao;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
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

	@Override
	public ArrayList<Reservation> selectResList(PageInfo pi) {
		
		return rDao.selectResList(pi);
	}

	@Override
	public int getSearchResultListCount(ResSearchCondition sc) {

		return rDao.getSearchResultListCount(sc);
	}

	@Override
	public ArrayList<Reservation> selectSearchResultList(ResSearchCondition sc, PageInfo pi) {
		
		return rDao.selectSearchResultList(sc,pi);
	}

	@Override
	public Reservation selectResOne(int res_no) {
		return rDao.selectResOne(res_no);
	}


}
