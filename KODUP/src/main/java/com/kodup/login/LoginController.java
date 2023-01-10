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
		b = service.login(mVo); //ID&PWD체크
		
		//b = true;  //테스트용
		//b = false; // 테스트용
		
		if( !b ) {
			mv.addObject("b", b);
			mv.setViewName("/login/login_false");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", mVo.getId());
			
			//grade가져옴
			int grade = 0;
			grade = service.checkGrade(mVo.getId());
			
			if(grade > 0 || grade <4) {
				session.setAttribute("grade", grade);
			}
			
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
	//카카오 로그인
	@RequestMapping("/login/join_kakao_check")
	public ModelAndView loginKakaoR(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String img = req.getParameter("img");
		boolean b = false;
		
		//ID 중복체크 후 중복아니면 INSERT하고 로그인, 중복이면 LOGIN
		b = service.checkId(id);
		
		b = true; //테스트용
		//ID중복
		if( b ) {
			mv.addObject("id", id);
			mv.addObject("email", email);
			mv.addObject("img", img);
			mv.setViewName("/login/join_kakao");
		} else { //ID중복 아님
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", mVo.getId());
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
	@RequestMapping("/login/login_kakao")
	public ModelAndView loginKakao(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mVo", mVo);
		mv.setViewName("/login/main");
		return mv;
	}
	
	//카카오 회원가입
	@RequestMapping("/login/join_kakao")
	public ModelAndView joinKako(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		
		
		HttpSession session = req.getSession();
		session.setAttribute("sessionId", mVo.getId());
		mv.setViewName("/login/main");
		return mv;
	}
	
}
