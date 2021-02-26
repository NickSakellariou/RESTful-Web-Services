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
<link rel="stylesheet" type="text/css" href="AdminDeleteComment.css">
<title>Delete a comment</title>
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

<%
if(request.getParameter("btn") != null){
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	
	Client client = Client.create();
	WebResource webResource = client.resource(("http://localhost:8080/booktime/rest/booktimeService/RemoveComment/"+title+"/"+email).replace(" ", "+"));
	ClientResponse myresponse = webResource.accept("text/plain").delete(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	
	if(output.equals("success")){
		%>
		<script>
			alert('Comment was removed successfully');
			window.location.href='AdminAllComments.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('There is no comment from this user for this book');
		</script>
		<%
	}
}
%>
<h2>Delete a comment</h2>
	<hr>
	<form METHOD="POST">
		<div class="form-group">
			<input type="email" placeholder="E-mail" class="form-control" name="email" required>
		</div>
		<div class="form-group">
			<input type="text" placeholder="Title" class="form-control" name="title" required>
		</div>
		<input type="submit" name="btn" class="btn btn-primary" value="Delete" name="submit">
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