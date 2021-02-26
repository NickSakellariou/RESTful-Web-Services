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
<link rel="stylesheet" type="text/css" href="BestSellerBooks.css">

<title>Best seller books</title>
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
	<h2>Best seller books</h2>
	<hr>
	<form action="ThirdPartyService1.jsp">
		<input type="submit" class="btn btn-primary" value="View all the categories of books" name="submit">
	</form>
	<br>
	<br>
	<h2>View the best seller books of a list</h2>
	<hr>
	<form ACTION="ThirdPartyService2Result.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="List" class="form-control" name="list" required>
		</div>
		<input type="submit" class="btn btn-primary" value="View Books" name="submit">
	</form>
	<br>
	<br>
	<br>
	<br>
	<form ACTION="UserHomePage.jsp" METHOD="POST">
		<input type="submit" class="btn btn-danger" value="Go back" name="submit">
	</form>
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