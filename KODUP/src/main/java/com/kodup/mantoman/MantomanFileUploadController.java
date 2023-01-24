package com.kodup.mantoman;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kodup.mypage.MypageVo;

@RestController
public class MantomanFileUploadController {
	static String path = "C:\\Users\\dkapq\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\mantoman_images\\";
	
	@Autowired
	MantomanService service;
	
	@RequestMapping("/updateTalk")
	public synchronized String updateTalk(  MantomanVo mtmVo, @RequestParam("frmData") String frmData, 
			@RequestParam("last_talk") String last_talk, @RequestParam("roomCode") String roomCode){
		
		String msg="";
		try {
			mtmVo.setDoc(frmData);
			mtmVo.setLast_talk(last_talk);
			mtmVo.setRoomCode(roomCode);
			
			// 본문을 저장
			boolean flag = service.updateTalk(mtmVo);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		//msg="확인";
		return msg;
	}
	
	@RequestMapping("/updateFile")
	public synchronized String updateTalk( @RequestParam("attFile") List<MultipartFile> mul, @ModelAttribute MantomanAttVo mtmAttVo){
		
		String sendImg="";
		try {
			for(MultipartFile m : mul) {
				if(!m.isEmpty()) {
					List<MantomanAttVo> attList = new ArrayList<MantomanAttVo>();
					attList = fileupload(mul);
					mtmAttVo.setSysFile(attList.get(0).getSysFile());
					service.updateFile(mtmAttVo);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		sendImg=mtmAttVo.getSysFile();
		return sendImg;
	}
	
	public List<MantomanAttVo> fileupload(List<MultipartFile> mul) throws Exception{
		List<MantomanAttVo> attList = new ArrayList<MantomanAttVo>();
		for(MultipartFile m : mul) {
			if(m.isEmpty()) continue;
			
			UUID uuid = UUID.randomUUID();
			String oriFile = m.getOriginalFilename();
			String sysFile = "";
			File temp = new File(path + oriFile);
			m.transferTo(temp);
			sysFile = (uuid.getLeastSignificantBits()*-1) + "-" + oriFile;
			File f = new File(path + sysFile);
			temp.renameTo(f);
			
			MantomanAttVo attVo = new MantomanAttVo();
			attVo.setSysFile(sysFile);
			attList.add(attVo);
		}
		return attList;
	}
}
