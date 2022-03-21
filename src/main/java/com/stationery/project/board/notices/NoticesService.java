package com.stationery.project.board.notices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardService;
import com.stationery.project.util.FileManager;

@Service
public class NoticesService implements BoardService{
	
	@Autowired
	private NoticesDAO noticesDAO;
	@Autowired
	private FileManager fileManager;
	
	public NoticesFileDTO detailFile(NoticesFileDTO noticesFileDTO) throws Exception{
		return noticesDAO.detailFile(noticesFileDTO);
	}
	
	@Override
	public List<BoardDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return noticesDAO.list();
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticesDAO.detail(boardDTO);
	}

	//@Override
	public int add(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		int result=noticesDAO.add(boardDTO);
		//1. HDD에 저장
		for(int i=0;i<files.length;i++) {
			if(files[i].isEmpty()) {
			 //files[i].getSize()==0
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/notices/");
			System.out.println("file save");
		//2. DB에 저장
			NoticesFileDTO noticesFileDTO = new NoticesFileDTO();
			noticesFileDTO.setNum(boardDTO.getNum());
			noticesFileDTO.setFileName(fileName);
			noticesFileDTO.setOriName(files[i].getOriginalFilename());
			result = noticesDAO.addFile(noticesFileDTO);
		}
		
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
