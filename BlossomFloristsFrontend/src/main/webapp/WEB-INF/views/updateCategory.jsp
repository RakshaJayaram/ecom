<%@ page language="java" contentType="text/html" import="com.niit.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<%@ include file="header.jsp"%>

<form:form action="${pageContext.request.contextPath}/updateCategory" modelAttribute="category" method="post">

<table align="center" cellspacing="2" class="table">
	<center>
		<h2>Category Module</h2>
	</center>
	<tr>
		<td><h4>Category ID</h4></td>
		<!--<td><input type="text" name="catId"/></td>-->
		<td><form:input path="catId"/></td>
	</tr>
	<tr>
		<td><h4>Category Name</h4></td>
		<!-- <td><input type="text" name="catName"/></td> -->
		<td><form:input path="catName"/></td>
	</tr>
	<tr>
		<td><h4>Category Desc</h4></td>
		<!-- <td><input type="text" name="catDesc"/></td> -->
		<td><form:input path="catDesc"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" class="btn btn-default" value="Update Category"/></center>
		</td>
	</tr>
</table>

</form:form><br>
	<div class="foot"><%@ include file="footer.jsp" %></div>
</body>
</html>