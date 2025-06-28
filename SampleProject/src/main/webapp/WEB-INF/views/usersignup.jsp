<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | User Signup</title>
    <link rel="stylesheet" type="text/css" href="css/signuppage.css">
</head>
<body>

    <div class="signup-container">
        <h1>Signup</h1>

        <form action="/usersignup" method="post" class="signup-form">

            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="mobileno">Mobile Number</label>
            <input type="tel" id="mobileno" name="mobileno" required>

            <label for="city">City</label>
            <input type="text" id="city" name="city" required>

            <label for="emailid">Email ID</label>
            <input type="email" id="emailid" name="emailid" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" class="btn-signup">Signup</button>

        </form>

        <!-- Login Prompt -->
        <p class="login-link">
            Already have an account? <a href="/userlogin">Login Here</a>
        </p>

        <!-- Back to Home Link -->
        <p class="back-home-link">
            <a href="/home">← Back to Home</a>
        </p>
    </div>

</body>
</html>
