package com.gdu.vinery.mapper;
import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.CartDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

@Mapper
public interface OrderMapper {

	public int insertOrders(OrdersDTO orderDTO);
	public OrdersDTO selectMyOrder(int userNo);
	public UserDTO getUserByUserNo(int userNo);
	public CartDTO getProdByNo(int prodNo);
	public ProductDTO getFromProd(int prodNo);
}
