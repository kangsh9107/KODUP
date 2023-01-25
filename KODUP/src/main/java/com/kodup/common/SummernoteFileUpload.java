package com.kodup.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SummernoteFileUpload {
	
	@RequestMapping("/common/summernoteFileUpload")
	public void fileUpload(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String flag = "";
		if(req.getParameter("flag") != null) {
			flag = req.getParameter("flag");
		}
		UUID uuid = null;
		String tempDir = "c:/temp/";
		String uploadPath = "C:\\Users\\K\\Documents\\GitHub\\KODUP\\KODUP\\src\\main\\resources\\static\\images\\";
		ModelAndView mv = new ModelAndView();
		
		if(flag.equals("delete")) {
			String target = req.getParameter("target");
			String[] temp = target.split("/");
			String[] temp2 = temp[temp.length-1].substring(1).split("-");
			String del = "-" + temp2[0] + "-";
			
			File FileList = new File(uploadPath);
			String fileList[] = FileList.list(); //업로드 폴더의 전체 파일 가져옴
			for(int i=0; i<fileList.length; i++){
				String FileName = fileList[i];   //파일명 하나씩 확인
				if(FileName.contains(del)){      //파일명에 타겟 uuid가 포함되어 있으면 삭제
					File deleteFile = new File(uploadPath + FileName);
					deleteFile.delete();
				}
			}
		} else {
			Collection<Part> parts = req.getParts();
			for (Part p : parts) {
				if (p.getHeader("Content-Disposition").contains("filename=")) {

					if (p.getSize() > 0) {
						uuid = UUID.randomUUID();
						String temp = String.format("%s-%s", uuid.getLeastSignificantBits(), p.getSubmittedFileName());
						p.write(uploadPath + temp);
						p.delete();

						try {
							Thread.sleep(10);
							out.print("images/" + temp);
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				}
			}
		}
	}
	
}
