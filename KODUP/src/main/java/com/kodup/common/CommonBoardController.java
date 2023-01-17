package com.kodup.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView qnaList(CommonBoardPageVo cbpVo) {
		ModelAndView mv = new ModelAndView();
		List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
		cbpVo = cbService.getCbpVo();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("listQna", listQna);
		mv.setViewName("/qna/qna");
		return mv;
	}
	
	//Q&A 리스트 출력 back
	@RequestMapping("/qna/qna_list_back")
	public ModelAndView qnaListBack(CommonBoardPageVo cbpVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
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
	
	//hashtag search
	@RequestMapping("/login/find_hashtag")
	public ModelAndView hashtagList(CommonBoardPageVo cbpVo) {
		ModelAndView mv = new ModelAndView();
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
	
	//INSERTR
	@RequestMapping("/qna/qna_insertR")
	public ModelAndView qnaInsertR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
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
		b = cbService.insert(ibVo);
		if( !b ) {
			mv.addObject("error", "error_insert");
			mv.setViewName("/login/error");
		} else {
			List<SelectBoardVo> listQna = cbService.listQna(cbpVo);
			cbpVo = cbService.getCbpVo();
			
			for(SelectBoardVo l : listQna) {
				System.out.println(l.qna_pixel_reward);
			}
			
			mv.addObject("cbpVo", cbpVo);
			mv.addObject("listQna", listQna);
			mv.setViewName("/qna/qna");
		}
		
		return mv;
	}
	
	//UPDATE 폼 출력
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
	
	//UPDATER
	@RequestMapping("/qna/qna_updateR")
	public ModelAndView qnaUpdateR(CommonBoardPageVo cbpVo, InsertBoardVo ibVo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cbpVo", cbpVo);
		mv.addObject("ibVo", ibVo);
		mv.setViewName("/qna/qna_view");
		return mv;
	}
	
}
