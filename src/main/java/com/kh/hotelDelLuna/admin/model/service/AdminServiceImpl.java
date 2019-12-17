package com.kh.hotelDelLuna.admin.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.admin.model.dao.AdminDao;
import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.admin.model.vo.Sales;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao aDao;

	@Override
	public int getListCount() {
		
		return aDao.getListCount();
	}

	@Override
	public ArrayList<Invoice> selectList(PageInfo pi) {
		
		return aDao.selectList(pi);
	}

	@Override
	public Invoice createInvoice(int ivId) {
		
		return aDao.createInvoice(ivId);
	}

	@Override
	public int getSalesListCount() {
		
		return aDao.getSalesListCount();
	}

	@Override
	public ArrayList<Sales> selectSalesList(PageInfo pi) {
		
		return aDao.selectSalesList(pi);
	}

	
	  @Override 
	  public Sales salesDetail(String ckDate) {
	  
		  return aDao.salesDetail(ckDate); }


	@Override
	public List<Sales> selectSalesList() {
		
		return aDao.selectSalesList();
	}

	@Override
	public List<Sales> selectMonthSales() {
		
		return aDao.selectMonthSales();
	}

	@Override
	public List<Sales> selectYearSales() {
		
		return aDao.selectYearSales();
	}
	 


}
