<%@ page language="java" contentType="text/html"
	import="com.niit.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
<html>
<head>
<title>Blossom Florists</title>
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
  bottom: 0 !important;
  width:100%;
  }}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<center>
	<form:form method="post" action="InsertProduct" 
		commandName="createProductObj" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td><form:label path="productId">Product Id</form:label></td>
				<td><form:input path="productId" disabled="true"
						class="form-control"></form:input></td>
				<%-- <td><form:hidden path="id" /></td> --%>
			</tr>
			<tr>
				<td><form:label path="productName">Product Name</form:label></td>
				<td><form:input path="productName" class="form-control"></form:input></td>
				<td><form:errors path="productName" /></td>
			</tr>

			<tr>
				<td><form:label path="price">Product Price</form:label></td>
				<td><form:input path="price" class="form-control"></form:input></td>
				<td><form:errors path="price" /></td>
			</tr>

			<tr>
				<td><form:label path="productDesc">Product Description</form:label></td>
				<td><form:input path="productDesc" class="form-control"></form:input></td>
				<td><form:errors path="productDesc" /></td>
			</tr>
			<tr>
				<td><form:label path="stock">Stock</form:label></td>
				<td><form:input path="stock" class="form-control"></form:input></td>
				<td><form:errors path="stock" /></td>
			</tr>
			<tr>
				<td><form:label path="supplier">Supplier List
						<spring:message text="Supplier" />
					</form:label></td>
				<td><form:select path="supplier.supplierName"
						items="${supplierList}" itemValue="supplierName" itemLabel="supplierName"
						class="form-control" /></td>
			</tr>
			<tr>
				<td><form:label path="category">Category List
						<spring:message text="Category" />
					</form:label></td>
				<td><form:select path="category.catName"
						items="${categoryList}" itemValue="catName" itemLabel="catName"
						class="form-control" /></td>
			</tr>

			<tr>
				<td><form:label path="pimage"> Insert Image
						<spring:message text="pimage" />
					</form:label></td>
				<td><form:input path="pimage" type="file" /></td>

			</tr>
			</center>
				<center>
			<tr>
				<td colspan="2"><input type="submit" value="Add Product"
					class="btn btn-default"></td>
			</tr>
			</center>
		</table>
	</form:form>
<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>