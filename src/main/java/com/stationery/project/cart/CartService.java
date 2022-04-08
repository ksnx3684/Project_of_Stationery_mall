package com.stationery.project.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stationery.project.order.OrderDetailDTO;
import com.stationery.project.order.UsersOrderDTO;
import com.stationery.project.product.OptionDTO;
import com.stationery.project.product.ProductDTO;
import com.stationery.project.users.UsersDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> cartlist(UsersDTO usersDTO) throws Exception {
		return cartDAO.cartlist(usersDTO);
	}
	
	public OptionDTO cartoption(CartDTO cartDTO) throws Exception {
		return cartDAO.cartoption(cartDTO);
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
	
	public Integer optionstock(OptionDTO optionDTO) throws Exception {
		return cartDAO.optionstock(optionDTO);
	}
	
	public int stockUpdate(ProductDTO productDTO) throws Exception {
		return cartDAO.stockUpdate(productDTO);
	}
	
	public int optionstockUpdate(OptionDTO optionDTO) throws Exception {
		return cartDAO.optionstockUpdate(optionDTO);
	}
}
