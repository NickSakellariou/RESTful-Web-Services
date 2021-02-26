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
<link rel="stylesheet" type="text/css" href="UserAddRemoveComment.css">

<title>Add or remove a comment</title>
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
	<h2>Add a comment and a rating for a book</h2>
	<hr>
	<form ACTION="UserAddComment.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Comment" class="form-control" name="comment" required>
		</div>
		<div class="form-group">
			<input type="number" placeholder="Rating(1-5)" min="1" max="5" class="form-control" name="rating" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Add" name="submit">
	</form>
	<br>
	<br>
	
	<h2>Remove a comment and a rating for a book</h2>
	<hr>
	<form ACTION="UserRemoveComment.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Remove" name="submit">
	</form>
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