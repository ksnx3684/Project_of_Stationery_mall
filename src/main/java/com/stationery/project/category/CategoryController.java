package com.stationery.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/category/*")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "catelist", method = RequestMethod.GET)
	public ModelAndView catelist(ModelAndView mv)throws Exception{
		
		List<CategoryDTO> ar =categoryService.catelist();
		mv.addObject("list",ar);
		mv.setViewName("category/catelist");
		return mv;
		
	}
	
	
}
