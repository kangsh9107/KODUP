package com.kodup.pixel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.login.MemberVo;

@RestController
public class PixelController {
	
	@Autowired
	PixelService service;
	@RequestMapping("/pixel/pixel_buy")
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		List<PixelPriceVo> list = service.select();
		mv.addObject("list", list);
		mv.setViewName("pixel/pixel_buy");
		
		return mv;

	}
		
	@RequestMapping("/pixel/buy_complete")
	public ModelAndView buy(MemberVo mVo) {
		ModelAndView mv = new ModelAndView();
		PixelBuyVo buyVo = service.buylist(mVo);
//		mVo = service.addpixel(mVo.getId());
		mv.addObject("buyVo",buyVo);
		mv.setViewName("mypage/mypage_mypixel");
			
		return mv;
	}		
}
