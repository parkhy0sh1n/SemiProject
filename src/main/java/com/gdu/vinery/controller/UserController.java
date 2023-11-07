package com.gdu.vinery.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	//@GetMapping("/")
	public String welcome1() {
		return "users/home";
	}
	
	@GetMapping("/users/index.page")
	public String welcome2() {
		return "users/login";
	}
	
	@GetMapping("/users/agree.page")
	public String agreePage() {
		return "users/agree";
	}
	
	@GetMapping("/users/agree.do")
	public String agree(@RequestParam(value="location", required=false) String location	// �Ķ���� location�� ���޵��� ������ �� ���ڿ�("")�� String location�� ����ȴ�.                
					  , @RequestParam(value="event", required=false) String event		// �Ķ���� event�� ���޵��� ������ �� ���ڿ�("")�� String event�� ����ȴ�.
					  , Model model) {
		model.addAttribute("location", location);
		model.addAttribute("event", event);
		
		return "users/join";
	}
	
	
	@ResponseBody
	@GetMapping(value="/users/verifyId.do", produces="application/json")
	public Map<String, Object> verifyId(@RequestParam("userId") String userId){
		return userService.verifyId(userId);
	}
	
	
	@ResponseBody
	@GetMapping(value="/users/verifyEmail.do", produces="application/json")
	public Map<String, Object> verifyEmail(@RequestParam("userEmail") String userEmail){
		return userService.verifyEmail(userEmail);
	}
	
	@ResponseBody
	@GetMapping(value="/users/sendAuthCode.do", produces="application/json")
	public Map<String, Object> sendAuthCode(@RequestParam("userEmail") String userEmail){
		return userService.sendAuthCode(userEmail);
	}
	
	
	@PostMapping("/users/join.do")
	public void  join(HttpServletRequest request, HttpServletResponse response) {
		userService.join(request, response);
	}
	
	
	@GetMapping("/users/login.form")
	  public String loginForm(HttpServletRequest request, Model model) {
	    // ��û ��� referer : �α��� ȭ������ �̵��ϱ� ������ �ּҸ� �����ϴ� ��� ��
	    String url = request.getHeader("referer");
	    model.addAttribute("url", url == null ? request.getContextPath() : url);
	    return "users/login";
	  }
	
	
	@PostMapping("/users/login.do")
	  public void login(HttpServletRequest request, HttpServletResponse response) {
	    userService.login(request, response);
	  }
	
	
	@GetMapping("/users/logout.do")
	  public String logout(HttpServletRequest request, HttpServletResponse response) {
	    userService.logout(request, response);
	    return "redirect:/main";
	  }
	
	
	@GetMapping("/users/leave.do")
	  public void leave(HttpServletRequest request, HttpServletResponse response) {
	    userService.leave(request, response);
	  }
	
	@GetMapping("/users/findId.page")  // 아이디 찾기 화면으로 이동
    public String findIdForm() {
      return "users/findId";
    }
    
    @ResponseBody
    @PostMapping(value="/users/findId.do", produces="application/json")  // 아이디 찾기
    public Map<String, Object> findId(@RequestBody UserDTO userDTO) {
      return userService.findUser(userDTO);
    }
	
	
	
	
}
