package com.stationery.project.board.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.qnas.QnasFileDTO;
import com.stationery.project.util.FileManager;
import com.stationery.project.util.Pager;

@Service
public class ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
	
	public int fileDelete(ReviewFileDTO reviewFileDTO) throws Exception {
		reviewFileDTO = reviewDAO.detailFile(reviewFileDTO);
		int result = reviewDAO.fileDelete(reviewFileDTO);
		return result;
	}
	
	public ReviewFileDTO detailFile(ReviewFileDTO reviewFileDTO) throws Exception {
		return reviewDAO.detailFile(reviewFileDTO);
	}
	
	public List<BoardDTO> list(Pager pager, int productNum) throws Exception {
		/* pager와 productNum 같이 넘겨주기 위해 hasgMap 생성 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		pager.makeRow();
		pager.makeNum(reviewDAO.total(productNum));
		map.put("pager", pager);
		map.put("productNum", productNum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("productNum", productNum);

		return reviewDAO.list(map);
	}

	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		return reviewDAO.detail(boardDTO);
	}
	
	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return reviewDAO.detailList(boardDTO);
	}

	public List<BoardDTO> allList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(reviewDAO.total2(pager));
		return reviewDAO.allList(pager);
	}

	public int add(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		int result = reviewDAO.add(boardDTO);

		// 1. HDD에 저장
		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) {
				// files[i].getSize()==0
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/review/");
			// 2. DB에 저장
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setNum(boardDTO.getNum());
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setOriName(files[i].getOriginalFilename());
			result = reviewDAO.addFile(reviewFileDTO);
		}

		return result;
	}

	public int reviewUpdate(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		//수정내용 먼저 update
		int result = reviewDAO.reviewUpdate(boardDTO);
		
		// file update
		// 1. HDD에 저장
		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) {
			// files[i].getSize()==0
			continue;
		}
		String fileName = fileManager.save(files[i], "resources/upload/review/");
		System.out.println("file save");
		// 2. DB에 저장
		ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
		reviewFileDTO.setNum(boardDTO.getNum());
		reviewFileDTO.setFileName(fileName);
		reviewFileDTO.setOriName(files[i].getOriginalFilename());
		result = reviewDAO.addFile(reviewFileDTO);
		}
		
		return result;
	}

	public int reviewDelete(BoardDTO boardDTO) throws Exception {
		List<ReviewFileDTO> ar = reviewDAO.listFile(boardDTO);
		int result = reviewDAO.reviewDelete(boardDTO);
		
		if(result>0) {
			for(ReviewFileDTO reviewFileDTO:ar) {
				boolean check = fileManager.remove("resources/upload/review/", reviewFileDTO.getFileName());
				System.out.println(check);
			}
		}
		return result;
	}

	public int orderProductNumDetail(BoardDTO boardDTO) throws Exception {
		return reviewDAO.orderProductNumDetail(boardDTO);
	}
	
}
