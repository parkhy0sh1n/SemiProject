package com.gdu.vinery.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.domain.OrdersDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
  private AdminService adminService;
	
	
	/* [  상  품  ] */
	
  // 상품 리스트
	@GetMapping("/prodList.page")
	public String prodList(HttpServletRequest request, Model model) {
		adminService.selectProd(request, model);
		return "admin/prodList";	
	}
	
	// 상품 페이징 개수 저장
	@GetMapping("/record.do")
	public String changeRecord(HttpSession session
	    , HttpServletRequest request
	    , HttpServletResponse response
	    , @RequestParam(value="recordPerPage", required=false, defaultValue="10") int recordPerPage) {
	  session.setAttribute("recordPerPage", recordPerPage);
	  return "redirect:" + request.getHeader("referer");  
	}
	
	
	// 상품 상세
	@GetMapping("/detailProd.page")
	public String detailProd(HttpServletRequest request, Model model) {
	  model.addAttribute("w", adminService.selectProdByNo(request));
	  return "admin/prodDetail";
	}
	
	// 상품 수정
	@ResponseBody
	@PostMapping(value="/modifyProd.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> modifyProd(HttpServletRequest request) {
	  return adminService.modifyProd(request);
	}
	
	// 상품 삭제
	@PostMapping("/removeProd.do")
	public void removeProd(HttpServletRequest request, HttpServletResponse response) {
	  adminService.removeProd(request, response);
	}
	
	// 상품 입력화면
	@GetMapping("/addProd.page")
	public String addProd() {
	  return "admin/prodAdd";
	}
	
	// 상품 삽입
	@PostMapping("/addProd.do")
	public String insertProd(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	  redirectAttributes.addFlashAttribute("addResult", adminService.insertProd(request));
	  return "redirect:/admin/prodList.page";
	}
	
	// 상품 조회
	@GetMapping("/searchProd.do")
	public String searchProd(HttpServletRequest request, Model model) {
	  adminService.searchProd(request, model);
	  return "admin/prodSearch";
	}
	
	
  /* [  회  원  ] */
	// 회원 관리
	@GetMapping("/userList.page")
	public String memberList(Model model) {
	  List<UserDTO> memberList = adminService.selectUsers();
	  model.addAttribute("memberList", memberList);
		return "admin/userList";
	}
	
	@GetMapping("/detailUser.page")
	public String userdetail(HttpServletRequest request, Model model) {
		UserDTO user = adminService.selectuserByNo(request);
		model.addAttribute("u", user);
		return "admin/userDetail";
	}
	
	
	/* [ 주   문 ] */
	@GetMapping("/orderList.page")
  public String orderList(Model model) {
    List<OrdersDTO> orderList = adminService.selectOrders();
    model.addAttribute("orderList", orderList);
    return "admin/orderList";
  }	
	
	
  @GetMapping("/noticeList.page")
  public String noticeList(Model model) {
    List<NoticeDTO> noticeList = adminService.selectNotices();
    model.addAttribute("noticeList", noticeList);
    return "admin/noticeList";
  }
  
}