package com.kodup.mansearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MansearchFileUploadController {
	
	MansearchBoardVo mbVo = new MansearchBoardVo();

	@Autowired
	MansearchService service;
	
	@RequestMapping("/mansearch/mansearch_insertR")
	public synchronized String insertR(@ModelAttribute MansearchBoardVo mbVo) {	
		String msg="";
		int corp_status = service.corp_status(mbVo);
		if(corp_status == 2 ) {
			boolean flag1 = service.boardinsert(mbVo);
			boolean flag2 = service.mansearchinsert(mbVo);			
			
			if(flag1 && flag2) {
				msg = "정상적으로 저장되었습니다.";
			} else msg="저장중 오류 발생";
			
		}else if(corp_status !=2) {
			msg="마이페이지에서 기업 인증 후 작성 가능합니다.";	
		}
		return msg;
	}
	
	@RequestMapping("/mansearch/mansearch_updateR")
	public synchronized String updateR(@ModelAttribute MansearchBoardVo mbVo) {
		String msg="";
		try {
			boolean flag1 = service.boardupdate(mbVo);
			boolean flag2 = service.mansearchupdate(mbVo);			
			
			if(flag1 && flag2) {
				msg = "정상적으로 수정되었습니다.";
			} else msg="수정중 오류 발생";
	

		}catch(Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("/mansearch/mansearch_reviewR")
	public synchronized String reviewR(@ModelAttribute MansearchBoardVo mbVo) {	
		System.out.println("reviewR");
		String msg="";
		String certification = service.certification(mbVo);
		System.out.println("certification : " + certification);
		if(certification != null ) {
			boolean flag = service.reviewinsert(mbVo);			
			
			if(flag) {
				msg = "리뷰가 작성되었습니다. 다른 유저가 열람 시 200픽셀을 획득합니다.";
			} else msg="저장중 오류 발생";
			
		}else if(certification == null) {
			msg="경력인증 후 작성 가능합니다.";	
		}
		return msg;
	}
}
