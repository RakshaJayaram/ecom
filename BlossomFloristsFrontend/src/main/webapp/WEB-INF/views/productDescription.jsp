<%@ page language="java" contentType="text/html"
	import="com.niit.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" >
<title>Blossom FLorists</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="header.jsp" %>

	
	<div class="container">
		 <div class="row">
    		<div class="col-md-3">
    		</div>
    		<div class="col-md-6">
    			<div class="thumbnail" style="width:360px;">
    				<c:url value="/resources/images/${product.productId}.jpg" var="url" />
      				<img src="${url }" class="img-rounded" style="width:100%; height: 380px;">
      			</div>
    		</div>
      		<div class="col-md-3">
    		</div>
    	</div>	
    	<div class="row">
    		<div class="col-md-12">
    			<h2>${product.productName }</h2>
    		</div>		
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Product Id</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.productId}</h4>
    		</div>
    		
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Product Price</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.price}</h4>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Stock</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.stock}</h4>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Product Description</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.productDesc}</h4>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Supplier</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.supplier.supplierName}</h4>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col col-xs-4 col-md-3">
    			<h4>Category</h4>
    		</div>
    		<div class="col col-xs-8 col-md-9">
    			<h4>${product.category.catName}</h4>
    		</div>
    	</div>
    	<form action="${pageContext.request.contextPath}/addCart/${product.productId}/${pageContext.request.userPrincipal.name}/">
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
								<button class="btn btn-info btn-lg" type="submit" name="addbutton" value="add" >add to cart</button>
							</security:authorize></h4>
    		</div>
    
    		<div class="col col-xs-8 col-md-9">
    			<a href="<c:url value="/getAllUserProducts"></c:url>"
						class="btn btn-info btn-lg">Back</a>
    		</div>
    	</div>
    	</form>
	</div>
	<br>
	

</body>
<div class="foot"><%@ include file="footer.jsp" %></div>
</html>