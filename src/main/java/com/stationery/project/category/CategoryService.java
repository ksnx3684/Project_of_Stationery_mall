package com.stationery.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	public int delete(CategoryDTO categoryDTO)throws Exception{
		return categoryDAO.delete(categoryDTO);
	}
	
	public int addTopCategory(String categoryName)throws Exception{
		CategoryDTO	categoryDTO= new CategoryDTO();
		categoryDTO.setCategoryName(categoryName);
//		System.out.println("service:"+categoryDTO.getCategoryName());
		return categoryDAO.addTopCategory(categoryDTO);
	}
	
	public int addSubCategory(String categoryName)throws Exception{
		CategoryDTO	categoryDTO= new CategoryDTO();
		categoryDTO.setCategoryName(categoryName);
		return categoryDAO.addSubCategory(categoryDTO);
	}
	
	
	public List<CategoryDTO> catelist()throws Exception{
		return categoryDAO.catelist();
	}
	
	public List<CategoryDTO> allList()throws Exception{
		return categoryDAO.allList();
	}
}
