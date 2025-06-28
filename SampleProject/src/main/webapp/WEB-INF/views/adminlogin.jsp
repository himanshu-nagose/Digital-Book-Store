<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Online Bookstore</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/adminlogin.css">
</head>
<body>

    <div class="admin-login-container">
        <h2>Admin Login</h2>

        <form action="/adminlogin" method="post" class="admin-login-form">
            <label for="emailid">Email ID</label>
            <input type="email" id="emailid" name="emailid" placeholder="admin@example.com" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <label for="adminkey">Admin Secret Key</label>
            <input type="password" id="adminkey" name="adminkey" placeholder="Enter secret admin key" required>

            <button type="submit" class="btn-admin-login">Login as Admin</button>
        </form>

        <p class="note">Only authorized users can access the admin panel.</p>

        <div class="back-home">
            <a href="/home">← Back to Home</a>
        </div>
    </div>

</body>
</html>
