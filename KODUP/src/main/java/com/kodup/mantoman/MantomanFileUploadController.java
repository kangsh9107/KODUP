package com.kodup.mantoman;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
public class MantomanFileUploadController {
	static String path = "C:\\Users\\dkapq\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\upload\\";
	
	@Autowired
	MantomanService service;
	
	@RequestMapping("/updateTalk")
	public synchronized String updateTalk(MantomanVo mtmVo, @RequestParam("frmData") String frmData, 
			@RequestParam("last_talk") String last_talk, @RequestParam("roomCode") String roomCode) {
		
		System.out.println("실행됨");
		 
		String msg="";
		try {
			mtmVo.setDoc(frmData);
			mtmVo.setLast_talk(last_talk);
			mtmVo.setRoomCode(roomCode);
			
			// 본문을 저장
			boolean flag = service.updateTalk(mtmVo);
			System.out.println("flag : " + flag);
			
			
//			if(flag) {
//				for(MultipartFile m : mul) {
//					if(!m.isEmpty()) {
//						List<MantomanAttVo> attList = new ArrayList<MantomanAttVo>();
//						attList = fileupload(mul);
//						service.insertAttList(attList);
//					}
//				}
//			}else {
//				msg="fail";
//			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		//msg="확인";
		return msg;
	}
}
