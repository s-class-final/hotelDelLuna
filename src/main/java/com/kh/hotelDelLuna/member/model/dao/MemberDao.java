package com.kh.hotelDelLuna.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.member.model.vo.Inquiry;
import com.kh.hotelDelLuna.member.model.vo.Member;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

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

	public Member idCheck(String userId) {
		
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

	public Member findMember(Member m) {
		
		return sqlSession.selectOne("memberMapper.findMember", m);
	}

	public int updateMember(Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int findKakao(Member m) {
		
		return sqlSession.selectOne("memberMapper.findKakao", m);
	}

	public int getListCount() {
		
		return sqlSession.selectOne("memberMapper.getListCount");
	}

	public ArrayList<Inquiry> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", pi, rowBounds);
	}
	
	public int getMListCount(String userId) {
		
		return sqlSession.selectOne("memberMapper.getMListCount", userId);
	}

	public ArrayList<Inquiry> selectMList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMList", userId, rowBounds);
	}

	public int insertInquiry(Inquiry i) {
		
		return sqlSession.insert("memberMapper.insertInquiry", i);
	}

	public Inquiry selectInquiry(int iId) {
		
		return sqlSession.selectOne("memberMapper.selectInquiry", iId);
	}

	public int deleteInquiry(int iId) {
		
		return sqlSession.update("memberMapper.deleteInquiry", iId);
	}

	public int updateInquiry(Inquiry i) {
		
		return sqlSession.update("memberMapper.updateInquiry", i);
	}

	public int insertNonMember(Member m) {
		
		return sqlSession.insert("memberMapper.insertNonMember",m);
	}
	
	public int deleteMember(String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int getNoReplyListCount() {
		
		return sqlSession.selectOne("memberMapper.getNoReplyListCount");
	}

	public ArrayList<Inquiry> selectNoReplyList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectNoReplyList", pi, rowBounds);
	}

	public int getMyRListCount(String userId) {
		
		return sqlSession.selectOne("memberMapper.getMyRListCount", userId);
	}

	public ArrayList<Reservation> selectMyResList(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyResList", userId, rowBounds);
	}

	public int insertNMember(Member m) {
		
		return sqlSession.update("memberMapper.insertNMember", m);
	}

	public int searchRes(Member m) {
		
		return sqlSession.selectOne("memberMapper.searchRes", m);
	}

	public int insertNKMember(Member m) {
		
		return sqlSession.update("memberMapper.insertNKMember", m);
	}
	
}
