<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Page</title>
</head>
<body>
<main>
 <c:forEach var="product" items="${products }">
  <!-- Left Column / Product Image -->
  <!--
  <div>
    <img data-image="black" src="images/black.png" alt="">
    <img data-image="blue" src="images/blue.png" alt="">
    <img data-image="red" class="active" src="images/red.png" alt="">
  </div>
  --> <!-- add this for product color (optional) -->


 <c:forEach var="product" items="${products }">
  <!-- Right Column -->
  <div>
 
    <!-- Product Description -->
    <div>
      <span>${product.tag}</span>
      <h1>${product.name}</h1>
      <p>${product.describe}</p>
    </div>
    <!-- Product Pricing -->
    <div>
      <span>${product.price}</span>
      <a href="#">Add to cart</a> <!-- put # here cuz after add to cart the page often go bak to the top (like shopee) -->
    </div>
  </div>
</c:forEach>
</main>
</body>
</html>