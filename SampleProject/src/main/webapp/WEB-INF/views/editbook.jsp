<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book Details</title>
    <link rel="stylesheet" href="/css/editbook.css">
</head>
<body>

<!-- Header -->
<div class="header">
    <div class="logo">BookStore Admin</div>
    <div class="nav-links">
        <a href="/adminhomepage">Dashboard</a>
        <a href="/addbook">Add Book</a>
        <a href="/managebooks">Manage Books</a>
        <a href="/categories">Categories</a>
        <a href="/stats">Stats</a>
    </div>
</div>

<!-- Main Edit Form -->
<div class="edit-form-container">
    <h1>Edit Book</h1>
    
    <c:set var="ob" value="${edit_data}" />

    <form action="/edit/${ob.isbnno}" method="post" class="edit-book-form">
        <div class="form-columns">
            <div class="form-group">
                <label for="booktitle">Book Title</label>
                <input type="text" id="booktitle" name="booktitle" value="${ob.booktitle}" required>
            </div>

            <div class="form-group">
                <label for="authorname">Author Name</label>
                <input type="text" id="authorname" name="authorname" value="${ob.authorname}" required>
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" value="${ob.category}" required>
            </div>

            <div class="form-group">
                <label for="yopublication">Year of Publication</label>
                <input type="number" id="yopublication" name="yopublication" value="${ob.yopublication}" required>
            </div>

            <div class="form-group">
                <label for="isbnno">ISBN Number</label>
                <input type="number" id="isbnno" name="isbnno" value="${ob.isbnno}" readonly>
            </div>

            <div class="form-group">
                <label for="price">Price (INR)</label>
                <input type="number" id="price" name="price" value="${ob.price}" required>
            </div>

            <div class="form-group">
                <label for="discount">Discount (%)</label>
                <input type="number" id="discount" name="discount" value="${ob.discount}" min="0" max="100">
            </div>

            <div class="form-group">
                <label for="stockquantity">Stock Quantity</label>
                <input type="number" id="stockquantity" name="stockquantity" value="${ob.stockquantity}" required>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-update">Update</button>
            <button type="reset" class="btn-reset">Reset</button>
        </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 BookStore Admin Panel. All rights reserved.
</div>

</body>
</html>
