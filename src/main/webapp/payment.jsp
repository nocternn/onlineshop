<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
	<jsp:include page="_banner.jsp"></jsp:include>
     
   <%@ page import="java.util.*" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="servlets.*" %>
    <!-- Functions for plus/minus buttons -->
    <script type='text/javascript'>
		function increment(productName) {
			var productQuantityField = document.getElementById("input" + productName).stepUp();
			var productPrice = document.getElementById("price" + productName).value;
			document.getElementById("Total").value = parseFloat(document.getElementById("Total").value) + parseFloat(productPrice);
			
		  }
		function decrement(productName) {
			if (document.getElementById("input" + productName).value > 0)	
			{
				document.getElementById("input" + productName).stepDown();
				var productPrice = document.getElementById("price" + productName).value;
				document.getElementById("Total").value = parseFloat(document.getElementById("Total").value) - parseFloat(productPrice);
			}
		  }
	</script>
     
      <div id="product">
         <div class="container">
            <div class="col-md-12" style="padding-top: 120px;">
               <div class="titlepage">
                  <h2>Your Cart</h2>
                  
                  <!-- GENERATE PRICE TABLE  -->
                  	
                  
                  <!-- TODO: Remove session.setAttribute() when everything is in place-->
                  <% 
                 	//session.setAttribute("Cart", new ArrayList<Integer>(Arrays.asList(1, 2, 3)));

          			float totalPrice=0;
          			if (session.getAttribute("Cart") == null){ %>
          			
          				<p>There's nothing in your cart. Go buy something!</p>
          			
          			<% }else %>
          			
          			<table> <tr> <td></td>	<td></td>	<td>Quantity</td>	<td></td>	<td>Price</td></tr>
          			
          			<%
          			{
                      	ArrayList<Integer> productID = (ArrayList<Integer>) session.getAttribute("Cart");
                      	
                		String imgLink = "", imgName = "", price = "";
                	
           				PreparedStatement s = SQLite.get("onlineshop.db").prepareStatement("Select image, product_name, price from product where product_id == ?;");
               			for (int iii=0; iii<productID.size(); ++iii)
               			{
               				s.setString(1, productID.get(iii).toString());
               				
               				ResultSet r = s.executeQuery();
               				imgLink = r.getString("Image");
               				imgName = r.getString("Product_Name");
               				price = r.getString("price");
               				totalPrice += Float.parseFloat(price);
               				r.close();
               				%>
               				<tr>
               					<td> <img src='<%= imgLink %>' alt='<%=imgName%>' width='100' height='100'> </td>
               					<td> <button onclick='decrement("<%=imgName%>")'>-</button></td>
               					<td> <input id='input<%=imgName%>' type=number placeholder=1 value=1 maxlength='4' size='4' readonly='readonly'> </td>
               					<td> <button onclick='increment("<%=imgName%>")'>+</button></td>
               					<td> <input id='price<%=imgName%>' type=number value='<%=price%>' size='4' readonly='readonly'></td>
               				</tr>
      
               				
               				<tr>
               					<td><%=imgName%></td>
               				</tr>
               				
               				<%
               			}
           				s.close();
          			}
          		%>
                  <tr> <td></td>	<td></td>	<td>Total:</td>	<td></td>	<td><input id='Total' type=number value='<%=totalPrice%>' size='10' readonly='readonly'></td></tr>
                  <tr> <td></td>	<td></td>	<td></td>	<td></td>	<td><button type='button'><a href='/onlineshop/form'>Checkout</a></button></td></tr>
				</table>
                  
            	</div>
        	</div>
      	</div>
      </div>
      
     <jsp:include page="_footer.jsp"/>
   
</html>
