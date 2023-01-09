package com.kodup.notification;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class NotificationBoardController {
	
	@RequestMapping("/notification/notification")
	public ModelAndView notfication() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification");
		return mv;
	}

	@RequestMapping("/notification/notification_insert")
	public ModelAndView notficationInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification_insert");
		return mv;
	}
	
	@RequestMapping("/notification/notification_update")
	public ModelAndView notificationUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification_update");
		return mv;
	}
	
	//성호
	@RequestMapping("/notification/notification_view")
	public ModelAndView notficationView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification_view");

		return mv;
	}

}
