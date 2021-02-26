<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove a book</title>
</head>
<body>

<%
	int productid = Integer.parseInt(request.getParameter("productid"));
	
	Client client = Client.create();
	WebResource webResource = client.resource(("http://localhost:8080/booktime/rest/booktimeService/RemoveBook/"+productid));
	ClientResponse myresponse = webResource.accept("text/plain").delete(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	
	if(output.equals("success")){
		%>
		<script>
			alert('Book was removed successfully');
			window.location.href='AdminAllBooks.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('Book was not removed');
			window.location.href='AdminAddRemoveUpdateBook.jsp';
		</script>
		<%
	}
%>
</body>
</html>