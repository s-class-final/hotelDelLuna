package com.kh.hotelDelLuna.member.model.service;

import com.kh.hotelDelLuna.member.model.vo.Member;

public interface MemberService {

	Member loginUser(Member m);

	int insertMember(Member m);

	int idCheck(String userId);

	int kakaoIdCheck(String kakaoId);

	int insertKMember(Member m);

	Member kakaoLogin(String kakao);

	int changePwd(Member m);

	int nameCheck(Member m);

	int phoneCheck(Member m);

	Member findUser(Member m);

}
