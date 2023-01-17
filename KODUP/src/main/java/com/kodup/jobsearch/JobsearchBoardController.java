package com.kodup.jobsearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class JobsearchBoardController {
	
	@Autowired
	JobsearchBoardService service;
	
	@RequestMapping("/jobsearch/jobsearch")
	public ModelAndView jobsearch() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch");
		return mv;
	}

	@RequestMapping("/jobsearch/jobsearch_insert")
	public ModelAndView jobsearchInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch_insert");
		return mv;
	}
	
	@RequestMapping("/jobsearch/jobsearch_update")
	public ModelAndView jobsearchUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jobsearch/jobsearch_update");
		return mv;
	}
	
	
	
	//성호
	@RequestMapping("/jobsearch/jobsearch_view")
	public ModelAndView jobsearchView(JobsearchBoardVo jbVo, JobsearchBoardReplVo jbrVo) {
		ModelAndView mv = new ModelAndView();

		
		
		jbVo = service.view(jbVo.getSno());
		List<JobsearchBoardReplVo> replList = service.replList(jbVo.getSno());//본문의sno를 넣어줌
		
		
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		System.out.println(replList);
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/thumbup")
	public void jobsearchThumbup(@RequestParam(name="sno") int sno) {
		service.thumbup(sno);
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/thumbdown")
	public void jobsearchThumbdown(@RequestParam(name="sno") int sno) {
		service.thumbdown(sno);
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/deleteR")
	public ModelAndView jobsearchDeleteR(JobsearchBoardVo jbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.jobsearchDeleteR(jbVo);
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		//mv = jobsearch(jbVo);	//담겨진 데이터들을 들고 jobsearch()를 통해  jobsearch.jsp로 넘어가게 하려고
		mv.addObject("msg",msg);
		mv.setViewName("/jobsearch/jobsearch");
		return mv;
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/ReplDeleteR")
	public ModelAndView jobsearchReplDeleteR(JobsearchBoardVo jbVo, JobsearchBoardReplVo jbrVo){
		String msg="";
		ModelAndView mv = new ModelAndView();
		
		boolean b = service.jobsearchReplDeleteR(jbrVo.getRepl_sno());
		if(!b) {
			msg = "삭제중 오류 발생";
		}
		
		jbVo = service.view(jbVo.getSno());
	
		List<JobsearchBoardReplVo> replList = service.replList(jbVo.getSno());
		mv.addObject("msg",msg);
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
		
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/insertRepl")
	public ModelAndView insertRepl(JobsearchBoardReplVo jbrVo, JobsearchBoardVo jbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		//댓글을 repl에 추가(service.insertRepl(jbrVo))->
		//추가된댓글의repl_sno를 추출한 후 추출된repl_sno를 repl_selected테이블의 추가(service.insertRepl2(jbrVo)
		boolean b = service.insertRepl(jbrVo);//repl테이블의 추가
		
		if(!b) {
			msg = "댓글 입력 중 오류 발생";
		}
		
		
		
		jbVo = service.view(jbVo.getSno());
		
		List<JobsearchBoardReplVo> replList = service.replList(jbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
	}
	
	@RequestMapping("/jobsearch/jobsearch_view/insertInnerRepl")
	public ModelAndView insertInnerRepl(JobsearchBoardReplVo jbrVo, JobsearchBoardVo jbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.insertInnerRepl(jbrVo);
		
		if(!b) {
			
			msg = "댓글 입력 중 오류 발생";
		} 
		
		jbVo = service.view(jbVo.getSno());
		
		List<JobsearchBoardReplVo> replList = service.replList(jbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
	}
	
	
	
	@RequestMapping("/jobsearch/jobsearch_view/ReplUpdateR")
	public ModelAndView ReplUpdateR(JobsearchBoardReplVo jbrVo, JobsearchBoardVo jbVo) {
		String msg="";
		ModelAndView mv = new ModelAndView();
		boolean b = service.ReplUpdateR(jbrVo);
		
		
		if(!b) {
			msg = "수정 중 오류 발생";
		}
		
		jbVo = service.view(jbVo.getSno());
		
		List<JobsearchBoardReplVo> replList = service.replList(jbVo.getSno());
		
		//mv.addObject("attList",attlist);
		mv.addObject("msg",msg);	
		mv.addObject("jbVo",jbVo);
		mv.addObject("replList",replList);
		
		mv.setViewName("/jobsearch/jobsearch_view");
		return mv;
	}
}
