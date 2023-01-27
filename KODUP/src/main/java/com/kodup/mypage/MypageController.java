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
   static String path="C:\\Users\\K\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\upload\\"
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
   
   @RequestMapping("/board/mypage_memberinfo") //회원정보. 
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
   
   
   //회원정보 수정화면. 기존 정보 보여주는 거
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
      System.out.println("grade : " + mpVo.getGrade());
      
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
         File temp = new File(path + oriFile);    // 임시저장 경로
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
   
   public List<MypageAttVo> fileUpload2(List<MultipartFile> mul, MypageCertiVo mpcv) throws Exception{
      List<MypageAttVo> attList = new ArrayList<MypageAttVo>();
      int cnt = 0;
      for(MultipartFile m : mul) {
         if(m.isEmpty()) continue;
         UUID uuid = UUID.randomUUID();
         String oriFile = m.getOriginalFilename();
         String sysFile = ""; 
         File temp = new File(path + oriFile);    // 임시저장 경로
         m.transferTo(temp);
         sysFile = (uuid.getLeastSignificantBits()*-1) + "-" + oriFile;
         if(cnt < 1) {
            mpcv.setLicense_sysFile(sysFile);
         } else {
            mpcv.setLogo_sysFile(sysFile);
         }
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
   
   
//나의픽셀 페이지
   
   //<나의 픽셀> 보유픽셀과, 픽셀이력, && 나의픽셀 페이징처리
   @RequestMapping("/board/mypage_mypixel") 
   public ModelAndView mypage_mypixel(PageVo pVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
      ModelAndView mv = new ModelAndView();
   
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      
      pVo.setId(id);
      if(req.getParameter("nowPage") != null) pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
      /* if () { */
      List<MypagePixelVo> list = service.pixel(pVo);
         /*
          * } else if () { List<MypagePixelVo> list = service.pixel_get(pVo); } else {
          * List<MypagePixelVo> list = service.pixel_use(pVo); }
          */
      pVo = service.getpVo();
      if(req.getParameter("nowPage") != null) pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));

      //System.out.println(list.get(list.size() - 1).pixel);
      //int pixel = list.get(list.size() - 1).pixel;
      //mv.addObject("M_PIXEL", pixel);
      System.out.println("nowPage : " + pVo.getNowPage());
      
      System.out.println(list);

      if(list.size()==0) {
         int pixel = service.pixel_have(id);
         mv.addObject(pixel);
         System.out.println(pixel); 
         mv.setViewName("mypage/mypage_mypixel");
         
      } else {
         mv.addObject("list", list);
         mv.addObject("pVo", pVo);
         mv.setViewName("mypage/mypage_mypixel");
      }
      
      return mv;
   
   } 
   
   //보유픽셀
   /*
   @RequestMapping("/board/mypage_mypixel_have") 
   public ModelAndView mypage_mypixel_have(HttpServletRequest req, HttpServletResponse res) throws IOException {
      ModelAndView mv = new ModelAndView();
   
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      
      int pixel_have = service.pixel_have(id);

      mv.addObject("pixel_have", pixel_have);
      System.out.println(pixel_have); //콘솔 뜸
      
      mv.setViewName("mypage/mypage_mypixel");
      
      return mv;
   
   } 
   */
   
   
   
   //픽셀 획득 이력
   @RequestMapping("/board/mypage_pixel_get") 
   public ModelAndView pixel_get(PageVo pVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
      ModelAndView mv = new ModelAndView();
      System.out.println("nowpage1 : " + pVo.getNowPage());
      String nowPage = (String)req.getParameter("nowPage");
      System.out.println("nowPage2 : "+ nowPage);
      
      System.out.println("픽셀get 실행됨");
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      
      pVo.setId(id);
      if(req.getParameter("nowPage") != null) pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
      
      List<MypagePixelVo> list = service.pixel_get(pVo);
      pVo = service.getpVo();
      
      
      mv.addObject("list", list);
      mv.addObject("pVo", pVo);
      mv.setViewName("mypage/mypage_mypixel_get");
      return mv;

   } 
   
   
   //픽셀 사용 이력
   @RequestMapping("/board/mypage_pixel_use") 
   public ModelAndView pixel_use(PageVo pVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
      ModelAndView mv = new ModelAndView();
   
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      
      pVo.setId(id);
      if(req.getParameter("nowPage") != null) pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
      
      List<MypagePixelVo> list = service.pixel_use(pVo);
      pVo = service.getpVo();
      
      mv.addObject("list", list);
      mv.addObject("pVo", pVo);
      mv.setViewName("mypage/mypage_mypixel_use");
      return mv;

   } 
   
   
   //환전신청
   @RequestMapping("/board/mypage_pixel_exchange")
   public ModelAndView mypage_pixel_exchange(MypagePixelVo mppv) {
      ModelAndView mv = new ModelAndView();
      boolean b = true;
      b = service.mypage_pixel_exchange(mppv);
      
      //mv.addObject("class_pixel", mppv.getPixel());
      //mv.addObject("class_pixel_want_exchange", mppv.getPixel_want_exchange());
      mv.setViewName("mypage/mypage_mypixel");
      return mv;
   }
   
   
