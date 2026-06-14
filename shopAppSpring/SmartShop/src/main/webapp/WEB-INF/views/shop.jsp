<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop | SmartShop</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>
<c:if test="${not empty msg}">
		<h2 class="msg">${msg}</h2> </c:if>
	
 	 <h1>Shop Products</h1>
	 <div class="product-grid">

		<c:forEach var="p" items="${products}">
		    <div class="product-card">
		        <div class="image-box">
					<img src="${p.imagepath}" alt="${p.productname}">
		        </div>
		        <div class="product-details">
		            <h3>${p.productname}</h3>
		            <p class="category">${p.category}</p>
		            <p class="price">&#8377; ${p.price}</p>
		           
					 <form action="/add-to-cart/${p.pid}" method="post">
		                <input type="hidden" name="pid" value="${p.pid}">
		                <button type="submit" class="cart-btn">
		                    🛒 Add To Cart
		                </button>
		            </form>
		        </div>
		    </div>
		</c:forEach>
	 	</div>
  	<a href="/shop"> Let's Shop -->>> </a>

<%@ include file="footer.jsp" %>
</body>
</html>




