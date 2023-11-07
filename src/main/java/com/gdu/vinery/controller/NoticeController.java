package com.gdu.vinery.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice/list.do")
	public String list(Model model) {
		model.addAttribute("noticeList", noticeService.getNoticeList());
		return "notice/noticeList";
	}
	
	@GetMapping("/notice/detail.do")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("notice", noticeService.getNotice(request));
		return "notice/noticeDetail";
	}
	
	@GetMapping("/notice/qna.do")
	public String qna() {
		return "notice/qna";
	}
	
	@GetMapping("/notice/search.do")
	public String search(@RequestParam("keyword") String keyword, Model model) {
	    List<NoticeDTO> noticeList = noticeService.searchNotices(keyword);
	    if (noticeList.isEmpty()) {
	        model.addAttribute("errorMessage", "검색 결과가 없습니다.");
	    } else {
	        model.addAttribute("successMessage", "검색이 완료되었습니다.");
	        model.addAttribute("noticeList", noticeList);
	    }
	    return "notice/noticeList";
	}

}