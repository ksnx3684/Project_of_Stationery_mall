package com.stationery.project.product;

import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stationery.project.util.FileManager;
import com.stationery.project.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private FileManager fileManager;

	public int updateThumbnail(ProductDTO productDTO) throws Exception {
		return productDAO.updateThumbnail(productDTO);
	}

	public int fileDelete(ProductFileDTO productFileDTO) throws Exception {
		return productDAO.fileDelete(productFileDTO);
	}

	public List<ProductDTO> list(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(productDAO.total(pager));
		List<ProductDTO> ar = productDAO.list(pager);
		return ar;
	}

	public int add(ProductDTO productDTO, MultipartFile[] files, MultipartFile t_files) throws Exception {
		// thumbnail 넣어줌 db에 insert하기 전에
		// 나중에 files[0].getOriginalFilename->

//		productDTO.setThumbnail(files[0].getOriginalFilename());
//		System.out.println(files[0].getOriginalFilename());

		int result = productDAO.add(productDTO); // productDTO에 시퀀스 들어가있

		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) { // file이 비어있으면 다시 위로 올라가서 다음꺼 실행
				// files[i].getSize()==0 //file 비어져있으면 저장 안되도록 하기 위함
				continue;
			}

			// 파일 반복문 돌려서 파일매니저save 메서드로 filename얻어
			String fileName = fileManager.save(files[i], "resources/upload/product/");

			// 파일 DTO 생성
			ProductFileDTO productFileDTO = new ProductFileDTO();
			// productNum은 add 실행 후 생성됨

			productFileDTO.setProductNum(productDTO.getProductNum());
			productFileDTO.setFileName(fileName);
			productFileDTO.setOriName(files[i].getOriginalFilename());
			productFileDTO.setThumbnailCheck(1);

			productDAO.addFile(productFileDTO);
		}

		String thumbnail = fileManager.save(t_files, "resources/upload/product/");
		ProductFileDTO productFileDTO = new ProductFileDTO();
		// productNum은 add 실행 후 생성됨

		productFileDTO.setProductNum(productDTO.getProductNum());
		productFileDTO.setFileName(thumbnail);
		productFileDTO.setOriName(t_files.getOriginalFilename());
		productFileDTO.setThumbnailCheck(0);

		productDAO.addFile(productFileDTO);
		productDTO.setThumbnail(thumbnail);
		// update?update query문에 썸네일 추가하면 update.jsp에서 file 추가안했을때 files null나와서 에러뜸
		int result2 = productDAO.updateThumbnail(productDTO);

		return result;
	}

	public ProductDTO detail(ProductDTO productDTO) throws Exception {
		return productDAO.detail(productDTO);
	}

	public int delete(ProductDTO productDTO) throws Exception {
		List<ProductFileDTO> ar = productDAO.listFile(productDTO);
		// ar에 파일명 들어있음
		int result = productDAO.delete(productDTO);

		// db에서 삭제 성공했으면 OS도움받아 삭제
		if (result > 0) {
//			for(int i=0;i<ar.size();i++) {
//				ar.get(i);
//			}
			// for(Collection에서 꺼낼타입명 변수명: Collection의변수명){}
			for (ProductFileDTO dto : ar) {
				// check가 true면 삭제 성공 false면 삭제 실패
				boolean check = fileManager.remove("resources/upload/product/", dto.getFileName());

			}
		}

		return result;
	}

	public int update(ProductDTO productDTO, MultipartFile[] files,MultipartFile t_files) throws Exception {


		int result = productDAO.update(productDTO); // productDTO에 시퀀스 들어가있

		for (int i = 0; i < files.length; i++) {
			if (files[i].isEmpty()) { // file이 비어있으면 다시 위로 올라가서 다음꺼 실행
				// files[i].getSize()==0 //file 비어져있으면 저장 안되도록 하기 위함
				continue;
			}

			String fileName = fileManager.save(files[i], "resources/upload/product/");

			ProductFileDTO productFileDTO = new ProductFileDTO();
			// productNum은 add 실행 후 생성됨
			productFileDTO.setProductNum(productDTO.getProductNum());
			productFileDTO.setFileName(fileName);
			productFileDTO.setOriName(files[i].getOriginalFilename());
			productFileDTO.setThumbnailCheck(1);
			productDAO.addFile(productFileDTO);
		}


		
		
		
		if (productDTO.getCheck() == 1) {//썸네일 수정했다면 
			String thumbnail = fileManager.save(t_files, "resources/upload/product/");
			ProductFileDTO productFileDTO = new ProductFileDTO();
			// productNum은 add 실행 후 생성됨

			productFileDTO.setProductNum(productDTO.getProductNum());
			productFileDTO.setFileName(thumbnail);
			productFileDTO.setOriName(t_files.getOriginalFilename());
			productFileDTO.setThumbnailCheck(0);

			productDAO.addFile(productFileDTO);
			productDTO.setThumbnail(thumbnail);
			int result2 = productDAO.updateThumbnail(productDTO);
		}

	
		return result;
	}
}
