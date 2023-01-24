package com.kodup.infoshare;

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


@RestController
public class InfoshareBoardController {
	
	@Autowired
	InfoshareBoardService service;
	
	@Autowired
	CommonBoardService cbService;
	
	@RequestMapping("/infoshare/infoshare")
	public ModelAndView infoshare() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/infoshare/infoshare");
		return mv;
	}

	@RequestMapping("/infoshare/infoshare_insert")
	public ModelAndView infoshareInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/infoshare/infoshare_insert");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_update")
	public ModelAndView infoshareUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/infoshare/infoshare_update");
		return mv;
	}
	
	//성호
	@RequestMapping("/infoshare/infoshare_view")
	public ModelAndView infoshareView(InfoshareBoardVo ibVo, InfoshareBoardReplVo ibrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();

		
		ibVo = service.view(ibVo.getSno());
		List<InfoshareBoardReplVo> replList = service.replList(ibVo.getSno());//본문의sno를 넣어줌
		
		//봤던글 표시
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSno(ibVo.getSno());
		if(cbpVo.getId() != null) cbService.insertView(cbpVo);
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_view/thumbup")
	public void infoshareThumbup(@RequestParam(name="sno") int sno) {
		service.thumbup(sno);
	}
	
	@RequestMapping("/infoshare/infoshare_view/thumbdown")
	public void infoshareThumbdown(@RequestParam(name="sno") int sno) {
		service.thumbdown(sno);
	}
	
	@RequestMapping("/infoshare/infoshare_view/deleteR")
	public ModelAndView infoshareDeleteR(InfoshareBoardVo ibVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.infoshareDeleteR(ibVo);
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		//mv = infoshare(ibVo);	//담겨진 데이터들을 들고 infoshare()를 통해  infoshare.jsp로 넘어가게 하려고
		mv.addObject("msg",msg);
		mv.setViewName("/infoshare/infoshare");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_view/ReplDeleteR")
	public ModelAndView infoshareReplDeleteR(InfoshareBoardVo ibVo, InfoshareBoardReplVo ibrVo){
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.infoshareReplDeleteR(ibrVo.getRepl_sno());
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		
		ibVo = service.view(ibVo.getSno());
	
		List<InfoshareBoardReplVo> replList = service.replList(ibVo.getSno());
		mv.addObject("msg",msg);
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
		
	}
	
	@RequestMapping("/infoshare/infoshare_view/insertRepl")
	public ModelAndView insertRepl(InfoshareBoardReplVo ibrVo, InfoshareBoardVo ibVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		//댓글을 repl에 추가(service.insertRepl(ibrVo))->
		//추가된댓글의repl_sno를 추출한 후 추출된repl_sno를 repl_selected테이블의 추가(service.insertRepl2(ibrVo)
		boolean b = service.insertRepl(ibrVo);//repl테이블의 추가
		
		if(!b) {
			msg = "댓글 입력 중 오류 발생";
		}
		
		
		
		ibVo = service.view(ibVo.getSno());
		
		List<InfoshareBoardReplVo> replList = service.replList(ibVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_view/insertInnerRepl")
	public ModelAndView insertInnerRepl(InfoshareBoardReplVo ibrVo, InfoshareBoardVo ibVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.insertInnerRepl(ibrVo);
		
		if(!b) {
			
			msg = "댓글 입력 중 오류 발생";
		} 
		
		ibVo = service.view(ibVo.getSno());
		
		List<InfoshareBoardReplVo> replList = service.replList(ibVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
	}
	
	
	
	@RequestMapping("/infoshare/infoshare_view/ReplUpdateR")
	public ModelAndView ReplUpdateR(InfoshareBoardReplVo ibrVo, InfoshareBoardVo ibVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.ReplUpdateR(ibrVo);
		
		
		if(!b) {
			msg = "수정 중 오류 발생";
		}
		
		ibVo = service.view(ibVo.getSno());
		
		List<InfoshareBoardReplVo> replList = service.replList(ibVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	
		mv.addObject("ibVo",ibVo);
		mv.addObject("replList",replList);
		
		mv.setViewName("/infoshare/infoshare_view");
		return mv;
	}
}
