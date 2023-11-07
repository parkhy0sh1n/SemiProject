package com.gdu.vinery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.ReviewDTO;
import com.gdu.vinery.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
  
    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public  List<ReviewDTO> getReviewList(int prodNo) {
        return reviewMapper.getReviewList(prodNo);
    }
    
}