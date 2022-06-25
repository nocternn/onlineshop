<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>OnlineShop</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <!-- Google OAuth2.0 -->
      <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
      <script src="https://apis.google.com/js/platform.js" async defer></script>
      <meta name="google-signin-scope" content="profile email">
      <meta name="google-signin-client_id" content="514770052287-j3u5heaf45imceft1cnnfag7vu8d557i.apps.googleusercontent.com">
   </head>
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
							  	<div class="sign_btn"><a href="/onlineshop/login?code=loggedin">Logged In</a></div>
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
      <!-- product list -->
      <div id="product">
         <div class="container">
            <div class="col-md-12" style="padding-top: 120px;">
               <div class="titlepage">
                  <h2>Our Products</h2>
               </div>               
            </div>
            <div class="row">
               <div class="col-sm-6 col-lg-4">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
               <div class="col-sm-6 col-lg-4">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
               <div class="col-sm-6 col-lg-4">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
               <div class="col-sm-6 col-lg-4" style="margin-top: 40px;">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
               <div class="col-sm-6 col-lg-4" style="margin-top: 40px;">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
               <div class="col-sm-6 col-lg-4" style="margin-top: 40px; margin-bottom: 120px;">
                  <div class="box">
               		 <div>
               		    <img src="images/product.png">
               		 </div>
               		 <div>
               		 	<h4>Product Name</h4>
               		 	<div class="product_info">
               		 	   <h4>
               		 	      <span>$</span>
               		 	      999
               		 	   </h4>
               		 	</div>
               		 </div>
               	  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end product list -->
      <!--  footer -->
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

