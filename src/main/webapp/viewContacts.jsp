<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin - View Contacts</title>
    <link href="assets/css/admin.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .contacts-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 10px;
        }
        .contact-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
            width: 300px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .contact-card p {
            margin: 5px 0;
            font-size: 14px;
        }
        .card-buttons {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
        }
        .card-buttons a {
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .view-btn { background-color: #007bff; }
        .view-btn:hover { background-color: #0056b3; }
        .delete-btn { background-color: #dc3545; }
        .delete-btn:hover { background-color: #a71d2a; }

        .alert {
            max-width: 500px;
            margin: 10px auto;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
        }
        .alert-success { background-color: #d4edda; color: #155724; }
        .alert-danger { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>

<h2>Contact Messages</h2>

<c:if test="${param.deleted == 'true'}">
    <div class="alert alert-success">✅ Message deleted successfully.</div>
</c:if>

<c:if test="${param.error == 'true'}">
    <div class="alert alert-danger">❌ Something went wrong. Please try again.</div>
</c:if>

<c:if test="${empty contacts}">
    <p style="text-align:center;">No messages found.</p>
</c:if>

<div class="contacts-container">
    <c:forEach var="c" items="${contacts}">
        <div class="contact-card">
            <p><strong>ID:</strong> ${c.id}</p>
            <p><strong>Name:</strong> ${c.name}</p>
            <p><strong>Email:</strong> ${c.email}</p>
            <p><strong>Subject:</strong> ${c.subject}</p>
            <div class="card-buttons">
                <a class="view-btn" href="contactController?action=view&id=${c.id}">View</a>
                <a class="delete-btn" href="contact?action=delete&id=${c.id}" onclick="return confirm('Delete this message?')">Delete</a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
