package com.stationery.project;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.category.CategoryDAO;
import com.stationery.project.category.CategoryDTO;

@Repository
public class ProductCategoryTest extends MyJunitTest{

	
	
	@Autowired
	private CategoryDAO productCategoryDAO;
	
	
	//@Test
	public void listTest() throws Exception {
		List<CategoryDTO> ar =productCategoryDAO.catelist();
		assertEquals(3, ar.size());
	}
	
	//@Test
	public void add() throws Exception{
		CategoryDTO productCategoryDTO = new CategoryDTO();
		productCategoryDTO.setCategoryName("가방/지갑");
		productCategoryDTO.setCategoryNum(400);
		productCategoryDTO.setParentId(null);
	
		int result= productCategoryDAO.add(productCategoryDTO);
		assertEquals(1, result);
	}

}
