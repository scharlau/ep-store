<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Vector, java.util.Iterator, uk.ac.abdn.csd.etech.epstore.models.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The books</title>
</head>
<body>
<h3>My Books</h3>

<jsp:useBean id="book2" class="uk.ac.abdn.csd.etech.epstore.models.Book" 
scope="page"></jsp:useBean>

<h4>OneBook</h4>
<% book2 = book2.getBook("1"); %>
<p>
<%= book2.getTitle() %>
</p>
<%
Book mybook = new Book();
Vector vec = mybook.getBooks("all");
 %>
<jsp:useBean id="book" class="uk.ac.abdn.csd.etech.epstore.models.Book" 
scope="page"></jsp:useBean>

<h3>Lots of books</h3>
<% 
Iterator iter = vec.iterator();
while (iter.hasNext()){
book = (Book) iter.next();
%>
<p>Title: <%= book.getTitle() %> </p>
 <% }%>
</body>
</html>