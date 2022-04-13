package com.stationery.project.board.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.BoardFileDTO;
import com.stationery.project.util.Pager;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.stationery.project.board.review.ReviewDAO.";
	
	public int fileDelete(ReviewFileDTO reviewFileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"fileDelete", reviewFileDTO);
	}
	
	public List<ReviewFileDTO> listFile(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listFile", boardDTO);
	}
	
	public ReviewFileDTO detailFile(ReviewFileDTO reviewFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailFile", reviewFileDTO);
	}
	
	public int addFile(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);
	}
	
	public List<BoardDTO> allList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"allList", pager);
	}
	
	public List<BoardDTO> list(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", map);
	}

	public ReviewDTO detail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"detail", boardDTO);
	}

	public Long total(Integer productNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total", productNum);
	}
	
	public Long total2(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total2", pager);
	}
	
	public Long reviewTotal(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"reviewTotal", id);
	}
	
	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"detailList", boardDTO);
	}
	
	public int add(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}

	public int reviewUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"reviewUpdate", boardDTO);
	}

	public int reviewDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"reviewDelete", boardDTO);
	}
	
	public int orderProductNumDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"orderProductNumDetail", boardDTO);
	}
	
	public List<BoardDTO> myReviewList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"myReviewList", map);
	}
}
