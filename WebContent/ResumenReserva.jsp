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
<title>Resumen Reserva</title>
</head>
<body>
	<h1>Resumen de la reserva</h1>
	
	<form action="" name="myForm" method="post">	
		<div class="container">		 
			<div class="row">
				<div class="col-sm-4" style="background-color:lavender;">
					<label>Fecha:</label><br>
					<label>Tipo de auto:</label><br>
					<label>Modelo:</label><br>
			   	</div>
			   	<div class="col-sm-4" style="background-color:lavender;">
			 		<label>Sucursal:</label><br>
					<label>Total:</label><br>
					<button class="btn btn-primary" onclick="javascript: crearAlquiler('CrearAlquiler')" >Alquilar</button>
			 	</div>
			 </div>
		 </div>
	</form>
	
</body>
</html>