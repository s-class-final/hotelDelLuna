package com.kh.hotelDelLuna.member.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotelDelLuna.common.PageInfo;
import com.kh.hotelDelLuna.common.Pagination;
import com.kh.hotelDelLuna.member.model.exception.MemberException;
import com.kh.hotelDelLuna.member.model.service.MemberService;
import com.kh.hotelDelLuna.member.model.vo.Inquiry;
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
		
		if(m.getUserPwd().length() <= 7 && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "member/changePwd";
			
		}else {
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				model.addAttribute("loginUser", loginUser);
			}else {
				throw new MemberException("로그인 실패!!");
			}
			return "../../index";
		}
		
	}
	

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		// SessionStatus에서 제공하는 setComplete를 쓰는 이유는
		// Session.setAttributes의 객체는 setComplete()를 호출할 때까지 유지됨

		// 로그아웃은 되는데 간혹 로그아웃 버튼을 두 번 눌러야 로그아웃 되는 경우가 있는데
		// 그럴 때는 로그인 부분에서 미리 setComplete를 실행하고 로그아웃 해 주면 잘 됨

		return "../../index";
		// 다 되는 거 확인 됐으면 menubar.jsp 가서 회원가입 만들자(a 태그에 urlmapping 경로 추가)
	}
	
	@RequestMapping("mjoin.do")
	public String memberJoin() {

		return "member/memberJoin";
	}
	
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, Model model, HttpSession session,
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
			Member loginUser = mService.loginUser(m);
			model.addAttribute("loginUser", loginUser);
			return "home";
		}else {
			throw new MemberException("회원 가입 실패!!");
		}
	}
	
	@RequestMapping("mdrop.do")
	public String memberDrop() {

		return "member/memberDrop";
	}
	
	@RequestMapping("mdelete.do")
	public String deleteMember(HttpSession session, String userId) {
		int result = mService.deleteMember(userId);
		
		if(result > 0) {
			return "redirect:logout.do";
			// 알아서 로그아웃을 해 주는 메소드를 활용하자
		}else {
			throw new MemberException("탈퇴 실패!!");
		}
		
	}
	
	@RequestMapping("idcheck.do")
	public void idCheck(HttpServletResponse response, String userId) throws IOException {
		
		boolean isUsable = mService.idCheck(userId) == 0 ? false : true;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping(value="pwdcheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String pwdCheck(Member m, Model model, String userId, String userPwd) throws IOException {
		Member loginUser = mService.loginUser(m);
		
		if(loginUser == null) {
			return "nope";
		}
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			return "true";
		}else {
			return "false";
		}
		
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
			Member loginUser = mService.kakaoLogin(kakaoId);
			session.setAttribute("loginUser", loginUser);
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
		
		return "../../index";
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
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		m.setUserId(tomail);
		String encPwd = bcryptPasswordEncoder.encode(request.getParameter("randomPwd"));
		m.setUserPwd(encPwd);
		
		int result = mService.changePwd(m);
		
		if(result > 0) {
			return "../../index";
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
		
		Member myPage = mService.findMember(m);
		
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
	public String changePwd(HttpSession session, Member m, Model model, String userId, String userPwd) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setUserId(userId);
		String encPwd = bcryptPasswordEncoder.encode(userPwd);
		m.setUserPwd(encPwd);
		
		m.setUserName(loginUser.getUserName());
		m.setUserPhone(loginUser.getUserPhone());
		m.setUserT(loginUser.getUserT());
		m.setKakao(loginUser.getKakao());
		m.setPoint(loginUser.getPoint());
		
		int result = mService.changePwd(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "true";			
		}else {
			return "false";
		}
	}
	
	@RequestMapping("changeInfo.do")
	@ResponseBody
	public String changeInfo(HttpSession session, Model model, Member m, String userName, String userPhone) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setUserId(loginUser.getUserId());
		m.setUserName(userName);
		m.setUserPhone(userPhone);
		
		m.setUserT(loginUser.getUserT());
		m.setKakao(loginUser.getKakao());
		m.setPoint(loginUser.getPoint());
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "true";			
		}else {
			return "false";
		}
	}
	
	@RequestMapping("findkakao.do")
	@ResponseBody
	public String findKakao(Member m, HttpServletResponse response, String userId) {
		m.setUserId(userId);
		
		int result = mService.findKakao(m);
		
		if(result > 0) {
			return "true";			
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping("allinquiry.do")
	public ModelAndView inquiryList(ModelAndView mv,
									@RequestParam(value="page", required=false) Integer page) {
		// 마이바티스 때 했던 PageInfo와 Pagination을 그대로 쓰자
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
			int listCount = mService.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<Inquiry> list = mService.selectList(pi);
		/*
			listCount = mService.getNoReplyListCount();
			pi = Pagination.getPageInfo(currentPage, listCount);
			list = mService.selectNoReplyList(pi);
		*/
		if(list != null && list.size() > 0) {	// 게시글이 있다면
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/inquiryAll");
		}else {
			mv.addObject("list", list);
			mv.setViewName("member/inquiryAll");
		}
		
		return mv;
	}
	
	@RequestMapping("minquiry.do")
	public ModelAndView mInquiryList(ModelAndView mv, HttpSession session,
									@RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Inquiry> list = mService.selectMList(userId, pi);
		
		if(list != null && list.size() > 0) {	// 게시글이 있다면
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/inquiryMember");
		}else {
			mv.addObject("list", list);
			mv.setViewName("member/inquiryMember");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "sendcode.do", method = RequestMethod.POST)
	@ResponseBody
	public String sendCode(HttpSession session, String userId, String emailCode) {
		
		System.out.println(emailCode);
		String setfrom = "hoteldelluna1226@gmail.com";
		String tomail = userId; // 받는 사람 이메일
		String title = "호텔 델루나 가입 인증 코드"; // 제목
		String content = emailCode; // 내용

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
		
		return "true";
	}
	
	@RequestMapping("iinsertView.do")
	public String boardInsertView() {
		return "member/inquiryInsert";
	}
	
	@RequestMapping(value="iInsert.do", method=RequestMethod.POST)
	public String InquiryInsert(HttpSession session, HttpServletRequest request, Inquiry i) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String iWriter = loginUser.getUserId();
		i.setiWriter(iWriter);
		int result = mService.insertInquiry(i);
		
		if(result > 0) {
			return "redirect:minquiry.do";
		}else {
			throw new MemberException("게시글 등록 실패!");
		}
	}
	
	@RequestMapping("reinquiry.do")
	public ModelAndView inquiryUpdateView(ModelAndView mv, int iId,
										@RequestParam("page") Integer page) {
		mv.addObject("inquiry", mService.selectInquiry(iId)).addObject("currentPage", page).setViewName("member/inquiryReplyInsert");
		
		return mv;
	}
	
	@RequestMapping("upreinquiry.do")
	public ModelAndView replyUpdateView(ModelAndView mv, int iId,
										@RequestParam("page") Integer page) {
		mv.addObject("inquiry", mService.selectInquiry(iId)).addObject("currentPage", page).setViewName("member/inquiryReplyUpdate");
		
		return mv;
	}
	
	@RequestMapping("idelete.do")
	public String inquiryDelete(int iId, HttpServletRequest request, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mService.deleteInquiry(iId);
		
		if(result > 0) {
			if(loginUser.getUserT() == 1) {
				return "redirect:minquiry.do";				
			}else {
				return "redirect:allinquiry.do";
			}
		}else {
			throw new MemberException("문의글 삭제 실패!!");
		}
	}

	@RequestMapping(value="reupdate.do", method=RequestMethod.POST)
	public ModelAndView inquiryUpdate(ModelAndView mv, Inquiry i,
									HttpServletRequest request,
									@RequestParam("iId") Integer iId,
									@RequestParam("reContent") String reContent,
									@RequestParam("page") Integer page) {
		i.setiId(iId);
		i.setReContent(reContent);
		int result = mService.updateInquiry(i);
		
		if(result > 0) {
			mv.addObject("page", page).setViewName("redirect:noreply.do");
		}else {
			throw new MemberException("문의글 답변 실패!!");
		}
		
		return mv;
	}
	
	@RequestMapping(value="reupdate2.do", method=RequestMethod.POST)
	public ModelAndView replyUpdate(ModelAndView mv, Inquiry i,
									HttpServletRequest request,
									@RequestParam("iId") Integer iId,
									@RequestParam("reContent") String reContent,
									@RequestParam("page") Integer page) {
		i.setiId(iId);
		i.setReContent(reContent);
		int result = mService.updateInquiry(i);
		
		if(result > 0) {
			mv.addObject("page", page).setViewName("redirect:allinquiry.do");
		}else {
			throw new MemberException("문의글 답변 실패!!");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "sendinquiry.do")
	public String inquirySending(HttpServletRequest request, HttpSession session) {
		
		String setfrom = request.getParameter("EMAIL");
		String tomail =  "hoteldelluna1226@gmail.com";	// 받는 사람 이메일
		String title = request.getParameter("iTitle"); // 제목
		String content = "이름 : " + request.getParameter("PI_CUST_NM") + "<br>"
						+ "이메일 : " + request.getParameter("EMAIL") + "<br>"
						+ "전화번호 : " + request.getParameter("TEL1") + "-"
						+ request.getParameter("TEL2") + "-"
						+ request.getParameter("TEL3") + "<br>"
						+ "문의 내용 : " + request.getParameter("iContent"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "../../index";
	}
	
	@RequestMapping("noreply.do")
	public ModelAndView NoReplyList(ModelAndView mv,
									@RequestParam(value="page", required=false) Integer page) {
		// 마이바티스 때 했던 PageInfo와 Pagination을 그대로 쓰자
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
			int listCount = mService.getNoReplyListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<Inquiry> list = mService.selectNoReplyList(pi);
		
		if(list != null && list.size() > 0) {	// 게시글이 있다면
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/inquiryNoReply");
		}else {
			mv.addObject("list", list);
			mv.setViewName("member/inquiryNoReply");
		}
		
		return mv;
	}
	
	@RequestMapping("mmyres.do")
	public String memberMyRes() {

		return "member/memberMyRes";
	}
	
}
