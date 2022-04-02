package com.stationery.project.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.users.UsersDTO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.cart.CartDAO.";
	
//	public CartDTO view(UsersDTO usersDTO) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"view", usersDTO);
//	}
	
	public List<CartDTO> cartlist(UsersDTO usersDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"cartlist", usersDTO);
	}

	public int cartlistDelete(Long caNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"cartlistDelete", caNum);
	}
	
	public CartDTO cartOrder(Long cartNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"cartOrder", cartNum);
	}
}
