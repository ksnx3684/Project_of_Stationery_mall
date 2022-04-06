package com.stationery.project.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.order.OrderDetailDTO;
import com.stationery.project.order.UsersOrderDTO;
import com.stationery.project.product.ProductDTO;
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
	
	public int order(UsersOrderDTO usersOrderDTO) throws Exception {
		return cartDAO.order(usersOrderDTO);
	}
	
	public int orderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		return cartDAO.orderDetail(orderDetailDTO);
	}
	
	public int cartOrderDelete(Long cartNum) throws Exception {
		return cartDAO.cartOrderDelete(cartNum);
	}
	
	public Integer stock(Integer productNum) throws Exception {
		return cartDAO.stock(productNum);
	}
	
	public int stockUpdate(ProductDTO productDTO) throws Exception {
		return cartDAO.stockUpdate(productDTO);
	}
}
