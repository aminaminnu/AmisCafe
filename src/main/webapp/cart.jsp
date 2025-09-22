<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
    <title>My Cart</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        body { font-family: 'Roboto', sans-serif; background:#fdf6f6; margin:0; padding:0; }

        h2 { text-align:center; margin:30px 0; color:#e63946; font-size:32px; font-weight:700; }

        .cart-page {
            display:flex;
            justify-content: center;
            gap: 30px;
            padding: 0 20px;
            align-items: flex-start;
            flex-wrap: wrap-reverse;
        }

        .cart-container { flex:1; display:flex; flex-direction: column; gap:20px; max-width:700px; }

        .cart-card {
            display:flex; align-items:center; gap:15px;
            background:#fff; border-radius:12px; box-shadow:0 6px 18px rgba(0,0,0,0.08);
            padding:15px; transition: transform 0.3s, box-shadow 0.3s;
        }

        .cart-card:hover { transform:translateY(-3px); box-shadow:0 10px 22px rgba(0,0,0,0.12); }

        .food-img { width:120px; height:120px; object-fit:contain; border-radius:10px; background:#fff; padding:5px; }

        .cart-info { flex:1; }

        .cart-info h4 { margin:0 0 8px 0; font-size:18px; color:#333; font-weight:600; }
        .cart-info p { margin:4px 0; font-size:15px; color:#555; }

        .quantity-update { display:flex; align-items:center; gap:8px; margin:8px 0; }
        .quantity-update input[type="number"] { width:50px; padding:4px; border-radius:5px; border:1px solid #ccc; text-align:center; }

        .btn { display:inline-block; background-color:#e63946; color:#fff; padding:6px 14px; border-radius:5px; margin-top:4px; cursor:pointer; border:none; transition:0.3s; }
        .btn:hover { background-color:#d62828; transform:scale(1.05); }
        .btn-cart { background-color:#ff6b6b; }
        .btn-cart:hover { background-color:#ff4b4b; }

        .checkout-card {
            background:#fff; border-radius:12px; padding:25px; box-shadow:0 6px 18px rgba(0,0,0,0.1);
            width:300px; flex-shrink:0; height:max-content; position: sticky; top:20px;
        }

        .checkout-card select { padding:8px 12px; border-radius:5px; border:1px solid #ccc; margin-bottom:15px; width:100%; font-size:14px; }
        .checkout-card button { width:100%; padding:10px 0; font-size:16px; border-radius:6px; }

        .checkout-summary { text-align:left; margin-bottom:15px; border-bottom:1px solid #eee; padding-bottom:10px; }
        .checkout-summary p { margin:4px 0; font-size:15px; color:#333; font-weight:500; }

        @media (max-width:900px) {
            .cart-page { flex-direction: column; align-items: center; }
            .checkout-card { position: static; width:95%; margin-bottom:30px; }
            .cart-container { width:95%; }
            .cart-card { flex-direction: column; align-items:center; text-align:center; }
            .food-img { width:150px; height:150px; }
        }
    </style>
</head>
<body>

<h2>🛒 Your Cart</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center; color:#555;">
        Your cart is empty. <a href="menu.jsp" class="btn">Browse Menu</a>
    </p>
</c:if>

<c:if test="${not empty cartItems}">
    <div class="cart-page">
        <div class="cart-container">
            <c:set var="totalAmount" value="0" />
            <c:forEach var="cart" items="${cartItems}">
                <c:set var="itemTotal" value="${cart.menuItem.price * cart.quantity}" />
                <c:set var="totalAmount" value="${totalAmount + itemTotal}" />

                <div class="cart-card">
                    <img src="${cart.menuItem.image != null ? cart.menuItem.image : 'assets/images/default-food.png'}" alt="${cart.menuItem.name}" class="food-img"/>
                    <div class="cart-info">
                        <h4>${cart.menuItem.name}</h4>
                        <p>Price: ₹<fmt:formatNumber value="${cart.menuItem.price}" minFractionDigits="2" maxFractionDigits="2"/></p>

                        <div class="quantity-update">
                            <form action="updateCartQuantity" method="post">
                                <input type="hidden" name="cartId" value="${cart.id}" />
                                <input type="number" name="quantity" value="${cart.quantity}" min="1" />
                                <button type="submit" class="btn">Update</button>
                            </form>
                        </div>

                        <p>Total: ₹<fmt:formatNumber value="${itemTotal}" minFractionDigits="2" maxFractionDigits="2"/></p>

                        <form action="removeCartItem" method="post">
                            <input type="hidden" name="cartId" value="${cart.id}" />
                            <button type="submit" class="btn btn-cart">Remove</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Checkout Card -->
        <div class="checkout-card">
            <div class="checkout-summary">
                <p>Total Items: <c:out value="${fn:length(cartItems)}"/></p>
                <p>Total Amount: ₹<fmt:formatNumber value="${totalAmount}" minFractionDigits="2" maxFractionDigits="2"/></p>
            </div>

            <form action="checkout" method="post">
                <c:forEach var="cart" items="${cartItems}">
                    <input type="hidden" name="menuItemId" value="${cart.menuItem.id}" />
                    <input type="hidden" name="quantity" value="${cart.quantity}" />
                </c:forEach>

               
                <button type="submit" class="btn">Checkout</button>
            </form>
        </div>
    </div>
</c:if>

</body>
</html>
