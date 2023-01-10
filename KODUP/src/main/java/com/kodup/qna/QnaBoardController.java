package com.kodup.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView qnaView(QnaBoardVo qbVo) {
		ModelAndView mv = new ModelAndView();
		
		//doc안에 있는 \n 기호를 <br/>로 변경;수형이형 인서트부분과 말맞춰봐야함.
		/*
		 String temp = qbVo.getDoc();
		  qbVo.setDoc(temp.replace("\n","<br/>"));
		 */
		
		qbVo.setSno(3);
		qbVo = service.view(qbVo.getSno());
		
		mv.addObject("qbVo",qbVo);
		
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
}
