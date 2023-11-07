package com.gdu.vinery.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.domain.OrderListDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

@Mapper
public interface AdminMapper {
	
  // 상품관리
	public ProductDTO selectProdByNo(int prodNo);
  public int modifyProd(ProductDTO product);
  public int deleteProd(int wNo);
  public int insertProd(ProductDTO product);
  
  public List<ProductDTO> getProductListUsingPagination(Map<String, Object> map);
  public int getProductsCount();  // 상품 총 개수
  
  public List<ProductDTO> searchProd(String prodN);
  
  
  // 회원관리
  public List<UserDTO> selectUsers();
  public UserDTO selectUserByNo(int userNo);
  
  public List<OrdersDTO> selectOrders();
  public List<NoticeDTO> selectNotices();
  
  
}
