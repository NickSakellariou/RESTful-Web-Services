<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove books by their pages</title>
</head>
<body>

<%
	int pages = Integer.parseInt(request.getParameter("pages"));
	
	Client client = Client.create();
	WebResource webResource = client.resource(("http://localhost:8080/booktime/rest/booktimeService/RemoveBookByPagesMore/"+pages));
	ClientResponse myresponse = webResource.accept("text/plain").delete(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	
	if(output.equals("success")){
		%>
		<script>
			alert('Books were removed successfully');
			window.location.href='AdminAllBooks.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('There is no book with more pages than you typed');
			window.location.href='AdminDeleteByPages.jsp';
		</script>
		<%
	}
%>
</body>
</html>