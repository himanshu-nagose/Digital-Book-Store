<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | User Profile</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/profile.css">
    <script>
        function togglePasswordFields() {
            const passwordFields = document.getElementById('password-fields');
            passwordFields.style.display = passwordFields.style.display === 'none' ? 'block' : 'none';
        }

        function validateForm() {
            const newPassword = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
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
        <a href="/orderhistory">Order History</a>
    </nav>
    <nav class="nav-link">
        <a href="/logout">Logout</a>
    </nav>
</header>

<div class = "main-content ">
	<section class="profile-section">
	    <div class="profile-container">
	        <h1>My Profile</h1>
	
	        <form action="/updateProfile" method="post" onsubmit="return validateForm();" class="profile-form">
	
	            <!-- Basic Info -->
	            <div class="form-group">
	                <label for="name">Full Name *</label>
	                <input type="text" id="name" name="name" value="${user.name}" required />
	            </div>
	
	            <div class="form-group">
	                <label for="emailid">Email ID *</label>
	                <input type="email" id="emailid" name="emailid" value="${user.emailid}" readonly />
	            </div>
	
	            <div class="form-group">
	                <label for="mobileno">Mobile Number *</label>
	                <input type="tel" id="mobileno" name="mobileno" value="${user.mobileno}" required />
	            </div>
	
	            <div class="form-group">
	                <label for="city">City / Location</label>
	                <input type="text" id="city" name="city" value="${user.city}" />
	            </div>
	
	            <!-- Address Info -->
	            <div class="form-group">
	                <label for="address">Address</label>
	                <textarea id="address" name="address" rows="3">${user.address}</textarea>
	            </div>
	
	            <div class="form-group">
	                <label for="pincode">Pincode</label>
	                <input type="text" id="pincode" name="pincode" value="${user.pincode}" />
	            </div>
	
	            <div class="form-group">
	                <label for="country">Country</label>
	                <input type="text" id="country" name="country" value="${user.country}" />
	            </div>
	
	            <div class="form-group">
	                <label for="landmark">Landmark</label>
	                <input type="text" id="landmark" name="landmark" value="${user.landmark}" />
	            </div>
	
	            <!-- Preferences -->
	            <div class="form-group">
	                <label for="genre">Preferred Genre</label>
	                <select id="genre" name="genre">
	                    <option value="">-- Select --</option>
	                    <option value="fiction" ${user.genre == 'fiction' ? 'selected' : ''}>Fiction</option>
	                    <option value="non-fiction" ${user.genre == 'non-fiction' ? 'selected' : ''}>Non-Fiction</option>
	                    <option value="self-help" ${user.genre == 'self-help' ? 'selected' : ''}>Self-help</option>
	                    <option value="history" ${user.genre == 'history' ? 'selected' : ''}>History</option>
	                    <option value="biography" ${user.genre == 'biography' ? 'selected' : ''}>Biography</option>
	                    <option value="mystery" ${user.genre == 'mystery' ? 'selected' : ''}>Mystery</option>
	                    <option value="sci-fi" ${user.genre == 'sci-fi' ? 'selected' : ''}>Sci-Fi</option>
	                    <option value="romance" ${user.genre == 'romance' ? 'selected' : ''}>Romance</option>
	                </select>
	            </div>
	
	            <div class="form-group">
	                <label for="dob">Date of Birth</label>
	                <input type="date" id="dob" name="dob" value="${user.dob}" />
	            </div>
	
	            <!-- Gender -->
	            <div class="form-group">
	                <label>Gender</label>
	                <div class="radio-group">
	                    <label><input type="radio" name="gender" value="male" ${user.gender == 'male' ? 'checked' : ''}> Male</label>
	                    <label><input type="radio" name="gender" value="female" ${user.gender == 'female' ? 'checked' : ''}> Female</label>
	                    <label><input type="radio" name="gender" value="other" ${user.gender == 'other' ? 'checked' : ''}> Other</label>
	                </div>
	            </div>
	
	            <!-- Optional Password Update -->
	            <div class="form-group">
	                <button type="button" class="btn-secondary" onclick="togglePasswordFields()">Change Password</button>
	            </div>
	
	            <div id="password-fields" style="display: none;">
	                <div class="form-group">
	                    <label for="password">New Password</label>
	                    <input type="password" id="password" name="password" />
	                </div>
	                <div class="form-group">
	                    <label for="confirmPassword">Confirm New Password</label>
	                    <input type="password" id="confirmPassword" name="confirmPassword" />
	                </div>
	            </div>
	
	            <!-- Submit -->
	            <div class="form-actions">
	                <button type="submit" class="btn-primary">Update Profile</button>
	            </div>
	
	        </form>
	    </div>
	</section>
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
