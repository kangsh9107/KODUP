package com.kodup.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CommonBoardController {

	@Autowired
	CommonBoardService cbService;
	
	//Q&A 리스트 출력
	@RequestMapping("/qna/qna_list")
	public ModelAndView qnaList(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		String boardtype = cbpVo.getBoardtype();
		if(boardtype.equals("qna")) {
			List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listQna", listQna);
			mv.setViewName("/qna/qna");
		} else if(boardtype.equals("infoshare")) {
			List<SelectBoardVo> listInfoshare = cbService.listInfoshare(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listInfoshare", listInfoshare);
			mv.setViewName("/infoshare/infoshare");
		} else if(boardtype.equals("freetalking")) {
			List<SelectBoardVo> listFreetalking = cbService.listFreetalking(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listFreetalking", listFreetalking);
			mv.setViewName("/freetalking/freetalking");
		} else if(boardtype.equals("jobsearch")) {
			List<SelectBoardVo> listJobsearch = cbService.listJobsearch(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listJobsearch", listJobsearch);
			mv.setViewName("/jobsearch/jobsearch");
		} else if(boardtype.equals("notification")) {
			List<SelectBoardVo> listNotification = cbService.listNotification(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listNotification", listNotification);
			mv.setViewName("/notification/notification");
		}
		
		return mv;
	}
	
	//Q&A 리스트 출력 back
	@RequestMapping("/qna/qna_list_back")
	public ModelAndView qnaListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listQna", listQna);
		mv.setViewName("/qna/qna");
		return mv;
	}
	
	//INFOSHARE 리스트 출력 back
	@RequestMapping("/infoshare/infoshare_list_back")
	public ModelAndView infoshareListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listInfoshare = cbService.listInfoshare(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listInfoshare", listInfoshare);
		mv.setViewName("/infoshare/infoshare");
		return mv;
	}
	
	//FREETALKING 리스트 출력 back
	@RequestMapping("/infoshare/freetalking_list_back")
	public ModelAndView freetalkingListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listFreetalking = cbService.listFreetalking(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listFreetalking", listFreetalking);
		mv.setViewName("/freetalking/freetalking");
		return mv;
	}
	
	//JOBSEARCH 리스트 출력 back
	@RequestMapping("/jobsearch/jobsearch_list_back")
	public ModelAndView jobsearchListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listJobsearch = cbService.listJobsearch(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listJobsearch", listJobsearch);
		mv.setViewName("/jobsearch/jobsearch");
		return mv;
	}
	
	//NOTIFICATION 리스트 출력 back
	@RequestMapping("/notification/notification_list_back")
	public ModelAndView notificationListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		List<SelectBoardVo> listNotification = cbService.listNotification(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listNotification", listNotification);
		mv.setViewName("/notification/notification");
		return mv;
	}
	
	//hashtag search
	@RequestMapping("/login/find_hashtag")
	public ModelAndView hashtagList(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		cbpVo.setId((String)session.getAttribute("sessionId"));
		cbpVo.setSort(1);
		if(req.getParameter("nowPageK") != null) cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		if(req.getParameter("horseheadK") != null) cbpVo.setHorsehead(req.getParameter("horseheadK"));
		List<SelectBoardVo> listHashtag = cbService.listHashtag(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listHashtag", listHashtag);
		mv.setViewName("/login/find_hashtag");
		return mv;
	}
	
	//INSERT 폼 출력
	@RequestMapping("/qna/qna_insert")
	public ModelAndView qnaInsert(CommonBoardPageVo cbpVo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("cbpVo", cbpVo);
		mv.setViewName("/qna/qna_insert");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_insert")
	public ModelAndView infoshareInsert(CommonBoardPageVo cbpVo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("cbpVo", cbpVo);
		mv.setViewName("/infoshare/infoshare_insert");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_insert")
	public ModelAndView freetalkingInsert(CommonBoardPageVo cbpVo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("cbpVo", cbpVo);
		mv.setViewName("/freetalking/freetalking_insert");
		return mv;
	}
	
	//INSERTR
	@RequestMapping("/qna/qna_insertR")
	public ModelAndView qnaInsertR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String boardtype = cbpVo.getBoardtype();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 작성 성공
		b = cbService.insert(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_insert");
			mv.setViewName("/login/error");
		} else {
			boolean c = false; //true면 픽셀감소, 픽셀히스토리 insert 성공
			c = cbService.history(ibVo);
			List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listQna", listQna);
			mv.setViewName("/qna/qna");
		}
		
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_insertR")
	public ModelAndView infoshareInsertR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String boardtype = cbpVo.getBoardtype();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 작성 성공
		b = cbService.insert(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_insert");
			mv.setViewName("/login/error");
		} else {
			boolean c = false; //true면 픽셀감소, 픽셀히스토리 insert 성공
			c = cbService.history(ibVo);
			List<SelectBoardVo> listInfoshare = cbService.listInfoshare(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listInfoshare", listInfoshare);
			mv.setViewName("/infoshare/infoshare");
		}
		
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_insertR")
	public ModelAndView freetalkingInsertR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String boardtype = cbpVo.getBoardtype();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 작성 성공
		b = cbService.insert(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_insert");
			mv.setViewName("/login/error");
		} else {
			boolean c = false; //true면 픽셀감소, 픽셀히스토리 insert 성공
			c = cbService.history(ibVo);
			List<SelectBoardVo> listFreetalking = cbService.listFreetalking(cbpVo);
			cbpVo = cbService.getCbpVo();
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listFreetalking", listFreetalking);
			mv.setViewName("/freetalking/freetalking");
		}
		
		return mv;
	}
	
	//update 폼 출력
	@RequestMapping("/qna/qna_update")
	public ModelAndView qnaUpdate(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		ibVo.setQna_horsehead(req.getParameter("horsehead"));
		ibVo.setSubject(req.getParameter("subject"));
		ibVo.setDoc(req.getParameter("doc"));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo", ibVo);
		mv.setViewName("/qna/qna_update");
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_update")
	public ModelAndView infoshareUpdate(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		ibVo.setInfoshare_horsehead(req.getParameter("horsehead"));
		ibVo.setSubject(req.getParameter("subject"));
		ibVo.setDoc(req.getParameter("doc"));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo", ibVo);
		mv.setViewName("/infoshare/infoshare_update");
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_update")
	public ModelAndView freetalkingUpdate(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		cbpVo.setSort(Integer.parseInt(req.getParameter("sortK")));
		cbpVo.setBoardtype(req.getParameter("boardtypeK"));
		cbpVo.setHorsehead(req.getParameter("horseheadK"));
		cbpVo.setNowPage(Integer.parseInt(req.getParameter("nowPageK")));
		ibVo.setFreetalking_horsehead(req.getParameter("horsehead"));
		ibVo.setSubject(req.getParameter("subject"));
		ibVo.setDoc(req.getParameter("doc"));
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo", ibVo);
		mv.setViewName("/freetalking/freetalking_update");
		return mv;
	}
	
	//updateR
	@RequestMapping("/qna/qna_updateR")
	public ModelAndView qnaUpdateR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		String boardtype = ibVo.getBoardtype();
		
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 수정 성공
		ibVo.setQna_horsehead(req.getParameter("qna_horseheadK"));
		b = cbService.update(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_update");
			mv.setViewName("/login/error");
		} else {
			List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
			cbpVo = cbService.getCbpVo();
			
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listQna", listQna);
			mv.setViewName("/qna/qna");
		}
		
		return mv;
	}
	
	@RequestMapping("/infoshare/infoshare_updateR")
	public ModelAndView infoshareUpdateR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		String boardtype = ibVo.getBoardtype();
		
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 수정 성공
		ibVo.setInfoshare_horsehead(req.getParameter("infoshare_horseheadK"));
		b = cbService.update(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_update");
			mv.setViewName("/login/error");
		} else {
			List<SelectBoardVo> listInfoshare = cbService.listInfoshare(cbpVo);
			cbpVo = cbService.getCbpVo();
			
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listInfoshare", listInfoshare);
			mv.setViewName("/infoshare/infoshare");
		}
		
		return mv;
	}
	
	@RequestMapping("/freetalking/freetalking_updateR")
	public ModelAndView freetalkingUpdateR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		String basic = req.getParameter("basic");
		StringBuilder sb = new StringBuilder();
		String boardtype = ibVo.getBoardtype();
		
		//[{"value":"hashtag"},{}]를 파싱해서 #hashtag#hashtag로 만든다
		try {
			JSONParser jParser = new JSONParser();
			JSONArray jArray = (JSONArray)jParser.parse(basic);
			for(int i=0; i<jArray.size(); i++) {
				JSONObject jObject = (JSONObject)jArray.get(i);
				sb.append("#");
				sb.append(jObject.get("value"));
			}
			ibVo.setHashtag(sb.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		boolean b = false; //true면 글 수정 성공
		ibVo.setFreetalking_horsehead(req.getParameter("freetalking_horseheadK"));
		b = cbService.update(ibVo, boardtype);
		if( !b ) {
			mv.addObject("error", "error_update");
			mv.setViewName("/login/error");
		} else {
			List<SelectBoardVo> listFreetalking = cbService.listFreetalking(cbpVo);
			cbpVo = cbService.getCbpVo();
			
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listFreetalking", listFreetalking);
			mv.setViewName("/freetalking/freetalking");
		}
		
		return mv;
	}
	
}
