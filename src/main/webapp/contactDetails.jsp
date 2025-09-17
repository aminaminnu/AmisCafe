<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin - Contact Details</title>
    <link href="assets/css/admin.css" rel="stylesheet" />
    <style>
        .contact-details {
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .contact-details h2 { margin-bottom: 20px; }
        .contact-details p { margin: 8px 0; font-size: 16px; }
        .back-link { display: inline-block; margin-top: 20px; color: #007bff; text-decoration: none; }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="contact-details">
        <h2>Contact Message Details</h2>

        <c:if test="${not empty contact}">
            <p><strong>ID:</strong> ${contact.id}</p>
            <p><strong>Name:</strong> ${contact.name}</p>
            <p><strong>Email:</strong> ${contact.email}</p>
            <p><strong>Subject:</strong> ${contact.subject}</p>
            <p><strong>Message:</strong></p>
            <p>${contact.message}</p>
        </c:if>

        <c:if test="${empty contact}">
            <p>Contact message not found.</p>
        </c:if>

        <a class="back-link" href="contact?action=list">← Back to Contact List</a>
    </div>
</body>
</html>
