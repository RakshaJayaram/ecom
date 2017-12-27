<%@ page language="java" contentType="text/html"
	import="com.niit.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Blossom Florists</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
	<br>
	<center>
		<h2>Manage Category</h2>

		<security:authorize access="hasRole('ROLE_ADMIN')">

			<a href="createCategory" class="btn btn-primary" role="button">Add
				Category</a>
		</security:authorize>

	</center>



	<center>
		<table class="table">
			<thead>
				<tr>
					        
					<th >Category ID</th>         
					<th >Category Name</th>         
					<th >Category Description</th>         
					<th >Operations</th>       
				</tr>
				    
			</thead>

			<c:forEach items="${categoryList}" var="category">
				<tr >
					<td >${category.catId}</td>
					<td >${category.catName}</td>
					<td >${category.catDesc}</td>


					<td>
							<a href="<c:url value="deleteCategory/${category.catId}"/>">DELETE</a>/
			<a href="<c:url value="updateCategory/${category.catId}"/>">UPDATE</a>
						</td>
				</tr>
			</c:forEach>

		</table>
	</center>
	<br>
	<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>