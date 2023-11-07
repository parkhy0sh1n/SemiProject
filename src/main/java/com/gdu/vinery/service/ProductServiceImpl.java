package com.gdu.vinery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<ProductDTO> getProductList() {
        return productMapper.getProductList();
    }
    
    @Override
    public ProductDTO getProductByNo(int prodNo) {
        return productMapper.getProductByNo(prodNo);
    }
    
    @Override
    public List<ProductDTO> searchProduct(String query) {
        return productMapper.searchProduct(query);
    }
}