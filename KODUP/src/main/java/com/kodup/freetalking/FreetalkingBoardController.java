package com.kodup.freetalking;

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
public class FreetalkingBoardController {
	
	@Autowired
	FreetalkingBoardService service;
	
	@Autowired
	CommonBoardService cbService;
	
	//성호
	@RequestMapping("/freetalking/freetalking_view")
	public ModelAndView freetalkingView(FreetalkingBoardVo fbVo, FreetalkingBoardReplVo fbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();

		fbVo = service.view(fbVo.getSno());
		List<FreetalkingBoardReplVo> replList = service.replList(fbVo.getSno());//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(fbVo.getSno());
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_view/thumbup")
	public void freetalkingThumbup(@RequestParam(name="sno") int sno) {
		service.thumbup(sno);
	}
	
	@RequestMapping("/freetalking/freetalking_view/thumbdown")
	public void freetalkingThumbdown(@RequestParam(name="sno") int sno) {
		service.thumbdown(sno);
	}
	
	@RequestMapping("/freetalking/freetalking_view/deleteR")
	public ModelAndView freetalkingDeleteR(FreetalkingBoardVo fbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.freetalkingDeleteR(fbVo);
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		//리스트 출력
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listFreetalking = cbService.listFreetalking(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listFreetalking", listFreetalking);
		mv.addObject("msg",msg);
		mv.setViewName("/freetalking/freetalking");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_view/ReplDeleteR")
	public ModelAndView freetalkingReplDeleteR(FreetalkingBoardVo fbVo, FreetalkingBoardReplVo fbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.freetalkingReplDeleteR(fbrVo.getRepl_sno());
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		
		fbVo = service.view(fbVo.getSno());
		List<FreetalkingBoardReplVo> replList = service.replList(fbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(fbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_view/insertRepl")
	public ModelAndView insertRepl(FreetalkingBoardReplVo fbrVo, FreetalkingBoardVo fbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		//댓글을 repl에 추가(service.insertRepl(fbrVo))->
		//추가된댓글의repl_sno를 추출한 후 추출된repl_sno를 repl_selected테이블의 추가(service.insertRepl2(fbrVo)
		boolean b = service.insertRepl(fbrVo);//repl테이블의 추가
		
		if(!b) {
			msg = "댓글 입력 중 오류 발생";
		}
		
		
		
		fbVo = service.view(fbVo.getSno());
		
		List<FreetalkingBoardReplVo> replList = service.replList(fbVo.getSno());
		 
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(fbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_view/insertInnerRepl")
	public ModelAndView insertInnerRepl(FreetalkingBoardReplVo fbrVo, FreetalkingBoardVo fbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.insertInnerRepl(fbrVo);
		
		if(!b) {
			
			msg = "댓글 입력 중 오류 발생";
		} 
		
		fbVo = service.view(fbVo.getSno());
		
		List<FreetalkingBoardReplVo> replList = service.replList(fbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(fbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
	
	
	
	@RequestMapping("/freetalking/freetalking_view/ReplUpdateR")
	public ModelAndView ReplUpdateR(FreetalkingBoardReplVo fbrVo, FreetalkingBoardVo fbVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.ReplUpdateR(fbrVo);
		
		
		if(!b) {
			msg = "수정 중 오류 발생";
		}
		
		fbVo = service.view(fbVo.getSno());
		
		List<FreetalkingBoardReplVo> replList = service.replList(fbVo.getSno());
		
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(fbVo.getSno());
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("msg",msg);	
		mv.addObject("fbVo",fbVo);
		mv.addObject("replList",replList);
		
		mv.setViewName("/freetalking/freetalking_view");
		return mv;
	}
}
