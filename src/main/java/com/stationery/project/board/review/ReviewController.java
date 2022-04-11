package com.stationery.project.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@ModelAttribute("board")
	public String board() {
		return "review";
	}
	
	@PostMapping("fileDelete")
	public ModelAndView fileDelete(ReviewFileDTO reviewFileDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(reviewFileDTO.getFileNum());
		int result = reviewService.fileDelete(reviewFileDTO);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = reviewService.allList(pager);
		mv.addObject("list",ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("reviewDetailList")
	public ModelAndView reviewDetailList(Pager pager, ReviewDTO reviewDTO, @RequestParam(value="productNum") Integer productNum) throws Exception {
		/* review 파트 */
		ModelAndView mv = new ModelAndView();
	
		List<BoardDTO> qnasDTOs = reviewService.list(pager, productNum);
		
		mv.addObject("reviewDto", qnasDTOs);
		//mv.addObject("dto", productDTO);
		mv.setViewName("board/reviewDetailList");
		
		return mv;
	}
	
	@GetMapping("reviewDetail")
	public ModelAndView detail(ReviewDTO reviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = reviewService.detail(reviewDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/reviewDetail");
		
		return mv;
	}
	
	@GetMapping("reviewAdd")
	public ModelAndView add() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/reviewAdd");
		return mv;
	}
	
	@PostMapping("reviewAdd")
	public ModelAndView add(ReviewDTO reviewDTO, MultipartFile [] files, @RequestParam(value="productNum") Integer productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.add(reviewDTO, files);
		mv.setViewName("redirect:../product/detail?productNum="+productNum);
		
		return mv;
	}
	
	@GetMapping("reviewUpdate")
	public String reviewUpdate(ReviewDTO reviewDTO, Model model) throws Exception {
		BoardDTO boardDTO = reviewService.detail(reviewDTO);
		model.addAttribute("dto",boardDTO);
		return "board/reviewUpdate";
		
	}
	
	@PostMapping("reviewUpdate")
	public ModelAndView reviewUpdate(ReviewDTO reviewDTO, @RequestParam(value="productNum") Integer productNum, MultipartFile [] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.reviewUpdate(reviewDTO, files);
		mv.setViewName("redirect:../product/detail?productNum="+productNum);
		
		return mv;
	}
	
	@GetMapping("reviewDelete")
	public String reviewDelete(ReviewDTO reviewDTO, @RequestParam(value="productNum") Integer productNum) throws Exception {
		int result = reviewService.reviewDelete(reviewDTO);
		return "redirect:../product/detail?productNum="+productNum;
	}
	
	
	
}
