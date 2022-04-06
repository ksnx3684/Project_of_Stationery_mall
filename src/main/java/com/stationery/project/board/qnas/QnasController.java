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
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.board.BoardDTO;
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
	
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnasService.allList(pager);
		mv.addObject("list",ar);
		mv.setViewName("board/list");
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
	public ModelAndView add(QnasDTO qnasDTO, @RequestParam(value="productNum") Integer productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(productNum);
		int result = qnasService.add(qnasDTO);
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
	public String qnaDelete(QnasDTO qnasDTO) throws Exception {
		int result = qnasService.qnaDelete(qnasDTO);
		return "redirect:./list";
	}
}
