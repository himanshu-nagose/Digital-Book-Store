<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Search Results</title>
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/searchresults.css" />
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

<header class="header">
    <a href="/home" class="logo">BookStore</a>
    <nav class="nav-links">
        <a href="/newarrivals">New Arrivals</a>
        <a href="/bestsellers">Best Sellers</a>
        <a href="/homepage">Home Page</a>
        <form action="/search" method="get" class="search-form">
            <input type="text" name="query" placeholder="Search books..." class="search-input">
            <button type="submit" class="search-btn">Search</button>
        </form>
        <a href="/cart">Go to Cart</a>
        <a href="/orderhistory">Order History</a> 
    </nav>
    <nav class="nav-link">
	    <c:if test="${not empty sessionScope.user}">
	    	<div class="welcome-msg">Welcome, ${sessionScope.user.name}</div>
		</c:if>
	    <a href="/logout">Logout</a>
        <a href="/profile">Profile</a>
    </nav>
</header>

<div class="main-content">
<c:choose>
    <c:when test="${empty searchResults}">
        <div class="no-results">
            <h2>No books found matching your search.</h2>
            <p>Please try a different keyword or check back later.</p>
        </div>
    </c:when>
    <c:otherwise>
        <div class="book-grid">
            <c:forEach var="book" items="${searchResults}">
                <div class="book-card">
                    <h3>${book.booktitle}</h3>
                    <p>Author: ${book.authorname}</p>
                    <p>Category: ${book.category}</p>
                    <p class="price">Price: ₹${book.price}</p>
                    <p class="discount">Discount: ${book.discount}%</p>

                    <c:choose>
                        <c:when test="${book.stockquantity == 0}">
                            <div class="stock-status out-of-stock">Out of Stock</div>
                        </c:when>
                        <c:when test="${book.stockquantity <= 5}">
                            <div class="stock-status low-stock">Low Stock (${book.stockquantity})</div>
                        </c:when>
                        <c:otherwise>
                            <div class="stock-status in-stock">In Stock (${book.stockquantity})</div>
                        </c:otherwise>
                    </c:choose>

                    <form action="/cart/add" method="post">
                        <input type="hidden" name="isbnno" value="${book.isbnno}" />
                        <button type="submit" class="add-to-cart" <c:if test="${book.stockquantity == 0}">disabled</c:if>>
                            Add to Cart
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>
	
	
</div>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 Online Bookstore. All rights reserved.</p>
    <p><a href="/about">About</a> | <a href="/contactus">Contact Us</a></p>
</footer>
</body>
</html>