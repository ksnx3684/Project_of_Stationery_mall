package com.stationery.project.board.notices;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.stationery.project.board.BoardDAO;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardFileDTO;
import com.stationery.project.util.Pager;

@Repository
public class NoticesDAO implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.board.notices.NoticesDAO.";
	
	public List<NoticesFileDTO> listFile(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listFile", boardDTO);
	}
	
	public NoticesFileDTO detailFile(NoticesFileDTO noticesFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailFile", noticesFileDTO);
	}
	
	//addFile
	public int addFile(BoardFileDTO boardFileDTO)throws Exception {
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);
	}
	
	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "list", pager);
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "detail", boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "add", boardDTO);
	}

	@Override
	public Long total(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "total", pager);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"delete", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"update", boardDTO);
	}
	
}
