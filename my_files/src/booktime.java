package my.restful.web.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;

@Path("booktimeService")
public class booktime {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/booktimedb?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
	
	static final String USER = "admin";
	static final String PASS = "psw1";
	
	@POST
	@Path("/AddUser/{name}/{email}/{password}/{category}")
	@Produces(MediaType.TEXT_PLAIN)
	public String createUser(@PathParam("name") String name, @PathParam("email") String email, @PathParam("password") String password, @PathParam("category") String category) 
	{
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM users WHERE email = '"+email+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "failure";
			}
			else {
				result = "success";
				
				String NAME = name.replace('+', ' ');
				
				PreparedStatement ps = conn.prepareStatement("INSERT INTO users (name, email, password, category) VALUES (?, ?, ?, ?)");
				ps.setString(1, NAME);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, category);
				
				ps.executeUpdate();
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GET
	@Path("/UserLogin/{email}/{password}/{category}")
	@Produces(MediaType.TEXT_PLAIN)
	public String UserLogin( @PathParam("email") String email, @PathParam("password") String password, @PathParam("category") String category) 
	{
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM users WHERE email = '"+email+"' && password = '"+password+"'&& category = '"+category+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@POST
	@Path("/AddBook/{title}/{year}/{description}/{author}/{pages}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addBook(@PathParam("title") String title, @PathParam("year") int year, @PathParam("description") String description, @PathParam("author") String author, @PathParam("pages") int pages) 
	{
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			int i = 1;
			
			while(true) {
				PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE productid = '"+i+"'");
				ResultSet res1 = pst1.executeQuery();
				
				if(res1.next())	{
					i++;
					continue;
				}
				else {
					String TITLE = title.replace('+', ' ');
					String DESCRIPTION = description.replace('+', ' ');
					String AUTHOR = author.replace('+', ' ');
					
					PreparedStatement ps = conn.prepareStatement("INSERT INTO books (productid, title, year, description, author, pages) VALUES (?, ?, ?, ?, ?, ?)");
					ps.setInt(1, i);
					ps.setString(2, TITLE);
					ps.setInt(3, year);
					ps.setString(4, DESCRIPTION);
					ps.setString(5, AUTHOR);
					ps.setInt(6, pages);
					
					ps.executeUpdate();
					
					result = "success";
					
					break;
				}
			}			
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@DELETE
	@Path("/RemoveBook/{productid}")
	@Produces("text/plain")
	public String RemoveBook(@PathParam("productid") int productid) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM books WHERE productid = '"+productid+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				PreparedStatement ps = conn.prepareStatement("DELETE FROM books WHERE productid = "+productid);
				ps.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PUT
	@Path("/UpdateBook/{productid}/{title}/{year}/{description}/{author}/{pages}")
	@Produces(MediaType.TEXT_PLAIN)
	public String updateBook(@PathParam("productid") int productid,@PathParam("title") String title, @PathParam("year") int year, @PathParam("description") String description, @PathParam("author") String author, @PathParam("pages") int pages) 
	{
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM books WHERE productid = '"+productid+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				String TITLE = title.replace('+', ' ');
				String DESCRIPTION = description.replace('+', ' ');
				String AUTHOR = author.replace('+', ' ');
				
				PreparedStatement pst1 = conn.prepareStatement("UPDATE books SET title = '"+TITLE+"',year = '"+year+"',description = '"+DESCRIPTION+"',author = '"+AUTHOR+"',pages = '"+pages+"' WHERE productid in ('"+productid+"')");
				pst1.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GET
	@Path("/AllBooks")
	@Produces(MediaType.APPLICATION_JSON)
	public String ShowAll() {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books");
			ResultSet rs1 = ps1.executeQuery();
					
			while(rs1.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("productid", rs1.getInt("productid"));
				jsonObject.put("title", rs1.getString("title"));
				jsonObject.put("year", rs1.getInt("year"));
				jsonObject.put("description", rs1.getString("description"));
				jsonObject.put("author", rs1.getString("author"));
				jsonObject.put("pages", rs1.getInt("pages"));
						
				ja.put(jsonObject);

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/AllUsers")
	@Produces(MediaType.APPLICATION_JSON)
	public String allUsers() {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM users WHERE category = 'user'");
			ResultSet rs1 = ps1.executeQuery();
					
			while(rs1.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("name", rs1.getString("name"));
				jsonObject.put("email", rs1.getString("email"));
						
				ja.put(jsonObject);

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/AllCommentsAdmin")
	@Produces(MediaType.APPLICATION_JSON)
	public String allComments() {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM comments");
			ResultSet rs1 = ps1.executeQuery();
	
			while(rs1.next())
			{
				PreparedStatement pst1 = conn.prepareStatement("SELECT title FROM books WHERE productid = '"+rs1.getInt("productid")+"'");
				ResultSet res1 = pst1.executeQuery();
				
				while(res1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("title", res1.getString("title"));
					jsonObject.put("email", rs1.getString("email"));
					jsonObject.put("comment", rs1.getString("comment"));
					jsonObject.put("rating", rs1.getInt("rating"));
							
					ja.put(jsonObject);	
				}

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@DELETE
	@Path("/DeleteUser/{email}")
	@Produces("text/plain")
	public String deleteBook(@PathParam("email") String email) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM users WHERE email = '"+email+"'&& category = 'user'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE email = '"+email+"'");
				ps.executeUpdate();
				
				PreparedStatement ps1 = conn.prepareStatement("DELETE FROM c WHERE email = '"+email+"'");
				ps1.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PUT
	@Path("/UpdateUser/{email}")
	@Produces("text/plain")
	public String updateUser(@PathParam("email") String email) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM users WHERE email = '"+email+"'&& category = 'user'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				PreparedStatement pst1 = conn.prepareStatement("UPDATE users SET category = 'admin' WHERE email in ('"+email+"')");
				pst1.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GET
	@Path("/SearchByTitle/{title}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchByTitle(@PathParam("title") String title) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			String TITLE = title.replace('+', ' ');
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE title = '"+TITLE+"'");
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books WHERE title = '"+TITLE+"'");
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("productid", rs1.getInt("productid"));
					jsonObject.put("title", rs1.getString("title"));
					jsonObject.put("year", rs1.getInt("year"));
					jsonObject.put("description", rs1.getString("description"));
					jsonObject.put("author", rs1.getString("author"));
					jsonObject.put("pages", rs1.getInt("pages"));
						
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/SearchByYear/{year}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchByYear(@PathParam("year") int year) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE year = "+year);
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books WHERE year = "+year);
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("productid", rs1.getInt("productid"));
					jsonObject.put("title", rs1.getString("title"));
					jsonObject.put("year", rs1.getInt("year"));
					jsonObject.put("description", rs1.getString("description"));
					jsonObject.put("author", rs1.getString("author"));
					jsonObject.put("pages", rs1.getInt("pages"));
						
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/SearchByAuthor/{author}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchByAuthor(@PathParam("author") String author) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			String AUTHOR = author.replace('+', ' ');
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE author = '"+AUTHOR+"'");
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books WHERE author = '"+AUTHOR+"'");
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("productid", rs1.getInt("productid"));
					jsonObject.put("title", rs1.getString("title"));
					jsonObject.put("year", rs1.getInt("year"));
					jsonObject.put("description", rs1.getString("description"));
					jsonObject.put("author", rs1.getString("author"));
					jsonObject.put("pages", rs1.getInt("pages"));
						
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@POST
	@Path("/AddComment/{title}/{comment}/{rating}/{email}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addBook(@PathParam("title") String title, @PathParam("comment") String comment, @PathParam("rating") int rating, @PathParam("email") String email) 
	{
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			String TITLE = title.replace('+', ' ');
			
			PreparedStatement pst = conn.prepareStatement("SELECT productid FROM books WHERE title = '"+TITLE+"'");
			ResultSet res = pst.executeQuery();
			
			if(res.next())
			{
				PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM comments WHERE email = '"+email+"' && productid = '"+res.getInt("productid")+"'");
				ResultSet res1 = pst1.executeQuery();
					
				if(res1.next())	{
					result = "failure";
				}
				else {
					
					PreparedStatement pst2 = conn.prepareStatement("SELECT * FROM books WHERE productid = '"+res.getInt("productid")+"'");
					ResultSet res2 = pst2.executeQuery();
						
					if(res2.next())	{
						
						String COMMENT = comment.replace('+', ' ');
						
						PreparedStatement ps = conn.prepareStatement("INSERT INTO comments (productid, email, comment, rating) VALUES (?, ?, ?, ?)");
						ps.setInt(1, res.getInt("productid"));
						ps.setString(2, email);
						ps.setString(3, COMMENT);
						ps.setInt(4, rating);
							
						ps.executeUpdate();
							
						result = "success";
					}
					else {
						result = "failure";
					}
				}	
			}
			else {
				result = "failure";
			}		
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@DELETE
	@Path("/RemoveComment/{title}/{email}")
	@Produces("text/plain")
	public String removeComment(@PathParam("title") String title, @PathParam("email") String email) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			String TITLE = title.replace('+', ' ');
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT productid FROM books WHERE title = '"+TITLE+"'");
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement prst = conn.prepareStatement("SELECT * FROM comments WHERE productid = '"+res1.getInt("productid")+"' && email = '"+email+"'");
				ResultSet resu = prst.executeQuery();
				
				if(resu.next())
				{
					result = "success";
					
					PreparedStatement ps = conn.prepareStatement("DELETE FROM comments WHERE productid = '"+res1.getInt("productid")+"' && email = '"+email+"'");
					ps.executeUpdate();
				}
				else {
					result = "failure";
				}
			}
			else 
			{
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GET
	@Path("/AllComments/{email}")
	@Produces(MediaType.APPLICATION_JSON)
	public String allComments(@PathParam("email") String email) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM comments WHERE email = '"+email+"'");
			ResultSet rs1 = ps1.executeQuery();
					
			while(rs1.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("email", rs1.getString("email"));
				jsonObject.put("comment", rs1.getString("comment"));
				jsonObject.put("rating", rs1.getInt("rating"));
						
				PreparedStatement ps2 = conn.prepareStatement("SELECT title FROM books WHERE productid = '"+rs1.getInt("productid")+"'");
				ResultSet rs2 = ps2.executeQuery();
					
				while(rs2.next())
				{
					jsonObject.put("title", rs2.getString("title"));
				}
				
				ja.put(jsonObject);

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/CommentsForBook/{title}")
	@Produces(MediaType.APPLICATION_JSON)
	public String commentsForBook(@PathParam("title") String title) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			String TITLE = title.replace('+', ' ');
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT productid FROM books WHERE title = '"+TITLE+"'");
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				int productid = res1.getInt("productid");
				
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM comments WHERE productid = '"+productid+"'");
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("email", rs1.getString("email"));
					jsonObject.put("comment", rs1.getString("comment"));
					jsonObject.put("rating", rs1.getInt("rating"));
					
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	
	@GET
	@Path("/AllBooksSortedByYear")
	@Produces(MediaType.APPLICATION_JSON)
	public String allBooksSortedByYear() {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books ORDER BY year DESC");
			ResultSet rs1 = ps1.executeQuery();
					
			while(rs1.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("productid", rs1.getInt("productid"));
				jsonObject.put("title", rs1.getString("title"));
				jsonObject.put("year", rs1.getInt("year"));
				jsonObject.put("description", rs1.getString("description"));
				jsonObject.put("author", rs1.getString("author"));
				jsonObject.put("pages", rs1.getInt("pages"));
						
				ja.put(jsonObject);

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/AllBooksSortedByOldest")
	@Produces(MediaType.APPLICATION_JSON)
	public String allBooksSortedByOldest() {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books ORDER BY year ASC");
			ResultSet rs1 = ps1.executeQuery();
					
			while(rs1.next())
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("productid", rs1.getInt("productid"));
				jsonObject.put("title", rs1.getString("title"));
				jsonObject.put("year", rs1.getInt("year"));
				jsonObject.put("description", rs1.getString("description"));
				jsonObject.put("author", rs1.getString("author"));
				jsonObject.put("pages", rs1.getInt("pages"));
						
				ja.put(jsonObject);

			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/AllBooksSortedByPagesMore/{pages}")
	@Produces(MediaType.APPLICATION_JSON)
	public String allBooksSortedByPagesMore(@PathParam("pages") int pages) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE pages > "+pages);
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books WHERE pages > "+pages);
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("productid", rs1.getInt("productid"));
					jsonObject.put("title", rs1.getString("title"));
					jsonObject.put("year", rs1.getInt("year"));
					jsonObject.put("description", rs1.getString("description"));
					jsonObject.put("author", rs1.getString("author"));
					jsonObject.put("pages", rs1.getInt("pages"));
						
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@GET
	@Path("/AllBooksSortedByPagesLess/{pages}")
	@Produces(MediaType.APPLICATION_JSON)
	public String allBooksSortedByPagesLess(@PathParam("pages") int pages) {
		JSONArray ja = new JSONArray();
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement pst1 = conn.prepareStatement("SELECT * FROM books WHERE pages < "+pages);
			ResultSet res1 = pst1.executeQuery();
			
			if(res1.next())
			{
				PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM books WHERE pages < "+pages);
				ResultSet rs1 = ps1.executeQuery();
					
				while(rs1.next())
				{
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("productid", rs1.getInt("productid"));
					jsonObject.put("title", rs1.getString("title"));
					jsonObject.put("year", rs1.getInt("year"));
					jsonObject.put("description", rs1.getString("description"));
					jsonObject.put("author", rs1.getString("author"));
					jsonObject.put("pages", rs1.getInt("pages"));
						
					ja.put(jsonObject);

				}
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return ja.toString();
	}
	
	@DELETE
	@Path("/RemoveBookByPagesMore/{pages}")
	@Produces("text/plain")
	public String removeBookByPagesMore(@PathParam("pages") int pages) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM books WHERE pages > '"+pages+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				PreparedStatement ps = conn.prepareStatement("DELETE FROM books WHERE pages > "+pages);
				ps.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@DELETE
	@Path("/RemoveBookByPagesLess/{pages}")
	@Produces("text/plain")
	public String removeBookByPagesLess(@PathParam("pages") int pages) {
		
		String result = null;
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			PreparedStatement prst = conn.prepareStatement("SELECT * FROM books WHERE pages < '"+pages+"'");
			ResultSet resu = prst.executeQuery();
			
			if(resu.next())
			{
				result = "success";
				
				PreparedStatement ps = conn.prepareStatement("DELETE FROM books WHERE pages < "+pages);
				ps.executeUpdate();
			}
			else {
				result = "failure";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
