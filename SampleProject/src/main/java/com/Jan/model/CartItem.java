package com.Jan.model;

public class CartItem {
    private Long bookId;
    private String bookTitle;
    private int quantity;
    private double price;
    
	public Long getBookId() {
		return bookId;
	}
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public CartItem(Long bookId, String bookTitle, int quantity, double price) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.price = price;
	}
}