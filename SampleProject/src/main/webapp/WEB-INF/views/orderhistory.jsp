<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/orderhistory.css" />
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

<!-- Header Section -->
<header class="header">
    <a href="/homepage" class="logo">BookStore</a>
    <nav class="nav-links">
        <a href="/booksection">Book Section</a>
        <a href="/newarrivals">New Arrivals</a>
        <a href="/bestsellers">Best Sellers</a>
        <form action="/search" method="get" class="search-form">
            <input type="text" name="query" placeholder="Search books..." class="search-input">
            <button type="submit" class="search-btn">Search</button>
        </form>
        <a href="/homepage">Home Page</a>
        <a href="/cart">Go to Cart</a>
    </nav>
    <nav class="nav-link">
    	<c:if test="${not empty sessionScope.user}">
	    		<div class="welcome-msg">Welcome, ${sessionScope.user.name}</div>
		</c:if>
        <a href="/logout">Logout</a>
    </nav>
</header>

<div class="main-content">
	<div class="order-history-container">
    <h1>Your Orders</h1>

    <c:choose>
        <c:when test="${empty orders}">
            <p class="empty">You have not placed any orders yet.</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="order" items="${orders}">
                <div class="order-card">
                    <div class="order-header">
                        <h2>Order #${order.id}</h2>
                        <span class="order-date">Date: ${order.orderDate}</span>
                    </div>
                    <p>Total: ₹${order.totalAmount}</p>
                    <p>Status: <strong>${order.status}</strong></p>

					<div class="progress-bar">
					    <div class="progress-step ${order.status == 'Placed' || order.status == 'Shipped' || order.status == 'Delivered' ? 'active placed' : ''}">Placed</div>
					    <div class="progress-step ${order.status == 'Shipped' || order.status == 'Delivered' ? 'active' : ''}">Shipped</div>
					    <div class="progress-step ${order.status == 'Delivered' ? 'active' : ''}">Delivered</div>
					</div>
				
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</div>

<!-- Footer Section -->
<footer class="footer">
    <p>&copy; 2025 Online Bookstore. All rights reserved.</p>
    <p>
        <a href="/about">About</a> |
        <a href="/contactus">Contact Us</a>
    </p>
</footer>

</body>
</html>
