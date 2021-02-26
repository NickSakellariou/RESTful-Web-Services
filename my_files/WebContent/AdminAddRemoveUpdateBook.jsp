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
<link rel="stylesheet" type="text/css" href="AdminAddRemoveUpdateBook.css">

<title>Add or remove or update a book</title>
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
	<h2>Add a book</h2>
	<hr>
	<form ACTION="AdminAddBook.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<div class="form-group">
			<input type="number" placeholder="Year" class="form-control" name="year" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Description" class="form-control" name="description" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Author" class="form-control" name="author" required>
		</div>
		<div class="form-group">
			<input type="number" placeholder="Pages" class="form-control" name="pages" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Add" name="submit">
	</form>
	<br>
	<br>
	
	<h2>Remove a book</h2>
	<hr>
	<form ACTION="AdminRemoveBook.jsp" METHOD="POST">
		<div class="form-group">
			<input type="number" placeholder="Product id" class="form-control" name="productid" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Remove" name="submit">
	</form>
	<br>
	<br>
	
	<h2>Update a book</h2>
	<hr>
	<form ACTION="AdminUpdateBook.jsp" METHOD="POST">
		<div class="form-group">
			<input type="number" placeholder="Product id" class="form-control" name="productid" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<div class="form-group">
			<input type="number" placeholder="Year" class="form-control" name="year" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Description" class="form-control" name="description" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Author" class="form-control" name="author" required>
		</div>
		<div class="form-group">
			<input type="number" placeholder="Pages" class="form-control" name="pages" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Update" name="submit">
	</form>
	<br>
	<br>
	<form ACTION="AdminHomePage.jsp" METHOD="POST">
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