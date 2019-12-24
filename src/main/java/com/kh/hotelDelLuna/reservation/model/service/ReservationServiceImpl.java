package com.kh.hotelDelLuna.reservation.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.reservation.model.dao.ReservationDao;
import com.kh.hotelDelLuna.reservation.model.vo.ResSearchCondition;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;
import com.kh.hotelDelLuna.room.model.vo.RoomType;

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

	@Override
	public int resInsert(Reservation res) {
		// TODO Auto-generated method stub
		return rDao.resInsert(res);
	}

	@Override
	public int resDelete(int res_no) {

		return rDao.resDelete(res_no);
	}

	@Override
	public int resModify(Reservation res) {

		return rDao.resModify(res);
	}

	@Override
	public int getRoomCount(String string) {
		return rDao.getRoomCount(string);
	}

	
	@Override
	public int getSuperiorResCount(String date) {

		return rDao.getSuperiorResCount(date);
	}

	@Override
	public int getDeluxeResCount(String date) {

		return rDao.getDeluxeResCount(date);
	}

	@Override
	public int getSuiteResCount(String date) {

		return rDao.getSuiteResCount(date);
	}


	@Override
	public String getRoomFileName(String res_roomType) {
		// TODO Auto-generated method stub
		return rDao.getRoomFileName(res_roomType);
	}

	@Override
	public int resRoomStatusInsert(Reservation res) {
		return rDao.resRoomStatusInsert(res);
	}

	@Override
	public int getResNo(Reservation res) {

		return rDao.getResNo(res);
	}

	@Override
	public int payStatusCheck(int res_no) {

		return rDao.payStatusCheck(res_no);
	}

	@Override
	public int roomStatusDelete(int resNo) {

		return rDao.roomStatusDelete(resNo);
	}


	@Override
	public List<Map<String, Object>> getRoomList() {

		return rDao.getRoomList();
	}

	@Override
	public int getResRoomCount(Reservation searchRes) {

		return rDao.getResRoomCount(searchRes);
	}

	@Override
	public ArrayList<RoomType> selectRoomList() {

		return rDao.selectRoomList();
	}

	@Override
	public RoomType getRoomType(String res_roomType) {

		return rDao.getRoomType(res_roomType);
	}

	@Override
	public int insertInvoice(Reservation res) {

		return rDao.insertInvoice(res);
	}

	@Override
	public int insertSales(Reservation res) {

		return rDao.insertSales(res);
	}


}
