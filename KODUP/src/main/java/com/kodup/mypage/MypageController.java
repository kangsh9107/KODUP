package com.kodup.mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class MypageController {
	static String path="C:\\Users\\N\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\upload\\"
;
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
	
	@RequestMapping("/board/mypage_memberinfo") //회원정보. select
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
	
	
	//회원정보 수정화면. 기존 정보 보여주는 거라 이것도 select
	@RequestMapping("/board/mypage_memberinfo_update") 
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
	
	
	
	//회원 정보 글 수정 되는 코드.
	/*
	@RequestMapping("/board/mypage_memberinfo_update_complete") //회원정보 수정 완료
	public ModelAndView mypage_memberinfo_update_complete(MypageVo mpVo){
		String msg = "";
		ModelAndView mv = new ModelAndView();
		
		boolean b= service.mypage_memberinfo_update_complete(mpVo); // 데이터를 넘겨줌
		if( !b ) msg = "수정 중 오류 발생";
		
		mpVo = service.info(mpVo.getId());
		mv.addObject("mpVo", mpVo);
		
		mv.addObject("msg", msg);
		//mv.setViewName("mypage/mypage_memberinfo_update");
		mv.setViewName("mypage/mypage_memberinfo");
		 //왜 인덱스로 연결...???
		return mv;
	}
	*/
	
	//파일 업로드
	//회원정보 수정 후 수정완료 버튼 클릭 시 작동. (이미지 파일 첨부, 수정한 입력 정보 반영)
	@RequestMapping("/board/mypage_memberinfo_update_complete") 
	public ModelAndView updateR(@RequestParam("attFile")List<MultipartFile> mul, // t선택한파일
						 @ModelAttribute MypageVo mpVo, //폼태그로 날린 정보
						 @RequestParam(name = "delFile", required = false, defaultValue="") String[] delFile) {		
		ModelAndView mv = new ModelAndView();
		boolean b = false;
		
		if(mul.size() > 0) {
			try {
				List<MypageAttVo> attList = fileUpload(mul);
				mpVo.setProfile_img(attList.get(0).getSysFile());
				System.out.println(mpVo.getProfile_img()); //1234-1.png
				
				b = service.updateR(mpVo, delFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/*
		String msg = "";
		if(b) msg = "정상적으로 수정되었습니다.";
		else  msg = "수정중 오류 발생";
		*/
		mv.addObject("mpVo", mpVo);
		mv.setViewName("mypage/mypage_memberinfo");
		return mv;
	}
	
//파일 업로드 공통부분(중복코드 제거: insertR, updateR, replR에서 공통으로 들어감)
	public List<MypageAttVo> fileUpload(List<MultipartFile> mul) throws Exception{
		List<MypageAttVo> attList = new ArrayList<MypageAttVo>();
		for(MultipartFile m : mul) {
			if(m.isEmpty()) continue;
			UUID uuid = UUID.randomUUID();
			String oriFile = m.getOriginalFilename();
			String sysFile = ""; 
			File temp = new File(path + oriFile); 	// 임시저장 경로
			m.transferTo(temp);
			sysFile =(uuid.getLeastSignificantBits()*-1) + "-" + oriFile;
			File f = new File(path + sysFile);
			temp.renameTo(f);
			
			MypageAttVo attVo = new MypageAttVo();
			attVo.setSysFile(sysFile);
			
			attList.add(attVo);
//			System.out.println(m.getOriginalFilename());
//			System.out.println(uuid.getLeastSignificantBits());
		}
		
		return attList;
	}
	
	/*
	 * @RequestMapping("/board/mypage_memberinfo_update_complete") //회원정보 수정 완료
	 * public String mypage_memberinfo_update_complete(@RequestParam("attFile"),
	 * 
	 * @ModelAttribute MypageVo mpVo, @RequestParam(name = "delFile", required =
	 * false, defaultValue="") String[] delFile) { // attFile이라는 파라미터가 들어온 경우에는
	 * MultipartFile로 받고 나머지는 BoardVo로 받는다?
	 * 
	 * ) String msg = ""; boolean flag =
	 * service.mypage_memberinfo_update_complete(mpVo, delFile);
	 * 
	 * boolean b= service.mypage_memberinfo_update_complete(mpVo); // 데이터를 넘겨줌 if(b)
	 * { b="정상적으로 수정되었습니다"; try(b{ List<AttVo> })
	 * 
	 * }
	 * 
	 * return msg; }
	 */
	
	
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
	public ModelAndView mypage_memberinfo_quit(HttpServletRequest req, HttpServletResponse res) throws IOException{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionId");
		System.out.println(id);
		
		MypageVo mpVo = service.info(id);
		mv.addObject("mpVo", mpVo);
		
		mv.setViewName("mypage/mypage_memberinfo_quit");
		return mv;
	}
	
	
	@RequestMapping("/board/mypage_memberinfo_quit_real") // 찐 탈퇴
	public ModelAndView mypage_memberinfo_quit_real(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("nickname");
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		MypageQuitVo mqVo = service.member_quit(id);
		mv.addObject("mqVo", mqVo);
				
		mv.setViewName("login/main");
		return mv;
	}
	
	
	/*
	 * @RequestMapping("/board/mypage_memberinfo_quit_real") // 찐 탈퇴 public
	 * ModelAndView mypage_memberinfo_quit_real(HttpServletRequest req,
	 * HttpServletResponse res) throws IOException { ModelAndView mv = new
	 * ModelAndView();
	 * 
	 * HttpSession session = req.getSession(); String id = (String)
	 * session.getAttribute("sessionId");
	 * 
	 * MypageQuitVo mqVo = service.member_quit(id); mv.addObject("mqVo", mqVo);
	 * 
	 * mv.setViewName("login/main"); return mv; }
	 */
	
	
	
}