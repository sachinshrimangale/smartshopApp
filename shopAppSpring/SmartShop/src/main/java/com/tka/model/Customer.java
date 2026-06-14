package com.tka.model;

import org.springframework.stereotype.Component;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
@Component
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;

    private String fullname;
    private String address;
    private String email;
    private String mobile;
    private String username;
    private String password;

    // ✅ GETTERS
    public int getCid() { return cid; }
    public String getFullname() { return fullname; }
    public String getAddress() { return address; }
    public String getEmail() { return email; }
    public String getMobile() { return mobile; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }

    // ✅ SETTERS (these were MISSING — causing NULL values!)
    public void setCid(int cid) { this.cid = cid; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public void setAddress(String address) { this.address = address; }
    public void setEmail(String email) { this.email = email; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    public void setUsername(String username) { this.username = username; }
    public void setPassword(String password) { this.password = password; }
}