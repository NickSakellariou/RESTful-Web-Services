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
<link rel="stylesheet" type="text/css" href="UserHomePage.css">

<title>User's Home Page</title>
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
	<form action="UserAllBooks.jsp">
		<input type="submit" class="btn btn-primary" value="View all books" name="submit">
	</form>
	<br>
	<form action="UserSearchBooks.jsp">
		<input type="submit" class="btn btn-primary" value="Search books" name="submit">
	</form>
	<br>
	<form action="UserSortBooks.jsp">
		<input type="submit" class="btn btn-primary" value="Sort books" name="submit">
	</form>
	<br>
	<form action="UserAllComments.jsp">
		<input type="submit" class="btn btn-primary" value="View all your comments" name="submit">
	</form>
	<br>
	<form action="UserAddRemoveComment.jsp">
		<input type="submit" class="btn btn-primary" value="Add or remove a comment for a book" name="submit">
	</form>
	<br>
	<form action="UserCommentsForBook.jsp">
		<input type="submit" class="btn btn-primary" value="View all comments and ratings for a book" name="submit">
	</form>
	<br>
	<form action="UserDeleteAccount.jsp">
		<input type="submit" class="btn btn-primary" value="Delete your account" name="submit">
	</form>
	<br>
	
	<form action="BestSellerBooks.jsp">
		<input type="submit" class="btn btn-primary" value="View the best seller books" name="submit">
	</form>
	<br>
	
	<form action="UserSearch.jsp">
		<input type="submit" class="btn btn-primary" value="Search for books and authors" name="submit">
	</form>
	<br>
	<form action="ThirdPartyServiceBonus.jsp">
		<input type="submit" class="btn btn-primary" value="See a random joke" name="submit">
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