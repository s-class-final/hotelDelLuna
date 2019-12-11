package com.kh.hotelDelLuna.front.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.front.model.vo.Notice;

public interface SupportService {

	//공지글 조회 - 전체 공지사항 갯수 확인
	public int getListCount();

	//공지글 조회 - 화면에 보여줄 공지글만 불러오기
	public ArrayList<Notice> selectList(PageInfo pi);

	//공지글 상세보기 - 선택한 공지사항 상세보기
	public Notice selectNotice(int nId);

	public int insertNotice(Notice n);

	public int updateNotice(Notice n);

	public int deleteNotice(int nId);


	
	
}
