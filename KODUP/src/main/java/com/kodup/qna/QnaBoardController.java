package com.kodup.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.common.CommonBoardPageVo;
import com.kodup.common.CommonBoardService;
import com.kodup.common.SelectBoardVo;

@RestController
public class QnaBoardController {
	
	@Autowired
	QnaBoardService service;
	
	@Autowired
	CommonBoardService cbService;
	 
	@RequestMapping("/qna/hashtag_view")
	public ModelAndView hashtagView(QnaBoardVo qbVo, QnaBoardReplVo qbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());//본문의sno를 넣어줌
		qbVo.getHashtaglist();
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/login/hashtag_view");
		return mv;
	}
	
	//성호
	@RequestMapping("/qna/qna_view")
	public ModelAndView qnaView(QnaBoardVo qbVo, QnaBoardReplVo qbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		/*
		 String temp = qbVo.getDoc();
		  qbVo.setDoc(temp.replace("\n","<br/>"));
		 */
		//qna.jsp 에서 해당리스트를 눌렀을때 작동하는것으로 해당 리스트마다 
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());//본문의sno를 넣어줌
		qbVo.getHashtaglist();
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	
	@RequestMapping("/qna/qna_view/thumbup")
	public void qnaThumbup(@RequestParam(name="sno") int sno) {
		service.thumbup(sno);
	}
	
	@RequestMapping("/qna/qna_view/thumbdown")
	public void qnaThumbdown(@RequestParam(name="sno") int sno) {
		service.thumbdown(sno);
	}
	
	@RequestMapping("/qna/qna_view/deleteR")
	public ModelAndView qnaDeleteR(QnaBoardVo qbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.qnaDeleteR(qbVo);
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		//mv = qna(qbVo);	//담겨진 데이터들을 들고 qna()를 통해  qna.jsp로 넘어가게 하려고
		
		//리스트 출력
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listQna", listQna);
		mv.addObject("msg",msg);
		mv.setViewName("/qna/qna");
		return mv;
	}
	
	@RequestMapping("/qna/qna_view/ReplDeleteR")
	public ModelAndView qnaReplDeleteR(QnaBoardVo qbVo, QnaBoardReplVo qbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.qnaReplDeleteR(qbrVo.getRepl_sno());
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);
		mv.addObject("qbVo",qbVo);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
		
	}
	@RequestMapping("/qna/qna_view/ReplChaetaek")
	public ModelAndView replChaetaek(QnaBoardVo qbVo, QnaBoardReplVo qbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.replChaetaek(qbrVo);
		
		if(b) {
			qbVo.setId(qbrVo.getId());
			b = service.giveRewardPixel(qbVo,qbrVo);
			if(!b) {
				msg = "보상픽셀 전달 중 오류 발생";
			}
		}else {msg = "채택 중 오류 발생";}
		
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	
		mv.addObject("qbVo",qbVo);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
		
	}
	@RequestMapping("/qna/qna_view/insertRepl")
	public ModelAndView insertRepl(QnaBoardReplVo qbrVo, QnaBoardVo qbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		//댓글을 repl에 추가(service.insertRepl(qbrVo))->
		//추가된댓글의repl_sno를 추출한 후 추출된repl_sno를 repl_selected테이블의 추가(service.insertRepl2(qbrVo)
		boolean b = service.insertRepl(qbrVo);//repl테이블의 추가
		
		if(b) {
			b = service.insertRepl2(qbrVo);//repl_selected테이블의 추가
			if(!b) {
				msg = "댓글 입력(2/2) 중 오류 발생";
			}
		}else {msg = "댓글 입력(1/2) 중 오류 발생";}
		
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		 
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	@RequestMapping("/qna/qna_view/insertInnerRepl")
	public ModelAndView insertInnerRepl(QnaBoardReplVo qbrVo, QnaBoardVo qbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.insertInnerRepl(qbrVo);
		
		if(b) {
			b = service.insertInnerRepl2(qbrVo);//repl_selected테이블의 추가
			if(!b) {
				msg = "댓글 입력(2/2) 중 오류 발생";
			}
			
		}else {msg = "댓글 입력(1/2) 중 오류 발생";}
		
		qbVo = service.view(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	@RequestMapping("/qna/qna_view/ReplUpdateR")
	public ModelAndView ReplUpdateR(QnaBoardReplVo qbrVo, QnaBoardVo qbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.ReplUpdateR(qbrVo);
		if(!b) {
			msg = "수정 중 오류 발생";
		}
		qbVo = service.view(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(qbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	
		mv.addObject("qbVo",qbVo);
		mv.addObject("checkChaeTaek",checkChaeTaek);
		mv.addObject("replList",replList);
		
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	
}
