package com.stationery.project.product;

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

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.qnas.QnasService;
import com.stationery.project.category.CategoryDTO;
import com.stationery.project.category.CategoryService;
import com.stationery.project.util.Pager;
import com.stationery.project.util.ProductPager;

@Controller
@RequestMapping(value = "/product/*")
public class ProductController {

	@ModelAttribute("board")
	public String board() {
		return "product";
	}

	@Autowired
	private ProductService productService;
	@Autowired
	private QnasService qnasService;
	
	// (add.jsp에 카테고리 출력위해 )
	@Autowired
	private CategoryService categoryService;

	@PostMapping("updateThumbnail")
	public void updateThumbnail(ProductDTO productDTO) throws Exception {
		int result = productService.updateThumbnail(productDTO);
	}

	@PostMapping("fileDelete")
	public ModelAndView fileDelete(ProductFileDTO productFileDTO) throws Exception {
		// filenum 넘어옴
		ModelAndView mv = new ModelAndView();

		int result = productService.fileDelete(productFileDTO);

		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, ProductPager pager) throws Exception {
		List<CategoryDTO> ar1 = categoryService.catelist();
		List<ProductDTO> ar = productService.list(pager);
		mv.addObject("list", ar);
		mv.addObject("cateList", ar1);
		mv.setViewName("product/list");
		return mv;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void add(Model model) throws Exception {
		// category 받아와
		List<CategoryDTO> ar = categoryService.allList();
		model.addAttribute("list", ar);

	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ProductDTO productDTO, MultipartFile[] files, MultipartFile t_files) throws Exception {
		int result = productService.add(productDTO, files, t_files);
		System.out.println(result);
		return "redirect:./list";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(ProductDTO productDTO, ModelAndView mv, Pager pager) throws Exception {

		/* qna 파트 */
		/* 해당 상품의 문의만 가져오기 위해 productNum 같이 넘겨주기 */
		int productNum = productDTO.getProductNum();
		List<BoardDTO> qnasDTOs = qnasService.list(pager, productNum);
		 
		//상품 상세페이지
		productDTO = productService.detail(productDTO);
		mv.addObject("qnaDto", qnasDTOs);
		mv.addObject("dto", productDTO);
		mv.setViewName("product/detail");

		return mv;
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(ProductDTO productDTO) throws Exception {
		int result = productService.delete(productDTO);
		return "redirect:./list";
	}

	@GetMapping("update")
	public void update(ProductDTO productDTO, Model model) throws Exception {
		productDTO = productService.detail(productDTO);
		model.addAttribute("dto", productDTO);

	}

	@PostMapping("update")
	public String update(ProductDTO productDTO, MultipartFile[] files, MultipartFile t_files) throws Exception {
		int result = productService.update(productDTO, files, t_files);

		return "redirect:./list";
	}

}
