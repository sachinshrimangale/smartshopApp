<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Bill</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>

<%@ include file="header.jsp"%>

<div class="bill-container">

	<h2>Order Invoice</h2>

	<table>

		<tr>
			<th>Sr.No</th>
			<th>Product Name</th>
			<th>Category</th>
			<th>Price</th>
		</tr>

		<c:forEach var="p" items="${billProducts}" varStatus="st">
		    <tr>
		        <td>${st.count}</td>
		        <td>${p.productname}</td>
		        <td>${p.category}</td>
		        <td>₹ ${p.price}</td>
		    </tr>
		</c:forEach>
		<tr class="total-row">
			<td colspan="3"><b>Total Amount</b></td>
			<td><b>₹ ${totalAmount}</b></td>
		</tr>
	</table>

	<div class="bill-actions">
		<a href="#"  class="link-url">Place Order--></a>
		<a href="#"  class="link-url">Email Bill--></a>
		<button onclick="window.print()" class="print-btn">
			Print Bill
		</button>
	</div>
</div>

</body>
</html>