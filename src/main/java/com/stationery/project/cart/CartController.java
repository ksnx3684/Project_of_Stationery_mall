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
import com.stationery.project.product.OptionDTO;
import com.stationery.project.product.ProductDTO;
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
	
	List<CartDTO> lists = new ArrayList<CartDTO>(); // 카트에 담을 수 있는 전역변수 lists
	List<String> optionlists = new ArrayList<String>(); // 옵션이름을 담을 수 있는 전역변수 optionlists
	int totalsize = 0;
	
	
	// 장바구니 보기 (카트 목록 불러오기)
	@GetMapping("cartlist")
	public void cartlist(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		List<CartDTO> list = cartService.cartlist(usersDTO);
		List<OptionDTO> optionlist = new ArrayList<OptionDTO>();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getOptionNum() == null) {
				optionlist.add(i, null);
			} else {
				optionlist.add(i, cartService.cartoption(list.get(i)));
			}
		}
		
		model.addAttribute("cartlist", list);
		model.addAttribute("optionlist", optionlist);
		
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
	public String cartOrder(String[] cartNum, String[] optionContents) throws Exception {

		int size = 1;
		size = cartNum.length;
		lists.clear(); // 초기화
		optionlists.clear(); // 초기화
		
		for(int i = 0; i < size; i++) {
			Long result = Long.parseLong(cartNum[i]);
			lists.add(cartService.cartOrder(result)); // lists에 담아서 주문 폼으로 전송
			if(optionContents.length != 0) {
				optionlists.add(i, optionContents[i]); // optionlists에 옵션이름을 담아서 주문 폼으로 전송
			}
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
		
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		
		usersDTO = usersService.mypage(usersDTO);
		
		model.addAttribute("order", lists);
		model.addAttribute("orderoption", optionlists);
		model.addAttribute("myinfo", usersDTO);
		//System.out.println(lists.get(0).getProductDTO().getThumbnail());
	}
	
	// 주문 처리
	@PostMapping("order")
	public String order(UsersOrderDTO usersOrderDTO, OrderDetailDTO orderDetailDTO, ProductDTO productDTO, OptionDTO optionDTO,
			String payRequest, String[] cartNum, String[] productNum, String[] count, String[] optionContents) throws Exception {
		
		if(payRequest.equals("kakao")) { // 카카오페이
			
			return "redirect:../order/kakaoPay";
			
		} else if(payRequest.equals("naver")) { // 네이버페이
			
			return "redirect:../order/naverPay";
		
		} else { // 무통장입금
			
			cartService.order(usersOrderDTO); // 주문정보 DB로 전송

			for(int i = 0; i < lists.size(); i++) {
				orderDetailDTO.setProductNum(lists.get(i).getProductNum());
				orderDetailDTO.setName(lists.get(i).getProductDTO().getName());
				orderDetailDTO.setCount(lists.get(i).getProductCount());
				orderDetailDTO.setPrice(lists.get(i).getProductDTO().getPrice());
				if(optionlists.isEmpty()) {
					orderDetailDTO.setOptionContents("0");
				} //else if(optionlists.get(i)) {
				else {
					orderDetailDTO.setOptionContents(optionlists.get(i));
				}
				cartService.orderDetail(orderDetailDTO); // 주문정보 DB로 전송
				
				Long num = Long.parseLong(cartNum[i]);
				cartService.cartlistDelete(num); // 주문완료된 상품을 카트에서 제거
				
				Integer ProductNum = Integer.parseInt(productNum[i]);
				Integer currentStock = cartService.stock(ProductNum); // 상품의 현 재고 조회
				Integer currentOptionStock = 0;
				
				if(optionContents != null) {
					if(!optionContents[i].isEmpty()) {
						optionDTO.setProductNum(ProductNum);
						optionDTO.setOptionContents(optionContents[i]);
						currentOptionStock = cartService.optionstock(optionDTO); // 옵션의 현 재고 조회
					}
				}
				
				Integer Count = Integer.parseInt(count[i]);
				Integer productCount = currentStock - Count; // 주문한 상품수량만큼 재고에서 차감
				productDTO.setStock(productCount);
				productDTO.setProductNum(ProductNum);
				cartService.stockUpdate(productDTO); // 상품의 재고 업데이트
				
				if(optionContents != null) {
					if(!optionContents[i].isEmpty()) {
						Integer optionCount = currentOptionStock - Count; // 주문한 상품수량만큼 옵션 재고에서 차감
						optionDTO.setOptionStock(optionCount);
						cartService.optionstock(optionDTO); // 옵션의 재고 업데이트
					}
				}
			}
			
			return "redirect:../order/orderComplete";
			
		}
		
	}
		
}
