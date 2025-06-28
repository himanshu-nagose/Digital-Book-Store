<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | Home Page</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/homepage.css">
</head>
<body>

	<!-- Header Section -->
	<header class="header">
        <a href="/home" class="logo">BookStore</a>
        <nav class="nav-links">
        	<a href="/booksection">Book Section</a>
        	<a href="/newarrivals">New Arrivals</a>
            <a href="/bestsellers">Best Sellers</a> 
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

    <!-- Hero Section -->
    <section class="hero">
        <h1>Welcome to the Online Bookstore</h1>
        <p>Discover a world of books at unbeatable prices. New releases every week!</p>
        <a href="/booksection" class="btn-shop">Shop Now</a>
    </section>

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
