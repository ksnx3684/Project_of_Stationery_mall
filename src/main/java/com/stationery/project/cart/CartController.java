package com.stationery.project.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stationery.project.users.UsersDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
//	@GetMapping("view")
//	public String view(Model model, HttpSession httpSession, CartDTO cartDTO) throws Exception {
//		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
//		CartDTO list = cartService.view(usersDTO);
//		model.addAttribute("view", list);
//		return "cart/view";
//	}
	
	@GetMapping("view")
	public void view(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		List<CartDTO> list = cartService.view(usersDTO);
		model.addAttribute("view", list);
	}
}
