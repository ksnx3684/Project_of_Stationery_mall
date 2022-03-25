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

import com.stationery.project.category.CategoryDTO;
import com.stationery.project.category.CategoryService;
import com.stationery.project.util.Pager;

@Controller
@RequestMapping(value = "/product/*")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	//안될시 삭제 (add.jsp에 카테고리 출력위해 )
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("fileDelete")
	public ModelAndView fileDelete(ProductFileDTO productFileDTO)throws Exception{
		//filenum 넘어옴 
		ModelAndView mv= new ModelAndView();

		int result = productService.fileDelete(productFileDTO);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,Pager pager) throws Exception{
		List<CategoryDTO> ar1=categoryService.catelist();
		List<ProductDTO> ar=productService.list(pager);
		mv.addObject("list",ar);
		mv.addObject("cateList",ar1);
		mv.setViewName("product/list");
		return mv;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.GET)
	public void add(Model model) throws Exception{
		//category 받아와 
		List<CategoryDTO> ar=categoryService.allList();
		model.addAttribute("list",ar);
	
		
	}
	
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String add(ProductDTO productDTO,MultipartFile[] files)throws Exception{
		int result=productService.add(productDTO,files);
		System.out.println(result);
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
		return "redirect:./list";
	}

	@GetMapping("update")
	public void update(ProductDTO productDTO,Model model) throws Exception{
		productDTO=productService.detail(productDTO);
		model.addAttribute("dto",productDTO);
		
	}
	
	@PostMapping("update")
	public String update(ProductDTO productDTO,MultipartFile[] files)throws Exception{
		int result=productService.update(productDTO,files);

		return "redirect:./list";
	}

}