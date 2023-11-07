package com.gdu.vinery.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int reviewNo;
	private UserDTO userDTO;
	private int orderDetailNo;
	private String reviewContent;
	private double reviewGrade;
	private String reviewCreatedAt;
}