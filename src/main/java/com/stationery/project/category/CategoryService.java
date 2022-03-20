package com.stationery.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	public List<CategoryDTO> catelist()throws Exception{
		return categoryDAO.catelist();
	}
}
