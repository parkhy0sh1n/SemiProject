package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SleepUserDTO {

	private int userNo;
	private String userId;
    private String userPw;
    private String userName;
    private String userTel;
    private String userPost;
    private String userRoadAddress;
    private String userJibunAddress;
    private String userDetailAddress;
    private String userExtraAddress;
    private String userEmail;
    private String userBirth;
    private String userGender;
    private Date userPwModifiedAt;
    private int userAgreecode;
    private int userState;
    private Date userJoinedAt;
    private Date userSleepAt;
	
}