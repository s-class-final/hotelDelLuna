package com.kh.hotelDelLuna.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.member.model.dao.MemberDao;
import com.kh.hotelDelLuna.member.model.vo.Inquiry;
import com.kh.hotelDelLuna.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao mDao;
	
	@Override
	public Member loginUser(Member m) {
		
		return mDao.selectMember(m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(m);
	}

	@Override
	public int idCheck(String userId) {
		
		return mDao.idCheck(userId);
	}

	@Override
	public int kakaoIdCheck(String kakaoId) {
		
		return mDao.kakaoIdCheck(kakaoId);
	}

	@Override
	public int insertKMember(Member m) {
		
		return mDao.insertKMember(m);
	}

	@Override
	public Member kakaoLogin(String kakao) {
		
		return mDao.kakaoLogin(kakao);
	}

	@Override
	public int changePwd(Member m) {
		
		return mDao.changePwd(m);
	}

	@Override
	public int nameCheck(Member m) {
		
		return mDao.nameCheck(m);
	}

	@Override
	public int phoneCheck(Member m) {
		
		return mDao.phoneCheck(m);
	}

	@Override
	public Member findUser(Member m) {
		
		return mDao.findUser(m);
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(m);
	}

	@Override
	public int findKakao(Member m) {
		
		return mDao.findKakao(m);
	}

	@Override
	public int getListCount() {
		
		return mDao.getListCount();
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi) {
		
		return mDao.selectList(pi);
	}
	
	@Override
	public int getMListCount(String userId) {
		
		return mDao.getMListCount(userId);
	}

	@Override
	public ArrayList<Inquiry> selectMList(String userId, PageInfo pi) {
		
		return mDao.selectMList(userId, pi);
	}

	@Override
	public int insertInquiry(Inquiry i) {
		
		return mDao.insertInquiry(i);
	}



}
