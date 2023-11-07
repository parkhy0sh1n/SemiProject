package com.gdu.vinery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.ProductDTO;

@Mapper
public interface ProductMapper {
    List<ProductDTO> getProductList();
    ProductDTO getProductByNo(int prodNo);
    List<ProductDTO> searchProduct(String query);
}