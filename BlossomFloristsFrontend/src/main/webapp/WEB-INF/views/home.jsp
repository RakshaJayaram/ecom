<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home-Blossom Florists</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	@media (min-width: 100px) {
   #img1,#img2,#img3,#img4,#img5,#img6{ height: 100px !important ;}
   #con{width:150px !important}
}
	@media (min-width: 200px) {
   #img1,#img2,#img3,#img4,#img5,#img6{ height: 150px !important ;}
   #con{width:200px !important}
}

@media (min-width: 300px) {
  #img1,#img2,#img3,#img4,#img5,#img6{ height: 250px !important; }
   #con{width:300px !important}
}

@media (min-width: 400px) {
   #img1,#img2,#img3,#img4,#img5,#img6{ height: 350px !important; }
    #con{width:400px !important}
}
@media (min-width: 600px) {
   #img1,#img2,#img3,#img4,#img5,#img6{ height: 550px !important ;}
    #con{width:600px !important}
}
@media, (min-width: 800px) {
   img{ height: 650px !important ; }
    #con{width:800px !important}
}
body{
	background-color: rgb(232,232,232) !important ;
}
</style>
</head>

<body>
	<%@ include file="header.jsp" %>
	<div class="container" id="con">	
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img id="img1"
						src="${pageContext.request.contextPath}/resources/carousalImages/one.jpeg"
						>
				</div>

				<div class="item">
					<img id="img2"
						src="${pageContext.request.contextPath}/resources/carousalImages/two.jpg"
						>
				</div>

				<div class="item">
					<img id="img3"
						src="${pageContext.request.contextPath}/resources/carousalImages/three.jpg"
						>
				</div>

				<div class="item">
					<img id="img4"
						src="${pageContext.request.contextPath}/resources/carousalImages/four2.jpg"
						>
				</div>

				<div class="item">
					<img id="img5"
						src="${pageContext.request.contextPath}/resources/carousalImages/five.jpg"
						>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
	<div class="foot"><%@ include file="footer.jsp" %></div>
	
</body>
</html>