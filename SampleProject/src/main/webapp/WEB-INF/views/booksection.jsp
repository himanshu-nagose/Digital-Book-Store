<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | Book Section</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/booksection.css">
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

<!-- Book Grid Section -->
<section class="book-section">
    <h1>Book Section</h1>
    <div class="book-card-grid">
        <!-- 🟢 First: Show In-Stock Books -->
        <c:forEach var="book" items="${bookList}">
            <c:if test="${book.stockquantity > 0}">
                <div class="book-card">
                    <h2>${book.booktitle}</h2>
                    <p><strong>Author:</strong> ${book.authorname}</p>
                    <p><strong>Category:</strong> ${book.category}</p>
                    <p class="price">Price: ₹${book.price}</p>
       			    <p class="discount">Discount: ${book.discount}%</p>

		            <!-- Stock Badge -->
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
		                    
                    <form action="/addToCart" method="post">
                        <input type="hidden" name="isbnno" value="${book.isbnno}" />
                        <input 
                            type="number" 
                            class="qty-input" 
                            name="quantity" 
                            value="1" 
                            min="1" 
                            max="${book.stockquantity}" 
                        />
                        <button type="submit" class="btn-add">Add to Cart</button>
                    </form>
                </div>
            </c:if>
        </c:forEach>

        <!-- 🔴 Then: Show Out-of-Stock Books -->
        <c:forEach var="book" items="${bookList}">
            <c:if test="${book.stockquantity == 0}">
                <div class="book-card out-of-stock">
                    <h2>${book.booktitle}</h2>
                    <p><strong>Author:</strong> ${book.authorname}</p>
                    <p><strong>Category:</strong> ${book.category}</p>
                    <p><strong>Price:</strong> ₹${book.price}</p>
                    <p class="stock-out"><strong>Status:</strong> Out of Stock</p>

                    <form>
                        <input type="number" class="qty-input" value="0" disabled />
                        <button class="btn-add" disabled>Out of Stock</button>
                    </form>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 Online Bookstore. All rights reserved.</p>
    <p><a href="/about">About</a> | <a href="/contactus">Contact Us</a></p>
</footer>

</body>
</html>
