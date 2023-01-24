package com.kodup.profile;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.mantoman.MantomanService;

@RestController
public class ProfileController {
	
	@Autowired
	MantomanService service;
	
	@RequestMapping("/profile/member_profile")
	public ModelAndView profileMain(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException  {
		ModelAndView mv = new ModelAndView();
		String sessionId = (String)req.getParameter("sessionId");
		//pfVo = service.selectProfile(sessionId);
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
