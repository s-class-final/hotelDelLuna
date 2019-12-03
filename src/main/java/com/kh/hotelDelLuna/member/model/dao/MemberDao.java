package com.kh.hotelDelLuna.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member m) {
		
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(String userId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int kakaoIdCheck(String kakaoId) {
		
		return sqlSession.selectOne("memberMapper.kakaoIdCheck", kakaoId);
	}

	public int insertKMember(Member m) {
		
		return sqlSession.insert("memberMapper.insertKMember", m);
	}

	public Member kakaoLogin(String kakao) {
		
		return sqlSession.selectOne("memberMapper.kakaoLogin", kakao);
	}

	public int changePwd(Member m) {
		
		return sqlSession.update("memberMapper.changePwd", m);
	}

	public int nameCheck(Member m) {
		
		return sqlSession.selectOne("memberMapper.nameCheck", m);
	}

	public int phoneCheck(Member m) {
		
		return sqlSession.selectOne("memberMapper.phoneCheck", m);
	}

	public Member findUser(Member m) {
		
		return sqlSession.selectOne("memberMapper.findUser", m);
	}
	
	
}
