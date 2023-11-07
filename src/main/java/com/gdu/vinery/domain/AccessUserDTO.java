package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccessUserDTO {

	private String userId;
	private Date lastLoginAt;
	
}
