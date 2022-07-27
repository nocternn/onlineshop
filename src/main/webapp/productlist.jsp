<!DOCTYPE html>
<html>
   
   <%@ page import="java.util.*" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="servlets.*" %>
   
	<jsp:include page="_banner.jsp"/>
	<script type="text/javascript">
	function RedirectToProductInfo(ProductID)
	{
		var urlSP = new URLSearchParams();
		urlSP.append("ProductInfoID", ProductID);
		location.replace('/onlineshop/productinfo?' + urlSP.toString());
	}
	</script>
	
	<div id="product">
		<div class="container">
        	<div class="col-md-12" style="padding-top: 120px;">
            	<div class="titlepage">
             		<h2>Our Products</h2>
             	</div>               
          	</div>
           
           <%
           	PreparedStatement p = SQLite.get("onlineshop.db").prepareStatement("Select * from Product;");
           	ResultSet r = p.executeQuery();
           	
           	int ProductPerRow = 3;
           	int currentRowProducts = 0;
           	
           	%><table><%
           	while (r.next())
           	{
           		// Start a new row
           		if (currentRowProducts == 0)
           		{
           			%><tr><%
           		}%>
           	
           		<td>
           			<table>
           				<tr>
	           				<td><img src="<%= r.getString("Image") %>" width="200px" height="200px" onclick="RedirectToProductInfo('<%=r.getString("Product_ID")%>')"></td>
	           			</tr>
	           			<tr>
				         	<td><h4><%= r.getString("Product_Name") %></h4></td>
				        </tr>
				        <tr>
					        <td><%= r.getString("Price") %>d</td>
				        </tr>
           			</table>
	           	</td>
			         			
			         		 	
	           	
	           	<%
	           		// End a row
		           	if (currentRowProducts == ProductPerRow - 1)
		           	{
	           			%></tr><%
	           		}
	           	
	           		currentRowProducts = (currentRowProducts + 1)%ProductPerRow;
	           	}
	       %></table>
	       
           </div>
	</div>
     <!-- end product list -->
     
      <jsp:include page="_footer.jsp"/>
</html>