package com.stationery.project.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProductFileManager {
	
	@Autowired
	private ServletContext servletContext; //tomcat
	
	public boolean remove(String path,String fileName)throws Exception{
		//file을 HDD에서 삭제 
		//필요한 정보 : 저장된 파일명, 저장된 폴더명 
		
		//1. 실제경로 받아오기 
		path = servletContext.getRealPath(path);
		//2.파일의정보를 담고있는 클래스 준비 
		File file = new File(path, fileName);
		//3.삭제 
		return file.delete(); // t/f return
		
	}
	
	public String save(MultipartFile multipartFile,String path)throws Exception{
		//HDD : realpath 폴더
		String realPath = servletContext.getRealPath(path);
		//file명 
		System.out.println(realPath);
	///Users/jyp/Desktop/workspace_sts3/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Stationery_Project/resources/upload/product/
		
		
		File file= new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs(); 
		}
		
		String oriName=multipartFile.getOriginalFilename();
		String fileName=UUID.randomUUID().toString();
		fileName = fileName+"_"+oriName;
		
		//file HDD에 저장 
		file =new File(file,fileName);//이 경로에 이 파일명 
		FileCopyUtils.copy(multipartFile.getBytes(), file);

		
		return fileName;
	}
}
