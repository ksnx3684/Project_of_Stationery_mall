package com.stationery.project.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	@Autowired
	private ServletContext servletContext; //tomcat
	
	public String save(MultipartFile multipartFile,String path)throws Exception{
		String realPath = servletContext.getRealPath(path);
		File file= new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs(); 
		}
		
		String oriName=multipartFile.getOriginalFilename();
		String fileName=UUID.randomUUID().toString();
		fileName = fileName+"_"+oriName;
		
		file =new File(file,fileName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);

		
		return fileName;
	}
}
