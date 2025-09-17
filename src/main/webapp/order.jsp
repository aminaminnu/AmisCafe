<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Confirm & Pay</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        .order-card {
            max-width: 400px;
            margin: 40px auto;
            padding: 25px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }
        .order-card img {
            width: 100%;
            height: 200px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 12px;
            background-color: #fff;
            padding: 8px;
            box-sizing: border-box;
        }
        h3 {
            margin: 10px 0;
            color: #333;
        }
        p {
            margin: 6px 0;
            font-size: 15px;
            color: #555;
        }
        label {
            display: block;
            margin-top: 10px;
            text-align: left;
        }
        textarea, input[type=number] {
            width: 100%;
            padding: 6px;
            margin-top: 4px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            background-color: #ff4b5c;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            margin-top: 15px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn:hover {
            background-color: #ff2e44;
            transform: scale(1.05);
        }
        .btn-cancel {
            background-color: #ccc;
            color: #000;
            margin-left: 10px;
        }
        .payment-options {
            text-align: left;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<c:if test="${empty menuItem}">
    <script>
        alert("⚠️ Menu item not found. Redirecting to menu.");
        window.location.href = 'menu.jsp';
    </script>
</c:if>

<div class="order-card">
    <c:choose>
        <c:when test="${not empty menuItem.image}">
            <img src="${menuItem.image}" alt="${menuItem.name}" />
        </c:when>
        <c:otherwise>
            <img src="assets/images/default-food.png" alt="Default Food" />
        </c:otherwise>
    </c:choose>

    <h3>${menuItem.name}</h3>
    <p>Price: ₹<fmt:formatNumber value="${menuItem.price}" minFractionDigits="2" maxFractionDigits="2"/></p>

    <form action="placeOrderSubmit" method="post">
        <input type="hidden" name="menuItemId" value="${menuItem.id}" />

        <label>Quantity:</label>
        <input type="number" name="quantity" value="${quantity != null ? quantity : 1}" min="1" required />

        <label>Delivery Address:</label>
        <textarea name="deliveryAddress" rows="3" placeholder="Enter full delivery address" required>${deliveryAddress != null ? deliveryAddress : ''}</textarea>

        <p>Total: ₹<span id="total"><fmt:formatNumber value="${menuItem.price * (quantity != null ? quantity : 1)}" minFractionDigits="2" maxFractionDigits="2"/></span></p>

        <div class="payment-options">
            <label><input type="radio" name="paymentMethod" value="UPI" required> UPI</label>
            <label><input type="radio" name="paymentMethod" value="Card"> Credit/Debit Card</label>
            <label><input type="radio" name="paymentMethod" value="COD"> Cash on Delivery</label>
        </div>

        <button type="submit" class="btn">Place & Pay</button>
        <button type="button" class="btn btn-cancel" onclick="window.history.back();">Cancel</button>
    </form>
</div>

<script>
    const qtyInput = document.querySelector('input[name="quantity"]');
    const totalSpan = document.getElementById('total');
    const price = parseFloat('${menuItem.price}');

    qtyInput.addEventListener('input', function() {
        let qty = parseInt(this.value);
        if (isNaN(qty) || qty < 1) qty = 1;
        totalSpan.textContent = '₹' + (price * qty).toFixed(2);
    });
</script>

</body>
</html>
