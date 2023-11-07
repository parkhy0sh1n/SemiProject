package com.gdu.vinery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.NoticeDTO;

@Mapper
public interface NoticeMapper {
	public List<NoticeDTO> getNoticeList();
	public NoticeDTO getNotice(int noticeNo);
	public List<NoticeDTO> searchNotices(String keyword);
}