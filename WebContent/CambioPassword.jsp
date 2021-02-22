<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>		
<html lang="en">
<head>

	
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function cargarFormulario(met){
		document.myForm.action=met;
	}
			
	</script>
	
	
<title>Cambio de Contraseña</title>
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Admin.jsp">Home</a>
 
  	<button type="button" class="btn btn-outline-warning">Logout</button>

	</nav>

	<h1>Solicitud de cambio de contraseña</h1>
		
	<h2>Ingreso de datos</h2>
		
	<form action="" name="myForm" method="post">			
		<div class="container"> 
		  <div class="row">
		    <div class="col-sm-4" style="background-color:lavender;">
		    	<label>Cuil de usuario</label>
		    	<input type="text" name="txtCuil" class="form-control" value="<%=(String)request.getParameter("id")%>" readonly>
		   		<label>Contraseña Antigua:</label>
		   		<input type="password" name="txtPassVieja" class="form-control"><br>
		   		<label>Contraseña Nueva:</label>
				<input type="password" name="txtPassNueva" class="form-control"><br>
		    	<label>Reingrese la Contraseña (Nueva):</label>
				<input type="password" name="txtPassConfirm" class="form-control"><br>
				<button class="btn btn-primary" onclick="javascript: cargarFormulario('ValidaPassword')">Cambiar</button>
		  		<button class="btn btn-outline-primary" onclick="javascript: cargarFormulario('ABMUSuarios/cancelar')" name="">Cancelar</button>
		    </div>
		  </div>
		</div>
	
	</form>
<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
		


</body>
</html>