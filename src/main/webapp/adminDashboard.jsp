<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f6f8;
            color: #333;
        }
        .header {
            background: #4CAF50;
            color: white;
            padding: 20px 40px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        /* Logout Button */
        .header a.logout {
            position: absolute;
            top: 25px;
            right: 40px;
            padding: 8px 12px;
            background: #e74c3c;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
        }

        .header a.logout:hover {
            background: #c0392b;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 40px auto;
            gap: 20px;
        }
        .card {
            background: white;
            padding: 30px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 220px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
        .card h3 {
            margin: 0 0 10px;
        }
        .card p {
            font-size: 14px;
            color: #555;
        }
        .card a {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
        }
        .card a:hover {
            background: #45a049;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #4CAF50;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background: #4CAF50;
            color: white;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        button {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            background: #e74c3c;
            color: white;
            cursor: pointer;
            font-weight: 500;
        }

        button:hover {
            background: #c0392b;
        }

        a.back-link {
            display: inline-block;
            margin: 20px auto;
            padding: 8px 14px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        a.back-link:hover {
            background: #555;
        }

        .success-message {
            text-align: center;
            color: #2ecc71;
            font-weight: 500;
            margin-top: 10px;
        }

        @media(max-width: 768px) {
            .dashboard {
                flex-direction: column;
                align-items: center;
            }
            table {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Admin Dashboard</h1>
    <c:if test="${not empty sessionScope.user}">
        <a href="logout" class="logout">Logout</a>
    </c:if>
</div>

<c:choose>
    <c:when test="${section == 'dashboard'}">
        <div class="dashboard">
            <div class="card">
                <h3>👤 Users</h3>
                <p>Manage all registered users</p>
                <a href="admin?action=viewUsers">View Users</a>
            </div>
            <div class="card">
                <h3>🍽 Bookings</h3>
                <p>View and manage table bookings</p>
                <a href="admin?action=viewBookings">View Bookings</a>
            </div>
            <div class="card">
                <h3>📦 Orders</h3>
                <p>View and manage customer orders</p>
                <a href="admin?action=viewOrders">View Orders</a>
            </div>
            <div class="card">
                <h3>📩 Contacts</h3>
                <p>View customer messages</p>
                <a href="admin?action=viewContacts">View Contacts</a>
            </div>
        </div>
    </c:when>

    <c:when test="${section == 'users'}">
        <h2>All Users</h2>
        <c:if test="${param.deleted == 'true'}">
            <div class="success-message">✅ User deleted successfully.</div>
        </c:if>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Action</th>
            </tr>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td>${u.role}</td>
                    <td>
                        <form method="post" action="admin" style="display:inline;">
                            <input type="hidden" name="action" value="deleteUser" />
                            <input type="hidden" name="userId" value="${u.id}" />
                            <button type="submit" onclick="return confirm('Delete user?');">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="admin" class="back-link">⬅ Back to Dashboard</a>
    </c:when>

    <c:when test="${section == 'bookings'}">
        <h2>All Bookings</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Date</th><th>Time</th><th>People</th><th>Action</th>
            </tr>
            <c:forEach var="b" items="${bookings}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.name}</td>
                    <td>${b.email}</td>
                    <td>${b.phone}</td>
                    <td>${b.date}</td>
                    <td>${b.time}</td>
                    <td>${b.people}</td>
                    <td>
                        <form method="post" action="admin" style="display:inline;">
                            <input type="hidden" name="action" value="deleteBooking" />
                            <input type="hidden" name="bookingId" value="${b.id}" />
                            <button type="submit" onclick="return confirm('Delete booking?');">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="admin" class="back-link">⬅ Back to Dashboard</a>
    </c:when>

    <c:when test="${section == 'orders'}">
        <h2>All Orders</h2>
        <table>
            <tr>
                <th>ID</th><th>User</th><th>Item</th><th>Qty</th><th>Total</th><th>Date</th><th>Action</th>
            </tr>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.user.name}</td>
                    <td>${o.menuItem.name}</td>
                    <td>${o.quantity}</td>
                    <td>${o.totalPrice}</td>
                    <td>${o.orderDate}</td>
                    <td>
                        <form method="post" action="admin" style="display:inline;">
                            <input type="hidden" name="action" value="deleteOrder" />
                            <input type="hidden" name="orderId" value="${o.id}" />
                            <button type="submit" onclick="return confirm('Delete order?');">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="admin" class="back-link">⬅ Back to Dashboard</a>
    </c:when>

    <c:when test="${section == 'contacts'}">
        <h2>Contact Messages</h2>
        <c:if test="${param.deleted == 'true'}">
            <div class="success-message">✅ Contact deleted successfully.</div>
        </c:if>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Subject</th><th>Message</th><th>Action</th>
            </tr>
            <c:forEach var="c" items="${contacts}">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.email}</td>
                    <td>${c.subject}</td>
                    <td>${c.message}</td>
                    <td>
                        <form method="post" action="admin" style="display:inline;">
                            <input type="hidden" name="action" value="deleteContact" />
                            <input type="hidden" name="contactId" value="${c.id}" />
                            <button type="submit" onclick="return confirm('Delete message?');">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="admin" class="back-link">⬅ Back to Dashboard</a>
    </c:when>
</c:choose>

</body>
</html>
