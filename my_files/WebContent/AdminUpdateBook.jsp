<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update a book</title>
</head>
<body>

<%
	int productid = Integer.parseInt(request.getParameter("productid"));
	String title = request.getParameter("title");
	int year = Integer.parseInt(request.getParameter("year"));
	String description = request.getParameter("description");
	String author = request.getParameter("author");
	int pages = Integer.parseInt(request.getParameter("pages"));
	
	Client client = Client.create();
	WebResource webResource = client.resource(("http://localhost:8080/booktime/rest/booktimeService/UpdateBook/"+productid+"/"+title+"/"+year+"/"+description+"/"+author+"/"+pages).replace(" ", "+"));
	ClientResponse myresponse = webResource.accept("text/plain").put(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	
	if(output.equals("success")){
		%>
		<script>
			alert('Book was updated successfully');
			window.location.href='AdminAllBooks.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('Book was not updated');
			window.location.href='AdminAddRemoveUpdateBook.jsp';
		</script>
		<%
	}
%>

</body>
</html>