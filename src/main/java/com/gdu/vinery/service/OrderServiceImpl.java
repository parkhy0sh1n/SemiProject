package com.gdu.vinery.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.CartDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.mapper.CartMapper;
import com.gdu.vinery.mapper.OrderMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;
	private CartMapper cartMapper;
	
	
	@Override
	public OrdersDTO insertOrder(OrdersDTO orderDTO) {
		orderMapper.insertOrders(orderDTO);
		System.out.println(orderDTO.toString());
		System.out.println("조회된 정보 : " + orderMapper.selectMyOrder(orderDTO.getUserNo()));
		return orderMapper.selectMyOrder(orderDTO.getUserNo());
	}
	
	@Override
	public UserDTO getUserInfo(HttpServletRequest request) {
		// userId 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
				
		// 요청 파라미터
		int userNo = cartMapper.selectUserNoById(userId);
		return orderMapper.getUserByUserNo(userNo);
	}
	
	@Override
	public List<CartDTO> getSelectList(HttpServletRequest request) {
		
		String[] items = request.getParameter("selectedItems").split(",");
		List<CartDTO> list = new ArrayList<>();
		for(int i=0; i<items.length; i++) {
			list.add(orderMapper.getProdByNo(Integer.parseInt(items[i])));
		}
		return list;
	}
	
	@Override
	public ProductDTO getProduct(HttpServletRequest request) {
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		return orderMapper.getFromProd(prodNo);
	}
	

}
