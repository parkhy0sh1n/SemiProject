package com.gdu.vinery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.ReviewDTO;

@Mapper
public interface ReviewMapper {
	public List<ReviewDTO> getReviewList(int prodNo);
}