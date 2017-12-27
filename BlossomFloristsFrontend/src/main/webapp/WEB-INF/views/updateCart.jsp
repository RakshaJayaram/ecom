<%@ page language="java" contentType="text/html"
	import="com.niit.model.Cart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" >
<title>Blossom FLorists</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<%@ include file="header.jsp"%>


	<div class="container">
	 <div class="row">
    		<div class="col-md-3">
    		</div>
    		<div class="col-md-6">
    			<div class="thumbnail" style="width:360px;">
    				<c:url value="/resources/images/${cart.image}.jpg" var="url" />
      				<img src="${url }" class="img-rounded" style="width:100%; height: 380px;">
      			</div>
    		</div>
      		<div class="col-md-3">
    		</div>
    	</div>	
	<form method="post" action="${pageContext.request.contextPath}/updateCart/${cart.cartid }/${pageContext.request.userPrincipal.name}/"
    	modelAttribute="cart">
		    			<form:input path="cart.image" hidden="true"/>
		
    	<div class="row">
    		<div class="col-md-12">
    			<h2>${cart.name }</h2>
    			<form:input path="cart.name" hidden="true"/>
    		</div>		
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Cart Id</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${cart.cartid}</h4>
    			<form:input path="cart.cartid" hidden="true"/>
    		
    		</div>
    		
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>User Email Id</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${cart.email}</h4>
    			<form:input path="cart.email" hidden="true"/>
    		</div>
    		
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Product Price</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${cart.price}</h4>
				<form:input path="cart.price" hidden="true"/>
    		</div>
    	</div>
    	
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Quantity</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<%-- <h4><input type="number" name="quantity" min="1" max="${product.stock}" required></h4> --%>
    			<h4><input type="number" name="quantity" min="1" max="3" required></h4>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4><security:authorize access="hasRole('ROLE_USER')">
								<button class="btn btn-info btn-lg" type="submit" name="addbutton" value="add" >Update cart</button>
							</security:authorize></h4>
    		</div>
    
    		<div class="col col-xs-8 col-md-9">
    		</div>
    	</div>
    	</form>
	</div>
<br>
<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>