package com.kodup.mansearch;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kodup.board.PageVo;

@RestController
public class MansearchFileUploadController {
	static String path="C:\\Users\\p_yoh\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\images\\";
	
	@Autowired
	MansearchService service;
	
	public synchronized String insertR(@RequestParam("attFile")List<MultipartFile> mul,
						@ModelAttribute MansearchBoardVo mbVo, @ModelAttribute PageVo pVo ) {
		String msg="";
		
		try {
			boolean flag1 = service.boardinsert(mbVo);
			boolean flag2 = service.mansearchinsert(mbVo);
			if(flag1 && flag2) {
				msg = "정상적으로 저장되었습니다.";
				for(MultipartFile m : mul) {
					if(!m.isEmpty()) {
						List<MansearchAttVo> attList = new ArrayList<MansearchAttVo>();
						attList = fileUpload(mul);
						service.insertAttList(attList);
					}
				}
			}else msg="저장중 오류 발생";
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	public List<MansearchAttVo> fileUpload(List<MultipartFile> mul) throws Exception{
		List<MansearchAttVo> attList = new ArrayList<MansearchAttVo>();
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
			
			MansearchAttVo attVo = new MansearchAttVo();
			attVo.setOriFile(oriFile);
			attVo.setSysFile(sysFile);
			
			attList.add(attVo);
			System.out.println(m.getOriginalFilename());
			System.out.println(uuid.getLeastSignificantBits());
		}
		
		return attList;
	}
}
