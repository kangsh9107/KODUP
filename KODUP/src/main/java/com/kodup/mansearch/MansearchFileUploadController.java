package com.kodup.mansearch;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class MansearchFileUploadController {
	static String path="C:\\Users\\p_yoh\\git\\KODUP\\KODUP\\src\\main\\resources\\static\\images\\mansearch_images\\";
	
	MansearchBoardVo mbVo = new MansearchBoardVo();
	String corp_logo = ""; 

	@Autowired
	MansearchService service;
	
	@RequestMapping("/mansearch/mansearch_insertR")
	public synchronized String insertR(
			@ModelAttribute MansearchBoardVo mbVo, @ModelAttribute MansearchAttVo attVo	
			,@RequestParam("attFile")List<MultipartFile> mul ) {
		 
		String msg="";

		try {
			boolean flag1 = service.boardinsert(mbVo);
			boolean flag2 = service.mansearchinsert(mbVo);			
			
			System.out.println("id1 : " + mbVo.getId());
			if(flag1 && flag2) {
				msg = "정상적으로 저장되었습니다.";
				for(MultipartFile m : mul) {
					if(!m.isEmpty()) {
						corp_logo = fileUpload(mul);
						
						System.out.println("id2 : " + mbVo.getId());
					}
				}
			}else msg="저장중 오류 발생";
			mbVo.setCorp_logo(corp_logo);
			service.corpinsert(mbVo);
			System.out.println("corp_logo2 : " + mbVo.getCorp_logo());

		}catch(Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	public String fileUpload(List<MultipartFile> mul) throws Exception{

		for(MultipartFile m : mul) {
			if(m.isEmpty()) continue;
			UUID uuid = UUID.randomUUID();
			String orilogo = m.getOriginalFilename();
			File temp = new File(path + orilogo); 	// 임시저장 경로
			m.transferTo(temp);
			corp_logo =(uuid.getLeastSignificantBits()*-1) + "-" + orilogo;
			File f = new File(path + corp_logo);
			temp.renameTo(f);
		}
		
		return corp_logo;
	}
}
