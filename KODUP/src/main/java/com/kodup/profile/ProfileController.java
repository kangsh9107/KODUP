package com.kodup.profile;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.board.PageVo;
import com.kodup.common.CommonBoardPageVo;
import com.kodup.common.CommonBoardService;
import com.kodup.freetalking.FreetalkingBoardReplVo;
import com.kodup.freetalking.FreetalkingBoardService;
import com.kodup.freetalking.FreetalkingBoardVo;
import com.kodup.infoshare.InfoshareBoardReplVo;
import com.kodup.infoshare.InfoshareBoardService;
import com.kodup.infoshare.InfoshareBoardVo;
import com.kodup.jobsearch.JobsearchBoardReplVo;
import com.kodup.jobsearch.JobsearchBoardService;
import com.kodup.jobsearch.JobsearchBoardVo;
import com.kodup.login.MemberVo;
import com.kodup.mansearch.MansearchBoardVo;
import com.kodup.mansearch.MansearchService;
import com.kodup.mantoman.MantomanVo;
import com.kodup.notification.NotificationBoardReplVo;
import com.kodup.notification.NotificationBoardService;
import com.kodup.notification.NotificationBoardVo;
import com.kodup.qna.QnaBoardReplVo;
import com.kodup.qna.QnaBoardService;
import com.kodup.qna.QnaBoardVo;


@RestController
public class ProfileController {
	
	@Autowired
	ProfileService service;
	
	@Autowired
	QnaBoardService Qnaservice;
	
	@Autowired
	FreetalkingBoardService ftService;
	
	@Autowired
	JobsearchBoardService jsService;
	
	@Autowired
	NotificationBoardService ntService;
	
	@Autowired
	InfoshareBoardService isService;
	
	@Autowired
	MansearchService msService;
	
	@Autowired
	CommonBoardService cbService;
	
	@RequestMapping("/profile/member_profile")
	public ModelAndView profileMain(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException  {
		ModelAndView mv = new ModelAndView();
		String nickname = (String)req.getParameter("nickname");
		pfVo = service.selectProfile(nickname);
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
	public ModelAndView myarticle(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException  {
		ModelAndView mv = new ModelAndView();
		String id = (String)req.getParameter("id");
		List<ProfileVo> list = service.selectMyArticle(id);
		mv.addObject("list", list);
		System.out.println("list : " + list);
		mv.setViewName("profile/member_profile_myarticle");
		return mv;
	}
	
	@RequestMapping("/profile/member_profile_myrepl")
	public ModelAndView myrepl(ProfileVo pfVo, HttpServletRequest req, HttpServletResponse res) throws IOException  {
		ModelAndView mv = new ModelAndView();
		String id = (String)req.getParameter("id");
		List<ProfileVo> list = service.selectMyrepl(id);
		mv.addObject("list", list);
		mv.setViewName("profile/member_profile_myrepl");
		return mv;
	}
	
	@RequestMapping("/profile/qna_view")
	public ModelAndView qnaView(QnaBoardVo qbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));   
		
		qbVo = Qnaservice.view(sno);
		int checkChaeTaek =Qnaservice.checkChaeTaek(sno);
		List<QnaBoardReplVo> replList = Qnaservice.replList(sno);//본문의sno를 넣어줌
		qbVo.getHashtaglist();
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(sno);
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	@RequestMapping("/profile/freetalking_view")
	public ModelAndView freetalkingView(FreetalkingBoardVo fbVo, FreetalkingBoardReplVo fbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));

		fbVo = ftService.view(sno);
		List<FreetalkingBoardReplVo> replList = ftService.replList(sno);//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(sno);
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
	
	@RequestMapping("/profile/jobsearch_view")
	public ModelAndView jobsearchView(JobsearchBoardVo jbVo, JobsearchBoardReplVo jbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));
		
		jbVo = jsService.view(sno);
		List<JobsearchBoardReplVo> replList = jsService.replList(sno);//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(sno);
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
	}
	
	@RequestMapping("/profile/notification_view")
	public ModelAndView notificationView(NotificationBoardVo nbVo, NotificationBoardReplVo nbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));
		
		nbVo = ntService.view(sno);
		List<NotificationBoardReplVo> replList = ntService.replList(sno);//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(nbVo.getSno());
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("nbVo",nbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/notification/notification_view");
		return mv;
	}
	
	@RequestMapping("/profile/infoshare_view")
	public ModelAndView infoshareView(InfoshareBoardVo ibVo, InfoshareBoardReplVo ibrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));
		
		ibVo = isService.view(sno);
		List<InfoshareBoardReplVo> replList = isService.replList(sno);//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(sno);
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
	}
	
	@RequestMapping("/profile/mansearch_view")
	public ModelAndView view(MansearchBoardVo mbVo, MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		int sno = Integer.parseInt(req.getParameter("sno"));
		mbVo = msService.view(sno);
		List<MansearchBoardVo> premiumlist = msService.premiumlist(sno,mVo);
		mv.addObject("premiumlist",premiumlist);
		mv.addObject("mbVo",mbVo);
		mv.setViewName("mansearch/mansearch_view");

		return mv;
	}
}
