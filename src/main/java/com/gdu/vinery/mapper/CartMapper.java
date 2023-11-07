package com.gdu.vinery.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.CartDTO;
import com.gdu.vinery.domain.ProductDTO;

@Mapper
public interface CartMapper {

	public int selectUserNoById(String userId);
	public CartDTO selectProductByNo(int prodNo);
	public CartDTO selectAlreadyInCart(CartDTO alreadyCart);
	public int insertCart(CartDTO cartDTO);
	public ProductDTO selectProdByNo(int prodNo); 
	public List<CartDTO> selectCartList (int userNo);
	public int deleteByProdNo(Map<String, Object> map);
	public int updateCartQuantity(Map<String, Object> map);
}
