package com.kodup.infoshare;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class InfoshareBoardController {
	
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
	
	//성호
	@RequestMapping("/infoshare/infoshare_view")
	public ModelAndView infoshareView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/infoshare/infoshare_view");

		return mv;
	}

}
