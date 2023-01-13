package com.kodup.mantoman;

import java.io.IOException;
import java.util.List;

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
	public ModelAndView mantomanIndex(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		String sessionId = req.getParameter("sessionId");
		MantomanVo mtmVo = service.selectId(sessionId);
		String grade = mtmVo.getGrade();
		if(grade.equals("3")) {
			mtmVo.setGrade("파트너멘토");
		}else if(grade.equals("2")) {
			mtmVo.setGrade("플러스멘토"); 
		}else if(grade.equals("1")) {
			mtmVo.setGrade("퍼스널멘토");
		}else if(grade.equals("0")) {
			mtmVo.setGrade("멘티");
		}
		
		System.out.println("grade : " + grade);
		System.out.println("sessionId : " + sessionId);
		
		mv.addObject("mtmVo", mtmVo);
		mv.setViewName("mantoman/mantoman_index");
		return mv;
	}
	

	@RequestMapping("/mantoman/mantoman_mentorlist")
	public ModelAndView mentorlist(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		List<MantomanVo> list = service.selectMentoList();
		String mentiId = req.getParameter("mentiId");
		mv.addObject("list", list);
		mv.addObject("mentiId", mentiId);
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
	public ModelAndView chatView(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String roomCode = (String)req.getParameter("roomCode");
		String yourNickname = (String)req.getParameter("yourNickname");
		String myNickname = (String)req.getParameter("myNickname");
		String sessionId = (String)req.getParameter("sessionId");
		mv.addObject("roomCode", roomCode);
		mv.addObject("yourNickname", yourNickname);
		mv.addObject("myNickname", myNickname);
		mv.addObject("sessionId", sessionId);
		mv.setViewName("mantoman/mantoman_chatview");
		return mv;
	}
	
}
