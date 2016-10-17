<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>search</title>
<style type="text/css">
body {
	background-image: url(image/1425969907242.jpg);
	background-repeat;
}
}
</style>
</head>
<body bgcolor="#CBF3FB">
	<center>
	<br><br><br><br><br><br><br><br><br><br><br>
	<font size="20"  style="font-family:微软雅黑"color="#000000">图 书 馆 数 据 查 询</font>
	</center>
	<form action="search" method="get">
		<br><br><br><br>
		<center>
		<h2 size="4" > 请输入您想要查询的作者的姓名：<br></h2>
		<br>
		<input name="authorName" type="text" placeholder="please input the author name" required="required">
		<input type="submit" value="查询" />
		</center>>
	</form>
</body>
</html>