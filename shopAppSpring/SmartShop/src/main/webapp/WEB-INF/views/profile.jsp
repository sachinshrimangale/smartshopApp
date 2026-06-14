<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | SmartShop</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<c:if test="${not empty msg}">
		<h2 class="msg">${msg}</h2> </c:if>

<div class="profile-container">

    <div class="profile-header">
        <div class="avatar">
            ${customer.fullname.charAt(0)}
        </div>

        <h2>${customer.fullname}</h2>

        <p>SmartShop Customer</p>
    </div>

    <div class="profile-details">

        <div class="detail-row">
            <span>Customer ID</span>
            <strong>${customer.cid}</strong>
        </div>

        <div class="detail-row">
            <span>Full Name</span>
            <strong>${customer.fullname}</strong>
        </div>

        <div class="detail-row">
            <span>Address</span>
            <strong>${customer.address}</strong>
        </div>

        <div class="detail-row">
            <span>Email</span>
            <strong>${customer.email}</strong>
        </div>

        <div class="detail-row">
            <span>Mobile</span>
            <strong>${customer.mobile}</strong>
        </div>

        <div class="detail-row">
            <span>Username</span>
            <strong>${customer.username}</strong>
        </div>

    </div>

	<div class="actions">

	    <a href="/requpdate-customer/${customer.cid}" class="btn edit-btn">
	        Update Profile
	    </a>

	    <a href="/shop" class="btn">
	        Continue Shopping
	    </a>

	</div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>