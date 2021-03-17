<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>
<%@ page import="logic.UsuarioLogic" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	function cargarFormulario(met) {
		document.formAuto.action=met;
	}
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
	}
    </script>
	
	
	<title>Sistemas</title>
	<style>
		body{
  			background-color: #f5f5f5;
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
</head>
<body>
   	<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Usuario.jsp">Home</a>
 
  <button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>


	</nav>
	
		

	<main>
		
		<section>
			<h1>Home de Usuarios</h1>
			
			<h2>Alquileres</h2>
		    <ul>
		    	<li><a href="BuscarAlquiler.jsp">Buscar Alquiler</a></li>
		   
		    </ul>
	    </section>
	    <section>
		    <h2>Listados</h2>
		    <ul>
		    	<li><a href="BuscarAutoEnAlq.jsp">Buscar Autos en un Alquiler</a></li>
		    	<li><a href="BuscarCliEnPlanes.jsp">Buscar Cliente segun planes de pago</a></li>
		    </ul>
	    </section>
	    <section>
		    <p>Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones 
		    de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.
		
			Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica Richard 
			McClintock asegura que su uso se remonta a los impresores de comienzos del siglo XVI.1​ Su uso en algunos 
			editores de texto muy conocidos en la actualidad ha dado al texto lorem ipsum nueva popularidad.
			
			El texto en sí no tiene sentido, aunque no es completamente aleatorio, sino que deriva de un t
			exto de Cicerón en lengua latina, a cuyas palabras se les han eliminado sílabas o letras. 
			El significado del mismo no tiene importancia, ya que solo es una demostración o prueba. 
			El texto procede de la obra De finibus bonorum et malorum (Sobre los límites del bien y del mal) 
			que comienza con: 
			</p>
		</section>
	</main>
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>