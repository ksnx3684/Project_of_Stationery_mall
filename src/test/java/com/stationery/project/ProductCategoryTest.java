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
	private CategoryDAO categoryDAO;
	
	
	//@Test
	public void listTest() throws Exception {
		List<CategoryDTO> ar =categoryDAO.catelist();
		assertEquals(3, ar.size());
	}
	
	@Test
	public void add() throws Exception{
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setCategoryName("가방/지갑");
		categoryDTO.setCategoryNum(400);	
		categoryDTO.setParentId(null);
	
		int result= categoryDAO.add(categoryDTO);
		assertEquals(1, result);
	}

}
