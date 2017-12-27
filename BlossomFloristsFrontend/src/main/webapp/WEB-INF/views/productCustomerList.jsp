<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url value="/resources/css" var="css"></c:url>
<!DOCTYPE html>
<html>
<head>
<<meta http-equiv="Content-Type" >
<title>Blossom FLorists</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	
  
  #myTable{
	height: 400px !important;
	width : 290px !important;
	padding: 10px 10px 10px 10px;
	display:inline-table;
	/* float : left; */
	border: 5px solid ;
	border-color: rgb(232,232,232);
	border-radius:15px;
	background-color:rgb(240,240,240);
}

 .heading{
	width:200px !important;
	font-size: 16px;
	padding-bottom: 3px;
	padding-top: 3px;
	text-align: left;
	color:rgb(80,80,80);
	font-weight: lighter;
}
.content{
	width: 300px ;
	font-size: 17px;
	padding-bottom: 3px;
	padding-top: 3px;
	text-align: left;
	color:rgb(72,72,72);

}
.centerview{
	text-align: center !important;
}
#myButton{
	margin-left:50px !important;
	
}
</style>

</head>
<body>
<%@ include file="header.jsp" %>
<form:form action="AddProduct" modelAttribute="product"
		enctype="multipart/form-data">
			
				<c:if test="${empty productList}">
				<style>
					.foot {
						  position: absolute !important;
						  bottom: 0 !important;
						  width:100%;
						  }
				</style>
				</c:if>
			
				<c:forEach items="${productList}" var="product">
					<table class="table" id="myTable">
					<tr class="myRow">
					<td colspan="2" class="centerview"><img width="145px" height="165px"
							src="<c:url value="/resources/images/${product.productId}.jpg"/> " /></td>
					</tr>
					<tr class="myRow">
						<td class="heading">Product Name</td>
						<td class="content">${product.productName}</td>
					</tr>
					<tr class="myRow">
						<td class="heading">Price</td>
						<td class="content">Rs. ${product.price}</td>
					</tr>
					<tr class="myRow">
						<td class="heading">Category</td>
						<td class="content">${product.category.catName }</td>
					</tr>
					<tr class="myRow">
					<td colspan="2" >
						<a href="getAllUserProducts/${product.productId}" class="btn btn-info" id="myButton" role="button">View Product</a>
					
					</tr>
					</table>
				
				</c:forEach>

	
	</form:form><br>
		<div class="foot"><%@ include file="footer.jsp" %></div>
	
</body>
</html>