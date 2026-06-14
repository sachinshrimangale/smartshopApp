package com.tka.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.model.Product;
import com.tka.repo.ProductRepo;

@Service
public class ProductService {

    @Autowired
    ProductRepo productRepo;

    List<Product> cartProducts;

    public ProductService() {
        cartProducts = new ArrayList<>();
    }

    public Product addToCart(int pid) {
        Product product = getProductById(pid);

        if (product != null) {
            cartProducts.add(product);
        }

        return product;
    }

    public Product removeFromCart(int pid) {

        Product productToRemove = null;

        for (Product product : cartProducts) {
            if (pid == product.getPid()) {
                productToRemove = product;
                break;
            }
        }

        if (productToRemove != null) {
            cartProducts.remove(productToRemove);
        }

        return productToRemove;
    }

    public List<Product> getCartProducts() {
        return cartProducts;
    }

    public List<Product> getProducts() {
        return productRepo.findAll();
    }

    public Product getProductById(int pid) {
        return productRepo.findById(pid).orElse(null);
    }

    public double getCartTotalAmount() {

        double total = 0;

        for (Product product : cartProducts) {
            total += product.getPrice();
        }

        return total;
    }

    public List<Product> getProductsBill() {
        return cartProducts;
    }
}