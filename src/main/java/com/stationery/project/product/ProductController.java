package com.stationery.project.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value = "add",method = RequestMethod.GET)
	public void add() throws Exception{
	}
	
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String add(ProductDTO productDTO,MultipartFile photo)throws Exception{
		productService.add(productDTO,photo);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(ProductDTO productDTO,ModelAndView mv) throws Exception{
		productDTO=productService.detail(productDTO);
		mv.addObject("dto",productDTO);
		mv.setViewName("product/detail");
		
		return mv;
	}
	
	@RequestMapping(value = "delete",method = RequestMethod.GET)
	public String delete(ProductDTO productDTO) throws Exception{
		int result=productService.delete(productDTO);
		return "product/list";
	}

	@GetMapping("update")
	public void update(ProductDTO productDTO,Model model) throws Exception{
		productDTO=productService.detail(productDTO);
		model.addAttribute("dto",productDTO);
		
	}
	
	@PostMapping("update")
	public String update(ProductDTO productDTO)throws Exception{
		int result=productService.update(productDTO);
		return "redirect:./list";
	}

}
