package com.kodup.mansearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.board.PageVo;

@RestController
public class MansearchBoardController {
	
	@Autowired
	MansearchService service;
	@RequestMapping("/mansearch/mansearch")
	public ModelAndView select(PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		List<MansearchBoardVo> list = service.select(pVo);
		mv.addObject("pVo",pVo);
		mv.addObject("list",list);
		mv.setViewName("mansearch/mansearch");
		
		return mv;
	}
	
	@RequestMapping("/mansearch/mansearch_view")
	public ModelAndView view(MansearchBoardVo mbVo,PageVo pVo) {
		ModelAndView mv = new ModelAndView();
		mbVo = service.view(mbVo.getMansearch_sno());
		System.out.println("mansearchSno:" + mbVo.getMansearch_sno());
		mv.addObject("mbVo",mbVo);
		mv.addObject("pVo", pVo);
		mv.setViewName("mansearch/mansearch_view");

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
		String msg="";
		boolean b = service.delete(mbVo);
		if(!b) {
			msg = "삭제 중 오류 발생";
		}
		mv.addObject("pVo",pVo);
		mv.addObject("msg",msg);
		mv.setViewName("/mansearch/mansearch");
		
		return mv;
	
	}
}
