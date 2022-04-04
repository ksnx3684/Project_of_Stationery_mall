package com.stationery.project.board.qnas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

@Service
public class QnasService {
	@Autowired
	private QnasDAO qnasDAO;
	
	public List<BoardDTO> list(Pager pager) throws Exception {
		pager.makeRow();
		
		pager.makeNum(qnasDAO.total(pager));
		
		return qnasDAO.list(pager);
	}
	
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detail(boardDTO);
	}
	
	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detailList(boardDTO);
	}
	

}
