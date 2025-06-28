package com.Jan.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_items")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long bookId;
    private String bookTitle;
    private int quantity;
    private double price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

	 public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	 }

	 public Long getId() {
		 return id;
	 }

	 public void setId(Long id) {
		 this.id = id;
	 }

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

	 public Order getOrder() {
		 return order;
	 }

	 public void setOrder(Order order) {
		 this.order = order;
	 }

	 @Override
	 public String toString() {
		return "OrderItem [id=" + id + ", bookId=" + bookId + ", bookTitle=" + bookTitle + ", quantity=" + quantity
				+ ", price=" + price + ", order=" + order + "]";
	 }

	 public OrderItem(Long id, Long bookId, String bookTitle, int quantity, double price, Order order) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.quantity = quantity;
		this.price = price;
		this.order = order;
	 }
}
