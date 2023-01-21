package com.kodup.mansearch;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView view(MansearchBoardVo mbVo,PageVo pVo, MemberVo mVo) {
		ModelAndView mv = new ModelAndView();
		mbVo = service.view(mbVo.getMansearch_sno());
		List<MansearchBoardVo> premiumlist = service.premiumlist(mbVo.getMansearch_sno(),mVo);
		mv.addObject("premiumlist",premiumlist);
		mv.addObject("mbVo",mbVo);
		mv.addObject("pVo", pVo);
		mv.setViewName("mansearch/mansearch_view");

		return mv;
	}
	@RequestMapping("/mansearch/premium_review")
	public ModelAndView review(HttpServletRequest req,MemberVo mVo,MansearchBoardVo mbVo, PixelHistoryVo hVo) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		String buyer_id =(String)session.getAttribute("sessionId");
		System.out.println("premium_review_sno : " + mbVo.getPremium_review_sno());
		mbVo = service.review(mbVo.getPremium_review_sno());
		mbVo.setId(buyer_id);
		System.out.println("buyer_id : " + buyer_id);
		System.out.println("writer_id : " + mbVo.getWriter_id());
		service.buylistinsert(mbVo);
		service.readlog(buyer_id);
		service.writelog(mbVo);
		service.readpixel(buyer_id);
		service.writepixel(mbVo);
		mv.addObject("mbVo",mbVo);

		mv.setViewName("/mansearch/mansearch_view");
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
