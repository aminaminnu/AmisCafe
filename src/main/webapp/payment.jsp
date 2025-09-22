<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Payment</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        body {
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background:#fafafa;
            margin:20px;
        }
        h2 {
            text-align:center;
            margin-bottom:30px;
            color:#222;
            font-size:28px;
        }
        .payment-container {
            display:flex;
            flex-direction:column;
            align-items:center;
            gap:20px;
        }
        .payment-card {
            background:#fff;
            border-radius:12px;
            box-shadow:0 6px 18px rgba(0,0,0,0.1);
            width:350px;
            padding:20px;
            text-align:center;
        }
        .payment-card table {
            width:100%;
            border-collapse:collapse;
            margin-bottom:15px;
        }
        .payment-card table, th, td {
            border:1px solid #ccc;
        }
        th, td {
            padding:8px;
            text-align:center;
        }
        th {
            background:#f2f2f2;
        }
        .grand-total {
            font-weight:600;
            font-size:16px;
        }
        .payment-options {
            text-align:left;
            margin:12px 0;
        }
        .btn {
            display:inline-block;
            background-color:#ff4b5c;
            color:#fff;
            padding:8px 18px;
            font-weight:500;
            text-decoration:none;
            border-radius:5px;
            margin-top:10px;
            cursor:pointer;
            transition:0.3s;
        }
        .btn:hover { background-color:#ff2e44; transform:scale(1.05); }
        .btn-cancel { background-color:#aaa; margin-left:10px; }
        .btn-cancel:hover { background-color:#888; transform:scale(1.05); }
        @media (max-width:600px) { .payment-card { width:90%; } }
    </style>
</head>
<body>

<h2>🛒 Payment Page</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center; color:#666;">Your cart is empty. <a href="menu.jsp" class="btn">Browse Menu</a></p>
</c:if>

<c:if test="${not empty cartItems}">
    <div class="payment-container">
        <div class="payment-card">
            <table>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Total</th>
                </tr>
                <c:set var="grandTotal" value="0" />
                <c:forEach var="cart" items="${cartItems}">
                    <c:set var="itemTotal" value="${cart.menuItem.price * cart.quantity}" />
                    <c:set var="grandTotal" value="${grandTotal + itemTotal}" />
                    <tr>
                        <td>${cart.menuItem.name}</td>
                        <td>₹<fmt:formatNumber value="${cart.menuItem.price}" minFractionDigits="2"/></td>
                        <td>${cart.quantity}</td>
                        <td>₹<fmt:formatNumber value="${itemTotal}" minFractionDigits="2"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <th colspan="3">Grand Total</th>
                    <th class="grand-total">₹<fmt:formatNumber value="${grandTotal}" minFractionDigits="2"/></th>
                </tr>
            </table>

            <form action="${pageContext.request.contextPath}/checkout" method="post">
                <input type="hidden" name="grandTotal" value="${grandTotal}" />
                <c:forEach var="cart" items="${cartItems}">
                    <input type="hidden" name="menuItemId" value="${cart.menuItem.id}" />
                    <input type="hidden" name="quantity" value="${cart.quantity}" />
                </c:forEach>
  
         <!-- Delivery Address -->
        <label>Delivery Address:</label>
        <textarea name="deliveryAddress" rows="3" placeholder="Enter full delivery address" required>${deliveryAddress != null ? deliveryAddress : ''}</textarea>
  
  
                <div class="payment-options">
                    <label><input type="radio" name="paymentMethod" value="UPI" required> UPI</label><br>
                    <label><input type="radio" name="paymentMethod" value="Card"> Credit/Debit Card</label><br>
                    <label><input type="radio" name="paymentMethod" value="COD"> Cash on Delivery</label>
                </div>

                <button type="submit" class="btn">Pay Now</button>
                <button type="button" class="btn btn-cancel" onclick="window.history.back();">Cancel</button>
            </form>
        </div>
    </div>
</c:if>

</body>
</html>
