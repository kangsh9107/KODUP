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
		String msg1="";
		
		boolean listflag = service.buylist(buyVo);
		if(listflag) {
			msg = "리스트 추가 완료. ";
		}else msg ="리스트 추가 중 오류 발생";
		
		boolean buyflag = service.addpixel(mVo);
		
		if(buyflag) msg1=" 정상적으로 충전되었습니다.";
		else msg1="충전 중 오류 발생";		
			
		return msg+msg1;
	}		
}
