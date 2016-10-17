package com.bear.book;

public class book {
	private String ISBN;
	private String AuthorID;
	private String Publisher;
	private String title;
	private String PublishDate;
	private float Price;
	
	public String image;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getISBN() {
		return ISBN;
	}
	
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	public String getAuthorID() {
		return AuthorID;
	}
	
	public void setAuthorID(String AuthorID) {
		this.AuthorID = AuthorID;
	}
	
	public String getPublisher() {
		return Publisher;
	}
	
	public void setPublisher(String Publisher) {
		this.Publisher = Publisher;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPublishDate() {
		return PublishDate;
	}
	
	public void setPublishDate(String PublishDate) {
		this.PublishDate = PublishDate;
	}
	
	public float getPrice() {
		return Price;
	}
	
	public void setPrice(float Price) {
		this.Price = Price;
	}
}
