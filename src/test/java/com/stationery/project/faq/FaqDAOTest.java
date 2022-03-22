package com.stationery.project.faq;

import static org.junit.Assert.*;

import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.lf5.util.DateFormatManager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stationery.project.MyJunitTest;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.faq.FaqDAO;
import com.stationery.project.board.faq.FaqDTO;
import com.stationery.project.board.notices.NoticesDTO;

public class FaqDAOTest extends MyJunitTest{

	@Autowired
	private FaqDAO faqDAO;
	@Autowired
	private DataSource dataSource;
	
	
	//@Test
	public void dataSourceTest() throws Exception{
		assertNotNull(dataSource.getConnection());
	}
	
	//@Test
	public void check() {
		assertNotNull(faqDAO);
	}

	//@Test
	public void listTest() throws Exception {
		//List<BoardDTO> ar = faqDAO.list();
		//assertNotEquals(0, ar.size());
	}
	
	//@Test
//	public void detailTest() throws Exception {
//		FaqDTO faqDTO = new FaqDTO();
//		faqDTO.setId("id1");
//		faqDTO = faqDAO.detail(faqDTO);
//	}
	
	//@Test
//	public void addTest() throws Exception {
//		BoardDTO boardDTO = new BoardDTO();
//		boardDTO.setId("id1");
//		boardDTO.setTitle("t2");
//		boardDTO.setContents("c1");
//		int result =faqDAO.add(boardDTO);
//		assertEquals(1, result);
//	}
	
	//@Test
	public void updateTest() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(41L);
		boardDTO.setTitle("title2");
		boardDTO.setContents("contents2");
		int result = faqDAO.update(boardDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void deleteTest() throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(41L);
		int result = faqDAO.delete(boardDTO);
		assertEquals(1, result);
	}
	
	@Test
	public void addTest() throws Exception {
		for(int i=0;i<100;i++) {
			FaqDTO faqDTO = new FaqDTO();
			faqDTO.setId("id1");
			faqDTO.setTitle("title"+i);
			faqDTO.setContents("Contents"+i);
			

			int result = faqDAO.add(faqDTO);
			
			if(i%10 == 0)
				Thread.sleep(1000); //1초동안 멈추기
		}
		System.out.println("Insert Finish");
		//assertEquals(1, result);
	}
}
