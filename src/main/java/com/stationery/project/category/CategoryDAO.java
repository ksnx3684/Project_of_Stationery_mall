package com.stationery.project.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.stationery.project.category.CategoryDAO.";
	
	public List<CategoryDTO> catelist()throws Exception{
		return sqlSession.selectList(NAMESPACE+"catelist");
	}
	
	public int add(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"add",categoryDTO);
	}
}
