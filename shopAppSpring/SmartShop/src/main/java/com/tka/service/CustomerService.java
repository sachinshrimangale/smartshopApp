package com.tka.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.model.Customer;
import com.tka.repo.CustomerRepo;

@Service
public class CustomerService {

	@Autowired
	CustomerRepo customerRepo;

	public Customer checkLogin(String username, String password) {
		Customer customer = customerRepo.findByUsername(username); // {.......}
		if (customer != null) {
			System.err.println("Username is matching......");
			if (password.equals(customer.getPassword())) {
				System.err.println("Both Username & password matched......");
				return customer;
			}
		}
		return null;
	}

	public boolean saveCustomer(Customer customer) {
		Customer cust = customerRepo.save(customer);
		if (cust != null)
			return true;
		return false;
	}

	public Customer getCustomerById(int id) {
	    return customerRepo.findById(id).orElse(null);
	    // .orElseThrow(() -> new RuntimeException("Customer Not Found"));
	}
}
