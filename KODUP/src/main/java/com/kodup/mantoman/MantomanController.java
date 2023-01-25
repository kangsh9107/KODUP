package com.kodup.mantoman;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.profile.ProfileService;
import com.kodup.profile.ProfileVo;


@RestController
public class MantomanController {
	
	@Autowired
	MantomanService service;
	
	@Autowired
	ProfileService service2;
	
	@RequestMapping("/mantoman/mantoman_index")
	public ModelAndView mantomanIndex(MantomanVo mtmVo,HttpServletRequest req, HttpServletResponse res) throws IOException {
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
		List<MantomanVo> list = service.selectChatList(id);
		mv.addObject("list", list);
		System.out.println("list : " + list);
		mv.setViewName("mantoman/mantoman_chatlist");
		return mv;
	}
	
	@RequestMapping("/profile/member_profile_chat")
	public ModelAndView profileChat(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String nickname = (String)req.getParameter("nickname");
		pfVo = service2.selectProfile(nickname);
		if(pfVo!=null) {
			String grade = pfVo.getGrade();
			if(grade.equals("5")) {
				pfVo.setGrade("관리자");
			}else if(grade.equals("4")) {
				pfVo.setGrade("게시판지기");
			}else if(grade.equals("3")) {
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
		mv.setViewName("profile/member_profile_chat");
		return mv;
	}
	
	@RequestMapping("/mantoman/mantoman_chatview")
	public void chatView(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String roomCode = (String)req.getParameter("roomCode");
		System.out.println("roomCode : " + roomCode);
		int mantoman_pixel_reward = Integer.parseInt(req.getParameter("mantoman_pixel_reward"));
		
		mtmVo.setMantoman_pixel_reward(mantoman_pixel_reward);
		mtmVo.setRoomCode(roomCode);
		
		boolean b = service.insertMantoman(mtmVo);
	}
	
	@RequestMapping("/mantoman/mantoman_chatview2")
	public ModelAndView chatView2(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
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
		String requiredTime = (String)req.getParameter("requiredTime");
		String relation = (String)req.getParameter("relation");
		
		mtmVo.setId(sessionId);
		mtmVo.setYour_id(yourId);
		mtmVo.setMantoman_pixel_reward(mantoman_pixel_reward);
		mtmVo.setRequiredTime(requiredTime);
		mtmVo.setRoomCode(roomCode);
		
		System.out.println(relation);
		
		if(relation.equals("menti")) {
			System.out.println("여기 들어옴");
			boolean a = service.chatPixelReward(mtmVo);
			boolean b = service.chatPixelLog(mtmVo);
		}
		
		boolean c = service.insertMantoman2(mtmVo);
		boolean d = service.updateChatStatus(sessionId);
		
		mv.addObject("roomCode", roomCode);
		mv.addObject("yourNickname", yourNickname);
		mv.addObject("myNickname", myNickname);
		mv.addObject("sessionId", sessionId);
		mv.addObject("yourId", yourId);
		mv.addObject("myProfile_img", myProfile_img);
		mv.addObject("yourProfile_img", yourProfile_img);
		mv.addObject("relation", relation);
		mv.addObject("mtmVo", mtmVo);
		mv.setViewName("mantoman/mantoman_chatview");
		return mv;
	}
	
	@RequestMapping("/mantoman/mantoman_before_chatview")
	public ModelAndView beforeChatview(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String roomCode = (String)req.getParameter("roomCode");
		String yourNickname = (String)req.getParameter("yourNickname");
		String myNickname = (String)req.getParameter("myNickname");
		String sessionId = (String)req.getParameter("sessionId");
		String yourId = (String)req.getParameter("yourId");
		String myProfile_img = (String)req.getParameter("myProfile_img");
		String yourProfile_img = (String)req.getParameter("yourProfile_img");
		int mantoman_pixel_reward = Integer.parseInt(req.getParameter("mantoman_pixel_reward"));
		String doc = (String)req.getParameter("doc");
		
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
		return mv;
	}
	
	@RequestMapping("/mantoman/chatComplete")
	public void chatComplete(MantomanVo mtmVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String mentoId = (String)req.getParameter("mentoId");
		String mentiId = (String)req.getParameter("mentiId");
		int mantoman_pixel_reward = Integer.parseInt(req.getParameter("mantoman_pixel_reward"));
		
		mtmVo.setId(mentoId);
		mtmVo.setMantoman_pixel_reward(mantoman_pixel_reward);
		
		boolean a = service.chatPixelLog2(mtmVo);
		boolean b = service.chatPixelReward2(mtmVo);
		boolean c = service.updateChatStatus2(mentoId);
		boolean d = service.updateChatStatus2(mentiId);
		
		
		mv.addObject("mtmVo", mtmVo);
	}
}
