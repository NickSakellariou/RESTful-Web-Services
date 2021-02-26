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
<link rel="stylesheet" type="text/css" href="UserLogin.css">

<title>User Login</title>
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
	<h2>Enter e-mail address and password to login</h2>
	<hr>
	<form ACTION="UserLoginResult.jsp" METHOD="POST">
		<div class="form-group">
			<input type="email" placeholder="E-mail address" class="form-control" name="email" required>
		</div>
		<div class="form-group">
			<input type="password" placeholder="Password" class="form-control" pattern="{8,}" title="Must contain at least 8 characters" name="password" required>
		</div>
		<input type="submit" class="btn btn-primary" value="User Login" name="submit">
	</form>
	
	<br>
	<br>
	<h2>Or register as user if you haven't already</h2>
	<hr>
	<form ACTION="AddUser.jsp" METHOD="POST">
	<div class="form-group">
		<input type="text" placeholder="Full name" class="form-control" name="name" required>
	</div>
	<div class="form-group">
		<input type="email" placeholder="E-mail address" class="form-control" id="email" name="email" required>
	</div>
	<div class="form-group">
		<input type="password" placeholder="Password" class="form-control" pattern="{8,}" title="Must contain at least 8 characters" name="password" required>
	</div>
	<input type="submit" class="btn btn-primary" value="Register as user" name="submit">
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