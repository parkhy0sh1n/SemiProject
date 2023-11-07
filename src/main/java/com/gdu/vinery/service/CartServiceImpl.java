package com.gdu.vinery.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.vinery.domain.CartDTO;
import com.gdu.vinery.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Transactional
	@Override
	public String addCart(HttpServletRequest request) {
		
		// userId 가져오기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
		
		// 요청 파라미터
		int userNo = cartMapper.selectUserNoById(userId);
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		// 상품 번호로 상품 정보(이름, 이미지, 가격) 카트에 담기
		CartDTO cartDTO = cartMapper.selectProductByNo(prodNo);
		// 장바구니에 상품 담기
		cartDTO.setUserNo(userNo);
		cartDTO.setProdNo(prodNo);
		cartDTO.setQuantity(quantity);
		
		CartDTO alreadyCart = new CartDTO();
		alreadyCart.setUserNo(userNo);
		alreadyCart.setProdNo(prodNo);

		if(cartMapper.selectAlreadyInCart(alreadyCart) == null) {
			System.out.println(cartDTO);
			int insertResult = cartMapper.insertCart(cartDTO);
			if(insertResult == 1) {
				return "장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?";
			}
		}
		return "이미 장바구니에 담긴 상품입니다. 장바구니로 이동하시겠습니까?";
	}
	
	@Override
	public List<CartDTO> getCartList(HttpServletRequest request, HttpServletResponse response){
		
		// userId 가져오기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("loginId");
		
		if(userId == null) {
			response.setContentType("text/html; charset=UTF-8");
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요한 서비스입니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// userNo 가져오기
		int userNo = cartMapper.selectUserNoById(userId);
		List<CartDTO> cartList = cartMapper.selectCartList(userNo);
		
		
		return cartList;
	}
	
	@Override
	public int getUserNo(HttpServletRequest request) {
//		 userId 가져오기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("loginId");
		
//		 userNo 가져오기
		int userNo = cartMapper.selectUserNoById(userId);
		
		return userNo;
	}

	@Override
	public int deleteCart(List<String> prodNoArr) {
		
		// userId 가져오기
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("loginId");
//		
		// userNo 가져오기
//		int userNo = cartMapper.selectUserNoById(userId);
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("userNo", userNo);

		int deleteResult = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", 1);
		
		int length = prodNoArr.size();
		
		for(int i=0; i<length; i++) {
			map.put("prodNo", prodNoArr.get(i));
			deleteResult += cartMapper.deleteByProdNo(map);
		}
		
		return deleteResult;
	}
	
	@Override
	public void updateCartQuantity(int quantity, int prodNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("quantity", quantity);
		map.put("prodNo", prodNo);
		
		cartMapper.updateCartQuantity(map);
		
	}
	
}
