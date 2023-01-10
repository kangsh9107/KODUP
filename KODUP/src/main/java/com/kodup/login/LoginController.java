package com.kodup.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@RequestMapping("/login/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/main");
		return mv;
	}

	@RequestMapping("/login/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/login");
		return mv;
	}
	
	@RequestMapping("/login/change_pwd")
	public ModelAndView changePwd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/change_pwd");
		return mv;
	}
	
	@RequestMapping("/login/find_account")
	public ModelAndView findAccount() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/find_account");
		return mv;
	}
	
	@RequestMapping("/login/join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/join");
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/login/logoutR")
	public ModelAndView logoutR(HttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		session.setAttribute("sessionId", null);
		mv.setViewName("/login/main");
		return mv;
	}
	
	//로그인
	@RequestMapping("/login/loginR")
	public ModelAndView loginR(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		boolean b = false;
//		mVo.setAccount_type(0);
//		mVo.setAge(20);
//		mVo.setBan_status(0);
//		mVo.setCorp_status(0);
//		mVo.setEmail("hong@naver.com");
//		mVo.setGender("m");
//		mVo.setGrade("normal");
//		mVo.setJoin_date("2023-01-09");
//		mVo.setMento_status(0);
//		mVo.setNickname("a001");
//		mVo.setPixel(1000);
//		mVo.setProfile_img("default.png");
//		mVo.setPwd("1111");
		b = service.login(mVo);
		
		b = true;  //테스트용
		//b = false; // 테스트용
		
		if( !b ) {
			String msg = "아이디와 비밀번호를 확인해주세요.";
			res.setContentType("text/html; charset=euc-kr");
			res.setCharacterEncoding("euc-kr");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('" + msg + "');</script>");
			out.flush();
			mv.setViewName("/login/login");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", mVo.getId());
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
	//카카오 로그인
	@RequestMapping("/login/join_kakao_check")
	public ModelAndView loginKakaoR(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		//ID 중복체크
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		mv.addObject("id", id);
		mv.addObject("email", email);
		mv.setViewName("/login/join_kakao");
		return mv;
	}
	
	@RequestMapping("/login/login_kakao")
	public ModelAndView loginKakao(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		//INSERT
		
		mv.addObject("mVo", mVo);
		mv.setViewName("/login/main");
		return mv;
	}
	
}
