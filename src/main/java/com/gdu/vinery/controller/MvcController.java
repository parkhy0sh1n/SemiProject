package com.gdu.vinery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {

	@GetMapping("/")
	public String welcome() {
		return "index";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		return "main";
	}
	@GetMapping("productList")
	public String dsad() {
		return "productList";
	}
}