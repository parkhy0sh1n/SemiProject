package com.gdu.vinery.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
	
	private int orderDetailNo;
	private int orderNo;
	private int prodNo;
	private int couponNo;
	private int quantity;
	private int orderAmount;
	private int orderDiscount;

}
