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
	
	

}
