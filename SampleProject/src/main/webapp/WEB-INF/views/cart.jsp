<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart | Online Bookstore</title>
    <link rel="stylesheet" href="css/cart.css" />
    <link rel="stylesheet" href="css/common.css" />
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
	        <a href="/booksection">Book Section</a>
	        <a href="/newarrivals">New Arrivals</a>
	        <a href="/bestsellers">Best Sellers</a>
	        <form action="/search" method="get" class="search-form">
	            <input type="text" name="query" placeholder="Search books..." class="search-input">
	            <button type="submit" class="search-btn">Search</button>
	        </form>
	        <a href="/homepage">Home Page</a>
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


<!-- Main Cart Section -->
<div class="main-content">
	<section class="cart-container">
	    <h1>Your Shopping Cart</h1>
	
	    <c:if test="${empty booksInCart}">
	        <p class="empty-msg">Your cart is empty.</p>
	    </c:if>
	
	    <c:if test="${not empty booksInCart}">
	        <div class="cart-grid">
	            <c:forEach var="book" items="${booksInCart}">
	                <div class="cart-card">
	                    <h2>${book.booktitle}</h2>
	                    <p><strong>Price:</strong> ₹${book.price}</p>
	
	                    <!-- Quantity Update Form -->
	                    <form action="/cart/update" method="post" class="cart-form">
	                        <input type="hidden" name="isbnno" value="${book.isbnno}" />
	                        <label><strong>Quantity:</strong></label>
	                        <input type="number" name="quantity" min="1" value="${cartQuantities[book.isbnno]}" required />
	                        <button type="submit" class="btn-update">Update</button>
	                    </form>
	
	                    <p><strong>Total:</strong> ₹${book.price * cartQuantities[book.isbnno]}</p>
	
	                    <!-- Remove Form -->
	                    <form action="/cart/remove" method="post" class="cart-form">
	                        <input type="hidden" name="isbnno" value="${book.isbnno}" />
	                        <button type="submit" class="btn-remove">Remove</button>
	                    </form>
	                </div>
	            </c:forEach>
	        </div>
	
	        <div class="grand-total">
	            <h3>Grand Total: ₹${totalAmount}</h3>
	            <form action="/placeorder" method="post">
	    			<button type="submit" class="btn-place-order">Place Order</button>
				</form>
	            <a href="/booksection" class="btn-addmore">Add More Books</a>
	        </div>
	    </c:if>
	</section>
</div>
<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 Online Bookstore. All rights reserved.</p>
    <p><a href="/about">About</a> | <a href="/contactus">Contact Us</a></p>
</footer>

</body>
</html>
