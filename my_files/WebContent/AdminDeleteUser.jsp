<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete an user</title>
</head>
<body>

<%
	String email = request.getParameter("email");
	
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
			alert('User was deleted successfully');
			window.location.href='AdminAllUsers.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('There is no simple user with this e-mail');
			window.location.href='AdminDeleteUpdateUser.jsp';
		</script>
		<%
	}
%>
</body>
</html>