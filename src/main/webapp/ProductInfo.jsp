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
    

	
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div  class="head_top">
            <div class="header">
               <div class="container">
                  <div class="row">
                     <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                        <div class="full">
                           <div class="center-desk">
                              <div class="logo">
                                 <a href="index.html"><img src="images/logo.png" alt="#" /></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                        <nav class="navigation navbar navbar-expand-md navbar-dark">
                           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                           <span class="navbar-toggler-icon"></span>
                           </button>
                           <div class="collapse navbar-collapse" id="navbarsExample04">
                              <ul class="navbar-nav mr-auto">
                                 <li class="nav-item">
                                    <a class="nav-link" style="color: #2bcc91;" href="index.jsp">Home</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" style="color: #2bcc91;" href="#about">About</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" style="color: #2bcc91;" href="product.jsp">Our Products</a>
                                 </li>
                              </ul>
                              <% if (session.getAttribute("code") != "loggedin") { %>
							  	<div class="sign_btn"><a href="/onlineshop/login?code=login">Sign In</a></div>
							  <% } else { %>
							  	<div class="sign_btn"><a href="/onlineshop/product.jsp"><%= session.getAttribute("UserAccount") %></a></div>
							  <% } %>
                           </div>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
            <!-- end header inner -->
            <!-- end header -->
         </div>
      </header>
      <!-- end banner --> 
      
        
      <div id="product">
         <div class="container">
            <div class="col-md-12" style="padding-top: 120px;">
               <div class="titlepage">                  
		<%
			//session.setAttribute("ProductInfoID","1");
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
        				<a href="payment.jsp">BUY NOW</a>
      				</h3>
      				<h3>
        				<a href="javascript:void(0);" onclick="addCart();">ADD TO CART</a>
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
			cart.add(Integer.parseInt(productID));
			session.setAttribute("Cart",cart);
			%>
			}
		</script>
	            	</div>
        	</div>
      	</div>
      </div>		
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <div class="cont">
                        <h3> <strong class="multi"> Free Multipurpose</strong><br>
                           Responsive Landing Page 2019
                        </h3>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="cont_call">
                        <h3> <strong class="multi"> Call Now</strong><br>
                           (+1) 12345667890
                        </h3>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>Â© 2019 All Rights Reserved. Design by <a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
   </body>
</html>

