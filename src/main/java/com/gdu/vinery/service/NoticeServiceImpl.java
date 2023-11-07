package com.gdu.vinery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.mapper.NoticeMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	
	@Override
	public List<NoticeDTO> getNoticeList() {
		return noticeMapper.getNoticeList();
	}
	
	@Override
	public NoticeDTO getNotice(HttpServletRequest request) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		return noticeMapper.getNotice(noticeNo);
	}

	@Override
	public List<NoticeDTO> searchNotices(String keyword) {
	    return noticeMapper.searchNotices(keyword);
	}
	
}