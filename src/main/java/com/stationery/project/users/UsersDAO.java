package com.stationery.project.users;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.order.UsersOrderDTO;

@Repository
public class UsersDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.users.UsersDAO.";
	
	public WishListDTO wishlistCk(WishListDTO wishListDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"wishlistCk",wishListDTO);
	}
	
	public int deleteWishList(WishListDTO wishListDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteWishList",wishListDTO);
		
	}
	
	public int addWishList(WishListDTO wishListDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addWishList", wishListDTO);
	}
	
	public int join(UsersDTO usersDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"join", usersDTO);
	}
	
	public int joinFile(UsersFileDTO usersFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"joinFile", usersFileDTO);
	}
	
	public UsersDTO login(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"login", usersDTO);
	}
	
	public UsersDTO mypage(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"mypage", usersDTO);
	}
	
	public int infochange(UsersDTO usersDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"infochange", usersDTO);
	}
	public int infochangeFile(UsersFileDTO usersFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"infochangeFile", usersFileDTO);
	}
	
	public int fileDelete(UsersDTO usersDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"fileDelete", usersDTO);
	}
	
	public int pwchange(UsersDTO usersDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"pwchange", usersDTO);
	}
	
	public UsersDTO withdrawal(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"withdrawal", usersDTO);
	}
	
	public int withdrawalfinal(UsersDTO usersDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"withdrawalfinal", usersDTO);
	}

	public List<WishListDTO> wishlist(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"wishlist", usersDTO);
	}
	
	public List<UsersOrderDTO> orderlist(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"orderlist", usersDTO);
	}
	
	public List<UsersDTO> usersList(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"usersList", usersDTO);
	}
	
	public List<UsersOrderDTO> usersOrderList(UsersOrderDTO usersOrderDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"usersOrderList", usersOrderDTO);
	}
}
