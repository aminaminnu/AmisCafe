<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>My Orders</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        .orders-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .order-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }
        .order-card img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 10px;
            background-color: #fff;
            padding: 8px;
            box-sizing: border-box;
        }
        .order-card h4 {
            margin: 8px 0;
            font-size: 18px;
            color: #333;
        }
        .order-card p {
            margin: 6px 0;
            font-size: 15px;
            color: #555;
        }
        .no-orders {
            text-align: center;
            font-size: 16px;
            color: #666;
            margin-top: 40px;
        }
        .btn {
            display: inline-block;
            background-color: #ff4b5c;
            color: #fff;
            padding: 8px 18px;
            font-weight: 500;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #ff2e44;
        }
    </style>
</head>
<body>

<h2>🛒 My Orders</h2>

<c:if test="${empty orders}">
    <p class="no-orders">You have no past orders yet. <a href="menu.jsp" class="btn">Browse Menu</a></p>
</c:if>

<c:if test="${not empty orders}">
    <div class="orders-container">
        <c:forEach var="order" items="${orders}">
            <div class="order-card">
                <c:choose>
                    <c:when test="${not empty order.menuItem.image}">
                        <img src="${order.menuItem.image}" alt="${order.menuItem.name}" />
                    </c:when>
                    <c:otherwise>
                        <img src="assets/images/default-food.png" alt="Default Food" />
                    </c:otherwise>
                </c:choose>

                <h4>${order.menuItem.name}</h4>
                <p>Price: ₹<fmt:formatNumber value="${order.menuItem.price}" minFractionDigits="2"/></p>
                <p>Quantity: ${order.quantity}</p>
                <p>Total: ₹<fmt:formatNumber value="${order.totalPrice}" minFractionDigits="2"/></p>
                <p>Order Date: <fmt:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy HH:mm"/></p>
                <p>Delivery Address: ${order.deliveryAddress}</p>
                <p>Payment: ${order.paymentMethod}</p>
            </div>
        </c:forEach>
    </div>
</c:if>

</body>
</html>
