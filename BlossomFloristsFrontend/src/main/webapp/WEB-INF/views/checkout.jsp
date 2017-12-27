<%@ page language="java" contentType="text/html"%>
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
    

  <div class="container">

        <div class="row">
          <div class="col-xs-6 jumbotron">
          	<div class="head">
            	<h3><p class="mytext">Customer Details</p></h3>
          	</div>

          	<div class="outer">
            	<div class="well" style="width:100%">
     				<form action="${pageContext.request.contextPath}/invoice"  method="post">
            			<c:set var="myvar" value="0"></c:set>
            
            			<c:if test="${not empty cart}">
    						<c:forEach var="c" items="${cart}">   
        						<c:set var="myvar" value="${myvar + c.price * c.quantity }"></c:set>        
              				</c:forEach>  
              			</c:if>
              		
                <div class="well">
                 	<table class="tbdetail">
		
                		<tr>
              				<td colspan="3"><b>Name</b></td>
              				<td>${user.userName}</td>
              			</tr>
              			<tr>
              				<td colspan="3"><b>Email</b></td>
              				<td>${user.email}</td>
              			</tr>
              			<tr>
              				<td colspan="3"><b>Contact Number</b></td>
              				<td>${user.userContact}</td>
              			</tr>
              			<tr>
              				<td colspan="3"><b>Customer Address</b></td>
              				<td>${user.userAddress}</td>
              			</tr>
              
               			<tr>
              				<td colspan="3"><b>Total Amount</b></td>
              				<td>  ${myvar}</td>
              			</tr>
              		</table>
                </div>
                    
                <div style="margin-top:10px">
                  	<h3 ><strong>Enter card details</strong></h3>
                </div>
                <input type="hidden" name="total"  value="${myvar}" >
             
             <div class="well">
             	<label>Payment</label><br>
             	<select name="payment">
    				<option value="COD">Cash on Delivery</option>
    				<option value="NetBanking">Net Banking</option>
				</select>
  				
  				<br>
                <input type="text" name="cardnum" placeholder="Enter your card number" style="width:70%"><br>
                <br>
                <input type="text" name="name" placeholder="Name on the card" style="margin-bottom:10px;width:70%"><br>
                <div>
                    <table>
                       <tr>
                       		<th colspan="2">Expiry</th>
                         	<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                       		<th>CVV</th>
                       	</tr>
                       <tr>
                       		<td colspan="2">  <input type="number" min="1" max="12" name="month" placeholder="mm" style="width:50px">
                         	<input type="number" min="1" max="12" name="year" placeholder="yy" style="width:50px"></td>
                         	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
              				<td><input type="number" min="111" max="999" name="cvv" placeholder="cvv" style="width:50px"></td>
              				
              				<td></td>
              			</tr>
                	</table>
                </div>
              </div>
              <input type="submit"  value="PROCEED" style="width:75%; font-size:20px;" class="btn btn-success">
         </form>
         </div>
         </div>
        </div>


      </div>

      </div>
      
      <div><br></div>
    <div class="foot"><%@ include file="footer.jsp" %></div>
    
</body>

</html>