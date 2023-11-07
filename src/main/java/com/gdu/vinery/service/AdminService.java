package com.gdu.vinery.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

public interface AdminService {
	
  // 상품관리
	public void selectProd(HttpServletRequest request, Model model);
	public ProductDTO selectProdByNo(HttpServletRequest request);
	public Map<String, Object> modifyProd(HttpServletRequest request);
	public void removeProd(HttpServletRequest request, HttpServletResponse response);
	public int insertProd(HttpServletRequest request);
	public void searchProd(HttpServletRequest request, Model model); 
	
	
	// 회원관리
	public List<UserDTO> selectUsers();
	public UserDTO selectuserByNo(HttpServletRequest request);
	
	// 주문관리
	public List<OrdersDTO> selectOrders();
	
	// 공지관리
	public List<NoticeDTO> selectNotices();

}
