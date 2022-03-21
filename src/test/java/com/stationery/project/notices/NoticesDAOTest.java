package com.stationery.project.notices;

import static org.junit.Assert.*;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stationery.project.MyJunitTest;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.notices.NoticesDAO;

public class NoticesDAOTest extends MyJunitTest{

	@Autowired
	private NoticesDAO noticesDAO;
	

	
	//@Test
	public void check() {
		assertNotNull(noticesDAO);
	}

	//@Test
	public void listTest() throws Exception {
		List<BoardDTO> ar = noticesDAO.list();
		assertNotEquals(0, ar.size());
	}
	
	//@Test
//	public void detailTest() throws Exception {
//		FaqDTO faqDTO = new FaqDTO();
//		faqDTO.setId("id1");
//		faqDTO = faqDAO.detail(faqDTO);
//	}
	
	//@Test
	public void addTest() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId("id1");
		boardDTO.setTitle("title2");
		boardDTO.setContents("contents2");
		int result =noticesDAO.add(boardDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void updateTest() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(21L);
		boardDTO.setTitle("title3");
		boardDTO.setContents("contents3");
		int result = noticesDAO.update(boardDTO);
		assertEquals(1, result);
	}
	
	@Test
	public void deleteTest() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(21L);
		int result = noticesDAO.delete(boardDTO);
		assertEquals(1, result);
	}

}
