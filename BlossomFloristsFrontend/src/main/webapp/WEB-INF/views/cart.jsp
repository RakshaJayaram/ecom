<%@ page language="java" contentType="text/html"
	import="com.niit.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

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
</head>
<body>
	<%@ include file="header.jsp" %>
	<c:if test="${empty cartlist}">
		<style>
			body{
				background-position:50% 30%;
				background-image: url("${pageContext.request.contextPath}/resources/backgroundImages/sad smiley.png");
				background-repeat: no-repeat;
				background-color: white !important;
			}
			.foot {
						  position: absolute !important;
						  bottom: 0 !important;
						  width:100%;
						  }
		</style>
		<div class="container-fluid"><center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>You have not added anything to your cart.<br>
				<a href="${pageContext.request.contextPath}//getAllUserProducts" class="btn btn-link" role="button">>> Go Shopping</a></center>
		</div>
	</c:if>
	<c:if test="${not empty cartlist}">
	 <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th><h2>${product.productId}</h2></th>
                    </tr>
                </thead>
               
                <c:set var="total"/>
				<c:forEach var="cart" items="${cartlist}">                
                
                <tbody>
                
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        	<div ><img width="145px" height="165px"src="<c:url value="/resources/images/${cart.image}.jpg"/> " />
                            	<div class="media-body">
                                	<h4 >${cart.name}</h4>
                                	<span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            	</div>
                        	</div>
                        </td>
                       <%--  <td class="col-sm-1 col-md-1" style="text-align: center">
                        	<input type="email" class="form-control" id="exampleInputEmail1" value="${cart.quantity}" />
                        </td> --%>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cart.quantity}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>Rs${cart.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>Rs${cart.price*cart.quantity}</strong></td>
                        <td class="col-sm-1 col-md-1"> ${total=total+cart.price*cart.quantity}</td>
                        <td><a href="${pageContext.request.contextPath}/removeCart/${cart.cartid}/${pageContext.request.userPrincipal.name}/" >
                        		<button type="button" class="btn btn-danger">
                            		<span class="glyphicon glyphicon-remove"></span> Remove
                        		</button>
                        	</a>
                        	 <a href="${pageContext.request.contextPath}/editCart/${cart.cartid}/${pageContext.request.userPrincipal.name}/">
                        		<button type="button" class="btn btn-info">
                            		<span class="glyphicon glyphicon-pencil"></span> Edit
                        		</button>
                        	</a> 
                        </td>
                    </tr>
               
                </tbody>
	
				</c:forEach>

                <tfoot>
                    <tr>
                        
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal<h3>Rs:${total}</h3></h5></td>  
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="${pageContext.request.contextPath}/getAllUserProducts">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></a>
                        
                        </td>
                        <td>
                      <a href="${pageContext.request.contextPath}/checkout">  <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></a></td>
                        <td>
                        	<a href="${pageContext.request.contextPath}/clearCart/${pageContext.request.userPrincipal.name}/" >
                        		<button type="button" class="btn btn-danger">
                            		<span class="glyphicon glyphicon-remove"></span> Clear Cart
                        		</button>
                        	</a>
                        </td>
                    </tr>
                </tfoot>
            </table>
          
          </c:if>
         	<br>
           
</body>
<div class="foot"><%@ include file="footer.jsp" %></div>
</html>