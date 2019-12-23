package com.kh.hotelDelLuna.admin.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.admin.model.vo.Sales;

public interface AdminService {

	public int getListCount();
	
	public ArrayList<Invoice> selectList(PageInfo pi);

	public Invoice createInvoice(int ivId);
// ------------------------------------여기부턴 Sales 부분 -----------------------------------
	
	public int getSalesListCount();

	public ArrayList<Sales> selectSalesList(PageInfo pi);

	public List<Sales> selectSalesList();

	public List<Sales> selectMonthSales();

	public List<Sales> selectYearSales();

	public List<Sales> selectRtypeSales(); 



	
	
	
}
