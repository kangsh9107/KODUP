package com.kodup.mansearch;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.board.PageVo;
import com.kodup.login.MemberVo;
import com.kodup.pixel.PixelHistoryVo;
import com.kodup.pixel.PixelService;

@RestController
public class MansearchBoardController {
	@Autowired
	PixelService pixelservice;
	
	@Autowired
	MansearchService service;
	@RequestMapping("/mansearch/mansearch")
	public ModelAndView select(PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		List<MansearchBoardVo> list = service.select(pVo);
		pVo = service.getpVo();
		mv.addObject("pVo",pVo);
		mv.addObject("list",list);
		mv.setViewName("mansearch/mansearch");
		
		return mv;
	}
	
	@RequestMapping("/mansearch/mansearch_view")
	public ModelAndView view(MansearchBoardVo mbVo,PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		mbVo = service.view(mbVo.getMansearch_sno());
		List<MansearchBoardVo> list = service.review(mbVo.getMansearch_sno());
		List<MansearchBoardVo> premiumlist = service.premiumlist(mbVo.getMansearch_sno());
		mv.addObject("premiumlist",premiumlist);
		mv.addObject("list",list);
		mv.addObject("mbVo",mbVo);
		mv.addObject("pVo", pVo);
		mv.setViewName("mansearch/mansearch_view");

		return mv;
	}
	@RequestMapping("/mansearch/premium_review")
	public ModelAndView review(MemberVo mVo,MansearchBoardVo mbVo, PixelHistoryVo hVo) {
		ModelAndView mv = new ModelAndView();
		mbVo = service.view(mbVo.getMansearch_sno());
		List<MansearchBoardVo> list = service.review(mbVo.getMansearch_sno());
		pixelservice.readlog(hVo);
		pixelservice.writelog(hVo);
		pixelservice.readpixel(mVo);
		pixelservice.writepixel(mVo);
		
		mv.addObject("list",list);
		mv.addObject("mbVo",mbVo);
		mv.setViewName("/mansearch/mansearch_premium_review");
		return mv;
	}
	@RequestMapping("/mansearch/mansearch_insert")
	public ModelAndView insert(PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("pVo",pVo);
		mv.setViewName("mansearch/mansearch_insert");

		return mv;
	}
	
	@RequestMapping("/mansearch/mansearch_update")
	public ModelAndView update(MansearchBoardVo mbVo, PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		mbVo = service.view(mbVo.getMansearch_sno());
		mv.addObject("pVo", pVo);
		mv.addObject("mbVo", mbVo);
		mv.setViewName("mansearch/mansearch_update");

		return mv;
	}
	
	@RequestMapping("/mansearch/mansearch_delete")
	public ModelAndView delete(MansearchBoardVo mbVo,PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		String msg="삭제되었습니다.";
		boolean b = service.delete(mbVo);
		if(!b) {
			msg = "삭제 중 오류 발생";
		}
		mv = select(pVo);
		mv.addObject("pVo",pVo);
		mv.addObject("msg",msg);
		mv.setViewName("mansearch/mansearch");
		
		return mv;
	
	}
}
