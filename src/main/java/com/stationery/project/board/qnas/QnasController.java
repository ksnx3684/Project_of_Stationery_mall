package com.stationery.project.board.qnas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("detail")
	public ModelAndView detail(QnasDTO qnasDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = qnasService.detail(qnasDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView add() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		return mv;
	}
	
	public ModelAndView add(QnasDTO qnasDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnasService.add(qnasDTO);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
}
