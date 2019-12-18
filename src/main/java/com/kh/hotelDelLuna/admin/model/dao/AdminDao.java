package com.kh.hotelDelLuna.admin.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.admin.model.vo.Sales;

@Repository("aDao")
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Invoice> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList",null,rowBounds);
	}

	public Invoice createInvoice(int ivId) {
		
		return sqlSession.selectOne("adminMapper.createInvoice",ivId);
	}

	public int getSalesListCount() {
		
		return sqlSession.selectOne("adminMapper.getSalesListCount");
	}

	public ArrayList<Sales> selectSalesList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesList",null,rowBounds);
	}



	  public Sales salesDetail(String ckDate) {
	  
	  return sqlSession.selectOne("adminMapper.salesDetail",ckDate); 
	  
	  }

	public List<Sales> selectSalesList() {
		
		return sqlSession.selectList("adminMapper.selectSalesList");
	}

	public List<Sales> selectMonthSales() {
		
		return sqlSession.selectList("adminMapper.selectMonthSales");
	}

	public List<Sales> selectYearSales() {
		
		return sqlSession.selectList("adminMapper.selectYearSales");
	}
	 
	
	
}
