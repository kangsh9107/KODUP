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
		
	@RequestMapping("/pixel/pixel_buy_complete")
	public synchronized String buy(MemberVo mVo, PixelBuyVo buyVo) {
		String msg="";
		
		boolean listflag = service.buylist(buyVo);
		if(listflag) {
			msg = "정상적으로 충전되었습니다.";
		}else msg ="충전 중 오류 발생";
		
		boolean buyflag = service.addpixel(mVo);
//		mVo = service.addpixel(buyVo);
		
		
//		mv.addObject("buyVo",buyVo);
//		mv.addObject("mVo", mVo);
//		mv.setViewName("mypage/mypage_mypixel");
			
		return msg;
	}		
}
