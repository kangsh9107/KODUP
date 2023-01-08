package com.kodup.freetalking;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class FreetalkingBoardController {
	
	@RequestMapping("/freetalking/freetalking")
	public ModelAndView freetalking() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/freetalking/freetalking");
		return mv;
	}

	@RequestMapping("/freetalking/freetalking_insert")
	public ModelAndView freetalkingInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/freetalking/freetalking_insert");
		return mv;
	}
	
	//성호
	@RequestMapping("/freetalking/freetalking_view")
	public ModelAndView freetalkingView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/freetalking/freetalking_view");

		return mv;
	}

}
