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
<link rel="stylesheet" type="text/css" href="AdminDeleteUpdateUser.css">

<title>Delete or make a simple user an admin</title>
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
	<h2>Delete an user</h2>
	<hr>
	<form ACTION="AdminDeleteUser.jsp" METHOD="POST">
		<div class="form-group">
			<input type="email" placeholder="E-mail" class="form-control" name="email" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Delete" name="submit">
	</form>
	<br>
	<br>
	
	<h2>Make an user an admin</h2>
	<hr>
	<form ACTION="AdminUpdateUser.jsp" METHOD="POST">
		<div class="form-group">
			<input type="email" placeholder="E-mail" class="form-control" name="email" required>
		</div>
		<input type="submit" class="btn btn-primary" value="Update" name="submit">
	</form>
	<br>
	<br>
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