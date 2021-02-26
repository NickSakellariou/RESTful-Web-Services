<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>
<%@ page import="com.google.gson.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search books by their pages</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="UserSortByPagesLess.css">
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
	int pages = Integer.parseInt(request.getParameter("pages"));
	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/booktime/rest/booktimeService/AllBooksSortedByPagesLess/"+pages);
	ClientResponse myresponse = webResource.accept("application/json").get(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	Gson gson = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
	JsonParser jp = new JsonParser();
	JsonElement je = jp.parse(output);
	String prettyJsonString = gson.toJson(je);
	
	if(output.equals("[]")){
		%>
		<h2>There is no book with less pages than you typed.</h2>
		<hr>
		<br>
		<%	
	}
	else{
	%>
	<h2>Results : </h2>
	<hr>
	<h3 style="text-align:left;"><pre><%out.println(prettyJsonString); %></pre></h3>
	<br>
	<%
	} 
	%>
	
	<form ACTION="UserSortBooks.jsp" METHOD="POST">
		<input type="submit" class="btn btn-danger" value="Go back" name="submit">
	</form>
</div>
	
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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