package com.stationery.project.users;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private ServletContext servletContext;
	
	public int deleteWishList(WishListDTO wishListDTO)throws Exception{
		return usersDAO.deleteWishList(wishListDTO);
	}
	
	public int addWishList(WishListDTO wishListDTO)throws Exception{
		return usersDAO.addWishList(wishListDTO);
	}
	
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
	
	public int infochange(UsersDTO usersDTO, MultipartFile multipartFile) throws Exception {
		int result = usersDAO.infochange(usersDTO);
		
		if(multipartFile != null) {
			// 파일을 HDD에 저장
			String fileName = fileManager.save(multipartFile, "resources/upload/users/");
			
			// 정보를 DB에 저장 (파일명)
			UsersFileDTO usersFileDTO = new UsersFileDTO();
			usersFileDTO.setId(usersDTO.getId());
			usersFileDTO.setFileName(fileName);
			usersFileDTO.setOriName(multipartFile.getOriginalFilename());
			usersDAO.infochangeFile(usersFileDTO);
		}
		return result;
	}
	
	public int fileDelete(UsersDTO usersDTO, HttpSession httpSession) throws Exception {
//		fileManager.remove("resources/upload/users/", usersFileDTO.getFileName());
//		usersFileDTO = usersDAO.mypage(usersDTO);
//		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();
//		String realPath = servletContext.getRealPath("resources/upload/users/");
//		System.out.println(realPath);
//		System.out.println(rootPath);
//		System.out.println(usersFileDTO.getOriName()); // why null??
//		File file = new File(realPath, "c3f8a061-953f-4220-ae72-0a6a5fcfba72_bom.jpg");
//		file.delete();
		
//		String path = servletContext.getRealPath("resources/upload/users/");
//		String fileName = usersDTO.getUsersFileDTO().getOriName();
//		
//		File deleteFile = new File(path + fileName);
//		boolean result = deleteFile.delete();
//		
////		return usersDAO.fileDelete(usersFileDTO);
//		usersDAO.fileDelete(usersFileDTO);
		
		usersDTO = (UsersDTO)httpSession.getAttribute("mychange");
		System.out.println(usersDTO.getUsersFileDTO().getFileName());
		String name = usersDTO.getUsersFileDTO().getFileName();
		
//		usersDTO = usersDAO.mypage(usersDTO);
		int result = usersDAO.fileDelete(usersDTO);
		
		if(result > 0) {
			// check가 true면 성공, false면 실패
			boolean check = fileManager.remove("resources/upload/users/", name);
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		
		return result;
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
	
	public List<UsersDTO> usersList(UsersDTO usersDTO) throws Exception {
		return usersDAO.usersList(usersDTO);
	}
	
	public List<UsersOrderDTO> usersOrderList(UsersOrderDTO usersOrderDTO) throws Exception {
		return usersDAO.usersOrderList(usersOrderDTO);
	}
}
