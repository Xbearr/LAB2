package com.bear.book;

import java.util.ArrayList;


import java.sql.*;

public class bookdata {
	private static final String LOGIN_NAME = "root"; 
	private static final String LOGIN_PASSWORD = "123456";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://oziiwrzoclnp.rds.sae.sina.com.cn:10633/bookdb?characterEncoding=utf-8";
	private book book;
	private author author;
	private ArrayList<book> books = new ArrayList<>();
	private ArrayList<author> authors = new ArrayList<>();
	
	public ArrayList<book> getBooks() {
		return books;
	}

	public void setBooks(ArrayList<book> books) {
		this.books = books;
	}

	public ArrayList<author> getAuthors() {
		return authors;
	}

	public void setAuthors(ArrayList<author> authors) {
		this.authors = authors;
	}

	public book getBook() {
		return book;
	}
	
	public void setBook(book book) {
		this.book = book;
	}
	
	public author getAuthor() {
		return author;
	}
	
	public void setAuthor(author author) {
		this.author = author;
	}
	
	public void search(String authorname) throws Exception
	{
		Class.forName(DRIVER);
		Connection conn = DriverManager.getConnection(URL, LOGIN_NAME, LOGIN_PASSWORD);
		Statement statement = conn.createStatement();
		String searchSql = "select * from Book where AuthorID in (select AuthorID from Author where Name='" + authorname + "');";
		System.out.println(searchSql);
		ResultSet rs = statement.executeQuery(searchSql);  
		while (rs.next()) {
			book newBook = new book();
			newBook.setAuthorID(rs.getString("AuthorID"));
			newBook.setISBN(rs.getString("ISBN"));
			newBook.setPrice(rs.getFloat("Price"));
			newBook.setPublishDate(rs.getString("PublishDate"));
			newBook.setPublisher(rs.getString("Publisher"));
			newBook.setTitle(rs.getString("title"));
			this.books.add(newBook);
		}
		rs.close();
		conn.close();  
	}
	
	public void bookDetails (String title, String ISBN) {
		for (int i = 0; i < this.books.size(); i++) {
			if (this.books.get(i).getTitle().equals(title) && this.books.get(i).getISBN().equals(ISBN) && i != 0) {
				book temp = new book();
				temp.setISBN(this.books.get(0).getISBN());
				temp.setAuthorID(this.books.get(0).getAuthorID());
				temp.setTitle(this.books.get(0).getTitle());
				temp.setPublisher(this.books.get(0).getPublisher());
				temp.setPublishDate(this.books.get(0).getPublishDate());
				temp.setPrice(this.books.get(0).getPrice());
				this.books.get(0).setISBN(this.books.get(i).getISBN());
				this.books.get(0).setAuthorID(this.books.get(i).getAuthorID());
				this.books.get(0).setTitle(this.books.get(i).getTitle());
				this.books.get(0).setPublisher(this.books.get(i).getPublisher());
				this.books.get(0).setPublishDate(this.books.get(i).getPublishDate());
				this.books.get(0).setPrice(this.books.get(i).getPrice());
				this.books.remove(i);
				this.books.add(temp);
				break;
			}
		}
		Connection connection;
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, LOGIN_NAME, LOGIN_PASSWORD);
			if (connection.isClosed()) {
				System.out.println("connect failed!");
				return;
			}
			Statement statement = connection.createStatement();
			String authorSql = "select * from Author where AuthorID='" + this.books.get(0).getAuthorID() + "';";
			ResultSet resultSet = statement.executeQuery(authorSql);
			while (resultSet.next()) {
				author newAuthor = new author();
				newAuthor.setAge(resultSet.getInt("Age"));
				newAuthor.setAuthorID(resultSet.getString("AuthorID"));
				newAuthor.setCountry(resultSet.getString("Country"));
				newAuthor.setName(resultSet.getString("Name"));
				this.authors.add(newAuthor);
			}
			connection.close();
		}
		catch (ClassNotFoundException e) {
			System.out.println("Sorry, can't find the driver!");
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void bookDelete (String title, String ISBN) {
		Connection connection;
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, LOGIN_NAME, LOGIN_PASSWORD);
			if (connection.isClosed()) {
				System.out.println("connect failed!");
				return;
			}
			Statement statement = connection.createStatement();
			String searchSql = "delete from Book where title='" + title + "' and ISBN='" + ISBN + "';";
			statement.executeUpdate(searchSql);
			connection.close();
			for (int i = 0; i < this.books.size(); i++) {
				if (this.books.get(i).getISBN().equals(ISBN)) {
					this.books.remove(i);
					break;
				}
			}
		}
		catch (ClassNotFoundException e) {
			System.out.println("Sorry, can't find the driver!");
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}