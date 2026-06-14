<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smartshop | Home</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<c:if test="${not empty msg}">
		<h2 class="msg">${msg}</h2> </c:if>
	
	<div class="hero">
		    <h1>Welcome to Shopping Application </h1>
		    <p><u>Your One Stop Shopping Destination</u></p>
		    <br>
		    <a href="/shop"  class="link-url">Start Shopping</a>
		</div>
	

<%@ include file="footer.jsp" %>
</body>
</html>