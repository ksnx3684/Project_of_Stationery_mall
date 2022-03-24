package com.stationery.project.board.notices;

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

import com.iu.s1.board.qna.QnaFileDTO;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

@Controller
@RequestMapping("/notices/*")
public class NoticesController {
	
	@Autowired
	private NoticesService noticesService;
	
	@ModelAttribute("board")
	public String board() {
		return "notices";
	}
	
	@PostMapping("fileDelete")
	public ModelAndView fileDelete(NoticesFileDTO noticesFileDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(noticesFileDTO.getFileNum());
		int result = noticesService.fileDelete(noticesFileDTO);
		System.out.println(result);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result",result);
		return mv;
	}
	
	
	@RequestMapping(value = "fileDown", method=RequestMethod.GET)
	public ModelAndView fileDown(NoticesFileDTO noticesFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticesFileDTO = noticesService.detailFile(noticesFileDTO);
		
		mv.setViewName("fileDown");
		mv.addObject("file", noticesFileDTO);
		
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = noticesService.list(pager);
		mv.addObject("list",ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView detail(NoticesDTO noticesDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticesService.detail(noticesDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
		
	}
	
	
	@RequestMapping(value = "add", method=RequestMethod.POST)
	public ModelAndView add(NoticesDTO noticesDTO, MultipartFile [] files)throws Exception{
		System.out.println("add post");
		ModelAndView mv = new ModelAndView();
		int result = noticesService.add(noticesDTO, files);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	@RequestMapping(value = "add", method=RequestMethod.GET)
	public ModelAndView add()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		return mv;
	}
	
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public ModelAndView update(NoticesDTO noticesDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticesService.update(noticesDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(NoticesDTO noticesDTO, Model model)throws Exception{
		BoardDTO boardDTO = noticesService.detail(noticesDTO);
		model.addAttribute("dto", boardDTO);
		return "board/update";
	}
	
	@RequestMapping(value = "delete", method=RequestMethod.GET)
	public ModelAndView delete(NoticesDTO noticesDTO)throws Exception{
		int result = noticesService.delete(noticesDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./list");
		return mv;
	}
}
