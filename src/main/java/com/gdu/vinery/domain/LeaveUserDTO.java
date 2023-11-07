package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveUserDTO {

	private String userId;
	private String userEmail;
	private Date userJoinedAt;
	private Date userLeavedAt;
	
}
