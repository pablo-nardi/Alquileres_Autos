<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Cargar Conductor</title>

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
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
	}
	function buscarAlquileres(met){
		document.myForm.action=met;
	}
    </script>
	<style>
		body{
  			background-color: #c6c6c6;
  			padding: 5px 15px;
		}
		h1{
			background-color: #5ea248;
			text-align: center;
		}
		footer, nav{
  			background-color: #40632b;
  			height: 50px;
  
		}
		.container p{
			color: #f5f5f5;
		}
		
	</style>
		<% 	
	UsuarioLogic ul = new UsuarioLogic();
	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "g")){
		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
		response.sendRedirect(redirectURL);
	}
	%>
	<%
	
	AutoLogic al = new AutoLogic();
	Alquiler alq = (Alquiler) session.getAttribute("alquiler");
	alq.setAuto(al.getOne(request.getParameter("idAut")));
	
	session.setAttribute("alquiler", alq);
	%>
	
</head>
<body>
		<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	
	<h1>Cargar Conductor</h1>
	
				<form action="CargarConductor" name="myForm" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-12" style="background-color:lavender;">
						    	<label>Nombre y Apellido:</label>
								<input type="text" name="txtNomApe" required class="form-control">
						    	<label>Fecha de Nacimiento:</label>
								<input type="date" name="txtFechaNac" required class="form-control">
								<label>DNI:</label>
								<input type="number" name="txtDni" required class="form-control">
								<label>Numero Licencia:</label>
								<input type="number" name="txtLicencia" required class="form-control">
								<label>Fecha Licencia:</label>
								<input type="date" name="txtFechaLic" required class="form-control">
								<label>Celular:</label>
								<input type="number" name="txtCel" required class="form-control">
								<label>Mail:</label>
								<input type="email" name="txtMail" required class="form-control"><br>
								<button class="btn btn-primary">Continuar</button>
				   			</div>
		   				</div>
	   				</div>
	   			</form>
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>