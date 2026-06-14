<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | SmartShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<c:if test="${not empty msg}">
    <h2 class="msg">${msg}</h2>
</c:if>

<div class="page-body">
    <div class="register-container">

        <h3>Create Your Account</h3>

        <form action="/add-customer" method="POST">

            <div class="field-group">
                <label>Full Name</label>
                <input type="text" name="fullname" placeholder="Enter your full name">
            </div>

            <div class="field-group">
                <label>Address</label>
                <input type="text" name="address" placeholder="Enter your address">
            </div>

            <div class="field-group">
                <label>Email</label>
                <input type="text" name="email" placeholder="Enter your email">
            </div>

            <div class="field-group">
                <label>Mobile Number</label>
                <input type="text" name="mobile" placeholder="Enter mobile number">
            </div>

            <div class="field-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Choose a username">
            </div>

            <div class="field-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create a password">
            </div>

            <input type="submit" value="Create Account">

        </form>

        <p class="login-link">
            Already have an account? <a href="/login">Sign In Here</a>
        </p>

    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>