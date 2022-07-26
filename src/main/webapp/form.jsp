<!DOCTYPE html>
<html>
	<style>
		/* Remove up/down arrow in number-type button 
			Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox */
		
		input[type=number], button {
		  -moz-appearance: textfield;
		  vertical-align: middle;
		}
	</style>
	<jsp:include page="_banner.jsp" />

	
	<%@page import="java.sql.ResultSet"%>
	<%@page import="servlets.SQLite"%>
	
	<%
		String user = (String) session.getAttribute("UserAccount"); 
		String cus_name="",cus_addr="",cus_phone="";
		if (user != null)
		{
			
		  java.sql.Connection c = SQLite.get("onlineshop.db");
		  java.sql.PreparedStatement s = c.prepareStatement("Select * from Customer where Email ==?;");
		  s.setString(1,user);
		  ResultSet r = s.executeQuery();
	
		  if (r.isBeforeFirst() ) {  
			  cus_name = r.getString("Cus_name");
			  cus_addr = r.getString("Address");
			  cus_phone = r.getString("PhoneNumber");
			}
		}
	%>
		  
	 <div class="container">
            <div class="col-md-12" style="padding-top: 120px;">
				<form action="form" method="post">
				     <h1> Delivery Information Form </h1>
					<p>Name</p>
					<input name="name" value=<%=cus_name%> > <br>
					<p>Address</p>
					<input name="address" value=<%=cus_addr%>> <br>
					<p>Phone Number</p>
					<input name="phone" type=number value=<%=cus_phone%>> <br>
					<p/>
					<br>
					<button class="sign-btn">Submit</button>
				</form>
			</div>
	</div>
		
	<jsp:include page="_footer.jsp" />
	
</html>