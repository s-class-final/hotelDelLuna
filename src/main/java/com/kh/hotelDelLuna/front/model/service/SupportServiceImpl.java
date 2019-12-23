package com.kh.hotelDelLuna.front.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.admin.model.vo.Sales;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.front.model.dao.SupportDao;
import com.kh.hotelDelLuna.front.model.vo.Notice;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

@Service("sService")
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	SupportDao sDao;

	@Override
	public int getListCount() {
		return sDao.getListcount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return sDao.selectList(pi);
	}

	@Override
	public Notice selectNotice(int nId) {
		return sDao.selectNotice(nId);
	}

	@Override
	public int insertNotice(Notice n) {
		return sDao.insertNotice(n);
	}

	@Override
	public int updateNotice(Notice n) {
		return sDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nId) {
		return sDao.deleteNotice(nId);
	}


	
	
	@Override
	public int getAListCount() {
		
		return sDao.getAListcount();
	}

	@Override
	public ArrayList<Notice> selectAList(PageInfo pi) {
		
		return sDao.selectAList(pi);
	}

	
	@Override
	public ArrayList<RoomType> selectReservationGst(Reservation res) {
		return sDao.selectReservationGst(res);
	}

	@Override
	public int insertReservationGst(Reservation r) {
		return sDao.insertReservationGst(r);
	}

	@Override
	public int insertInvoiceGst(Invoice i) {
		return sDao.insertInvoiceGst(i);
	}

	@Override
	public int insertSalesGst(Reservation r) {
		return sDao.insertSalesGst(r);
	}
	

}
