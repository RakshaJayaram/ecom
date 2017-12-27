<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" >
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
	.foot {
  position: absolute !important;
  bottom: 0 !important;
  width:100%;
  }
</style>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="container-wrapper">
	<div class="login-container">
		<div id="login-box">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<center>
					
					<h2>Login</h2>
					</center>
					<hr class="colorgraph">
					<form name="loginForm" method="post"
						action="<c:url value="/j_spring_security_check"></c:url>">

						<div class="form-group">
							<label for="username">Email Id <span
								class="glyphicon glyphicon-user"></span>



							</label> <input type="text" id="username" name="j_username"
								class="form-control" placeholder="user name" required/>
						</div>

						<div class="form-group">
							<label for="password">Password <span
								class="glyphicon glyphicon-lock"></span>
							</label> <input type="password" id="password" name="j_password"
								class="form-control" placeholder="password" required/>
						</div>

						<input type="submit" value="Login" class="btn btn-primary" />
						<div id="errorMessage">${error }</div>
						<div>${logout}</div>
						<div id="registrationSuccessMessage">${registrationsuccess}</div>

					</form>
					</div>
					</div>
					</div>
					</div>
					</div><br>
					<div class="foot"><%@ include file="footer.jsp" %></div>	
					</body>
				
</html>