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
    		<div class="col-md-3">
    		</div>
    		<div class="col-md-6">
    			<div class="thumbnail" style="width:360px;">
    				<c:url value="/resources/backgroundImages/build4.jpg" var="url" />
      				<img src="${url }" class="img-rounded" style="width:100%; height: 380px;">
      			</div>
    		</div>
      		<div class="col-md-3">
    		</div>
    	</div>	
    	<div class="row">
    		<div class="col-md-12">
    			<h4>Blossom Florists is a caring local, family florist providing flower delivery. We formed the company
    	 because we have an inner desire to delight and wanted to combine this with our creative passion for beautiful flowers. 
    	As a local florists, we deliver direct from our own flower studio and pride ourselves on the quality of our flowers.
    	</h4>
    		</div>		
    	</div>
   		<div class="row">
   		</div>
   		<div class="row">
    		<div class="col-md-2">
    			<h4>Contact Us :</h4>
    		</div>		
    		<div class="col-md-10">
    			<h4>01632 431091</h4>	
    		</div>		
    	</div>
    	<div>
    	
    </div>
    </div>
		
</body>
<div class="foot"><%@ include file="footer.jsp" %></div>
</html>