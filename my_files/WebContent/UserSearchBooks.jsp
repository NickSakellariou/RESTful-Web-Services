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
<link rel="stylesheet" type="text/css" href="UserSearchBooks.css">

<title>Search books</title>
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
	<h2>Search books by the title</h2>
	<hr>
	<form ACTION="UserSearchByTitleResult.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Search Books" name="submit">
	</form>
	<br>
	<br>
	<h2>Search books by the author</h2>
	<hr>
	<form ACTION="UserSearchByAuthorResult.jsp" METHOD="POST">
		<div class="form-group">
			<input type="text" placeholder="Author" class="form-control" name="author" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Search Books" name="submit">
	</form>
	<br>
	<br>
	<h2>Search books by the year</h2>
	<hr>
	<form ACTION="UserSearchByYearResult.jsp" METHOD="POST">
		<div class="form-group">
			<input type="number" placeholder="Year" class="form-control" name="year" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Search Books" name="submit">
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