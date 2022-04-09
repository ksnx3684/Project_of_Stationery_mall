package com.stationery.project.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.FileManager;
import com.stationery.project.util.Pager;

@Service
public class ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
	
	public int fileDelete(ReviewFileDTO reviewFileDTO) throws Exception {
		// HDD에 파일 삭제 코드 작성
		return reviewDAO.fileDelete(reviewFileDTO);
	}
	
	public ReviewFileDTO detailFile(ReviewFileDTO reviewFileDTO) throws Exception {
		return reviewDAO.detailFile(reviewFileDTO);
	}
	
//	public List<BoardDTO> list(Pager pager) throws Exception {
//		pager.makeRow();
//		pager.makeNum(reviewDAO.total(pager));
//		return reviewDAO.list(pager);
//	}

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

	public int reviewUpdate(BoardDTO boardDTO) throws Exception {
		return reviewDAO.reviewUpdate(boardDTO);
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

	
}
