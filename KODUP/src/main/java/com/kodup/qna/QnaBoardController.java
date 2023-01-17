package com.kodup.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class QnaBoardController {
	
	@Autowired
	QnaBoardService service;
	
	@RequestMapping("/qna/qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/qna/qna");
		return mv;
	}

	@RequestMapping("/qna/qna_insert")
	public ModelAndView qnaInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/qna/qna_insert");
		return mv;
	}
	
	@RequestMapping("/qna/qna_update")
	public ModelAndView qnaUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/qna/qna_update");
		return mv;
	}
	
	//INSERT
	@RequestMapping("/qna/qna_insertR")
	public ModelAndView qnaInsertR() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/qna/qna");
		return mv;
	}
	
	//성호
	@RequestMapping("/qna/qna_view")
	public ModelAndView qnaView(QnaBoardVo qbVo, QnaBoardReplVo qbrVo) {
		ModelAndView mv = new ModelAndView();
		
		/*
		 String temp = qbVo.getDoc();
		  qbVo.setDoc(temp.replace("\n","<br/>"));
		 */
		qbVo.setSno(3); //qna.jsp 에서 해당리스트를 눌렀을때 작동하는것으로 해당 리스트마다 
		qbVo = service.view(qbVo.getSno());
		int checkChaeTaek =service.checkChaeTaek(qbVo.getSno());
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());//본문의sno를 넣어줌
		
		mv.addObject("checkChaeTaek",checkChaeTaek);
		System.out.println("채택스테이터스 서비스단:"+checkChaeTaek);
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		System.out.println(replList);
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
	public ModelAndView qnaDeleteR(QnaBoardVo qbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.qnaDeleteR(qbVo);
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		//mv = qna(qbVo);	//담겨진 데이터들을 들고 qna()를 통해  qna.jsp로 넘어가게 하려고
		mv.addObject("msg",msg);
		mv.setViewName("/qna/qna");
		return mv;
	}
	
	@RequestMapping("/qna/qna_view/ReplDeleteR")
	public ModelAndView qnaReplDeleteR(QnaBoardVo qbVo, QnaBoardReplVo qbrVo){
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.qnaReplDeleteR(qbrVo.getRepl_sno());
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		
		qbVo = service.view(qbVo.getSno());
	
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		mv.addObject("msg",msg);
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
		
	}
	@RequestMapping("/qna/qna_view/ReplChaetaek")
	public ModelAndView replChaetaek(QnaBoardVo qbVo, QnaBoardReplVo qbrVo){
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.replChaetaek(qbrVo);
		
		if(b) {
			qbVo.setId(qbrVo.getId());
			System.out.println("컨트롤러채택id:"+qbVo.getId());
			System.out.println("보상픽셀:"+qbVo.getQna_pixel_reward());
			b = service.giveRewardPixel(qbVo);
			if(!b) {
				msg = "보상픽셀 전달 중 오류 발생";
			}
		}else {msg = "채택 중 오류 발생";}
		
		qbVo = service.view(qbVo.getSno());
	
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
		
	}
	@RequestMapping("/qna/qna_view/insertRepl")
	public ModelAndView insertRepl(QnaBoardReplVo qbrVo, QnaBoardVo qbVo) {
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
		
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	@RequestMapping("/qna/qna_view/insertInnerRepl")
	public ModelAndView insertInnerRepl(QnaBoardReplVo qbrVo, QnaBoardVo qbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.insertInnerRepl(qbrVo);
		
		if(b) {
			b = service.insertRepl2(qbrVo);//repl_selected테이블의 추가
			if(!b) {
				msg = "댓글 입력(2/2) 중 오류 발생";
			}
			
		}else {msg = "댓글 입력(1/2) 중 오류 발생";}
		
		qbVo = service.view(qbVo.getSno());
		
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	
	
	@RequestMapping("/qna/qna_view/ReplUpdateR")
	public ModelAndView ReplUpdateR(QnaBoardReplVo qbrVo, QnaBoardVo qbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.ReplUpdateR(qbrVo);
		
		
		if(!b) {
			msg = "수정 중 오류 발생";
		}
		
		qbVo = service.view(qbVo.getSno());
		
		List<QnaBoardReplVo> replList = service.replList(qbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	
		mv.addObject("qbVo",qbVo);
		mv.addObject("replList",replList);
		
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
	
}
