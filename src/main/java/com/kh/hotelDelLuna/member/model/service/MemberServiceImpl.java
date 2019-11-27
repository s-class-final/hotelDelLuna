package com.kh.hotelDelLuna.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotelDelLuna.member.model.dao.MemberDao;
import com.kh.hotelDelLuna.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao mDao;
	
	@Override
	public Member loginUser(Member m) {
		
		return mDao.selectMember(m);
	}

}
