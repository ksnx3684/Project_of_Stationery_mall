package com.stationery.project.board.qnas;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.notices.NoticesFileDTO;
import com.stationery.project.util.FileManager;
import com.stationery.project.util.Pager;

@Service
public class QnasService {
	@Autowired
	private QnasDAO qnasDAO;
	@Autowired
	private FileManager fileManager;

	public int fileDelete(QnasFileDTO qnasFileDTO) throws Exception {
		qnasFileDTO = qnasDAO.detailFile(qnasFileDTO);
		int result = qnasDAO.fileDelete(qnasFileDTO);
		return result;
	}

	public QnasFileDTO detailFile(QnasFileDTO qnasFileDTO) throws Exception {
		return qnasDAO.detailFile(qnasFileDTO);
	}

	public List<BoardDTO> list(Pager pager, int productNum) throws Exception {
		/* pager와 productNum 같이 넘겨주기 위해 hasgMap 생성 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		pager.makeRow();
		pager.makeNum(qnasDAO.total(productNum));
		System.out.println("qnaTotal : "+qnasDAO.total(productNum));
		map.put("pager", pager);
		map.put("productNum", productNum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("productNum", productNum);

		return qnasDAO.list(map);
	}

	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detail(boardDTO);
	}

	public List<BoardDTO> detailList(BoardDTO boardDTO) throws Exception {
		return qnasDAO.detailList(boardDTO);
	}

	public List<BoardDTO> allList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(qnasDAO.total2(pager));
		return qnasDAO.allList(pager);
	}

	public int add(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		int result = qnasDAO.add(boardDTO);

		// 1. HDD에 저장
		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) {
				// files[i].getSize()==0
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/qnas/");
			// 2. DB에 저장
			QnasFileDTO qnasFileDTO = new QnasFileDTO();
			qnasFileDTO.setNum(boardDTO.getNum());
			qnasFileDTO.setFileName(fileName);
			qnasFileDTO.setOriName(files[i].getOriginalFilename());
			result = qnasDAO.addFile(qnasFileDTO);
		}

		return result;
	}

	public int qnaUpdate(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		// 수정 내용 먼저 update
		int result = qnasDAO.qnaUpdate(boardDTO);		
		
		// file update
		// 1. HDD에 저장
		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) {
			// files[i].getSize()==0
			continue;
		}
		String fileName = fileManager.save(files[i], "resources/upload/qnas/");
		System.out.println("file save");
		// 2. DB에 저장
		QnasFileDTO qnasFileDTO = new QnasFileDTO();
		qnasFileDTO.setNum(boardDTO.getNum());
		qnasFileDTO.setFileName(fileName);
		qnasFileDTO.setOriName(files[i].getOriginalFilename());
		result = qnasDAO.addFile(qnasFileDTO);
				}
		return result;
	}

	public int qnaDelete(BoardDTO boardDTO) throws Exception {
		List<QnasFileDTO> ar = qnasDAO.listFile(boardDTO);
		int result = qnasDAO.qnaDelete(boardDTO);
		
		if(result>0) {
			for(QnasFileDTO qnasFileDTO:ar) {
				boolean check = fileManager.remove("resources/upload/qnas/", qnasFileDTO.getFileName());
				System.out.println(check);
			}
		}
		return result;
	}

	public int reply(QnasDTO qnasDTO) throws Exception {
		// QnaDTO.num : 부모글의 번호
		// QnaDTO.title : 폼에서 입력한 제목
		// QnaDTO.writer : 폼에서 입력한 작성자
		// QnaDTO.contents : 폼에서 입력한 내용
		// QnaDTO.regDate : null
		// QnaDTO.hit : null
		// QnaDTO.ref : null
		// QnaDTO.step : null
		// QnaDTO.depth : null
		// 1. 부모글 조회(ref, step, depth)
		BoardDTO boardDTO = qnasDAO.detail(qnasDTO);
		QnasDTO parent = (QnasDTO) boardDTO;

		// 2. 답글의 ref는 부모의 ref값
		qnasDTO.setRef(parent.getRef());

		// 3. 답글의 step은 부모의 step+1
		qnasDTO.setStep(parent.getStep() + 1);

		// 4. 답글의 depth는 부모의 depth+1
		qnasDTO.setDepth(parent.getDepth() + 1);

		// 5. step update
		int result = qnasDAO.stepUpdate(parent);

		// 6. 답글 insert
		result = qnasDAO.reply(qnasDTO);


		return result;

}
}
