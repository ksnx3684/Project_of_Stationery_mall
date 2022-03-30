package com.stationery.project.product;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// (add.jsp에 카테고리 출력위해 )
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("optionDelete")
	public ModelAndView optionDelete(OptionDTO optionDTO)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result =productService.optionDelete(optionDTO);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
	@PostMapping("updateThumbnail")
	public void updateThumbnail(ProductDTO productDTO)throws Exception{
		int result= productService.updateThumbnail(productDTO);
	}
	
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
		mv.addObject("cateList",ar1);
		mv.addObject("list",ar);
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
	public String add(ProductDTO productDTO,MultipartFile[] files,MultipartFile t_files,String[] options)throws Exception{
		int result=productService.add(productDTO,files,t_files);
		int productNum=productDTO.getProductNum();
		productService.optionAdd(options,productNum);

		return "redirect:./list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(ProductDTO productDTO,ModelAndView mv) throws Exception{
		productDTO=productService.detail(productDTO);
		List<OptionDTO> ar=productService.optionList(productDTO);
		mv.addObject("dto",productDTO);
		mv.addObject("option", ar);
		System.out.println(ar);
		mv.setViewName("product/detail");
		
		return mv;
	}
	
	@RequestMapping(value = "delete",method = RequestMethod.GET)
	public String delete(ProductDTO productDTO) throws Exception{
		int result=productService.delete(productDTO);
		return "redirect:./list";
	}

	@GetMapping("update")
	public void update(ProductDTO productDTO,Model model,ArrayList<OptionDTO> optionDTO) throws Exception{
		productDTO=productService.detail(productDTO);
		optionDTO=productService.optionList(productDTO);
		model.addAttribute("dto",productDTO);
		model.addAttribute("options", optionDTO);
		
	}
	
	@PostMapping("update")
	public String update(ProductDTO productDTO,MultipartFile[] files,MultipartFile t_files,String[] options)throws Exception{
		int result=productService.update(productDTO,files,t_files);
		int productNum=productDTO.getProductNum();
		productService.optionAdd(options, productNum);
		

		return "redirect:./list";
	}

}
