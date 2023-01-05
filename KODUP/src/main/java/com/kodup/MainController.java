package com.kodup;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	@RequestMapping("/")
	public ModelAndView index() {
		System.out.println("컨트롤러");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

}