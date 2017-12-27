<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
	});
</script>
<style>

@media (min-width: 300px) {
	#space{
 	padding-left: 2em;}
}

@media (min-width: 400px) {
   #space{
 	padding-left: 3em;}
}
@media (min-width: 600px) {
    #space{
 	padding-left: 1em;}
}
@media (min-width: 700px) {
    #space{
 	padding-left: 1em;}
}
@media, (min-width: 800px) {
   #space{
 	padding-left: 35em;}
}
body{
	background-color: rgb(232,232,232) !important ;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Blossom Florists</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/home">
						<span class="glyphicon glyphicon-home"></span> Home</a>
					</li>


					<li><a href="${pageContext.request.contextPath}/aboutUs">About
							Us</a>
					</li>

					<c:if test="${pageContext.request.userPrincipal.name!=null}">
						<security:authorize access="hasRole('ROLE_ADMIN')">

							<li><a
								href="${pageContext.request.contextPath}/getAllcategories">Browse
									 Categories</a></li>
							<li><a
								href="${pageContext.request.contextPath }/getAllsuppliers">Browse
									 Suppliers</a></li>
							<li><a
								href="${pageContext.request.contextPath }/getAllproducts">Browse
									 Products</a></li>

						</security:authorize>
						
					<security:authorize access="hasRole('ROLE_USER')">
        				<li><a
								href="${pageContext.request.contextPath }/getAllUserProducts">Browse
									All Products</a></li>
					

						 <li> <a href="${pageContext.request.contextPath}/ShoppingCart/${pageContext.request.userPrincipal.name}/">
          <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
        </a></li>
				</security:authorize>
						<li id="space">&emsp;</li>
						<li ><a>Welcome ${pageContext.request.userPrincipal.name }</a></li>
						<li ><a href="<c:url value="/j_spring_security_logout"/>">logout</a></li>
					</c:if>
					
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name==null}">
						<li><a href="${pageContext.request.contextPath }/register"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>

						<li><a href="${pageContext.request.contextPath }/login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</c:if>





				</ul>
			</div>
		</div>
	</nav>
</body>
</html>





