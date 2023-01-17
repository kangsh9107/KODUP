package com.kodup.mantoman;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.login.MemberVo;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@RestController
public class MantomanController {
	
	@Autowired
	MantomanService service;
	
	@RequestMapping("/mantoman/mantoman_index")
	public ModelAndView mantomanIndex(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		String sessionId = req.getParameter("sessionId");
		mtmVo = service.selectId(sessionId);
		if(mtmVo!=null) {
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
		}
		
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
	public ModelAndView chatlist(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String id = (String)req.getParameter("id");
		System.out.println("id : " + id);
		List<MantomanVo> list = service.selectChatList(id);
		System.out.println("list : " + list);
		for (MantomanVo mtmVo : list) {
            System.out.println(mtmVo.getId());
            System.out.println(mtmVo.getLast_talk());
            System.out.println(mtmVo.getLast_talktime());
            System.out.println(mtmVo.getNickname());
        }
		mv.addObject("list", list);
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
	public ModelAndView chatView(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String roomCode = (String)req.getParameter("roomCode");
		System.out.println("roomCode : " + roomCode);
		String yourNickname = (String)req.getParameter("yourNickname");
		String myNickname = (String)req.getParameter("myNickname");
		String sessionId = (String)req.getParameter("sessionId");
		String yourId = (String)req.getParameter("yourId");
		String myProfile_img = (String)req.getParameter("myProfile_img");
		String yourProfile_img = (String)req.getParameter("yourProfile_img");
		int mantoman_pixel_reward = Integer.parseInt(req.getParameter("mantoman_pixel_reward"));
		
		System.out.println("myProfile_img : " + myProfile_img);
		
		mtmVo.setId(sessionId);
		mtmVo.setYour_id(yourId);
		mtmVo.setMantoman_pixel_reward(mantoman_pixel_reward);
		mtmVo.setRoomCode(roomCode);
		
		boolean b = service.insertMantoman(mtmVo);
		
		mv.addObject("roomCode", roomCode);
		mv.addObject("yourNickname", yourNickname);
		mv.addObject("myNickname", myNickname);
		mv.addObject("sessionId", sessionId);
		mv.addObject("yourId", yourId);
		mv.addObject("myProfile_img", myProfile_img);
		mv.addObject("yourProfile_img", yourProfile_img);
		mv.addObject("mtmVo", mtmVo);
		mv.setViewName("mantoman/mantoman_chatview");
		System.out.println("실행확인");
		return mv;
	}
	
	@RequestMapping("/mantoman/mantoman_before_chatview")
	public ModelAndView beforeChatview(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String roomCode = (String)req.getParameter("roomCode");
		System.out.println("roomCode : " + roomCode);
		String yourNickname = (String)req.getParameter("yourNickname");
		String myNickname = (String)req.getParameter("myNickname");
		String sessionId = (String)req.getParameter("sessionId");
		String yourId = (String)req.getParameter("yourId");
		String myProfile_img = (String)req.getParameter("myProfile_img");
		String yourProfile_img = (String)req.getParameter("yourProfile_img");
		int mantoman_pixel_reward = Integer.parseInt(req.getParameter("mantoman_pixel_reward"));
		String doc = (String)req.getParameter("doc");
		
		System.out.println("myProfile_img : " + myProfile_img);
		
		mtmVo.setId(sessionId);
		mtmVo.setYour_id(yourId);
		mtmVo.setMantoman_pixel_reward(mantoman_pixel_reward);
		mtmVo.setRoomCode(roomCode);
		
		mv.addObject("roomCode", roomCode);
		mv.addObject("yourNickname", yourNickname);
		mv.addObject("myNickname", myNickname);
		mv.addObject("sessionId", sessionId);
		mv.addObject("yourId", yourId);
		mv.addObject("myProfile_img", myProfile_img);
		mv.addObject("yourProfile_img", yourProfile_img);
		mv.addObject("doc", doc);
		mv.addObject("mtmVo", mtmVo);
		mv.setViewName("mantoman/mantoman_chatview");
		System.out.println("실행확인");
		return mv;
	}

}
