package com.stationery.project.board.faq;

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
import com.stationery.project.util.Pager;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@ModelAttribute("board")
	public String board() {
		return "faq";
	}
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = faqService.list(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView detail(FaqDTO faqDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = faqService.detail(faqDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView add(FaqDTO faqDTO, MultipartFile [] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		//service에서 인터페이스로 받아서 사용하기 때문에 파라미터에는 들어가있지만
		//faq는 파일업로드 없으니 faqDTO만 매개변수로 넣어주기
		int result = faqService.add(faqDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	@GetMapping("add")
	public ModelAndView add()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		return mv;
	}
	
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public ModelAndView update(FaqDTO faqDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = faqService.update(faqDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(FaqDTO faqDTO, Model model)throws Exception{
		BoardDTO boardDTO = faqService.detail(faqDTO);
		model.addAttribute("dto", boardDTO);
		return "board/update";
	}
	
	@RequestMapping(value = "delete", method=RequestMethod.GET)
	public String delete(FaqDTO faqDTO)throws Exception{
		int result = faqService.delete(faqDTO);
		return "redirect:./list";
	}
	
	
}
