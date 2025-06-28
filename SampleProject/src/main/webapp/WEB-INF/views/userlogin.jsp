<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore | User Login</title>
    <link rel="stylesheet" type="text/css" href="css/loginpage.css">
</head>
<body>

    <div class="login-container">
        <h1>Login</h1>

        <form action="/userlogin" method="post" class="login-form">

            <label for="email">Email ID</label>
            <input type="email" id="emailid" name="emailid" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <!-- Forgot Password Link -->
            <div class="forgot-password">
                <a href="/forgotpassword">Forgot Password?</a>
            </div>

            <button type="submit" class="btn-login">Login</button>
        </form>

        <!-- Signup Prompt -->
        <p class="signup-link">
            Don't have an account? <a href="/usersignup">Signup Here</a>
        </p>
        
        <!-- Back to Home Link -->
        <p class="back-home-link">
            <a href="/home">← Back to Home</a>
        </p>
        
    </div>

</body>
</html>
