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
	
}
