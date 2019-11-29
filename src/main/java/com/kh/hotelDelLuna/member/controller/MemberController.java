package com.kh.hotelDelLuna.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.hotelDelLuna.member.model.service.MemberService;
import com.kh.hotelDelLuna.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("loginForm.do")
	public String enrollView() {

		return "member/memberLogin";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberlogin(Member m, HttpSession session, SessionStatus status) {

		Member loginUser = mService.loginUser(m);
		System.out.println(loginUser);

		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}
		return "home";
	}

	/*
	 * @RequestMapping(value = "login.do", method = RequestMethod.POST) public
	 * String memberLogin(Member m, Model model) {
	 * 
	 * matches() 메소드를 통해 우리는 암호화되어 있는 DB값과 사용자가 입력한 비밀번호를 비교할 수 있다 당연히 일치하면 로그인 성공!,
	 * 실패하면 로그인 실패!
	 * 
	 * 
	 * Member loginUser = mService.loginUser(m);
	 * 
	 * if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) { // 암호화 됐던
	 * 비밀번호를 알아서 복호화 처리해서 비교해 줌 model.addAttribute("loginUser", loginUser);
	 * 
	 * }else { throw new MemberException("로그인 실패!!"); } return "home"; }
	 */

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃 처리를 위해 커맨드 객체로 세션의 상태를 관리할 수 있는 SessionStatus 객체가 필요하다
		status.setComplete();
		// SessionStatus에서 제공하는 setComplete를 쓰는 이유는
		// Session.setAttributes의 객체는 setComplete()를 호출할 때까지 유지됨

		// 로그아웃은 되는데 간혹 로그아웃 버튼을 두 번 눌러야 로그아웃 되는 경우가 있는데
		// 그럴 때는 로그인 부분에서 미리 setComplete를 실행하고 로그아웃 해 주면 잘 됨

		return "home";
		// 다 되는 거 확인 됐으면 menubar.jsp 가서 회원가입 만들자(a 태그에 urlmapping 경로 추가)
	}
}
