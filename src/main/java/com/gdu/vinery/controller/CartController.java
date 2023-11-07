package com.gdu.vinery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.vinery.service.CartService;

@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@GetMapping("/getCartList.do")
	public String getCartList(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("cartList", cartService.getCartList(request, response));
		model.addAttribute("userNo", cartService.getUserNo(request));
		return "order/cart";
	}
	
	@ResponseBody
	@PostMapping(value="/addCart.do", produces="application/json")
	public Map<String, Object> addCart(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("msg", cartService.addCart(request));
		return map;
	}
	
	@GetMapping("/deleteCart.do")
	public String deleteCart(@RequestParam("prodNoArr") List<String> prodNoArr, RedirectAttributes redirectAttributes) {
	    int deleteResult = cartService.deleteCart(prodNoArr);
		redirectAttributes.addFlashAttribute("deleteResult", deleteResult);
	    System.out.println("deleteResult" + deleteResult);
	    return "redirect:/cart/getCartList.do";
	}
	
	@ResponseBody
	@GetMapping("/updateCartQuantity.do")
	public void updateCartQuantity(@RequestParam("quantity") int quantity, @RequestParam("prodNo") int prodNo) {
		cartService.updateCartQuantity(quantity, prodNo);
	}

	
}
