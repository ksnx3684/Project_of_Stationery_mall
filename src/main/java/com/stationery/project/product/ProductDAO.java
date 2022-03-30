package com.stationery.project.product;

import java.util.ArrayList;
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

	public int optionDelete(OptionDTO optionDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"optionDelete",optionDTO);
	}
	
	public int optionAdd(OptionDTO optionDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"optionAdd", optionDTO);
	}
	
	public List<OptionDTO> optionList(ProductDTO productDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"optionList",productDTO);
	}
	
	
	public int updateThumbnail(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateThumbnail", productDTO);
	}
	
	public List<ProductFileDTO> listFile(ProductDTO productDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listFile",productDTO);
	}

	
	public int fileDelete(ProductFileDTO productFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"fileDelete",productFileDTO);
	}
	
	
	
	public int addFile(ProductFileDTO productFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"addFile",productFileDTO);
	}
	
	public List<ProductDTO> list(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list",pager);
	}
	public Long total(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"total", pager);
	}
	
	public ProductDTO detail(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detail",productDTO);
	}
	
	public int add(ProductDTO productDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add",productDTO);
	}
	
	public int delete(ProductDTO productDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete",productDTO);
	}
	
	public int update(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", productDTO);
	}
}
