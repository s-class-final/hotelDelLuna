package com.kh.hotelDelLuna.member.controller;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.hotelDelLuna.member.model.exception.MemberException;
import com.kh.hotelDelLuna.member.model.service.MemberService;
import com.kh.hotelDelLuna.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("loginForm.do")
	public String loginForm() {

		return "member/memberLogin";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginUser(m);
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
		
		}else {
			throw new MemberException("로그인 실패!!");
		}
		
		return "home";
	}
	

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		// SessionStatus에서 제공하는 setComplete를 쓰는 이유는
		// Session.setAttributes의 객체는 setComplete()를 호출할 때까지 유지됨

		// 로그아웃은 되는데 간혹 로그아웃 버튼을 두 번 눌러야 로그아웃 되는 경우가 있는데
		// 그럴 때는 로그인 부분에서 미리 setComplete를 실행하고 로그아웃 해 주면 잘 됨

		return "home";
		// 다 되는 거 확인 됐으면 menubar.jsp 가서 회원가입 만들자(a 태그에 urlmapping 경로 추가)
	}
	
	@RequestMapping("mjoin.do")
	public String memberJoin() {

		return "member/memberJoin";
	}
	
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, Model model,
								@RequestParam("userId1") String userId1,
								@RequestParam("userId2") String userId2,
								@RequestParam("lastName") String lastName,
								@RequestParam("firstName") String firstName,
								@RequestParam("userPhone1") String userPhone1,
								@RequestParam("userPhone2") String userPhone2,
								@RequestParam("userPhone3") String userPhone3) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());

		m.setUserPwd(encPwd);
		
		// 아이디 합치기
		m.setUserId(userId1 + '@' + userId2);
		
		// 이름 합치기
		m.setUserName(lastName + " " + firstName);
		
		// 휴대폰 번호 합치기
		m.setUserPhone(userPhone1 + "-"  + userPhone2 + "-"  + userPhone3);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "home";	
		}else {
			throw new MemberException("회원 가입 실패!!");
		}
	}
	
	@RequestMapping("idcheck.do")
	public void idCheck(HttpServletResponse response, String userId) throws IOException {
		
		boolean isUsable = mService.idCheck(userId) == 0 ? false : true;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping("kakaocheck.do")
	public void kakaoIdCheck(HttpServletResponse response, String kakaoId) throws IOException {
		
		boolean isUsable = mService.kakaoIdCheck(kakaoId) == 0 ? false : true;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping("kakaojoin.do")
	public String kakaoJoin(HttpServletRequest request, Model model, HttpSession session) {
		String kakaoId = request.getQueryString();
		
		session.setAttribute("kakaoId", kakaoId);
		
		return "member/kakaoJoin";
	}
	
	@RequestMapping("kakaoinsert.do")
	public String kakaoInsert(Member m, Model model, HttpSession session,
							@RequestParam("userId1") String userId1,
							@RequestParam("userId2") String userId2,
							@RequestParam("lastName") String lastName,
							@RequestParam("firstName") String firstName,
							@RequestParam("userPhone1") String userPhone1,
							@RequestParam("userPhone2") String userPhone2,
							@RequestParam("userPhone3") String userPhone3) {
		// 아이디 합치기
		m.setUserId(userId1 + '@' + userId2);
				
		// 이름 합치기
		m.setUserName(lastName + " " + firstName);
				
		// 휴대폰 번호 합치기
		m.setUserPhone(userPhone1 + "-"  + userPhone2 + "-"  + userPhone3);
		
		String kakaoId = (String)session.getAttribute("kakaoId");
		
		m.setKakao(kakaoId);
		
		int result = mService.insertKMember(m);
		
		if(result > 0) {
			return "home";	
		}else {
			throw new MemberException("카카오 회원 가입 실패!!");
		}
	}
	
	@RequestMapping("kakaologin.do")
	public String kakaoLogin(HttpSession session, HttpServletRequest request) {
		String kakao = request.getQueryString();
		Member loginUser = mService.kakaoLogin(kakao);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}
		
		return "home";
	}
	
	@RequestMapping("findpwd.do")
	public String findPwd() {

		return "member/findPwd";
	}
	
	@RequestMapping(value = "sendmail.do")
	public String mailSending(HttpServletRequest request, HttpSession session, Member m) {
		
		String setfrom = "hoteldelluna1226@gmail.com";
		String tomail = request.getParameter("findMail"); // 받는 사람 이메일
		String title = "호텔 델루나 임시 비번"; // 제목
		String content = request.getParameter("randomPwd"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		m.setUserId(tomail);
		String encPwd = bcryptPasswordEncoder.encode(content);
		m.setUserPwd(encPwd);
		
		int result = mService.changePwd(m);
		
		if(result > 0) {
			return "home";
		}else {
			throw new MemberException("임시 비밀번호 변경 실패!");
		}
	}
	
	@RequestMapping("namecheck.do")
	public void nameCheck(Member m, HttpServletResponse response, String userId, String lastName, String firstName) throws IOException {
		m.setUserId(userId);
		m.setUserName(lastName + " " + firstName);
		
		boolean isUsable = mService.nameCheck(m) == 0 ? false : true;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping("phonecheck.do")
	public void phoneCheck(Member m, HttpServletResponse response, String userId, String userPhone) throws IOException {
		m.setUserId(userId);
		m.setUserPhone(userPhone);
		
		boolean isUsable = mService.phoneCheck(m) == 0 ? false : true;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping("mconfirm.do")
	public String myPageConfirm() {

		return "member/myPageConfirm";
	}
	
	@RequestMapping("mypageLogin.do")
	@ResponseBody
	public String myPage(Member m, Model model, String userId, String userPwd) {
		m.setUserId(userId);
		
		Member myPage = mService.findUser(m);
		
		if(bcryptPasswordEncoder.matches(userPwd, myPage.getUserPwd())) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping("mypage.do")
	public String myPage() {

		return "member/myPage";
	}
	
	@RequestMapping("changepwd.do")
	@ResponseBody
	public String changePwd(Member m, String userId, String userPwd) {
		m.setUserId(userId);
		String encPwd = bcryptPasswordEncoder.encode(userPwd);
		m.setUserPwd(encPwd);
		
		int result = mService.changePwd(m);
		
		if(result > 0) {
			return "true";			
		}else {
			return "false";
		}
	}
	
}