//인증페이지
   
   @RequestMapping("/board/mypage_certification") //인증
   public ModelAndView mypage_certification(HttpServletRequest req, HttpServletResponse res) throws IOException {
      ModelAndView mv = new ModelAndView();
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      
      int status = 0;
     status = service.select_corp_status(id);
     
     mv.addObject("status", status);
      mv.setViewName("mypage/mypage_certification");
      return mv;
   }
   
   
   //이메일인증
   /*
   @RequestMapping("/board/mypage_email_certification")
   public ModelAndView mypage_email_certification(MypageCertiVo mpcv) {
      ModelAndView mv = new ModelAndView();
      boolean b = true;
      b = service.mypage_email_certification(mpcv);
      
      //mv.addObject("class_pixel", mppv.getPixel());
      //mv.addObject("class_pixel_want_exchange",    mppv.getPixel_want_exchange());
      mv.setViewName("mypage/mypage_certification");
      return mv;
   }
   
   
   //계좌인증
   @RequestMapping("/board/mypage_account_certification")
   public ModelAndView mypage_account_certification(MypageCertiVo mpcv) {
      ModelAndView mv = new ModelAndView();
      boolean b = true;
      b = service.mypage_account_certification(mpcv);
      
      //mv.addObject("class_pixel", mppv.getPixel());
      //mv.addObject("class_pixel_want_exchange",    mppv.getPixel_want_exchange());
      mv.setViewName("mypage/mypage_certification");
      return mv;
   }
   
   
   */
   
   //멘토인증          
   @RequestMapping("/board/mypage_mentor_certification") 
   public ModelAndView mypage_mentor_certification(HttpServletRequest req, HttpServletResponse res,
                @RequestParam(value ="attFile", required=false) List<MultipartFile> mul, // 선택한 파일 업로드
                   @ModelAttribute MypageCertiVo mpcv //폼태그로 날린 정보
                   ) throws IOException {
      ModelAndView mv = new ModelAndView();
      
      HttpSession session = req.getSession();
      String id = (String)session.getAttribute("sessionId");
      mpcv.setId(id);

      System.out.println(mpcv);
      boolean b = false;
      System.out.println("파일" + req.getParameter( "attFile"));
      System.out.println("경력증명 : " + mpcv.getCareer_certificate());
      
      for(MultipartFile m : mul) {
         if(!m.isEmpty()) {
            List<MypageAttVo> attList;
            try {
               attList = fileUpload(mul);
               mpcv.setCareer_certificate(attList.get(0).getSysFile());
               
               System.out.println(mpcv.getCareer_certificate());
               
               b = service.mypage_mentor_certification(mpcv);            
            } catch (Exception e) {
               e.printStackTrace();
            }
         }else {
            //b = service.update(mpcv);
         }
         
      } 
      
      mv.setViewName("mypage/mypage_corp_certification");
      return mv;
   }
   
   //@RequestParam(name="status") int status) 
   //MypageAttVo
   @RequestMapping("/board/mypage_corp_certification") //기업인증. 폼 전송 시.
   public ModelAndView mypage_corp_certification(@RequestParam("att") List<MultipartFile> mul, // 선택한 파일 업로드
                                      @ModelAttribute MypageCertiVo mpcv) throws Exception //폼태그로 날린 정보
    {
	   System.out.println("컨트롤");
      ModelAndView mv = new ModelAndView();
      List<MypageAttVo> mpatt = fileUpload(mul);
      String[] temp = new String[mpatt.size()];
      for(int i=0; i<mpatt.size(); i++) {
         if(mpatt.get(i).getSysFile() != null || mpatt.get(i).getSysFile() != "") {
            temp[i] = mpatt.get(i).getSysFile();
         }
      }
      boolean b = true;
      mpcv.setLicense_sysFile(temp[0]);
      mpcv.setLogo_sysFile(temp[1]);
      b = service.insert_corp(mpcv);
      if( !b ) {
         service.fileDelete(temp);
      } else {
         
      }
      
      mv.setViewName("mypage/mypage_certification");
      return mv;
    }
   
   
   
    
   
      
      /*
      List<MultipartFile> mpatt = new ArrayList<MultipartFile>();
      for(int i=0; i<1; i++) {
         mpatt.add(mul.get(i));
         mpatt.add(mul_2.get(i));
      }
      
      List<MypageAttVo> attList = null;
      try {
         attList = fileUpload(mpatt);
      } catch (Exception e1) {
         e1.printStackTrace();
      }
      mpcv.setCorp_license(attList.get(0).getSysFile());
      mpcv.setCorp_logo(attList.get(0).getSysFile());
         
      
      for(MultipartFile m : mpatt) {
         if(!m.isEmpty()) {
            //List<MypageAttVo> attList2;
            try {
               attList = fileUpload(mul);
               //mpcv.setProfile_img(attList.get(0).getSysFile());
               System.out.println(mpcv.getCorp_license()); //1234-1.png
                     
               b = service.corp_updateR(mpcv);
            } catch (Exception e) {
               e.printStackTrace();
            }
         } else {
         }
      } 
            
      mv.setViewName("mypage/mypage_memberinfo");
      return mv;  
   }*/
         
         
      /*
      } else {}
            try {
               attList = fileUpload_corp(mul, mul_2);
               mpcv.setCorp_license();
               mpcv.setCorp_logo();
               //(attList.get(0).getSysFile());
               
               b = service.updateR(mpVo, delFile);            
            } catch (Exception e) {
               e.printStackTrace();
            }
         }else {
            System.out.println("update 실행전");
            b = service.update(mpVo);
            System.out.println("update 실행완료");
         }
         
      mv.setViewName("mypage/mypage_certification");
      return mv;
   }
}  */
   
   // 인증>기업인증 첨부파일 업로드
   /*
   public List<MypageCorpVo> fileUpload_corp(List<MultipartFile> mul) throws Exception{
      List<MypageCorpAttVo> attList = new ArrayList<MypageCorpAttVo>();
      for(MultipartFile m : mul) {
         if(m.isEmpty()) continue;
         UUID uuid = UUID.randomUUID();
         String oriFile = m.getOriginalFilename();
         String sysFile = ""; 
         File temp = new File(path + oriFile);    // 임시저장 경로
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