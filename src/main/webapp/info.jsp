<%@ page language="java" contentType="text/html"%>
<html>
	<head>
		<title>User Info</title>
	</head>
	<body>
		<h1>INFO</h1>
		<%
			out.print("ID: " + request.getAttribute("id").toString());
			out.print("<br>Name: " + request.getAttribute("name").toString());
			out.print("<br>Email: " + request.getAttribute("UserAccount").toString());
		%>
	</html>