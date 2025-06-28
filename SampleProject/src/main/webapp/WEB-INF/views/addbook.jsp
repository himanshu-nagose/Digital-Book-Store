<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link rel="stylesheet" href="css/addbook.css"> <!-- Make sure the path is correct -->
</head>
<body>

<!-- Header -->
<div class="header">
    <a href="/adminhomepage" class="logo">BookStore Admin</a>
    <div class="nav-links">
        <a href="/adminhomepage">Dashboard</a>
        <a href="/managebooks">Manage Books</a>
        <a href="/categories">Book Categories</a>
        <a href="/stats">Sale Stats</a>
        <a href="/logout">Logout</a>
    </div>
</div>

<!-- Main Form Section -->
<div class="form-container">
    <h1>Add New Book</h1>
    <form class="add-book-form" action="/savebook" method="post">
        <div class="form-column">
            <label>Book Title <span>*</span></label>
            <input type="text" name="booktitle" required>

            <label>Author Name <span>*</span></label>
            <input type="text" name="authorname" required>

            <label>Category <span>*</span></label>
            <input type="text" name="category" required>

            <label>Year of Publication <span>*</span></label>
            <input type="number" name="yopublication" min="1500" max="2100" required>
        </div>

        <div class="form-column">
            <label>ISBN Number <span>*</span></label>
            <input type="number" name="isbnno" required>

            <label>Price (INR) <span>*</span></label>
            <input type="number" name="price" required>

            <label>Discount (%)</label>
            <input type="number" name="discount" min="0" max="100">

            <label>Stock Quantity <span>*</span></label>
            <input type="number" name="stockquantity" required>
        </div>

        <div class="form-full">
            <button type="submit" class="btn-submit">Add Book</button>
        </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 BookStore Admin Panel. All rights reserved.
</div>

</body>
</html>
