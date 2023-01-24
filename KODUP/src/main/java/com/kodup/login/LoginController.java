package com.kodup.login;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginController {
	
	@Autowired
	LoginService service;

	//로그인 폼 출력
	@RequestMapping("/login/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/login");
		return mv;
	}
	
	//계정찾기 폼 출력
	@RequestMapping("/login/find_account")
	public ModelAndView findAccount() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/find_account");
		return mv;
	}
	
	//코덥 회원가입 폼 출력
	@RequestMapping("/login/join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login/join");
		return mv;
	}
	
	//MAIN
	@RequestMapping("/login/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		List<IndexBoardVo> qna5 = service.qna5();
		List<IndexBoardVo> freetalking5 = service.freetalking5();
		List<IndexBoardVo> infoshare5 = service.infoshare5();
		List<IndexBoardVo> notification5 = service.notification5();
		List<IndexBoardVo> weeklyBest5 = service.weeklyBest5();
		List<IndexBoardVo> editor5 = service.editor5();
		
		mv.addObject("qna5", qna5);
		mv.addObject("freetalking5", freetalking5);
		mv.addObject("infoshare5", infoshare5);
		mv.addObject("notification5", notification5);
		mv.addObject("weeklyBest5", weeklyBest5);
		mv.addObject("editor5", editor5);
		mv.setViewName("/login/main");
		return mv;
	}
	
	//HOT TAG
	@RequestMapping("/login/hot_tag")
	public ModelAndView hotTag() {
		ModelAndView mv = new ModelAndView();
		List<CommonBoardVo> listHotTag = service.hotTag();
		
		//hashtag를 #기준으로 뜯고 Map구조에 key,value로 담아서 카운트
		Map<String, Integer> countHashTag = new HashMap<>();
		for(CommonBoardVo cbVo : listHotTag) {
			if(cbVo != null) {
				String temp = cbVo.hashtag.substring(1);
				String[] tag = temp.split("#");
				
				for(String t : tag) {
					if(countHashTag.get(t) == null) {
						try {
							countHashTag.put(t.toUpperCase(), 1);
						} catch(Exception e) {
							countHashTag.put(t, 1);
						}
					} else {
						try {
							countHashTag.put(t.toUpperCase(), countHashTag.get(t.toUpperCase())+1);
						} catch(Exception e) {
							countHashTag.put(t, countHashTag.get(t)+1);
						}
					}
				}
			}
		}
		
		//value 내림차순으로 정렬하고, value가 같으면 key 오름차순으로 정렬
        List<Map.Entry<String, Integer>> list = new LinkedList<>(countHashTag.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                if (o1.getValue() > o2.getValue())      return -1;
                else if (o1.getValue() < o2.getValue()) return 1;
 
                return o1.getKey().compareTo(o2.getKey());
            }
        });
 
        //순서유지를 위해 LinkedHashMap을 사용
        Map<String, Integer> sortedMap = new LinkedHashMap<>();
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();) {
            Map.Entry<String, Integer> entry = iter.next();
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        
        //정렬된 hashtag 중 상위 5개로 다시 listHotTagTemp를 만든다
        int cnt = 0;
        List<HotTagVo> listHotTagTemp = new LinkedList<>();
		for(HashMap.Entry<String, Integer> entry : sortedMap.entrySet()) {
			cnt++;
			HotTagVo htVo = new HotTagVo();
			htVo.setHotTag(entry.getKey());
			htVo.setTagCount(entry.getValue());
			
			listHotTagTemp.add(htVo);
			if(cnt == 5) break;
		}
		
		mv.addObject("listHotTagTemp", listHotTagTemp);
		mv.setViewName("/login/hot_tag");
		return mv;
	}
	
	//TOP WRITER
	@RequestMapping("/login/top_writer")
	public ModelAndView topWriter() {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> listTopWriter = service.topWriter();
		mv.addObject("listTopWriter", listTopWriter);
		mv.setViewName("/login/top_writer");
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/login/logoutR")
	public ModelAndView logoutR(HttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		service.chatDelete((String)session.getAttribute("sessionId"));
		System.out.println("로그아웃 실행중" );
		System.out.println("sessionId : " + (String)session.getAttribute("sessionId") );
		String str = null;
		session.setAttribute("sessionId", str);
		mv.setViewName("/login/main");
		return mv;
	}
	
	//로그인
	@RequestMapping("/login/loginR")
	public ModelAndView loginR(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		boolean b = false;
		b = service.login(mVo); //ID&PWD체크
		
		if( !b ) { //로그인 실패
			mv.addObject("error", "wrong_id&pwd");
			mv.setViewName("/login/error");
		} else {   //로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", mVo.getId());
			
			//grade가져옴
			int grade = 0;
			grade = service.checkGrade(mVo.getId());
			session.setAttribute("grade", grade);
			
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
	//코덥 회원가입 후 로그인
	@RequestMapping("/login/joinR")
	public ModelAndView join(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		boolean b = false;
		b = service.checkId(mVo.getId()); //true면 id중복
		
		if( !b ) { //id 중복아님
			boolean c = false;
			c = service.checkNickname(mVo.getNickname()); //true면 nickname중복
			
			if( !c ) { //nickname 중복아님. member테이블에 INSERT 후 로그인
				String[] dateTemp = req.getParameter("date").split("-");
				String date = "";
				for(String dt : dateTemp) {
					date += dt;
				}
				mVo.setAge(Integer.parseInt(date));
				
				boolean i = false; //true면 가입 성공. false면 가입 오류.
				i = service.insertMember(mVo);
				
				if( !i ) { //가입 오류
					mv.addObject("error", "error_join");
					mv.setViewName("/login/error");
				} else {   //가입 성공
					HttpSession session = req.getSession();
					session.setAttribute("sessionId", mVo.getId());
					
					//grade가져옴
					int grade = 0;
					grade = service.checkGrade(mVo.getId());
					session.setAttribute("grade", grade);
					
					mv.setViewName("/login/main");
				}
			} else {   //nickname 중복
				mv.addObject("error", "duplicate_nickname");
				mv.setViewName("/login/error");
			}
		} else { //id 중복
			mv.addObject("error", "duplicate_id");
			mv.setViewName("/login/error");
		}
		
		return mv;
	}
	
	//카카오 로그인
	@RequestMapping("/login/join_kakao_check")
	public ModelAndView loginKakaoR(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String img = req.getParameter("img");
		boolean b = false;
		b = service.checkId(id); //ID 중복체크. true면 중복
		
		if( b ) { //ID중복. 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", id);
			
			//grade가져옴
			int grade = 0;
			grade = service.checkGrade(id);
			session.setAttribute("grade", grade);
			
			mv.setViewName("/login/main");
		} else {  //ID중복 아님. 카카오 회원가입 폼으로.
			mv.addObject("id", id);
			mv.addObject("email", email);
			mv.addObject("img", img);
			mv.setViewName("/login/join_kakao");
		}
		
		return mv;
	}
	
	//카카오 회원가입 후 로그인
	@RequestMapping("/login/join_kakao")
	public ModelAndView joinKako(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		//NICKNAME 중복체크. true면 중복.
		boolean b = false;
		b = service.checkNickname(mVo.getNickname());
		
		if( !b ) {
			boolean c = false; //true면 가입완료
			String[] dateTemp = req.getParameter("date").split("-");
			String date = "";
			for(String dt : dateTemp) {
				date += dt;
			}
			mVo.setAge(Integer.parseInt(date));
			c = service.insertMemberKakao(mVo);
			
			if( !c ) { //member테이블 INSERT 오류
				mv.addObject("error", "error_join");
				mv.setViewName("/login/error");
			} else {   //member테이블 INSERT 성공
				HttpSession session = req.getSession();
				session.setAttribute("sessionId", mVo.getId());
				
				//grade가져옴
				int grade = 0;
				grade = service.checkGrade(mVo.getId());
				session.setAttribute("grade", grade);
				
				mv.setViewName("/login/main");
			}
		} else { //NICKNAME 중복
			mv.addObject("error", "duplicate_nickname");
			mv.setViewName("/login/error");
		}
		
		return mv;
	}
	
	//채팅세션 오픈 후 chat테이블에 INSERT
	@RequestMapping("/login/chat")
	public ModelAndView chat(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		boolean b = false;
		boolean c = false;
		
		//chat테이블에 존재하는지 확인. true면 중복
		String a = (String)req.getParameter("id");
		System.out.println("id : " + a);
		c = service.checkChatId(req.getParameter("id"));
		//grade가 0인 회원(멘티)는 로그인시 chat테이블에 추가하지 않음
		int grade = 0;
		grade = service.checkGrade(req.getParameter("id"));
		System.out.println("grade : " + grade);
		
		if( !c ) {
			b = service.chatInsert(req.getParameter("id"), grade);
			
			if( !b ) {
				mv.addObject("error", "error_chat");
				mv.setViewName("/login/error");
			} else {
				mv.setViewName("/login/main");
			}
		} else {
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
	//인증키 이메일로 발송
	@RequestMapping("/login/find_accountR")
	public ModelAndView findAccount(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String key = UUID.randomUUID().toString(); //랜덤 인증키 생성
		
		boolean b = service.checkEmail(req.getParameter("email")); //false면 DB에 저장된 코덥회원 이메일이 아님
		if( !b ) {
			mv.addObject("error", "not_found_email");
			mv.setViewName("/login/error");
		} else {
			boolean c = service.sendEmail(key, req, res); //false면 이메일 발송 에러
			if( !c ) {
				mv.addObject("error", "error_send_email");
				mv.setViewName("/login/error");
			} else {
				String keyTemp = service.enc(key);
				req.setAttribute("keyTemp", keyTemp);
				req.setAttribute("email", req.getParameter("email"));
				mv.setViewName("/login/find_account_key");
			}
		}
		
		return mv;
	}
	
	//인증키 인증 확인
	@RequestMapping("/login/find_account_keyR")
	public ModelAndView findAccountKey(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		String keyTemp = service.dec(req.getParameter("keyTemp"));
		if(req.getParameter("keyR").equals(keyTemp)) {
			String id = service.getId(req.getParameter("email"));
			req.setAttribute("id", id);
			mv.setViewName("/login/change_pwd");
		} else {
			mv.addObject("error", "error_key");
			mv.setViewName("/login/error");
		}
		
		return mv;
	}
	
	//비밀번호 변경
	@RequestMapping("/login/update_passwordR")
	public ModelAndView updatePwdR(MemberVo mVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		boolean b = false; //false면 비밀번호 변경오류
		b = service.updatePwd(mVo);
		
		if( !b ) {
			mv.addObject("error", "error_pwd");
			mv.setViewName("/login/error");
		} else {
			mv.setViewName("/login/main");
		}
		
		return mv;
	}
	
}
