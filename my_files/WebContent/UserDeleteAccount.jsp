<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete user account</title>
</head>
<body>

<%
	HttpSession session1 = request.getSession(true);
	
	String email = (String) session1.getAttribute("email");
	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/booktime/rest/booktimeService/DeleteUser/"+email);
	ClientResponse myresponse = webResource.accept("text/plain").delete(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	
	if(output.equals("success")){
		%>
		<script>
			alert('Your account was deleted');
			window.location.href='WebServiceClient.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('Your account was not deleted');
			window.location.href='UserHomePage.jsp';
		</script>
		<%
	}
%>

<h2><a href="WebServiceClient.jsp">Press here to return to home page</a></h2>

</body>
</html>