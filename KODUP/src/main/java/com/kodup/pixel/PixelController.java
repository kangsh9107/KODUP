package com.kodup.pixel;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class PixelController {
		@RequestMapping("/pixel/pixel_buy")
		public ModelAndView select() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("pixel/pixel_buy");

			return mv;

		}
}
