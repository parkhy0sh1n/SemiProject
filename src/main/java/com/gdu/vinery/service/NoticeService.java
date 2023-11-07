package com.gdu.vinery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gdu.vinery.domain.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> getNoticeList();
	public NoticeDTO getNotice(HttpServletRequest request);
	public List<NoticeDTO> searchNotices(String keyword);
}