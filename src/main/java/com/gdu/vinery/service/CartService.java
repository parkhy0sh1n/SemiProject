package com.gdu.vinery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.vinery.domain.CartDTO;

public interface CartService {
	
	public String addCart(HttpServletRequest request);
	public List<CartDTO> getCartList(HttpServletRequest request, HttpServletResponse response);
	public int getUserNo(HttpServletRequest request);
	public int deleteCart(List<String> prodNoArr);
	public void updateCartQuantity(int quantity, int prodNo);
}
