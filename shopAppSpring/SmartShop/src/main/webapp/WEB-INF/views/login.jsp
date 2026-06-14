<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>
	<%@ include file="header.jsp" %>
	<c:if test="${not empty msg}">
			<h2 class="msg">${msg}</h2> </c:if>
	
		<div class="login-container">

		<h2>Customer Login</h2>

		<form action="/verify-login" method="POST">

			<label>Username</label>
			<input type="text" name="username" placeholder="Enter Username" required>

			<label>Password</label>
			<input type="password" name="password" placeholder="Enter Password" required>

			<button type="submit">Login</button>

		</form>

		<p class="signup-link">
			Don't have an account?
			<a href="/register-page">Sign Up Here</a>
		</p>

	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>