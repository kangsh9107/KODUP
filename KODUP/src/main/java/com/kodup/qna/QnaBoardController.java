package com.kodup.qna;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class QnaBoardController {
	
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
	
	//성호
	@RequestMapping("/qna/qna_view")
	public ModelAndView qnaView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/qna/qna_view");

		return mv;
	}
}
