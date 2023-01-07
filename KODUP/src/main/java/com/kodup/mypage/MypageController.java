package com.kodup.mypage;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MypageController {

	//리퀘스트 매핑 주소 = mypage 폴더 내 jsp 파일명
	/*
	 * @RequestMapping("/board/mypage") public ModelAndView mypage() { ModelAndView
	 * mv = new ModelAndView();
	 * 
	 * mv.setViewName("mypage/mypage"); return mv; }
	 */
	
	@RequestMapping("/board/mypage") //회원정보 메뉴바
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage");
		return mv;
		}
	
	@RequestMapping("/board/mypage_memberinfo") //회원정보
	public ModelAndView mypage_info() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_memberinfo");
		return mv;
		}

	@RequestMapping("/board/mypage_dailycheck") //출석체크
	public ModelAndView mypage_dailycheck() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_dailycheck");
		return mv;
	}
	
	@RequestMapping("/board/mypage_mypixel") //나의 픽셀
	public ModelAndView mypage_mypixel() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_mypixel");
		return mv;
	}
	
	@RequestMapping("/board/mypage_certification") //인증
	public ModelAndView mypage_certification() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_certification");
		return mv;
	}
	
	@RequestMapping("/board/mypage_corp_certification") //기업인증
	public ModelAndView mypage_corp_certification() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_corp_certification");
		return mv;
	}
	
	@RequestMapping("/board/mypage_memberinfo_quit") //회원탈퇴
	public ModelAndView mypage_memberinfo_quit() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_memberinfo_quit");
		return mv;
	}
	
	@RequestMapping("/board/mypage_memberinfo_update") //회원탈퇴
	public ModelAndView mypage_memberinfo_update() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_memberinfo_update");
		return mv;
	}
}