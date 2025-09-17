<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Order Success</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        .success-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 25px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-card h2 {
            color: #28a745;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            background-color: #ff4b5c;
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 15px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn:hover {
            background-color: #ff2e44;
            transform: scale(1.05);
        }
        p {
            margin: 8px 0;
            color: #333;
        }
    </style>
</head>
<body>

<div class="success-card">
    <h2>🎉 Your order has been placed successfully!</h2>

    <c:if test="${not empty orders}">
        <table>
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <c:set var="grandTotal" value="0" />
            <c:forEach var="order" items="${orders}">
                <c:set var="grandTotal" value="${grandTotal + order.totalPrice}" />
                <tr>
                    <td>${order.menuItem.name}</td>
                    <td>₹<fmt:formatNumber value="${order.menuItem.price}" minFractionDigits="2"/></td>
                    <td>${order.quantity}</td>
                    <td>₹<fmt:formatNumber value="${order.totalPrice}" minFractionDigits="2"/></td>
                </tr>
            </c:forEach>
            <tr>
                <th colspan="3">Grand Total</th>
                <th>₹<fmt:formatNumber value="${grandTotal}" minFractionDigits="2"/></th>
            </tr>
        </table>

        <p><b>Delivery Address:</b> ${orders[0].deliveryAddress}</p>
        <p><b>Payment Method:</b> ${paymentMethod}</p>
    </c:if>

    <a href="myOrders" class="btn">View My Orders</a>
    <a href="menu.jsp" class="btn">Back to Menu</a>
</div>

</body>
</html>
