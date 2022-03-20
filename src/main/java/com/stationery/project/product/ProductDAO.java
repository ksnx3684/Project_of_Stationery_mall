package com.stationery.project.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.util.Pager;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.stationery.project.product.ProductDAO.";

	
	public List<ProductDTO> list(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list",pager);
	}
	
	public int add(ProductDTO productDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add",productDTO);
	}
}
