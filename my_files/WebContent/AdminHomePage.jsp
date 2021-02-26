<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="AdminHomePage.css">
<title>Admin's Home Page</title>
</head>
<body>
<div class="header">
	<a href="WebServiceClient.jsp">
		<h1>
			<img src="icons/book.jpg">
				BookTime
		</h1>
	</a>
	<h5>All about books</h5>
	<br>
	<br>
	<h3>Find your next favourite book!</h3>	
</div>

<br>

<div class="row1">
	<h2>Choose an option</h2>
	<hr>
	<form action="AdminAllBooks.jsp">
		<input type="submit" class="btn btn-primary" value="View all books" name="submit">
	</form>
	<br>
	<form action="AdminAllUsers.jsp">
		<input type="submit" class="btn btn-primary" value="View all users" name="submit">
	</form>
	<br>
	<form action="AdminAllComments.jsp">
		<input type="submit" class="btn btn-primary" value="View all comments" name="submit">
	</form>
	<br>
	<form action="AdminAddRemoveUpdateBook.jsp">
		<input type="submit" class="btn btn-primary" value="Add or remove or update a book" name="submit">
	</form>
	<br>
	<form action="AdminDeleteUpdateUser.jsp">
		<input type="submit" class="btn btn-primary" value="Delete or make a simple user an admin" name="submit">
	</form>
	<br>
	<form action="AdminDeleteComment.jsp">
		<input type="submit" class="btn btn-primary" value="Delete a comment an user has made" name="submit">
	</form>
	<br>
	
	<form action="AdminDeleteByPages.jsp">
		<input type="submit" class="btn btn-primary" value="Delete the books that have more or less pages than a number you type" name="submit">
	</form>
	<br>
</div>

<br>
<br>
<div class="footer">
	&copy;
	<a href="http://www.ds.unipi.gr/" target="_blank">2021 DS_UNIPI
	</a>.
	All rights reserved.
</div>
</body>
</html>

</body>
</html>