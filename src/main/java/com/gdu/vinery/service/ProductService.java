package com.gdu.vinery.service;

import java.util.List;

import com.gdu.vinery.domain.ProductDTO;

public interface ProductService {
    List<ProductDTO> getProductList();
    ProductDTO getProductByNo(int prodNo);
    List<ProductDTO> searchProduct(String query);
}