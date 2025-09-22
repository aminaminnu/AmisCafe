<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Confirm Order</title>
</head>
<body>
<h2>Confirm Your Order</h2>

<form action="placeOrderSubmit" method="post">
    <input type="hidden" name="menuItemId" value="${param.menuItemId}" />
    <input type="hidden" name="quantity" value="${param.quantity}" />
    <input type="hidden" name="cuisine" value="${param.cuisine}" />
    <input type="hidden" name="type" value="${param.type}" />

    <p>Quantity: ${param.quantity}</p>
    <p>Enter Delivery Address:</p>
    <textarea name="deliveryAddress" required></textarea>

    <p>Select Payment Method:</p>
    <select name="paymentMethod" required>
        <option value="COD">Cash on Delivery</option>
        <option value="CARD">Credit/Debit Card</option>
        <option value="UPI">UPI</option>
    </select>

    <br/><br/>
    <button type="submit">Place Order</button>
</form>
</body>
</html>

