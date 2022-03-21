package com.stationery.project.users;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.users.UsersDAO.";
	
	public int join(UsersDTO usersDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"join", usersDTO);
	}
	
	public UsersDTO login(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"login", usersDTO);
	}
	
	public List<WishListDTO> wishlist(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"wishlist", usersDTO);
	}
	
	public UsersDTO mypage(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"mypage", usersDTO);
	}
	
	public int infochange(UsersDTO usersDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"infochange", usersDTO);
	}
	
	public int pwchange(UsersDTO usersDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"pwchange", usersDTO);
	}
}
