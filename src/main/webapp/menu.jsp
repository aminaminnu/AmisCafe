<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Menu</title>
    <link href="assets/css/menu.css" rel="stylesheet" />
    <style>
        /* ✅ Card and container styling with pastel backgrounds */
        .menu-container, .cuisine-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card, .cuisine-card {
            border: 1px solid #e0e0e0;
            padding: 15px;
            border-radius: 10px;
            width: 200px;
            text-align: center;
            background: #fdf6f6; /* soft pastel pinkish-beige */
            box-shadow: 0 2px 5px rgba(0,0,0,0.08);
            transition: transform 0.2s;
        }

        .card:hover, .cuisine-card:hover {
            transform: translateY(-5px);
        }

        .food-img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .card-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
            flex-wrap: wrap;
        }

        .card-actions input[type="number"] {
            width: 60px;
            padding: 4px;
            border-radius: 4px;
            border: 1px solid #ccc;
            text-align: center;
        }

        /* ✅ Red theme buttons */
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: #dc3545;   /* Red */
            color: #fff;
            transition: background 0.2s ease;
        }

        .btn:hover {
            background: #c82333;   /* Darker red */
        }

        .btn-addcart {
            background-color: #e63946;  /* Brighter red */
            color: #fff;
        }

        .btn-addcart:hover {
            background-color: #d62828;  /* Darker red on hover */
        }

        /* ✅ Floating right-side cart button */
        .floating-cart {
            position: fixed;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
            z-index: 1000;
        }

        .floating-cart a {
            padding: 12px 16px;
            font-size: 16px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            border-radius: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.2s;
        }

        .floating-cart a:hover {
            transform: scale(1.1);
        }

        /* ✅ Attractive menu heading */
        .menu-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .menu-heading h1 {
            font-family: 'Roboto', sans-serif;
            font-size: 36px;
            font-weight: 700;
            color: #e63946;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }

        .menu-heading p {
            font-size: 18px;
            color: #555;
            font-weight: 500;
        }
    </style>
</head>
<body>

<!-- Right-side floating View Cart button -->
<div class="floating-cart">
    <a href="viewCart" class="btn btn-addcart">🛒 View Cart</a>
</div>

<!-- Attractive Menu Heading -->
<div class="menu-heading">
    <h1>
        <c:choose>
            <c:when test="${not empty param.cuisine and not empty param.type}">
                ${param.cuisine} - ${param.type} Menu
            </c:when>
            <c:otherwise>
                Our Delicious Menu
            </c:otherwise>
        </c:choose>
    </h1>
    <p>Explore our wide variety of dishes and order your favorites!</p>
</div>

<c:if test="${not empty param.error}">
    <div style="text-align:center; margin-bottom:20px; color:red;">
        <c:choose>
            <c:when test="${param.error eq 'PleaseLogin'}">⚠️ Please log in to place an order.</c:when>
            <c:when test="${param.error eq 'InvalidQuantity'}">⚠️ Quantity must be at least 1.</c:when>
            <c:when test="${param.error eq 'MenuItemNotFound'}">⚠️ Selected menu item not found.</c:when>
            <c:when test="${param.error eq 'OrderFailed'}">❌ Failed to place your order. Try again.</c:when>
            <c:when test="${param.error eq 'InvalidInput'}">⚠️ Invalid input provided.</c:when>
            <c:when test="${param.error eq 'ServerError'}">❌ Server error. Please try later.</c:when>
            <c:otherwise>⚠️ Unknown error occurred.</c:otherwise>
        </c:choose>
    </div>
</c:if>

<c:if test="${not empty param.success}">
    <div style="text-align:center; margin-bottom:20px; color:green;">
        ✅ Order placed successfully!
    </div>
</c:if>

<c:choose>
    <c:when test="${empty param.cuisine or empty param.type}">
        <div class="cuisine-container">
            <c:set var="cuisines" value="Indian,Chinese,Italian,Continental" />
            <c:set var="types" value="veg,nonveg,specials" />

            <c:forEach var="cuisine" items="${fn:split(cuisines, ',')}">
                <div class="cuisine-card">
                    <h3>${cuisine}</h3>
                    <c:forEach var="type" items="${fn:split(types, ',')}">
                        <a href="menu?cuisine=${cuisine}&type=${type}" class="btn btn-addcart">${type}</a>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </c:when>

    <c:otherwise>
        <div class="menu-container">
            <c:forEach var="item" items="${menuItems}">
                <div class="card">
                    <img src="${item.image != null ? item.image : 'assets/images/default-food.png'}" 
                         alt="${item.name}" class="food-img"/>
                    <h4>${item.name}</h4>
                    <p>₹<fmt:formatNumber value="${item.price}" minFractionDigits="2" maxFractionDigits="2"/></p>

                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <div class="card-actions">
                                <form action="${pageContext.request.contextPath}/placeOrderSubmit" method="post">
                                    <input type="hidden" name="menuItemId" value="${item.id}" />
                                    <input type="hidden" name="cuisine" value="${param.cuisine}" />
                                    <input type="hidden" name="type" value="${param.type}" />
                                    
                                    <input type="number" name="quantity" value="1" min="1" required />
                                    <input type="hidden" name="paymentMethod" value="COD" />
                                    <input type="hidden" name="deliveryAddress" value="Default Address" />
                                    <button type="submit" class="btn">Order Now</button>
                                </form>

                                <form action="addToCart" method="post">
                                    <input type="hidden" name="menuItemId" value="${item.id}" />
                                    <input type="hidden" name="quantity" value="1" />
                                    <button type="submit" class="btn btn-addcart">Add to Cart</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-actions">
                                <input type="number" value="1" disabled />
                                <button type="button" class="btn" 
                                        onclick="window.location.href='index.jsp?showLogin=true'">Order Now</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>
