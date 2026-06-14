package com.tka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
// @RequestMapping("/smartshopapi") // localhost:9090/smartshop/
public class SmartShopAppController { // Customer, Product, Cart ,Bill,

	@GetMapping("/")
	public String getMethodName() {
		return "index"; // return "WEB-INF/views/index.jsp"
	}

	@GetMapping("/home")
	public String getHomePage(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("LoggedUserId");
		if (userId != null) {
			return "home";
		}
		model.addAttribute("msg", "Please login first!");
		return "login";
	}

	@GetMapping("/login") // cart-api/getcard
	public String getLoginPage() {
		return "login";
	}

	@GetMapping("/register-page")
	public String getRegisterPage() {
		return "register";
	}

	@GetMapping("/logout")
	public String getLogoutPage(HttpSession session) {
		session.invalidate(); // destroys the current session
		return "index";
	}

}
