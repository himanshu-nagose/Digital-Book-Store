<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation | Online Bookstore</title>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/placeorder.css" />
</head>
<body>

<c:if test="${empty sessionScope.user}">
    <div id="session-expired-overlay">
        <h2>Session Expired</h2>
        <p>Your session has timed out. Please choose an option below.</p>
        <div class="btn-group">
            <a href="/userlogin">Login</a>
            <a href="/home">Home</a>
        </div>
    </div>
</c:if>

<!-- Header -->
<header class="header">
    <a href="/home" class="logo">BookStore</a>
    <nav class="nav-links">
        <a href="/booksection">Book Section</a>
        <a href="/newarrivals">New Arrivals</a>
        <a href="/bestsellers">Best Sellers</a>
        <a href="/orderhistory">Order History</a>
        <a href="/profile">Profile</a>
        <a href="/logout">Logout</a>
    </nav>
</header>


<section class="confirmation">
    <h1>Thank You for Your Purchase!</h1>
    <p>${orderSuccess}</p>
    <a href="/orderhistory" class="btn">View Order History</a>
    <a href="/booksection" class="btn">Continue Shopping</a>
</section>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 Online Bookstore. All rights reserved.</p>
</footer>

</body>
</html>
