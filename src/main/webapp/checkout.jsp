<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Checkout</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        body { font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background:#fafafa; margin:20px; }
        h2 { text-align:center; margin-bottom:30px; color:#222; font-size:28px; }
        .checkout-container { display:flex; flex-direction:column; align-items:center; gap:20px; }
        .checkout-card {
            background:#fff;
            border-radius:12px;
            box-shadow:0 6px 18px rgba(0,0,0,0.1);
            width:300px;
            padding:20px;
            text-align:center;
        }
        .checkout-card h4 { margin:10px 0 5px; color:#333; }
        .checkout-card p { margin:6px 0; color:#555; font-size:15px; }
        .food-img { width:100%; height:160px; object-fit:contain; border-radius:10px; margin-bottom:12px; background:#fff; padding:8px; box-sizing:border-box; }
        .grand-total { font-size:18px; font-weight:600; margin-top:12px; }
        .payment-method { text-align:left; margin:12px 0; }
        .btn { display:inline-block; background-color:#ff4b5c; color:#fff; padding:8px 18px; font-weight:500; text-decoration:none; border-radius:5px; margin-top:10px; cursor:pointer; transition:0.3s; }
        .btn:hover { background-color:#ff2e44; transform:scale(1.05); }
        .btn-cancel { background-color:#aaa; margin-left:10px; }
        .btn-cancel:hover { background-color:#888; transform:scale(1.05); }
        input[type="number"] { width:50px; padding:4px; border-radius:4px; border:1px solid #ccc; text-align:center; }
        @media (max-width:600px) { .checkout-card { width:90%; } }
    </style>
</head>
<body>

<h2>🛒 Checkout</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center; color:#666;">Your cart is empty. <a href="menu.jsp" class="btn">Browse Menu</a></p>
</c:if>

<c:if test="${not empty cartItems}">
    <form action="placeOrderSubmit" method="post" class="checkout-container">
        <c:set var="grandTotal" value="0" />

        <c:forEach var="cart" items="${cartItems}">
            <c:set var="itemTotal" value="${cart.menuItem.price * cart.quantity}" />
            <c:set var="grandTotal" value="${grandTotal + itemTotal}" />

            <div class="checkout-card">
                <c:choose>
                    <c:when test="${not empty cart.menuItem.image}">
                        <img src="${cart.menuItem.image}" alt="${cart.menuItem.name}" class="food-img"/>
                    </c:when>
                    <c:otherwise>
                        <img src="assets/images/default-food.png" alt="Default Food" class="food-img"/>
                    </c:otherwise>
                </c:choose>

                <h4>${cart.menuItem.name}</h4>
                <p>Price: ₹<fmt:formatNumber value="${cart.menuItem.price}" minFractionDigits="2" maxFractionDigits="2"/></p>
                <p>Quantity: <input type="number" name="quantity_${cart.menuItem.id}" value="${cart.quantity}" min="1" required /></p>
                <p>Total: ₹<fmt:formatNumber value="${itemTotal}" minFractionDigits="2" maxFractionDigits="2"/></p>
                <input type="hidden" name="menuItemId" value="${cart.menuItem.id}" />
            </div>
        </c:forEach>
        
         <!-- Add Delivery Address field here -->
         <label>Delivery Address:</label>
         <textarea name="deliveryAddress" rows="3" placeholder="Enter full delivery address" required>${deliveryAddress != null ? deliveryAddress : ''}</textarea>
        

        <p class="grand-total">Grand Total: ₹<fmt:formatNumber value="${grandTotal}" minFractionDigits="2" maxFractionDigits="2"/></p>

        <div class="payment-method">
            <label><input type="radio" name="paymentMethod" value="UPI" required> UPI</label><br>
            <label><input type="radio" name="paymentMethod" value="Card"> Credit/Debit Card</label><br>
            <label><input type="radio" name="paymentMethod" value="COD"> Cash on Delivery</label>
        </div>

        <div>
            <button type="submit" class="btn">Place & Pay</button>
            <button type="button" onclick="window.history.back();" class="btn btn-cancel">Cancel</button>
        </div>
    </form>
</c:if>

</body>
</html>
