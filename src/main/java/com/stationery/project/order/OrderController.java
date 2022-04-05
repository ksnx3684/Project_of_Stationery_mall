package com.stationery.project.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	// 카카오페이 결제 진행 화면
	@GetMapping("kakaoPay")
	public void kakaoPay() throws Exception {
	}
	
	// 네이버페이 결제 진행 화면
	@GetMapping("naverPay")
	public void naverPay() throws Exception {
	}

	// 주문 완료 폼
	@GetMapping("orderComplete")
	public void orderComplete() throws Exception {
	}
	
}
