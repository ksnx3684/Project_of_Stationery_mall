package com.stationery.project.faq;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stationery.project.MyJunitTest;
import com.stationery.project.board.faq.FaqDAO;
import com.stationery.project.board.faq.FaqDTO;

public class FaqDAOTest extends MyJunitTest{

	@Autowired
	private FaqDAO faqDAO;
	
	//@Test
	public void check() {
		assertNotNull(faqDAO);
	}

	//@Test
	public void listTest() throws Exception {
		List<FaqDTO> ar = faqDAO.list();
		assertNotEquals(0, ar.size());
	}
	
	@Test
	public void detailTest() throws Exception {
		FaqDTO faqDTO = new FaqDTO();
		faqDTO.setId("id1");
		faqDTO = faqDAO.detail(faqDTO);
	}
}
