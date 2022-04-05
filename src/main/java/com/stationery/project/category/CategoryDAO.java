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
	
	public int delete(CategoryDTO categoryDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", categoryDTO);
	}
	
	public List<CategoryDTO> catelist()throws Exception{
		return sqlSession.selectList(NAMESPACE+"catelist");
	}
	
	public int addTopCategory(CategoryDTO categoryDTO)throws Exception{
		System.out.println("dao:"+categoryDTO.getCategoryName());
		return sqlSession.insert(NAMESPACE+"addTopCategory",categoryDTO);
	}
	
	public int addSubCategory(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"addSubCategory",categoryDTO);
	}
	
	public List<CategoryDTO> allList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"allList");
	}
}
