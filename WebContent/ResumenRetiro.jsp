<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Resumen Retiro</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/CSS/ABM.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
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
	AlquilerLogic al = new AlquilerLogic();
	Alquiler alq = al.getAlquiler(2);
	//Alquiler alq = (Alquiler) session.getAttribute("alquiler");
	
	//CALCULO CANTIDAD DE DIAS
	
		Date fechaRetiro= alq.getFecRetiroPrevisto();
		Date fechaDevolucion= alq.getFecDevPrevista();
			
		long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
	
	%>
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	<h1>Perfecto! El cliente ya puede retirar el vehiculo</h1>
				<form action="RetirarAuto" name="myForm" method="post">
					<div class="container"> 
				  		<div class="row">
				  			<div class="col-sm-4" style="background-color:lavender;">
								<label>Modelo:<%=alq.getModelo().getDenominacion() %></label><br>
								<label>Patente:</label><br>
								
						   	</div>
						   	<div class="col-sm-4" style="background-color:lavender;">
						 		<label>Sucursal de retiro: <%=alq.getSucursal().getDenominacion() %></label><br>
								<label>Total:<%=alq.getPrecioDiario() * dias %></label><br>
								<button class="btn btn-primary">Terminar</button>
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