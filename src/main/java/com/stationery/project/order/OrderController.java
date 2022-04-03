package com.stationery.project.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	// 주문 완료 폼
	@GetMapping("orderComplete")
	public void orderComplete() throws Exception {
	}
	
}
