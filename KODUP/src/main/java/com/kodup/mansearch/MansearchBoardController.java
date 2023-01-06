package com.kodup.mansearch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MansearchBoardController {
	@RequestMapping("/mansearch/mansearch")
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mansearch/mansearch");

		return mv;
	}
	
	@RequestMapping("/mansearch/mansearch_view")
	public ModelAndView view() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mansearch/mansearch_view");

		return mv;
	}
}
