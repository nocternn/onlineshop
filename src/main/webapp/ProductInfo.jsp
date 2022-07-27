<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="servlets.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
   <jsp:include page="_banner.jsp"/>
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
        
      <div id="product">
         <div class="container">
            <div class="col-md-12" style="padding-top: 120px;">
               <div class="titlepage">                  
		<%
			String imgLink = "", 
					imgName = "",
					price = "",
					description = "",
					productID = (String) request.getParameter("ProductInfoID");
			
			PreparedStatement s = SQLite.get("onlineshop.db").prepareStatement("Select * from product where product_id == ?;");
			s.setString(1,productID);
			ResultSet r = s.executeQuery();
			imgLink = r.getString("Image");
			imgName = r.getString("Product_Name");
			price = r.getString("price");
			description = r.getString("Description");
			r.close();
			s.close();
		%>	
		<!-- Showing product information -->
		<table>
			<tr>
				<th>
					<img src='<%= imgLink %>' alt ='<%= imgName %>' width="400" height="500">
					<br>
					<h5 style="text-transform:uppercase;"><%= imgName %></h5>
				</th>
				<th>
					<h2><b style="text-transform:uppercase;"><%= imgName %></b></h2>
					<p style="font-size:160%;"><%= description %></p>
					<br>
					<h3>
        				<a href="javascript:void(0);" onclick="addCart();">ADD TO CART</a>
      				</h3>
      				<h3>
        				<a href="payment.jsp">LET'S SEE MY CART</a>
      				</h3>
				</th>
			</tr>
		</table>
		<br>	
		<script>
			function addCart() {
			alert("Added to cart");
			<%
			ArrayList<Integer> cart = (ArrayList<Integer>) session.getAttribute("Cart");
			if (cart == null)
				cart = new ArrayList<Integer>();
			int pID = Integer.parseInt(productID);
			
			// Check for duplicate ID
			for (int iii=0; iii<cart.size(); ++iii)
			{
				if (cart.get(iii) == pID)
					pID = -1;
			}
			
			if (pID != -1)
				cart.add(pID);
			
			session.setAttribute("Cart",cart);
			%>
			}
		</script>
	            	</div>
        	</div>
      	</div>
      </div>		
      <jsp:include page="_footer.jsp"/>
</html>

