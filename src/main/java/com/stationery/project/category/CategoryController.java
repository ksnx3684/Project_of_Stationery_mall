package com.stationery.project.category;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/category/*")
public class CategoryController {
	

	
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("delete")
	public ModelAndView delete(CategoryDTO categoryDTO)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result=categoryService.delete(categoryDTO);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}

	@RequestMapping(value = "catelist", method = RequestMethod.GET)
	public ModelAndView catelist(ModelAndView mv)throws Exception{
		
		List<CategoryDTO> ar =categoryService.catelist();
		mv.addObject("list",ar);
		mv.setViewName("category/catelist");
		return mv;
		
	}
	
	@GetMapping("add")
	public void add(Model model)throws Exception{
		List<CategoryDTO> ar=categoryService.allList();
		model.addAttribute("list", ar);
	}
	
	

	
	@PostMapping("add")
	public String add(String[] categoryName)throws Exception{
	
		for(int i=0; i<categoryName.length;i++) {
			if(i==0) {
				categoryService.addTopCategory(categoryName[i]);
			}else {
				categoryService.addSubCategory(categoryName[i]);
			}
		}
	return "redirect:./catelist";
	}
}
