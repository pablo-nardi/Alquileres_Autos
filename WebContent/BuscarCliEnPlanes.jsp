<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %><!DOCTYPE html>
<html lang="en">
<head>

<title>Buscar Alquileres</title>

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
	function recargar(met){
		/*if(confirm("¿Desea recargar la pagina?")){
			window.location.href = "BuscarAutoEnAlq.jsp";*/
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

	PlanDePago pdp = new PlanDePago();
	PlanDePagoLogic pl = new PlanDePagoLogic();
	LinkedList<PlanDePago> planes = pl.getPlanes();
	LinkedList<Alquiler> alquileres = null;
	if (request.getParameter("nom") != null){
		alquileres = pl.getAlqFromPlanes(
				request.getParameter("nom"), 
				request.getParameter("ent"),
				request.getParameter("tar")
				);
	}
	
	
	
	%>

	
	
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	
	<h1>Buscar en base a planes de pago</h1>
<div class="container" style="background-color:#96c287; margin-top:100px;">	
	     	<div class="row">
	     		<div class="col-sm-12"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                  	<th>Nombre Plan</th>
	                  	<th>Entidad Crediticia</th>
	                    <th>Tarjeta</th>
	                    <th>Accion</th>
	                  </tr>
	                </thead>
	                <tbody>
	                	<%
	                	if(!planes.isEmpty()  ){
		                	for( PlanDePago p : planes) { %>
			                	<tr>
			                		<td><%=p.getNombrePlan() %></td>
			                		<td><%=p.getEntidadCrediticia() %></td>
			                		<td><%=p.getNombreTarjeta() %></td>
				                	<td><a class="form-botton-editar" 
				                  		href="BuscarCliEnPlanes.jsp?nom=<%=p.getNombrePlan() %>&ent=<%=p.getEntidadCrediticia()  %>&tar=<%=p.getNombreTarjeta()  %>"
				                  		style="width: 100px;"
				                  		>Seleccionar</a></td>
				                </tr>
							<%}
	                	}
		                	%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	     	</div>
	    </div>
	<div class="container" style="background-color:#96c287; margin-top:100px;
	 display:<%=request.getParameter("nom")==null?"none":"block"%>">	
	     	<div class="row">
	     		<div class="col-sm-12"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                  	<th>Id ALquieler</th>
	                  	<th>Nombre Cliente</th>
	                    <th>CUIL</th>
	                    <th>Modelo</th>
						<th>Nombre Plan</th>
						<th>Entidad Crediticia</th>
						<th>Tarjeta</th>
						<th>Cuotas</th>	
	                  </tr>
	                </thead>
	                <tbody>
	                	<%
	                	if(alquileres != null ){
		                	for(Alquiler a : alquileres) { %>
			                	<tr>
			                		<td><%=a.getIdAlquiler() %></td>
			                		<td><%=a.getUsuario().getNombre() %></td>
			                		<td><%=a.getUsuario().getCuil() %></td>
			                		<td><%=a.getAuto().getModelo().getDenominacion() %></td>
			                		<td><%=a.getPlan().getNombrePlan() %></td>
				                	<td><%=a.getPlan().getEntidadCrediticia() %></td>
				                	<td><%=a.getPlan().getNombreTarjeta() %></td>
				                	<td><%=a.getPlan().getCantCuotas() %></td>
				                </tr>
							<%}
	                	}
		                	%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	     	</div>
	    </div>
	    	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>