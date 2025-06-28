<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | Contact Us</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/contactpage.css">
</head>
<body>

	<!-- Header Section -->
    <header class="header">
        <a href="/homepage" class="logo">BookStore</a>
        <nav class="nav-links">
        	<a href="/booksection">Book Section</a>
        	<a href="/newarrivals">New Arrivals</a>
            <!-- ✅ Search Bar -->
        	<form action="/search" method="get" class="search-form">
            	<input type="text" name="query" placeholder="Search books..." class="search-input">
            	<button type="submit" class="search-btn">Search</button>
        	</form>
            <a href="/bestsellers">Best Sellers</a> 
            <a href="/homepage">Home Page</a>
            <a href="/cart">Go to Cart</a>
        </nav>
        <nav class="nav-link">
        	<a href="/logout">Logout</a>
            <a href="/profile">Profile</a>   
        </nav>
    </header>
    
    <div class="contact-container">
        <h1>Contact Us</h1>
        <p>If you have any questions or feedback, please fill out the form below and we will get back to you shortly.</p>

        <form action="/submitContact" method="post" class="contact-form">
            <label for="name">Name<span>*</span></label>
            <input type="text" id="name" name="name" placeholder="Your full name" required>

            <label for="email">Email<span>*</span></label>
            <input type="email" id="email" name="email" placeholder="your.email@example.com" required>

            <label for="subject">Subject<span>*</span></label>
            <input type="text" id="subject" name="subject" placeholder="Subject of your message" required>

            <label for="userquery">Message<span>*</span></label>
            <textarea id="userquery" name="userquery" rows="6" placeholder="Write your message here..." required></textarea>

            <button type="submit" class="btn-submit">Send Message</button>
        </form>
    </div>


	<!-- Footer Section -->
	<footer class="footer">
        <p>&copy; 2025 Online Bookstore. All rights reserved.</p>	        
        <p>
        	
	        <a href="/about">About Us</a>
	    </p>
    </footer>
    
</body>
</html>
