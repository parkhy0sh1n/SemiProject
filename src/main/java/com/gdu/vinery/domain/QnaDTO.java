package com.gdu.vinery.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaDTO {
	private int qnaNo;
	private String qnaTitle;
	private Date qnaRegDate;
	private String qnaGubun;
	private String qnaContent;
	private int qnaDepth;
}