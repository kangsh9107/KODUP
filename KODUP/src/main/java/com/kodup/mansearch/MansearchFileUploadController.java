package com.kodup.mansearch;

import java.util.List;

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
		
		return msg;
	}
}
