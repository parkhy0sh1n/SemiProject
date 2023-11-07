 package com.gdu.vinery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.ReviewDTO;
import com.gdu.vinery.service.ProductService;
import com.gdu.vinery.service.ReviewService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/product")
public class ProductController {
	
    private ProductService productService;
    private ReviewService reviewService;
    
    @GetMapping("/listPage.do")
    public String listPage() {
       return "product/productList";
    }
    
    @GetMapping("/list")
    @ResponseBody
    public List<ProductDTO> getProductList() {
        return productService.getProductList();
    }
    
    @GetMapping("/detail")
    public String getProductDetail(@RequestParam("prodNo") int prodNo, Model model) {
        ProductDTO product = productService.getProductByNo(prodNo);
        List<ReviewDTO> reviewList = reviewService.getReviewList(prodNo);
        model.addAttribute("product", product);
        model.addAttribute("reviewList", reviewList);
        return "/product/productDetail";
    }
    
    @GetMapping("/search")
    @ResponseBody
    public List<ProductDTO> searchProduct(@RequestParam("query") String query) {
        return productService.searchProduct(query);
    }
    
}