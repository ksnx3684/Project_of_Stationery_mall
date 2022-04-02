package com.stationery.project.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.users.UsersDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
//	public CartDTO view(UsersDTO usersDTO) throws Exception {
//		return cartDAO.view(usersDTO);
//	}
	
	public List<CartDTO> cartlist(UsersDTO usersDTO) throws Exception {
		return cartDAO.cartlist(usersDTO);
	}
	
	public int cartlistDelete(Long caNum) throws Exception {
		return cartDAO.cartlistDelete(caNum);
	}
	
	public CartDTO cartOrder(Long cartNum) throws Exception {
		return cartDAO.cartOrder(cartNum);
	}
}
