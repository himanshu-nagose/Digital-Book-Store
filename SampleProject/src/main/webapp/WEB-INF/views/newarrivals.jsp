<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Bookstore | New Arrivals</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/newarrivals.css">
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
            <a href="/bestsellers">Best Sellers</a> 
            <a href="/homepage">Home Page</a>
            <!-- ✅ Search Bar -->
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
	
	
    <h1 class="section-title">New Arrivals</h1>
    <c:choose>
        <c:when test="${empty newBooks}">
            <p class="no-books">No new books available right now.</p>
        </c:when>
        <c:otherwise>
            <div class="book-grid">
                <c:forEach var="book" items="${newBooks}">
                    <c:if test="${book.stockquantity > 0}">
                        <div class="book-card">
                            <span class="new-tag">NEW</span>
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
                                <input type="number" name="quantity" value="1" min="1" max="${book.stockquantity}" class="qty-input"/>
                                <button type="submit" class="btn-add">Add to Cart</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
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