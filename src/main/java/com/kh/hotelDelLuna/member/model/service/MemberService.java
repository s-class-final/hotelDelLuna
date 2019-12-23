package com.kh.hotelDelLuna.member.model.service;

import java.util.ArrayList;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.member.model.vo.Inquiry;
import com.kh.hotelDelLuna.member.model.vo.Member;
import com.kh.hotelDelLuna.reservation.model.vo.Reservation;

public interface MemberService {
	// 로그인
	Member loginUser(Member m);
	
	// 회원가입
	int insertMember(Member m);
	
	// 아이디 중복 확인
	Member idCheck(String userId);
	
	// 카카오 가입 여부 확인
	Member kakaoIdCheck(String kakaoId);
	
	// 카카오 회원 가입
	int insertKMember(Member m);
	
	// 카카오 로그인
	Member kakaoLogin(String kakao);
	
	// 비밀번호 변경
	int changePwd(Member m);
	
	// 이메일 임시비밀번호 전송 전 이름 일치여부 체크
	int nameCheck(Member m);
	
	// 이메일 임시비밀번호 전송 전 전화번호 일치여부 체크
	int phoneCheck(Member m);
	
	// 마이페이지 들어갈 때 비밀번호 한 번 더 확인
	Member findMember(Member m);
	
	// 회원 정보 수정
	int updateMember(Member m);
	
	// 이메일 임시비밀번호 전송 전 카카오로 가입한 아이디인지 확인
	int findKakao(Member m);
	
	// 문의 게시판 전체 수 조회(관리자)
	int getListCount();
	
	// 문의 게시판 전체 조회(관리자)
	ArrayList<Inquiry> selectList(PageInfo pi);
	
	// 문의 게시판 전체 수 조회(사용자)
	int getMListCount(String userId);
	
	// 문의 게시판 조회(사용자)
	ArrayList<Inquiry> selectMList(String userId, PageInfo pi);
	
	// 문의 게시판 등록(사용자)
	int insertInquiry(Inquiry i);
	
	// 문의 게시판 상세조회
	Inquiry selectInquiry(int iId);
	
	// 문의 글 삭제
	int deleteInquiry(int iId);
	
	// 문의 글 수정
	int updateInquiry(Inquiry i);

	// 예약내역 삽입시 비회원일 때 비회원으로 회원 생성
	int insertNonMember(Member m);
	
	// 회원 탈퇴
	int deleteMember(String userId);
	
	// 문의 게시판 답변 대기 전체 수 조회(관리자)
	int getNoReplyListCount();
	
	// 문의 게시판 답변 대기 조회(관리자)
	ArrayList<Inquiry> selectNoReplyList(PageInfo pi);
	
	// 내 예약 내역 전체 수 조회
	int getMyRListCount(String userId);
	
	// 내 예약 내역 조회
	ArrayList<Reservation> selectMyResList(String userId, PageInfo pi);
	
	// 예약 내역 존재하는 비회원 회원가입 해주기
	int insertNMember(Member m);
	
	// 회원 테이블에서 등록 돼있는지 조회
	int searchRes(Member m);
	
	// 예약 내역 존재하는 비회원 카카오 회원가입 해주기
	int insertNKMember(Member m);

	// 회원의 해당 예약 내역 총액을 계산하여 포인트 적립
	int plusPoint(Reservation res);
	

}
