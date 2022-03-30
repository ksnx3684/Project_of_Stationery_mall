package com.stationery.project.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.cart.CartDTO;
import com.stationery.project.users.UsersDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public List<CartDTO> order(UsersDTO usersDTO) throws Exception {
		return orderDAO.order(usersDTO);
	}
	
}
