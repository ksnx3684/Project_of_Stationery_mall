package com.stationery.project.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stationery.project.cart.CartDTO;
import com.stationery.project.users.UsersDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	// 장바구니에 담긴 상품들을 주문페이지로 불러오기
	@GetMapping("order")
	public void order(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		List<CartDTO> list = orderService.order(usersDTO);
		model.addAttribute("order",list);
	}
}
