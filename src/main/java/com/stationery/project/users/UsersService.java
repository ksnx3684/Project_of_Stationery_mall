package com.stationery.project.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.stationery.project.order.UsersOrderDTO;
import com.stationery.project.util.FileManager;

@Service
public class UsersService {
	
	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public int join(UsersDTO usersDTO, MultipartFile multipartFile) throws Exception {
		int result = usersDAO.join(usersDTO);
		
		// 파일을 HDD에 저장
		String fileName = fileManager.save(multipartFile, "resources/upload/users/");
		
		// 정보를 DB에 저장 (파일명)
		UsersFileDTO usersFileDTO = new UsersFileDTO();
		usersFileDTO.setId(usersDTO.getId());
		usersFileDTO.setFileName(fileName);
		usersFileDTO.setOriName(multipartFile.getOriginalFilename());
		usersDAO.joinFile(usersFileDTO);
		
		return result;
	}
	
	public UsersDTO login(UsersDTO usersDTO) throws Exception {
		return usersDAO.login(usersDTO);
	}
	
	public UsersDTO mypage(UsersDTO usersDTO) throws Exception {
		return usersDAO.mypage(usersDTO);
	}
	
	public int infochange(UsersDTO usersDTO) throws Exception {
		return usersDAO.infochange(usersDTO);
	}
	
	public int pwchange(UsersDTO usersDTO) throws Exception {
		return usersDAO.pwchange(usersDTO);
	}
	
	public UsersDTO withdrawal(UsersDTO usersDTO) throws Exception {
		return usersDAO.withdrawal(usersDTO);
	}
	
	public int withdrawalfinal(UsersDTO usersDTO) throws Exception {
		return usersDAO.withdrawalfinal(usersDTO);
	}

	public List<WishListDTO> wishlist(UsersDTO usersDTO) throws Exception {
		return usersDAO.wishlist(usersDTO);
	}
	
	public List<UsersOrderDTO> orderlist(UsersDTO usersDTO) throws Exception {
		return usersDAO.orderlist(usersDTO);
	}
}
