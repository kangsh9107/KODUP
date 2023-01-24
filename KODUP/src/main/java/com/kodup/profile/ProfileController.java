package com.kodup.profile;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class ProfileController {
	
	@Autowired
	ProfileService service;
	
	@RequestMapping("/profile/member_profile")
	public ModelAndView profileMain(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException  {
		ModelAndView mv = new ModelAndView();
		String sessionId = (String)req.getParameter("sessionId");
		pfVo = service.selectProfile(sessionId);
		if(pfVo!=null) {
			String grade = pfVo.getGrade();
			if(grade.equals("3")) {
				pfVo.setGrade("파트너멘토");
			}else if(grade.equals("2")) {
				pfVo.setGrade("플러스멘토"); 
			}else if(grade.equals("1")) {
				pfVo.setGrade("퍼스널멘토");
			}else if(grade.equals("0")) {
				pfVo.setGrade("멘티");
			}
		}
		mv.addObject("pfVo", pfVo);
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
