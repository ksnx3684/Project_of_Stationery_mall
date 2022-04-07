package com.stationery.project.product;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
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

import com.stationery.project.cart.CartDTO;
import com.stationery.project.cart.CartService;
import com.stationery.project.category.CategoryDTO;
import com.stationery.project.category.CategoryService;
import com.stationery.project.users.UsersDTO;
import com.stationery.project.util.Pager;


@Controller
@RequestMapping(value = "/product/*")
public class ProductController {
	

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	// (add.jsp에 카테고리 출력위해 )
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("addCart")
	public ModelAndView addCart(CartDTO cartDTO,HttpSession httpSession)throws Exception{
		
		UsersDTO usersDTO=(UsersDTO) httpSession.getAttribute("auth");
		
		ModelAndView mv= new ModelAndView();
		int result=2;
		Loop1:
			//로그인했을경우 
		if(usersDTO!=null) {
			cartDTO.setId(usersDTO.getId());
			Loop2:
				//같은상품 같은옵션이 장바구니에 있다면 
			if(cartService.cartCk(cartDTO)!=null) {
				break Loop1;
			}
			result=productService.addCart(cartDTO);
		}else { //로그인안했을경우 
			result=3;
		}
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
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
		if(productDTO.getStock()==null) {
			int stock=0;
			for(int i=1;i<options.length;i+=2) {
				stock=stock+Integer.parseInt(options[i]);
			}
			productDTO.setStock(stock);
		}
		int result=productService.add(productDTO,files,t_files);
		int productNum=productDTO.getProductNum();
		if(options!=null) {
		productService.optionAdd(options,productNum);
		}
		return "redirect:./list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(ProductDTO productDTO,ModelAndView mv) throws Exception{
		productDTO=productService.detail(productDTO);
		List<OptionDTO> ar=productService.optionList(productDTO);
		mv.addObject("dto",productDTO);
		mv.addObject("option", ar);
		mv.setViewName("product/detail");
		
		return mv;
	}
	
	@RequestMapping(value = "delete",method = RequestMethod.GET)
	public String delete(ProductDTO productDTO) throws Exception{
		int result=productService.delete(productDTO);
		return "redirect:./list";
	}

	@GetMapping("update")
	public void update(Model model,ProductDTO productDTO,ArrayList<OptionDTO> optionDTO) throws Exception{
		
		productDTO=productService.detail(productDTO);
		optionDTO=productService.optionList(productDTO);
		List<CategoryDTO> ar=categoryService.allList();
		model.addAttribute("list",ar);
		model.addAttribute("dto",productDTO);
		model.addAttribute("options", optionDTO);
		
	}
	
	@PostMapping("update")
	public String update(ProductDTO productDTO,MultipartFile[] files,MultipartFile t_files,String[] options,String[] optionStock,String[] optionNum, Integer productStock)throws Exception{
		int result=productService.update(productDTO,files,t_files);
		int productNum=productDTO.getProductNum();
		
		
		if(options!=null) { //option추가한경우에만 
		productService.optionAdd(options, productNum);
		}
		
		//option 재고 추가 
		if(optionStock!=null) {
			productService.stockUpdate(optionStock,optionNum,productNum);
		}
		


		return "redirect:./list";
	}

}
