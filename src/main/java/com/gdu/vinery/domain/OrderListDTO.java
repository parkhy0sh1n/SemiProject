package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderListDTO {

	private int orderNo;
	private int userNo;
	private Date orderDate;
	private String receiverName;
	private String receiverTel;
	private String receiverAddress;
	private String receiverJibunAddress;
	private String receiverDetailAddress;
	private String orderRequest;
	private String payMethod;
	private int orderAmount;
	private int orderDiscount;
	
}
