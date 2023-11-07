package com.gdu.vinery.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {

	private int cartNo;
	private int userNo;
	private int prodNo;
	private int quantity;
	private String prodName;
	private int prodPrice;
	private String prodThumbnail;

}
