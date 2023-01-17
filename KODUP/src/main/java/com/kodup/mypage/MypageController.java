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

import com.kodup.login.LoginService;



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
	
	@Autowired
	LoginService loginService;
	
	
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
	
	
	//프로필 파일 업로드
	//회원정보 수정 후 수정완료 버튼 클릭 시 작동. (이미지 파일 첨부, 수정한 입력 정보 반영)
	@RequestMapping("/board/mypage_memberinfo_update_complete") 
	public ModelAndView updateR(@RequestParam("attFile")List<MultipartFile> mul, // 선택한 파일 업로드
						 @ModelAttribute MypageVo mpVo, //폼태그로 날린 정보
						 @RequestParam(name = "delFile", required = false, defaultValue="") String[] delFile) {		
		ModelAndView mv = new ModelAndView();
		boolean b = false;
		
		System.out.println("mul size : " + mul.size());
		for(MultipartFile m : mul) {
			if(!m.isEmpty()) {
				List<MypageAttVo> attList;
				try {
					attList = fileUpload(mul);
					mpVo.setProfile_img(attList.get(0).getSysFile());
					System.out.println(mpVo.getProfile_img()); //1234-1.png
					
					b = service.updateR(mpVo, delFile);				
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				System.out.println("update 실행전");
				b = service.update(mpVo);
				System.out.println("update 실행완료");
			}
			
		} 
		
		mv.setViewName("mypage/mypage_memberinfo");
		return mv;
	}
	
	//회원정보 파일 업로드
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
		}
		
		return attList;
	}
	

	
	
	@RequestMapping("/board/mypage_dailycheck") //출석체크
	public ModelAndView mypage_dailycheck() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_dailycheck");
		return mv;
	}
	
	
	
	
	@RequestMapping("/board/mypage_mypixel") //나의 픽셀
	public ModelAndView mypage_mypixel(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
	
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		MypagePixelVo mPixelVo = service.pixel(id);
		
		System.out.println("보유픽셀:" + mPixelVo.getPixel());
		
		mv.addObject("mPixelVo", mPixelVo);
		mv.setViewName("mypage/mypage_mypixel");
		return mv;
	}
	
	
	
	@RequestMapping("/board/mypage_certification") //인증
	public ModelAndView mypage_certification() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage/mypage_certification");
		return mv;
	}
	
	/*
	@RequestMapping("/board/mypage_corp_certification") //기업인증. 폼 전송 시.
	public ModelAndView mypage_corp_certification(@RequestParam("attFile") MultipartFile mul,
			 @RequestParam("attFile2") MultipartFile mul_2,// 선택한 파일 업로드
			 @ModelAttribute MypageCorpVo mpCVo,
			 @RequestParam(name = "delFile", required = false, defaultValue="") String[] delFile) {		
			 
		ModelAndView mv = new ModelAndView();
		
		boolean b = false;
		
		//for(MultipartFile m : mul) {
			if(!mul.isEmpty() && !mul_2.isEmpty()) {
				List<MypageCorpAttVo> attList;
				try {
					attList = fileUpload_corp(mul, mul_2);
					mpCVo.setCorp_license(attList.get(0))
					System.out.println(mpCVo.getCorp_license());
					
					b = service.mypage_corp_certification(mpCVo, delFile);				
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				System.out.println("update 실행전");
				b = service.update(mpCVo);
				System.out.println("update 실행완료");
			}
			
			mv.setViewName("mypage/mypage_corp_certification");
			return mv;
		} 
		
	*/
	
	// 인증>기업인증 첨부파일 업로드
	/*
	public List<MypageCorpVo> fileUpload_corp(MultipartFile mul, MultipartFile mul_2) throws Exception{
		List<MypageCorpAttVo> attList = new ArrayList<MypageCorpAttVo>();
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
			
			MypageCorAttVo attCAVo = new MypageCorpAttVo();
			attCVo.setSysFile(sysFile);
			
			attList.add(attCVo);
		}
		
		return attList;
	}
	
	*/
	
	
	@RequestMapping("/board/mypage_memberinfo_quit") //회원탈퇴 (단순 회원탈퇴 페이지 이동버튼)
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
	public ModelAndView mypage_memberinfo_quit_real(MypageVo mpVo, HttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		String id = mpVo.getId();
		System.out.println("탈퇴할 아이디:" + id);
		System.out.println(mpVo.getEmail());
		boolean b = service.mypage_memberinfo_quit_real(mpVo);
		
		//mv.addObject("mpVo", mpVo);
		//로그아웃
		HttpSession session = req.getSession();
		loginService.chatDelete((String)session.getAttribute("sessionId"));
		String str = null;
		session.setAttribute("sessionId", str);
		
		
		mv.setViewName("login/main");
		return mv;
		
	}

}