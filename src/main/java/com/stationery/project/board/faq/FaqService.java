package com.stationery.project.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardService;
import com.stationery.project.util.Pager;

@Service
public class FaqService implements BoardService {

	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<BoardDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.list();
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.detail(boardDTO);
	}

	//@Override
	public int add(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.add(boardDTO);
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

//	public List<BoardDTO> list() throws Exception {
//
//		return faqDAO.list();
//	}
//	
	
	

}
