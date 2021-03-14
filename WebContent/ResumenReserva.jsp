<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
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
		function crearAlquiler(met){
			document.myForm.action=met;
		}
		function cancelarAlquiler(){
			if(confirm("Desea cancelar alquiler?")){
				window.location.href = "index.jsp";	
			}
			
		}
				
	</script>
 
    <%
    
    
    Alquiler alq = (Alquiler) session.getAttribute("alquiler");
    
    //CALCULO CANTIDAD DE DIAS
	
	Date fechaRetiro= alq.getFecRetiroPrevisto();
	Date fechaDevolucion= alq.getFecDevPrevista();
		
	long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
		
    
    %>
    
<title>Resumen de la Reserva</title>
</head>
<body>
			<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
 
  <a class="navbar-brand" href="login.jsp">Login</a>

	</nav>
	<h1>Resumen de la reserva</h1>

	<form action="" name="myForm" method="post">	
		<div class="container">		 
			<div class="row">
				<div class="col-sm-4" style="background-color:lavender;">
					<label>Fecha de retiro:<%=alq.getFecRetiroPrevisto() %></label><br>
					<label>Tipo de auto:<%=alq.getModelo().getTipoAuto().getNombreTipo() %></label><br>
					<label>Modelo:<%=alq.getModelo().getDenominacion() %> </label><br>
			   	</div>
			   	<div class="col-sm-4" style="background-color:lavender;">
			 		<label>Sucursal de retiro: <%=alq.getSucursal().getDenominacion() %></label><br>
					<label>Total:<%=alq.getPrecioDiario() * dias %></label><br>
					<button class="btn btn-primary" onclick="javascript: crearAlquiler('CrearAlquiler')" >Alquilar</button>
					<button type="button" class="btn btn-warning" onclick="javascript: cancelarAlquiler()" >Cancelar Alquiler</button>
			 	</div>
			 </div>
		 </div>
	</form>
	
</body>
</html>