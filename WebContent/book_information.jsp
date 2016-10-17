<%@page import="com.bear.book.bookdata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="author_book.css">
	<title>Book_Author</title>
<style type="text/css">
body {
	background-image: url(image/1425969907242.jpg);
	background-repeat;
}
}
</style>
</head>
	<body>
	<center>
		<br><br><br><br><br><br>
		<font size="15"  color="#1291A9" style="font-family:微软雅黑"><% bookdata bd = (bookdata)session.getAttribute("book_author");	%>
		<% out.print(bd.getBooks().get(0).getTitle()); %> 's detail</font>
		<br><br>
		<table align="center">
			<th>
			<tr>
				<th><font size="5"  style="font-family:微软雅黑">ISBN</font></th>
				<th><font size="5"  style="font-family:微软雅黑">Publisher</font></th>
				<th><font size="5"  style="font-family:微软雅黑">PublishDate</font></th>
				<th><font size="5"  style="font-family:微软雅黑">Price</font></th>
			</tr>
			<tr>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getBooks().get(0).getISBN()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getBooks().get(0).getPublisher()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getBooks().get(0).getPublishDate()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getBooks().get(0).getPrice()); %></font></td>
			</tr>
			<th>
		</table ><br>
		<font size="15" color="#1291A9" style="font-family:微软雅黑"><% out.print(bd.getBooks().get(0).getTitle()); %> 's Author Infomatin
		</font>
		<br><br>
		<table align="center">
			<tr>
				<th><font size="5"  style="font-family:微软雅黑">AuthorID</font></th>
				<th><font size="5"  style="font-family:微软雅黑">Name</font></th>
				<th><font size="5"  style="font-family:微软雅黑">Age</font></th>
				<th><font size="5"  style="font-family:微软雅黑">Country</font></th>
			</tr>
			<tr>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getAuthors().get(0).getAuthorID()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getAuthors().get(0).getName()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getAuthors().get(0).getAge()); %></font></td>
				<td><font size="5"  style="font-family:微软雅黑"><% out.print(bd.getAuthors().get(0).getCountry()); %></font></td>
			</tr>
		</table><br>
		<% session.setAttribute("books", bd); %>
		<form action="author_information.jsp">
			<input type="submit" value="返回上一页" />
		</form>
	</center>>
	</body>
</html>