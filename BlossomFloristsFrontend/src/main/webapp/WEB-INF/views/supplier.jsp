<%@ page language="java" contentType="text/html"
	import="com.niit.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
  bottom: 0 !important;
  width:100%;
  }}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<center>
		<h2>Manage Supplier</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createSupplier" class="btn btn-primary" role="button">Add
				Supplier</a>
		</security:authorize>


	</center>

	<center>
		<table  style="width: 80%" class="table">
			<thead>
				      
				<tr>
					        
					<th >Supplier ID</th>         
					<th >Supplier Name</th>         
					<th >Supplier Address</th>         
					<th >Operation</th>       
				</tr>
				    
			</thead>



			<c:forEach items="${supplierList}" var="supplier">
				<tr >
					<td >${supplier.supplierId}</td>
					<td >${supplier.supplierName}</td>
					<td >${supplier.supplierAddress}</td>
					<td><a
						href="<c:url value="deleteSupplier/${supplier.supplierId}"/>">DELETE</a>/
						<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>">UPDATE</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</center>
</body><br>
	<div class="foot"><%@ include file="footer.jsp" %></div>
</html>