package com.tka.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tka.model.Product;
import com.tka.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@GetMapping("/products")
	public String getProducts(Model model) {
		List<Product> products = productService.getProducts();
		model.addAttribute("products", products);
		return "products"; 
	}

	@GetMapping("/shop")
	public String getShopProducts(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("LoggedUserId");
		if (userId != null) {
			List<Product> shopProducts = productService.getProducts();
			model.addAttribute("products", shopProducts);
			return "shop"; // .jsp
		}
		model.addAttribute("msg", "Plz do login first @@@@@@@@@@@");
		return "login";
	}

	@PostMapping("/add-to-cart/{pid}") // ******************************
	public String addToCart(@PathVariable int pid, Model model) {
		System.err.println("add to cart > Product ID: " + pid);
		Product addCartProduct = productService.addToCart(pid);
		List<Product> shopProducts = productService.getProducts();
		model.addAttribute("msg", addCartProduct.getProductname() + " -added to cart successfully !!!!!!!!");

		model.addAttribute("products", shopProducts);
		return "redirect:/shop"; // redirect same page
	}

	@GetMapping("/cart")
	public String getCart(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("LoggedUserId");
		if (userId != null) {
			List<Product> cartProducts = productService.getCartProducts();
			model.addAttribute("cartProducts", cartProducts);
			double totalAmount = productService.getCartTotalAmount();
			model.addAttribute("totalAmount", totalAmount);
			return "cart";
		}
		model.addAttribute("msg", "Plz do login first @@@@@@@@@@@");
		return "login";
	}

	@PostMapping("/remove-from-cart/{pid}")
	public String removeFromCart(@PathVariable int pid, Model model) {
		Product removedCartProduct = productService.removeFromCart(pid);
		model.addAttribute("msg", removedCartProduct.getProductname() + " -added to cart successfully !!!!!!!!");
		return "redirect:/cart";
	}

	@GetMapping("/shop-now")
	public String shopNow(Model model) {
		List<Product> billProducts = productService.getProductsBill();

		// Directing to Payment / UPI Gateway API
		model.addAttribute("billProducts", billProducts);
		model.addAttribute("totalAmount", productService.getCartTotalAmount());
		return "bill";
	}

	@GetMapping("/bill")
	public String getBill(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("LoggedUserId");
		if (userId != null) {
			List<Product> billProducts = productService.getProductsBill();
			model.addAttribute("billProducts", billProducts);
			return "bill";
		}
		model.addAttribute("msg", "Plz do login first @@@@@@@@@@@");
		return "login";
	}

}
