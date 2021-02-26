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
<link rel="stylesheet" type="text/css" href="AdminDeleteByPages.css">

<title>Delete books by their pages</title>
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
	<h2>Type a number of pages and delete the books that have more pages than that</h2>
	<hr>
	<form ACTION="AdminDeleteByPagesMore.jsp" METHOD="POST">
		<div class="form-group">
			<input type="number" placeholder="Pages" class="form-control" name="pages" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Remove Books" name="submit">
	</form>
	<br>
	<br>
	
	<h2>Type a number of pages and delete the books that have less pages than that</h2>
	<hr>
	<form ACTION="AdminDeleteByPagesLess.jsp" METHOD="POST">
		<div class="form-group">
			<input type="number" placeholder="Pages" class="form-control" name="pages" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Remove Books" name="submit">
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