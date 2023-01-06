package com.kodup.mantoman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MantomanController {
	@RequestMapping("/mantoman/mantoman_index")
	public ModelAndView mantomanIndex() {
		ModelAndView mv = new ModelAndView();
		
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
	
}
