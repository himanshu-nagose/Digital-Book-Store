<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | About Us</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/about.css">
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

<div class="about-wrapper">
    
    <!-- Introduction -->
    <section class="about-intro">
        <h1>About Online Bookstore</h1>
        <p>
            Online Bookstore is more than just a digital marketplace — it's a passionate community of readers, learners, and thinkers. Founded with the aim of simplifying the way people access and enjoy books, our platform bridges the gap between traditional reading habits and modern digital convenience.
        </p>
        <p>
            Whether you're a student searching for academic texts, a professional seeking skill-enhancing reads, or a casual reader exploring fiction and non-fiction, our platform offers a curated collection for everyone. From global bestsellers to regional literature, Online Bookstore strives to deliver stories and knowledge to every corner of the country.
        </p>
    </section>

    <!-- Vision -->
    <section class="about-section">
        <h2>Our Vision</h2>
        <p>
            Our vision is to be India’s most trusted and accessible online destination for books and learning resources. We aspire to ignite a culture of reading, curiosity, and continuous learning in the digital age. In a world full of distractions, we believe in the timeless power of books to inspire, educate, and transform lives.
        </p>
        <p>
            We envision a future where anyone, regardless of geography or background, can access quality literature and learning material with a single click.
        </p>
    </section>

    <!-- Mission -->
    <section class="about-section">
        <h2>Our Mission</h2>
        <p>We are committed to:</p>
        <ul>
            <li>📚 Offering a vast and inclusive catalog of books across all genres, languages, and interests.</li>
            <li>📦 Ensuring a seamless shopping experience from discovery to delivery.</li>
            <li>💳 Making books affordable with discounts, offers, and student-friendly pricing.</li>
            <li>📈 Empowering authors and publishers by providing them a platform to reach wider audiences.</li>
            <li>📖 Promoting reading as a lifestyle through initiatives, campaigns, and community engagement.</li>
        </ul>
    </section>

    <!-- Journey -->
    <section class="about-section">
        <h2>Our Journey So Far</h2>
        <p>
            Launched in 2025 as a university-level project, Online Bookstore quickly evolved into a full-scale platform driven by feedback, innovation, and a shared love for reading. What started with a handful of books and users has grown into a thriving ecosystem of thousands of titles and hundreds of daily visitors.
        </p>
        <p>
            Our journey reflects dedication, adaptability, and the belief that access to knowledge should never be limited by physical or financial boundaries. With every passing month, we continue to grow — not just in numbers, but in the value we provide to our readers.
        </p>
    </section>
</div>

	<!-- Footer Section -->
	<footer class="footer">
        <p>&copy; 2025 Online Bookstore. All rights reserved.</p>	        
        <p>
        	
	        <a href="/contactus">Contact Us</a>
	    </p>
    </footer>

</body>
</html>
