package com.kodup.profile;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ProfileController {
	@RequestMapping("/profile/member_profile")
	public ModelAndView profileMain() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("profile/member_profile");
		return mv;
	}
	
	@RequestMapping("/profile/member_profile_myarticle")
	public ModelAndView myarticle() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("profile/member_profile_myarticle");
		return mv;
	}
	
	@RequestMapping("/profile/member_profile_myrepl")
	public ModelAndView myrepl() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("profile/member_profile_myrepl");
		return mv;
	}
}
