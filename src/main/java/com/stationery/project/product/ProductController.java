package com.stationery.project.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.util.Pager;

@Controller
@RequestMapping(value = "/product/*")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,Pager pager) throws Exception{
		List<ProductDTO> ar=productService.list(pager);
		mv.addObject("list",ar);
		mv.setViewName("product/list");
		return mv;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public void add(ProductDTO productDTO) throws Exception{
	productService.add(productDTO);

	}
	

}
