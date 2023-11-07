package com.gdu.vinery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.CartDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

@Service
public interface OrderService {

	public OrdersDTO insertOrder(OrdersDTO orderDTO);
	public UserDTO getUserInfo(HttpServletRequest request);
	public List<CartDTO> getSelectList(HttpServletRequest request);
	public ProductDTO getProduct(HttpServletRequest request);
}
