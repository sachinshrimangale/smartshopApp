<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile | SmartShop</title>
<link rel="stylesheet" href="/css/style.css">
</head>

<body>
	<%@ include file="header.jsp" %>
	<c:if test="${not empty msg}">
		<h2 class="msg">${msg}</h2> </c:if>
		
<div class="update-container">
    <h2>Update Customer Profile</h2>
   
	 <form action="/update-customer" method="post">
        <input type="hidden" name="cid" value="${customer.cid}">
       
		 <label>Full Name</label>
        <input type="text" name="fullname"  value="${customer.fullname}" required>

        <label>Address</label>
        <input type="text" name="address"  value="${customer.address}" required>

        <label>Email</label>
        <input type="email" name="email"  value="${customer.email}" required>

        <label>Mobile Number</label>
        <input type="text" name="mobile" value="${customer.mobile}" required>

        <label>Username</label>
        <input type="text" name="username"  value="${customer.username}" readonly>

        <label>Password</label>
        <input type="password" name="password"   value="${customer.password}" required>

        <div class="btn-group">
            <button type="submit">  Update Profile </button>
            <a href="/get-customer" class="cancel-btn">  Cancel  </a>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>