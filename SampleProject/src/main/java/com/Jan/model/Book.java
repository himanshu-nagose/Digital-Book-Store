package com.Jan.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "addbook")
public class Book {

    @Id
    private Long isbnno;

    private String booktitle;
    private String authorname;
    private String category;
    private int yopublication;
    private int price;
    private int discount;
    private int stockquantity;
    private int purchaseCount;
	public Long getIsbnno() {
		return isbnno;
	}
	public void setIsbnno(Long isbnno) {
		this.isbnno = isbnno;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getYopublication() {
		return yopublication;
	}
	public void setYopublication(int yopublication) {
		this.yopublication = yopublication;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getStockquantity() {
		return stockquantity;
	}
	public void setStockquantity(int stockquantity) {
		this.stockquantity = stockquantity;
	}
	public int getPurchaseCount() {
		return purchaseCount;
	}
	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}
	@Override
	public String toString() {
		return "Book [isbnno=" + isbnno + ", booktitle=" + booktitle + ", authorname=" + authorname + ", category="
				+ category + ", yopublication=" + yopublication + ", price=" + price + ", discount=" + discount
				+ ", stockquantity=" + stockquantity + ", purchaseCount=" + purchaseCount + "]";
	}
	public Book(Long isbnno, String booktitle, String authorname, String category, int yopublication, int price,
			int discount, int stockquantity, int purchaseCount) {
		super();
		this.isbnno = isbnno;
		this.booktitle = booktitle;
		this.authorname = authorname;
		this.category = category;
		this.yopublication = yopublication;
		this.price = price;
		this.discount = discount;
		this.stockquantity = stockquantity;
		this.purchaseCount = purchaseCount;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
}
