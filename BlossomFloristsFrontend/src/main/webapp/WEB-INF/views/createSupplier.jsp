<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form:form action="AddSupplier" modelAttribute="supplier">

<table align="center" cellspacing="2" class="table">
	<center>
		<h2>Supplier Module</h2>
	</center>
	<tr>
	<%-- 	<td><h4>Supplier ID</h4></td>
		<td><form:input type="hidden" path="supplierId" /></td> --%>
	</tr>
	<tr>
		<td><h4>Supplier Name</h4></td>
		<td><form:input path="supplierName"/></td>
	<td><form:errors path="supplierName" /></td>
	</tr>
	<tr>
		<td><h4>Supplier Address</h4></td>
		<td><form:textarea path="supplierAddress"/></td>
		<td><form:errors path="supplierAddress" /></td>
	</tr>
	
	
	<tr>
		<td colspan="2">
			<center><input type="submit" class="btn btn-info"value="Add Supplier"/></center>
		</td>
	</tr>
</table>
</form:form>
<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>