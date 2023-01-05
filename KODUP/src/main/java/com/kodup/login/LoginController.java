package com.kodup.login;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginController {
	
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
	
}
