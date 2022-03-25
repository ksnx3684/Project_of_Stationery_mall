package com.stationery.project.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.stationery.project.util.Pager;



public interface BoardService {
		//list
		public List<BoardDTO> list(Pager pager) throws Exception;
		
		//detail
		public BoardDTO detail(BoardDTO boardDTO) throws Exception;
				
		//add
		public int add(BoardDTO boardDTO, MultipartFile [] files) throws Exception;
		
		//update
		public int update(BoardDTO boardDTO, MultipartFile [] files) throws Exception;
		
		//delete
		public int delete(BoardDTO boardDTO) throws Exception;
}
