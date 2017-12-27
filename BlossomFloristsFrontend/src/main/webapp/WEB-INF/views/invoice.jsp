<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Product-Blossom Florist</title>
<style>
.foot {
						  position: absolute !important;
						  bottom: 0 !important;
						  width:100%;
						  }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
	<br>
		<form  class="form-horizontal" action="${pageContext.request.contextPath }/getAllUserProducts">
			<fieldset>
			  <div class="form-group">
							<label class="col-md-4 col-xs-4 control-label" for="username">Customer Name</label>
							<div class="col-md-8 col-xs-8">
								<label class="col-md-4 col-xs-4 control-label" for="username">${user.userName}</label>
							</div>
						</div>

					
						<div class="form-group">
							<label class="col-md-4 col-xs-4 control-label" for="email">Customer Email
								Address</label>
							<div class="col-md-8 col-xs-8">
								<label class="col-md-4 col-xs-4 control-label" for="email">${user.email}</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 col-xs-4 control-label" for="address">Shipping Address</label>
							<div class="col-md-8 col-xs-8">
								<label class="col-md-4 col-xs-4 control-label" for="address">${user.userAddress}</label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 col-xs-4 control-label" for="deliverydate">Date Of Delivery</label>
							<div class="col-md-8 col-xs-8">
								<label class="col-md-4 col-xs-4 control-label" for="deliverydate">Deliverd in 7 Working Days</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 col-xs-4 control-label" for="submit"></label>
							<div class="col-md-4 col-xs-4">
								<button type="submit" name="invoiceClick" class="btn btn-primary" >Continue Shopping</button>
							</div>
						</div>
			</fieldset>
		</form>
	</div><br>
	 <div class="foot"><%@ include file="footer.jsp" %></div>
	   
</body>
</html>