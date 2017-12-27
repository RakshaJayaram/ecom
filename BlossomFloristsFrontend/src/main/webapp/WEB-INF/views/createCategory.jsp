<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<form:form action="AddCategory" modelAttribute="category" >


		<table align="center" class="table">
			<center>

				<h2>
					Category Module
				</h2>

			</center>
			<tr>
				<!-- <td><h4>Category ID</h4></td> -->
				<td><form:input type="hidden" path="catId" /></td>
			</tr>
			<tr>
				<td><h4>Category Name</h4></td>
				<td><form:input path="catName" /></td>
				<td><form:errors path="catName" /></td>
			</tr>
			<tr>
				<td><h4>Category Description</h4></td>
				<td><form:input path="catDesc" /></td>
				<td><form:errors path="catDesc" /></td>
			</tr>
			<tr>
				<td colspan="2"><security:authorize
						access="hasRole('ROLE_ADMIN')">
						<center>

							<input type="submit" class="btn btn-default" value="Add Category" />
							
						</center>
					</security:authorize></td>
			</tr>
		</table>
	</form:form>

<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>