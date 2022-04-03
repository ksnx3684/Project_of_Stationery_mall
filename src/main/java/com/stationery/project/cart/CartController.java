package com.stationery.project.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stationery.project.order.OrderDetailDTO;
import com.stationery.project.order.UsersOrderDTO;
import com.stationery.project.users.UsersController;
import com.stationery.project.users.UsersDTO;
import com.stationery.project.users.UsersService;


@Controller
@RequestMapping("/cart/*")
public class CartController extends UsersController{ // UsersController에서 생성한 세션을 불러오려면 상속을 받아야한다

	@Autowired
	private CartService cartService;
	
	@Autowired
	private UsersService usersService;
	
	List<CartDTO> lists = new ArrayList<CartDTO>();
	
//	@GetMapping("view")
//	public String view(Model model, HttpSession httpSession, CartDTO cartDTO) throws Exception {
//		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
//		CartDTO list = cartService.view(usersDTO);
//		model.addAttribute("view", list);
//		return "cart/view";
//	}
	
	// 장바구니 보기 (카트 목록 불러오기)
	@GetMapping("cartlist")
	public void cartlist(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		List<CartDTO> list = cartService.cartlist(usersDTO);
		model.addAttribute("cartlist", list);
	}
	
	// 장바구니에서 선택 상품 제거
	@PostMapping("cartlistDelete")
	@ResponseBody
	public void cartlistDelete(HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView();
		String[] cartNum = request.getParameterValues("checkbox");
		List<String> cart = Arrays.asList(cartNum);
		
			int size = 1;
			size = cart.size();
			
			for(int i = 0; i < size; i++) {
				Long caNum = Long.parseLong(cart.get(i));
				int result = cartService.cartlistDelete(caNum);
			}
			
//		mv.addObject("result", result);
//		
//		mv.setViewName("cartlistDelete");
//
//		return mv;
	}
	
	// 장바구니에서 주문 폼으로 보내주기
	@PostMapping("cartlist")
	public String cartOrder(String[] cartNum) throws Exception {

		int size = 1;
		size = cartNum.length;
		lists.clear(); // 초기화
		
		for(int i = 0; i < size; i++) {
			Long result = Long.parseLong(cartNum[i]);
			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
		}
		
//		httpSession.setAttribute("order", lists);
//				
//		Long result = Long.parseLong(cartNum[0]);
//		
//		CartDTO list = cartService.cartOrder(result);
//
//		httpSession.setAttribute("order", list);
		
		return "redirect:./order";
	}
	
	// 주문 폼으로 가기
	@GetMapping("order")
	public void order(Model model, HttpSession httpSession) throws Exception {
	
		//usersDTO = usersService.mypage(usersDTO);	
		
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		
		usersDTO = usersService.mypage(usersDTO);
		
		model.addAttribute("order", lists);
		model.addAttribute("myinfo", usersDTO);
	}
	
	// 주문 정보 DB에 전송
	@PostMapping("order")
	public String order(UsersOrderDTO usersOrderDTO) throws Exception {
		
		cartService.order(usersOrderDTO);
		
		return "redirect:./orderComplete";
	}
}
