package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeDTO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImg;
	private Date noticeCreatedAt;
	private int noticeGubun;
}