package com.stationery.project.board.qnas;

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
import com.stationery.project.product.ProductDTO;
import com.stationery.project.util.Pager;

@Controller
@RequestMapping("/qnas/*")
public class QnasController {
	@Autowired
	private QnasService qnasService;

	@ModelAttribute("board")
	public String board() {
		return "qnas";
	}
	
	@PostMapping("fileDelete")
	public ModelAndView fileDelete(QnasFileDTO qnasFileDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(qnasFileDTO.getFileNum());
		int result = qnasService.fileDelete(qnasFileDTO);
		System.out.println(result);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}

	@PostMapping("qnaReply")
	public ModelAndView reply(QnasDTO qnasDTO, @RequestParam(value="productNum") Integer productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnasService.reply(qnasDTO);
		mv.setViewName("redirect:../product/detail?productNum="+productNum);
		
		return mv;
	}
	
	@GetMapping("qnaReply")
	public ModelAndView reply(QnasDTO qnasDTO, ModelAndView mv) throws Exception {
		BoardDTO boardDTO = qnasService.detail(qnasDTO);
		mv.addObject("dto",boardDTO); //부모글번호 넘겨주기 위해
		mv.setViewName("board/qnaReply");
		
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnasService.allList(pager);
		mv.addObject("list",ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("qnaDetailList")
	public ModelAndView qnaDetailList(Pager pager, QnasDTO qnasDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		/* qna 파트 */
		/* 해당 상품의 문의만 가져오기 위해 productNum 같이 넘겨주기 */
	//	BoardDTO boardDTO = qnasService.detail(qnasDTO);
		System.out.println("proNum"+qnasDTO.getProductNum());
		int productNum = qnasDTO.getProductNum();
		List<BoardDTO> qnasDTOs = qnasService.list(pager, productNum);
		
		mv.addObject("qnaDto", qnasDTOs);
		//mv.addObject("dto", productDTO);
		mv.setViewName("board/qnaDetailList");
		
		return mv;
	}
	
	@GetMapping("qnaDetail")
	public ModelAndView detail(QnasDTO qnasDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = qnasService.detail(qnasDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/qnaDetail");
		
		return mv;
	}
	
	@GetMapping("qnaAdd")
	public ModelAndView add() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/qnaAdd");
		return mv;
	}
	
	@PostMapping("qnaAdd")
	public ModelAndView add(QnasDTO qnasDTO, MultipartFile [] files, @RequestParam(value="productNum") Integer productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(productNum);
		int result = qnasService.add(qnasDTO, files);
		mv.setViewName("redirect:../product/detail?productNum="+productNum);
		
		return mv;
	}
	
	@GetMapping("qnaUpdate")
	public String qnaUpdate(QnasDTO qnasDTO, Model model) throws Exception {
		BoardDTO boardDTO = qnasService.detail(qnasDTO);
		model.addAttribute("dto",boardDTO);
		return "board/qnaUpdate";
		
	}
	
	@PostMapping("qnaUpdate")
	public ModelAndView qnaUpdate(QnasDTO qnasDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnasService.qnaUpdate(qnasDTO);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("qnaDelete")
	public String qnaDelete(QnasDTO qnasDTO, @RequestParam(value="productNum") Integer productNum) throws Exception {
		int result = qnasService.qnaDelete(qnasDTO);
		return "redirect:../product/detail?productNum="+productNum;
	}
}
