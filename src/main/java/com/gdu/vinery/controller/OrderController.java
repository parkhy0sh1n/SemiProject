package com.gdu.vinery.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.service.CartService;
import com.gdu.vinery.service.OrderService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RequestMapping("/order")
@Controller
public class OrderController {


	private OrderService orderService;
	private CartService cartService;
	@GetMapping("/prodList.page")
	public String prodList() {
		return "product/productList";
	}
	
	@PostMapping("/orderAll.do")
	public String orderAll(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("orderUser", orderService.getUserInfo(request));
		model.addAttribute("cartList", cartService.getCartList(request, response));
		return "order/orderDetail";
	}
	
	@PostMapping("/orderSelect.do")
	public String orderSelect(HttpServletRequest request, Model model) {
		model.addAttribute("orderUser", orderService.getUserInfo(request));
		model.addAttribute("cartList", orderService.getSelectList(request));
		return "order/orderDetail";
	}	
	
	@PostMapping("/orderDirect.do")
	public String orderDirect(HttpServletRequest request, Model model) {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		model.addAttribute("quantity", quantity);
		model.addAttribute("orderUser", orderService.getUserInfo(request));
		ProductDTO p = orderService.getProduct(request);
		System.out.println(p);
		model.addAttribute("product", p);
		return "order/orderDetail";
	}
	
	// 결제 버튼을 눌렀을 때 실행되는 매핑
	@ResponseBody
	@PostMapping(value="/insertOrder.do", produces="application/json")
	public Map<String, Object> insertOrder(OrdersDTO orderDTO, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("order", orderService.insertOrder(orderDTO));
		return map;
	}
	
}
