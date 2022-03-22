package com.stationery.project.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.stationery.project.file.FileDTO;

public class FileDown extends AbstractView{

	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		FileDTO fileDTO = (FileDTO)model.get("file");
		
		//바로 product 작성함 
		String path= "/resources/upload/product/";
		
		ServletContext sc =request.getSession().getServletContext();
		
		path = sc.getRealPath(path);
		File file = new File(path,fileDTO.getFileName());
		
		System.out.println(file.exists());
		System.out.println(file.isFile());
		
		//Encoding 처리 
		response.setCharacterEncoding("UTF-8");
		
		//총 파일의 크기 계산
		response.setContentLength((int)file.length());
		
		//다운로드시 파일의 이름을 인코딩 
		String fileName=URLEncoder.encode(fileDTO.getOriName(),"UTF-8");
		
		//Header 설정
		response.setHeader("Content-Disposition","attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//HDD에서 파일을 읽어서 Clinet로 전송 연결 준비 
		FileInputStream f1 = new FileInputStream(file); //읽을 준비 
		OutputStream os = response.getOutputStream(); // 응답으로 내보낼 준비 
		
		//최종 전송 
		FileCopyUtils.copy(f1, os);
		
		//연결 끊기
		os.close();
		f1.close();
		
		
	}
}
