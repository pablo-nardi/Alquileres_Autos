<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Cargar Extras</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
	
	ExtrasLogic el = new ExtrasLogic();
	LinkedList<Extras> extras = el.getAll();
	
	Alquiler alq = (Alquiler) session.getAttribute("alquiler");
	
	//CALCULO NUEVO PRECIO DEL ALQUILER SEGUN CANTIDAD DE DIAS
	
		Date fechaRetiro= alq.getFecRetiroPrevisto();
		Date fechaDevolucion= alq.getFecDevPrevista();
		
		long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
	
	if(request.getParameter("estado")!=null){
		LinkedList<Cantidad> cantidades = (LinkedList<Cantidad>) session.getAttribute("cantidades");
		cantidades.clear();
		session.setAttribute("cantidades", cantidades);
		alq.setPrecioDiario((Double) session.getAttribute("preOriginal"));
		
		response.sendRedirect("/Alquileres_Autos/CargarExtras.jsp");
	}
		
		
	%>
	
	
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	<h1>Elija los elementos extras para el vehiculo</h1>
				
					<div class="container"> 
				  		<div class="row">
				  			<table class="table table-hover">
				                <thead class="thead-dark">
				                  <tr>
				                    <th>Descripcion</th>
				                    <th>Precio</th>
									<th>Accion</th>
				                  </tr>
				                </thead>
				                <tbody>
				                <%for(Extras e : extras) { %>
					                	<tr>
					                		<td><%=e.getDescripcion() %></td>
						                    <td><%=e.getPrecio() %></td>
						                    <td>
						                    	<form action="CargarExtras" method="POST">
						                    		<input type="text" name="cant">
						                    		<input hidden="hidden" type="text" value="<%=e.getCodigo()  %>" name="cod">
						                    		<input hidden="hidden" type="text" value="<%=e.getPrecio()  %>" name="precio">
						                    		<input type='submit' value='Elegir'>
						                    	</form>
						                    </td>
						                </tr>
				                  <%}%>
				                </tbody>
				              </table>
				              	<label>Precio por dia del alquiler: </label>
				              	<p style="margin: 0 10px; color:black;"><b><%=alq.getPrecioDiario() %></b></p>
				              	<label>Cantidad de dias: </label>
				              	<p style="margin: 0 10px; color:black;"><b><%=dias %></b></p>
				              	<label>Precio total del alquiler: </label>
								<input type="text" value="<%=alq.getPrecioDiario() * dias %>" name="totalAlquiler">
								
	
				  		</div>
		   				<form action="" method="POST"> 
		   					
		   				</form>
		   					<button onclick="window.location.href = 'ResumenRetiro.jsp'"  class="btn btn-primary">Continuar</button>
		   					<button onclick="javascript: cancelarExtras()" class="btn btn-warning" >Cancelar Todos los Extras</button>
	   				</div>
	   
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
		<script type="text/javascript">
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
	}
	function cancelarExtras(){
		if(confirm("¿Desea Cancelar los extras elegidos?")){
			window.location.href = "CargarExtras.jsp?estado=wipeout";	
		}
	}
    </script>
</body>
</html>