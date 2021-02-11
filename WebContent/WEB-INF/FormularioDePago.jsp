<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>ABM de Autos</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<%
	PlanDePago plan = null;
    LinkedList<PlanDePago> planes = new LinkedList<>();
    PlanDePagoLogic ppl = new PlanDePagoLogic();
    planes = ppl.getAll();
	
	%>

<title>Carga de Formulario</title>
</head>
<body>
	<div class="container-fluid">		 
	    <h2>ABM de Provincias</h2>
	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
		<div class="row">
			<div class="col-sm-4" style="background-color:lavender;">
		          <form action="" name="myForm" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-12" style="background-color:lavender;">
						    	<label>Tarjeta:</label>
								<select name="selectTarjeta" class="form-control">
									<%for(PlanDePago pdp: planes){  String value = Integer.toString(pdp.getIdPlan()); %>
										<option value="<%=value%>" ><%=pdp.getNombreTarjeta() %></option>
									<%} %>
								</select>
								
											
								
								<label>Descripcion:</label>
								<input type="text" name="txtDescripcion"  class="form-control"><br>
								<label>Precio:</label>
								<input type="text" name="txtPrecio"  class="form-control" ><br>
						
								<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletABMExtras/')"></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ServletABMExtras/cancelar')">Cancelar</button>
				   			</div>
		   				</div>
	   				</div>
	   			</form>
		   	</div>
		 </div>
	
</body>
</html>