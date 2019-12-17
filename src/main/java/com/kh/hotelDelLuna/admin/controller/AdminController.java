package com.kh.hotelDelLuna.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotelDelLuna.admin.model.exception.AdminException;
import com.kh.hotelDelLuna.admin.model.service.AdminService;
import com.kh.hotelDelLuna.admin.model.vo.Invoice;
import com.kh.hotelDelLuna.admin.model.vo.PageInfo;
import com.kh.hotelDelLuna.admin.model.vo.Sales;
import com.kh.hotelDelLuna.common.Pagination;

@Controller
public class AdminController {
	
	@Autowired
	AdminService aService;
	
	@RequestMapping("rqlist.do")
	public ModelAndView RequestInvoiceList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		
		int currentPage = 1;
		
		if(page!= null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Invoice> list = aService.selectList(pi);
	//	System.out.println(list.get(4));
		
		if(list != null && list.size()>0) { // 인보이스 요청이 있다면
			 mv.addObject("list",list);
			 mv.addObject("pi",pi);
			 mv.setViewName("invoice/RequestInvoice");
		}else {
			throw new AdminException("인보이스 요청 조회 실패");
		}
		
		return mv;
		
	}
	
	@RequestMapping("create.do")
	public ModelAndView createInvoice(ModelAndView mv,int ivId) {
		
		
		
		Invoice invoice = aService.createInvoice(ivId);
		
		System.out.println(invoice);
		
		if(invoice != null) {
			mv.addObject("invoice",invoice).setViewName("invoice/createInvoice");
			
		}else {
			throw new AdminException("인보이스 발행 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("pList.do")
	public ModelAndView salesView(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		
		int currentPage = 1;
		
		if(page!= null) {
			currentPage = page;
		}
		
		int listCount = aService.getSalesListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sales> list = aService.selectSalesList(pi);
	//	System.out.println(list.get(4));
		
		if(list != null && list.size()>0) { 
			 mv.addObject("list",list);
			 mv.addObject("pi",pi);
			 mv.setViewName("sales/salesMenuPage");
		}else {
			throw new AdminException("매출 리스트 조회 실패");
		}
		
		
		return mv;
	}
	
	@RequestMapping("salesDetail.do")
	public ModelAndView salesDetail(ModelAndView mv,Date ckinDate) {
		
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		String ckDate = transFormat.format(ckinDate);
		
		
		
		Sales sales = aService.salesDetail(ckDate);
		
		
		
	
		/* Sales sales = (Sales)aService.salesDetail(ckDate); */
		
		
		
		System.out.println("날짜 : " + sales);
		System.out.println("inDate 변환 : " + ckDate);
		
		if(sales != null) {
			mv.addObject("sales",sales).setViewName("sales/salesDetail");
			
		}else {
			throw new AdminException("매출 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping(value="sumSales.do")
	public ModelAndView sumsales(ModelAndView mv,Date ckinDate) {
		
		
		
		List<Sales>  list=  aService.selectMonthSales();
		mv.addObject("list", list);
		mv.setViewName("sales/sumSales");
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		
		String str ="[";
		str +="['날짜' ,'가격'] ,";
		int num =0;
		for(Sales dto : list){
			str +="['";
			str  += dto.getCkinDate();
			str +="' , ";
			str += dto.getPrice();
			str +=" ]";
			
			num ++;
			if(num<list.size()){
				str +=",";
			}		
		}
		str += "]";
		mv.addObject("str", str);
		
		return mv;
	}
	
	@RequestMapping(value="yearSales.do")
	public ModelAndView yearSales(ModelAndView mv, Date ckinDate){
		
		List<Sales>  list=  aService.selectYearSales();
		mv.addObject("list", list);
		mv.setViewName("sales/sumSales");
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		
		String str ="[";
		str +="['날짜' ,'가격'] ,";
		int num =0;
		for(Sales dto : list){
			str +="['";
			str  += dto.getCkinDate();
			str +="' , ";
			str += dto.getPrice();
			str +=" ]";
			
			num ++;
			if(num<list.size()){
				str +=",";
			}		
		}
		str += "]";
		mv.addObject("str", str);
		
		return mv;
		
	}
	
	@RequestMapping(value="sales.do", method=RequestMethod.GET)
	public ModelAndView json_get(){
			
		ModelAndView mv=new ModelAndView();
		
		
		List<Sales>  list=  aService.selectSalesList();
		mv.addObject("list", list);
		mv.setViewName("sales/salesDetail");
		
		System.out.println(" 리스트 사이즈  : " + list.size());
		
		String str ="[";
		str +="['상품명' , '가격'] ,";
		int num =0;
		for(Sales dto : list){
			
			str +="['";
			str  += dto.getCkinDate();
			str +="' , ";
			str += dto.getPrice();
			str +=" ]";
			
			num ++;
			if(num<list.size()){
				str +=",";
			}		
		}
		str += "]";
		mv.addObject("str", str);
		return mv;
				
	}
	
	
	
	
	
	
	

}
