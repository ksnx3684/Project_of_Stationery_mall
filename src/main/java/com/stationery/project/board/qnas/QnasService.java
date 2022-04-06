package com.stationery.project.board.qnas;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

@Service
public class QnasService {
	@Autowired
	private QnasDAO qnasDAO;
	
	public List<BoardDTO> list(Pager pager, int productNum) throws Exception {
		/* pager와 productNum 같이 넘겨주기 위해 hasgMap 생성 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		pager.makeRow();
		pager.makeNum(qnasDAO.total(pager));
		map.put("pager", pager);
		map.put("productNum", productNum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("productNum", productNum);
		
		return qnasDAO.list(map);
	}
	
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detail(boardDTO);
	}
	
	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detailList(boardDTO);
	}
	
	public List<BoardDTO> allList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(qnasDAO.total(pager));
		return qnasDAO.allList(pager);
	}
	
	public int add(BoardDTO boardDTO) throws Exception {
		int result = qnasDAO.add(boardDTO);
		
		return result;
	}
	
	public int qnaUpdate(BoardDTO boardDTO) throws Exception {
		return qnasDAO.qnaUpdate(boardDTO);
	}
	
	public int qnaDelete(BoardDTO boardDTO) throws Exception {
		return qnasDAO.qnaDelete(boardDTO);
	}

}
