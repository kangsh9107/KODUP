package com.kodup.mantoman;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.login.MemberVo;

@RestController
public class MantomanController {
	
	@Autowired
	MantomanService service;
	
	@RequestMapping("/mantoman/mantoman_index")
	public ModelAndView mantomanIndex(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		String sessionId = req.getParameter("sessionId");
		MantomanVo mtmVo = service.selectId(sessionId);
		System.out.println("sessionId : " + sessionId);
		mv.addObject("mtmVo", mtmVo);

		mv.setViewName("mantoman/mantoman_index");
		return mv;
	}
	

	@RequestMapping("/mantoman/mantoman_mentorlist")
	public ModelAndView mentorlist() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mantoman/mantoman_mentorlist");
		return mv;
	}
	
	@RequestMapping("/mantoman/mantoman_chatlist")
	public ModelAndView chatlist() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mantoman/mantoman_chatlist");
		return mv;
	}
	
	@RequestMapping("/profile/member_profile_chat")
	public ModelAndView profileChat() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("profile/member_profile_chat");
		return mv;
	}
	
	@RequestMapping("/mantoman/mantoman_chatview")
	public ModelAndView chatView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mantoman/mantoman_chatview");
		return mv;
	}
	
}
