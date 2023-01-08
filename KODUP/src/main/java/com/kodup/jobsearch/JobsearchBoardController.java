package com.kodup.jobsearch;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class JobsearchBoardController {
	
	@RequestMapping("/jobsearch/jobsearch")
	public ModelAndView jobsearch() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch");
		return mv;
	}

	@RequestMapping("/jobsearch/jobsearch_insert")
	public ModelAndView jobsearchInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch_insert");
		return mv;
	}
	
	//성호
	@RequestMapping("/jobsearch/jobsearch_view")
	public ModelAndView jobsearchView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch_view");

		return mv;
	}

}
