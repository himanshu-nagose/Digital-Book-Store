<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Manage Books</title>
    <link rel="stylesheet" href="css/managebooks.css" />
</head>
<body>

<!-- Header -->
<div class="header">
    <a href="/adminhomepage" class="logo">BookStore Admin</a>
    <div class="nav-links">
        <a href="/adminhomepage">Dashboard</a>
        <a href="/addbook">Add Book</a>
        <a href="/categories">Book Categories</a>
        <a href="/stats">Sale Stats</a>
        <a href="/logout">Logout</a>
    </div>
</div>

<!-- Section Divider -->
<div class="section-divider"></div>

<!-- Main Content -->
<div class="manage-books-container">
    <h1>Manage Books</h1>
    
    <div class="book-card-grid">
        <c:forEach var="book" items="${manage_books}">
            <div class="book-card">
                <h2>${book.booktitle}</h2>
                <p><strong>ISBN:</strong> ${book.isbnno}</p>
                <p><strong>Price:</strong> ₹${book.price}</p>
                <p><strong>Stock:</strong> ${book.stockquantity}</p>

                <div class="action-buttons">
                    <a href="/editbook/${book.isbnno}" class="btn-edit">Edit</a>
                    <form action="/delete/${book.isbnno}" method="post" class="delete-form">
    					<input type="number" name="quantityToDelete" min="1" placeholder="Qty" required>
    					<button type="submit" class="btn-delete">Delete</button>
					</form>
                    
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 BookStore Admin Panel. All rights reserved.
</div>

</body>
</html>
