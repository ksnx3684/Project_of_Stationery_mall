package com.stationery.project.board.qnas;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardFileDTO;
import com.stationery.project.util.Pager;

@Repository
public class QnasDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.stationery.project.board.qnas.QnasDAO.";
	
	public int fileDelete(QnasFileDTO qnasFileDTO) throws Exception{ 
		return sqlSession.delete(NAMESPACE+"fileDelete", qnasFileDTO);
	}
	
	public List<QnasFileDTO> listFile(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listFile", boardDTO);
	}
	
	public QnasFileDTO detailFile(QnasFileDTO qnasFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailFile", qnasFileDTO);
	}

	public int addFile(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);
	}
	
	
	public List<BoardDTO> allList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"allList", pager);
	}
	
	public List<BoardDTO> list(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", map);
	}

	public QnasDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"detail", boardDTO);
	}
	
	public Long total(Integer productNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total", productNum);
	}
	
	public Long total2(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total2", pager);
	}

	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"detailList", boardDTO);
	}
	
	public int add(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}
	
	public int reply(QnasDTO qnasDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"reply", qnasDTO);
	}
	
	public int stepUpdate(QnasDTO qnasDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"stepUpdate", qnasDTO);
	}
	
	public int qnaUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"qnaUpdate", boardDTO);
	}
	
	public int qnaDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"qnaDelete", boardDTO);
	}
}
