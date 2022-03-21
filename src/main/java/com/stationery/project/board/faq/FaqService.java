package com.stationery.project.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqService {
	
	@Autowired
	private FaqDAO faqDAO;
	
	public List<FaqDTO> list() throws Exception {
		return faqDAO.list();
	}
}
