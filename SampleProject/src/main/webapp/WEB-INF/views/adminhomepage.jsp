<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - BookStore</title>
    <link rel="stylesheet" type="text/css" href="css/adminhomepage.css">
</head>
<body>

    <!-- Header -->
    <header class="header">
        <a href="/adminhomepage" class="logo">BookStore Admin</a>
        <nav class="nav-links">
            <a href="/addbook">Add Book</a>
            <a href="/managebooks">Manage Books</a>
            <a href="/categories">Book Categories</a>
            <a href="/stats">Sales Stats</a>
            <a href="/adminlogout">Logout</a>
        </nav>
    </header>

    <!-- Main Admin Content -->
    <div class="admin-dashboard">
        <h1>Welcome, Admin 👨‍💼</h1>
        <p>Use your privileges to manage the store efficiently and track its growth.</p>

        <div class="admin-cards">

            <div class="admin-card">
                <h2>Add New Book</h2>
                <p>Create entries for new books and upload relevant data.</p>
                <a href="/addbook" class="admin-btn">Add Book</a>
            </div>

            <div class="admin-card">
                <h2>Manage Books</h2>
                <p>Edit or remove existing books and manage inventory status.</p>
                <a href="/managebooks" class="admin-btn">Manage</a>
            </div>

            <div class="admin-card">
                <h2>Book Categories</h2>
                <p>Organize your bookstore by genres and themes.</p>
                <a href="/categories" class="admin-btn">Categorize</a>
            </div>

            <div class="admin-card">
                <h2>Sales Analytics</h2>
                <p>Visualize revenue, top-selling books, and user engagement.</p>
                <a href="/stats" class="admin-btn">View Stats</a>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Online Bookstore Admin Panel. All rights reserved.</p>
    </footer>

</body>
</html>
