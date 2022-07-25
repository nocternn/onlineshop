
<%@page import="java.sql.ResultSet"%>
<%@page import="servlets.SQLite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>A Form</title>
</head>
<body>
	<% String user = (String) session.getAttribute("UserAccount"); 
		  String cus_name="",cus_addr="",cus_phone="";
	
		  java.sql.Connection c = SQLite.get("onlineshop.db");
		  java.sql.PreparedStatement s = c.prepareStatement("Select * from Customer where Email ==?;");
		  s.setString(1,user);
		  ResultSet r = s.executeQuery();
	
		  if (r.isBeforeFirst() ) {  
			  cus_name = r.getString("Cus_name");
			  cus_addr = r.getString("Address");
			  cus_phone = r.getString("PhoneNumber");
			}
		  %>
	<form action="form" method="post">
		<p>Name</p>
		<input name="name" placeholder=<%=cus_name%> > <br>
		<p>Address</p>
		<input name="address" placeholder=<%=cus_addr%>> <br>
		<p>Phone Number</p>
		<input name="phone" placeholder=<%=cus_phone%>> <br>
		<p/>
		<button>Submit</button>
	</form>
</body>
</html>