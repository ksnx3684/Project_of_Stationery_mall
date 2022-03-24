package com.stationery.project.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardService;
import com.stationery.project.util.Pager;

@Service
public class FaqService{

	@Autowired
	private FaqDAO faqDAO;

	public List<BoardDTO> list(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		
		pager.makeNum(faqDAO.total(pager));
		
		return faqDAO.list(pager);
	}

	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.detail(boardDTO);
	}

	public int add(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.add(boardDTO);
	}

	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.update(boardDTO);
	}


	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.delete(boardDTO);
	}


}
