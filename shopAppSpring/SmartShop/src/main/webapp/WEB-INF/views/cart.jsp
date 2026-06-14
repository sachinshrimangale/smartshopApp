<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>

<%@ include file="header.jsp" %>

<h2>My Cart Products</h2>

<c:if test="${empty cartProducts}">
    <h3 class="msg">No Products Available In Cart</h3>
</c:if>

<c:if test="${not empty cartProducts}">

<table>
    <tr>
        <th>Product Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <c:forEach var="p" items="${cartProducts}">
        <tr>
            <td>${p.productname}</td>
            <td>${p.category}</td>
            <td>₹ ${p.price}</td>
            <td>
                <form action="/remove-from-cart/${p.pid}" method="post">
                    <button type="submit">
                        Remove
                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>
	
	<tfoot>
	    <tr>
	        <td colspan="2"><b>Total Amount</b></td>
	        <td><b>₹ ${totalAmount}</b></td>
	    </tr>
	</tfoot>
</table>
</c:if>

<div class="hero">
		    <a href="/shop-now"  class="link-url">Shop Now !!! </a>
		</div>



</body>
</html>