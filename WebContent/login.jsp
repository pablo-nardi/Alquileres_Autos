<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Alquileres Autos</title>
  <link rel="stylesheet" href="./CSS/index.css">
  <link rel="stylesheet" href="./CSS/login.css">

</head>
	<body>
		<!-- partial:index.partial.html -->
		<div class="login-page">
		  <div class="form">
		  	<a href="index.jsp" id="linkInicio">Volvar al Inicio</a>
		    <form class="register-form" action="ServletLogin" method="post">
		      <input type="email" name="txtNombre" id="name" placeholder="ejemplo@ejem.com" value="pnardi@gmail.com" required autofocus>
		      <input type="password" name="txtpswd" id="pswd" required placeholder="password" value="pablo1234" />
		      <button type="submit" >create</button>
		      
		      
		    </form>
		    
		  </div>
		</div>
	</body>
</html>