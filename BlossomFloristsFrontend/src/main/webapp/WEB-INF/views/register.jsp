<%@ page language="java" contentType="text/html" import="com.niit.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

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

	<style>
	@media (min-width: 1000px) {
	.foot {
  position: absolute !important;
 bottom: 0 !important; 
  width:100%;
  }}
</style>

</head>
<body style="height:600px;">
	
	 <%@ include file="header.jsp" %>

	<h1>Sign up</h1>
	<hr>
	<div class="col-lg-12" >
		<div class="row">
			<spring:form modelAttribute="user" action="saveRegister" method="post">
				<div class="col-lg-10">
					<div class="form-group">
						<label>Email Id</label>
						<spring:input path="email"  placeholder="Enter mail Id" class="form-control" />
						<spring:errors path="email"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Name</label>
						<spring:input path="userName" placeholder="Enter name" class="form-control" />
						<spring:errors path="userName"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Address</label>
						<spring:input path="userAddress" placeholder="Enter address" class="form-control" />
						<spring:errors path="userAddress"></spring:errors>
					
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Contact Number</label>
						<spring:input path="userContact" placeholder="Enter contact number" class="form-control"  />
						<spring:errors path="userContact"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="form-group">
						<label>Password</label>
						<spring:input path="password" placeholder="Enter password" class="form-control" />
						<spring:errors path="password"></spring:errors>
					</div>
				</div>
				<div class="col-lg-10">
				<button type="submit" class="btn btn-lg btn-info">Submit</button>
				<button type="reset" class="btn btn-lg btn-info">Cancel</button>
				</div>
			</spring:form>
		</div>
	</div>

	<br>
		
</body>
<div class="foot" ><%@ include file="footer.jsp" %></div>
</html>