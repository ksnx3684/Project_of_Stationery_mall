package com.stationery.project.board.faq;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.board.BoardDAO;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

@Repository
public class FaqDAO{
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.board.faq.FaqDAO.";
	

	public List<FaqDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"list");
	}


	public FaqDTO detail(FaqDTO faqDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"detail", faqDTO);
	}


//	public int add(BoardDTO boardDTO) throws Exception {
//		return sqlSession.insert(NAMESPACE+"add", boardDTO);
//	}
//
//	public Long total(Pager pager) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"total", pager);
//	}

}
