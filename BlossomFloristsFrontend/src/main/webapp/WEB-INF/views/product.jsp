<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
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
<style>
	@media (min-width: 1000px) {
	.foot {
  position: absolute !important;
  width:100%;
  }}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<center>
		<h2>Manage Product</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createProduct" class="btn btn-primary" role="button">Add
				Product</a>
		</security:authorize>


	</center>

	<form:form action="AddProduct" modelAttribute="product"
		enctype="multipart/form-data">
		<center>
			<table  style="width: 80%" class="table">
				<thead>
					      
					<tr>
						       
						<th >Product Id</th> 
						<th >Product Name</th>
						<th >Supplier Name</th>    
						<th >Category Name</th>              
						<th >Price</th>            
						<th >Description</th>
						<th >Stock</th>
						<th >Photo</th>  
						
					</tr>
					    
				</thead>
				<c:forEach items="${productList}" var="product">
					<tr>
						<td align="center"><a
							href="getAllproducts/${product.productId}">${product.productId }</a></td>

						<td >${product.productName}</td>
						<td >${product.supplier.supplierName }</td>
						<td >${product.category.catName }</td>
						<td >${product.price}</td>
						<td >${product.productDesc }</td>
						<td >${product.stock }</td>

						<td align="center"><img width="100px" height="100px"
							src="<c:url value="/resources/images/${product.productId}.jpg"/> " /></td>

						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a
								href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a>/
								<a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>
							</td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
	</form:form>
	</center><br>
		<div class="foot"><%@ include file="footer.jsp" %></div>
	
</body>
</html>