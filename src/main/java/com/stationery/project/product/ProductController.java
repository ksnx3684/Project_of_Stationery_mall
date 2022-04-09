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
import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.qnas.QnasService;


@Controller
@RequestMapping(value = "/product/*")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private QnasService qnasService;
	
	@Autowired
	private CartService cartService;
	
	// (add.jsp에 카테고리 출력위해 )
	@Autowired
	private CategoryService categoryService;

	
	
	@PostMapping("addCart")
	public ModelAndView addCart(CartDTO cartDTO,HttpSession httpSession)throws Exception{
		UsersDTO usersDTO=(UsersDTO) httpSession.getAttribute("auth");
		ModelAndView mv= new ModelAndView();
		int result=2; //기본값은 2
		Loop1: //1.로그인했을경우 
		if(usersDTO!=null) {
			cartDTO.setId(usersDTO.getId()); //cartDTO에 id 넣어 
			int pageCk=1; //listpage인지 detailpage인지 구별 
			//리스트페이지에서 옵션 있는 상품인경우 디테일페이지로 이동 디테일페이지에서 옵션있는 상품인경우 장바구니 추가 
			//페이지 구분을 어케하지 
			
			Loop2://1-1.같은상품 같은옵션이 장바구니에 있다면 2 (중단)
			if(cartService.cartCk(cartDTO)!=null) { 
				break Loop1; 
			}
			
			OptionDTO optionCk=productService.optionCk(cartDTO); 
			
			if(optionCk!=null) { // 옵션 있는경우
				if(cartDTO.getOptionNum()==0) { //옵션있는데 listpage에서 클릭한 경우 
					result=4;
				}else { //옵션있고 detailpage에서 클릭한 경우
					result=productService.addCart(cartDTO);
				}
				
				
				
			}else{ //옵션 없는경우 
				cartDTO.setProductCount((long)1);
				result=productService.addCart(cartDTO); //1-2.없다면 추가 1
			}
			
			
		}else { //2.로그인안했을경우 3
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
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,Pager pager) throws Exception{
		List<CategoryDTO> ar1=categoryService.catelist();
		List<CategoryDTO> ar2=categoryService.allList();
		List<ProductDTO> ar=productService.list(pager);
		
		mv.addObject("list",ar);
		mv.addObject("cateList",ar1);
		mv.addObject("allcatelist",ar2);
		mv.setViewName("product/list");
		return mv;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void add(Model model) throws Exception {
		// category 받아와
		List<CategoryDTO> ar = categoryService.allList();
		model.addAttribute("list", ar);

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

	public ModelAndView detail(ProductDTO productDTO,ModelAndView mv, Pager pager) throws Exception{
		/* qna 파트 */
		/* 해당 상품의 문의만 가져오기 위해 productNum 같이 넘겨주기 */
		int productNum = productDTO.getProductNum();
		List<BoardDTO> qnasDTOs = qnasService.list(pager, productNum);
		
		productDTO=productService.detail(productDTO);
		List<OptionDTO> ar=productService.optionList(productDTO);
		mv.addObject("qnaDto", qnasDTOs);
		mv.addObject("dto",productDTO);
		mv.addObject("option", ar);

		mv.setViewName("product/detail");

		return mv;
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(ProductDTO productDTO) throws Exception {
		int result = productService.delete(productDTO);
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
