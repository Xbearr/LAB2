<%@ page language="java" import="com.bear.book.bookdata" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>author_information</title>
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
<% 
bookdata books = (bookdata)session.getAttribute("books");
if(books.getBooks().size()==0){
%>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<font size="20"  style="font-family:微软雅黑"color="#000000">删除后数据库为空</font>
<%
}
else
{
%>
<br><br><br><br><br><br><br><br><br><br><br><br>
<font size="20"  style="font-family:微软雅黑"color="#000000">删除后的结果为</font>
	<table  align="center">
		<tr>
			<td><font size="5"  style="font-family:微软雅黑">Authorname</font></td>
			<td><font size="5"  style="font-family:微软雅黑">Publisher</font></td>
			<td><font size="5"  style="font-family:微软雅黑">PublisherDate</font></td>
			<td><font size="5"  style="font-family:微软雅黑">Price  </font></td>
			<td><font size="5"  style="font-family:微软雅黑">Operation</font></td>
		</tr>
		<%
			for (int i = 0; i < books.getBooks().size(); i++) {
		%>
		<tr>
			<td><font size="5"  style="font-family:微软雅黑"><% out.print("<a href=\"" + request.getContextPath() + "/book_information.action?title=" + books.getBooks().get(i).getTitle() + "&ISBN=" + books.getBooks().get(i).getISBN() + "\">" + books.getBooks().get(i).getTitle() + "</a>"); %></font></td>
			<td><font size="5"  style="font-family:微软雅黑"><%out.print(books.getBooks().get(i).getPublisher()); %></font></td>
			<td><font size="5"  style="font-family:微软雅黑"><%out.print(books.getBooks().get(i).getPublishDate()); %></font></td>
			<td><font size="5"  style="font-family:微软雅黑"><%out.print(books.getBooks().get(i).getPrice()); %></font></td>
			<td><font size="5"  style="font-family:微软雅黑"><% out.print("<a href=\"" + request.getContextPath() + "/delete_book.action?title=" + books.getBooks().get(i).getTitle() + "&ISBN=" + books.getBooks().get(i).getISBN() + "&deleteOpt=true" + "\">" + "删除" + "</a>"); %></font></td>
			
		</tr>
		<%  
			}
			session.setAttribute("bddel", books);
		%>
	</table><br>
		<form action="search.jsp">
		<input type="submit" value="返回主页" />
	</form>
</center>
<%
}
%>
</body>
</html>