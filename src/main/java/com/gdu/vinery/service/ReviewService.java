package com.gdu.vinery.service;

import java.util.List;

import com.gdu.vinery.domain.ReviewDTO;

public interface ReviewService {
	public List<ReviewDTO> getReviewList(int reviewNo);
}