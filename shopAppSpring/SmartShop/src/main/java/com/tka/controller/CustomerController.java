package com.tka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tka.model.Customer;
import com.tka.service.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller()
// RequestMapping("/customer-api")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@PostMapping("/verify-login")
	public String checkLogin(String username, String password, Model model, HttpSession session) {
		Customer loggedCustomer = customerService.checkLogin(username, password);
		if (loggedCustomer != null) {
			model.addAttribute("msg", "Customer Logg-in Successful!!!!!!!!!!!!!!!");
			// store userId -->
			session.setAttribute("LoggedUserId", loggedCustomer.getCid());
			session.setAttribute("LoggedUserName", loggedCustomer.getFullname());
			return "home"; // redirect
		}
		model.addAttribute("msg", "Customer Logg-in Failed***");
		return "register"; // redirect
	}

	@PostMapping("/add-customer")
	public String addCustomer(@ModelAttribute Customer customer, Model model) {
		boolean isAdded = customerService.saveCustomer(customer);
		if (isAdded) {
			model.addAttribute("msg", customer.getFullname() + " > Register successful !!!!!!");
			return "login";
		}
		model.addAttribute("msg", customer.getFullname() + " > Register Failed *** Try again");
		return "register";
	}

	@GetMapping("/profile")
	public String getCustomer(Model model, HttpSession session) {
		// fetching id from session once loggedIn user success...
		Object idObj =   session.getAttribute("LoggedUserId"); 
		if (idObj != null) {
			int id = (int) idObj;
			Customer customer = customerService.getCustomerById(id); // hard coded ...***
			model.addAttribute("customer", customer);
			return "profile";
		}
		model.addAttribute("msg", "Plz do login first @@@@@@@@@@@");
		return "login";
	}

	@GetMapping("/requpdate-customer/{cid}")
	public String updateCustomer(@PathVariable int cid, Model model) {
		Customer customer = customerService.getCustomerById(cid);
		model.addAttribute("customer", customer);
		return "updateProfile";
	}

	@PostMapping("/update-customer")
	public String updateCustomer(@ModelAttribute Customer customer, Model model) {
		customerService.saveCustomer(customer);
		model.addAttribute("msg", "Profile Updated Successfully!");
		return "profile";
	}

}
