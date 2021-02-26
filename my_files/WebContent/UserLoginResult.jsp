<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Result</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String category = "user";
	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/booktime/rest/booktimeService/UserLogin/"+email+"/"+password+"/"+category);
	ClientResponse myresponse = webResource.accept("text/plain").get(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	if(output.equals("success")){
		HttpSession session1 = request.getSession(true);
		
		session1.setAttribute("email", email);	
		%>
		<script>
			window.location.href='UserHomePage.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('E-mail and password do not match, try again');
			window.location.href='UserLogin.jsp';
		</script>
		<%
	}
	
	%>

</body>
</html>