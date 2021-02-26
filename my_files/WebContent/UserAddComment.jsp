<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a comment and a rating for a book</title>
</head>
<body>

<%
	HttpSession session1 = request.getSession(true);
		
	String email = (String) session1.getAttribute("email");
	
	String title = request.getParameter("title");
	String comment = request.getParameter("comment");
	int rating = Integer.parseInt(request.getParameter("rating"));
	
	Client client = Client.create();
	WebResource webResource = client.resource(("http://localhost:8080/booktime/rest/booktimeService/AddComment/"+title+"/"+comment+"/"+rating+"/"+email).replace(" ", "+"));
	ClientResponse myresponse = webResource.accept("text/plain").post(ClientResponse.class);
	
	if (myresponse.getStatus() != 200){
		throw new RuntimeException("Failed : HTTP error code : " +myresponse.getStatus());
	}
	
	String output = myresponse.getEntity(String.class);
	
	if(output.equals("success")){
		%>
		<script>
			alert('Comment was added successfully');
			window.location.href='UserAllComments.jsp';
		</script>
		<%	
	}
	else{
		%>
		<script>
			alert('Comment was not added');
			window.location.href='UserAddRemoveComment.jsp';
		</script>
		<%
	}
	%>

</body>
</html>