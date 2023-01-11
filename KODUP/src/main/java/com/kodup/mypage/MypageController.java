package com.kodup.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Autowired
	MypageService service;
	
	
	@RequestMapping("/board/mypage") //회원정보 메뉴바
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage");
		return mv;
	}
	
	@RequestMapping("/board/mypage_memberinfo") //회원정보
	public ModelAndView mypage_info(HttpServletRequest req, HttpServletResponse res) throws IOException{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionId");
		System.out.println(id);
		
		MypageVo mpVo = service.info(id);
		mv.addObject("mpVo", mpVo);
		
		mv.setViewName("mypage/mypage_memberinfo");
		return mv;
	}
	
	@RequestMapping("/board/mypage_memberinfo_update") //회원정보 수정
	public ModelAndView mypage_memberinfo_update(HttpServletRequest req, HttpServletResponse res)throws IOException {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionId");
		System.out.println(id);
		
		MypageVo mpVo = service.info(id);
		mv.addObject("mpVo", mpVo);
		
		mv.setViewName("mypage/mypage_memberinfo_update");
		return mv;
	}
	
	
	/*
	 * @RequestMapping("/board/mypage_memberinfo_update_complete") //회원정보 수정 완료
	 * public ModelAndView mypage_memberinfo_update_complete(@ModelAttribute
	 * MypageVo mpVo){ ModelAndView mv = new ModelAndView();
	 * 
	 * service.info_update_complete(mpVo);
	 * 
	 * 
	 * System.out.println("수정완료버튼..컨트롤러..연결됨"); System.out.println(mpVo.nickname);
	 * 
	 * mv.addObject("mpVo", mpVo);
	 * 
	 * mv.setViewName("mypage/mypage_memberinfo_update"); return mv; }
	 */
	
	
	@RequestMapping("/board/mypage_memberinfo_update_complete") //회원정보 수정 완료
	public String mypage_memberinfo_update_complete(@ModelAttribute MypageVo mpVo){
		String msg = "";
		
		boolean flag= service.mypage_memberinfo_update_complete(mpVo); // 데이터를 넘겨줌
		if( !flag ) msg = "수정 중 오류 발생";
		
		return msg;
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
	
	@RequestMapping("/board/mypage_memberinfo_quit") //회원탈퇴 (단순버튼)
	public ModelAndView mypage_memberinfo_quit() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_memberinfo_quit");
		return mv;
	}
	
	
	@RequestMapping("/board/mypage_memberinfo_quit_real") // 찐 탈퇴
	public ModelAndView mypage_memberinfo_quit_real(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		MypageQuitVo mqVo = service.member_quit(id);
		mv.addObject("mqVo", mqVo);
				
		mv.setViewName("login/main");
		return mv;
	}
	
	
	
}