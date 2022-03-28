package com.stationery.project.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.stationery.project.util.Pager;

public interface BoardDAO {
	

	
	//fileDelete
	public int fileDelete(BoardFileDTO boardFileDTO) throws Exception;
	
	//addFile
	public int addFile(BoardFileDTO boardFileDTO)throws Exception;
	
	// list
	public List<BoardDTO> list(Pager pager) throws Exception;

	// detail
	public BoardDTO detail(BoardDTO boardDTO) throws Exception;

	// add
	public int add(BoardDTO boardDTO) throws Exception;

	// total
	public Long total(Pager pager) throws Exception;
	
	//delete
	public int delete(BoardDTO boardDTO) throws Exception;
	
	//update
	public int update(BoardDTO boardDTO) throws Exception;
	
	//public int updateFile(BoardFileDTO boardFileDTO) throws Exception;
	

}
