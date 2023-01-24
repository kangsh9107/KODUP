package com.kodup.notification;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kodup.common.CommonBoardPageVo;
import com.kodup.common.CommonBoardService;

@RestController
public class NotificationBoardController {
	
	@Autowired
	NotificationBoardService service;
	
	@Autowired
	CommonBoardService cbService;

	@RequestMapping("/notification/notification_insert")
	public ModelAndView notficationInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification_insert");
		return mv;
	}
	
	@RequestMapping("/notification/notification_update")
	public ModelAndView notificationUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notification/notification_update");
		return mv;
	}
	
	//성호
		@RequestMapping("/notification/notification_view")
		public ModelAndView notificationView(NotificationBoardVo nbVo, NotificationBoardReplVo nbrVo, CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
			ModelAndView mv = new ModelAndView();
			
			nbVo = service.view(nbVo.getSno());
			List<NotificationBoardReplVo> replList = service.replList(nbVo.getSno());//본문의sno를 넣어줌
			
			//봤던글 표시
			HttpSession session = req.getSession();
			cbpVo.setId((String)session.getAttribute("sessionId"));
			cbpVo.setSno(nbVo.getSno());
			if(cbpVo.getId() != null) cbService.insertView(cbpVo);
			
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("nbVo",nbVo);
			mv.addObject("replList",replList);
			mv.setViewName("/notification/notification_view");
			return mv;
		}
		
		@RequestMapping("/notification/notification_view/thumbup")
		public void notificationThumbup(@RequestParam(name="sno") int sno) {
			service.thumbup(sno);
		}
		
		@RequestMapping("/notification/notification_view/thumbdown")
		public void notificationThumbdown(@RequestParam(name="sno") int sno) {
			service.thumbdown(sno);
		}
		
		@RequestMapping("/notification/notification_view/deleteR")
		public ModelAndView notificationDeleteR(NotificationBoardVo nbVo) {
			String msg="";
			ModelAndView mv = new ModelAndView();
			
			boolean b = service.notificationDeleteR(nbVo);
			if(!b) {
				msg = "삭제중 오류 발생";
			}
			//mv = notification(nbVo);	//담겨진 데이터들을 들고 notification()를 통해  notification.jsp로 넘어가게 하려고
			mv.addObject("msg",msg);
			mv.setViewName("/notification/notification");
			return mv;
		}
		
		@RequestMapping("/notification/notification_view/ReplDeleteR")
		public ModelAndView notificationReplDeleteR(NotificationBoardVo nbVo, NotificationBoardReplVo nbrVo){
			String msg="";
			ModelAndView mv = new ModelAndView();
			
			boolean b = service.notificationReplDeleteR(nbrVo.getRepl_sno());
			if(!b) {
				msg = "삭제중 오류 발생";
			}
			
			nbVo = service.view(nbVo.getSno());
		
			List<NotificationBoardReplVo> replList = service.replList(nbVo.getSno());
			mv.addObject("msg",msg);
			mv.addObject("nbVo",nbVo);
			mv.addObject("replList",replList);
			mv.setViewName("/notification/notification_view");
			return mv;
			
		}
		
		@RequestMapping("/notification/notification_view/insertRepl")
		public ModelAndView insertRepl(NotificationBoardReplVo nbrVo, NotificationBoardVo nbVo) {
			String msg="";
			ModelAndView mv = new ModelAndView();
			//댓글을 repl에 추가(service.insertRepl(nbrVo))->
			//추가된댓글의repl_sno를 추출한 후 추출된repl_sno를 repl_selected테이블의 추가(service.insertRepl2(nbrVo)
			boolean b = service.insertRepl(nbrVo);//repl테이블의 추가
			
			if(!b) {
				msg = "댓글 입력 중 오류 발생";
			}
			
			
			
			nbVo = service.view(nbVo.getSno());
			
			List<NotificationBoardReplVo> replList = service.replList(nbVo.getSno());
			
			//mv.addObject("attList",attlist);
			mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
			mv.addObject("nbVo",nbVo);
			mv.addObject("replList",replList);
			mv.setViewName("/notification/notification_view");
			return mv;
		}
		
		@RequestMapping("/notification/notification_view/insertInnerRepl")
		public ModelAndView insertInnerRepl(NotificationBoardReplVo nbrVo, NotificationBoardVo nbVo) {
			String msg="";
			ModelAndView mv = new ModelAndView();
			boolean b = service.insertInnerRepl(nbrVo);
			
			if(!b) {
				
				msg = "댓글 입력 중 오류 발생";
			} 
			
			nbVo = service.view(nbVo.getSno());
			
			List<NotificationBoardReplVo> replList = service.replList(nbVo.getSno());
			
			//mv.addObject("attList",attlist);
			mv.addObject("msg",msg);	//고도화시 이 msg를 가공해서 jsp에 뿌려주자jsp에서 스크립틀릿열고 alert(${msg})등 할수있음
			mv.addObject("nbVo",nbVo);
			mv.addObject("replList",replList);
			mv.setViewName("/notification/notification_view");
			return mv;
		}
		
		
		
		@RequestMapping("/notification/notification_view/ReplUpdateR")
		public ModelAndView ReplUpdateR(NotificationBoardReplVo nbrVo, NotificationBoardVo nbVo) {
			String msg="";
			ModelAndView mv = new ModelAndView();
			boolean b = service.ReplUpdateR(nbrVo);
			
			
			if(!b) {
				msg = "수정 중 오류 발생";
			}
			
			nbVo = service.view(nbVo.getSno());
			
			List<NotificationBoardReplVo> replList = service.replList(nbVo.getSno());
			
			//mv.addObject("attList",attlist);
			mv.addObject("msg",msg);	
			mv.addObject("nbVo",nbVo);
			mv.addObject("replList",replList);
			
			mv.setViewName("/notification/notification_view");
			return mv;
		}

}
