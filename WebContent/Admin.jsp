<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>

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
	
	<title>Servlet del Admin</title>
	<style>
		body{
  			background-color: #f5f5f5;
		}
		h1{
			background-color: green;
		}
		footer{
  			background-color: #285CAC;
  			height: 50px;
  
		}
		
	</style>
	
</head>
<body>
   	<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <a class="navbar-brand" href="#">Logout</a>

	</nav>
	<% 	
		Usuario user = (Usuario)session.getAttribute("usuario");
	
	if(!user.getRol().toLowerCase().equals("administrador")){
		String redirectURL = "index.html";
	    response.sendRedirect(redirectURL);
	}
	%>
		
	<label>Mail</label>
	<% out.println((String) user.getNombre().toString() ) ; %>
	
	<label>Rol</label>
	<% out.println((String) user.getRol().toString()); %>

	<h1>Probando JSP en Pagina de Admin</h1>
	

    <ul>
    	<li><a href="ABMModelos.jsp">IR a ABM Modelos</a></li>
    	<li><a href="ABMProvincias.jsp">IR a ABM de Provincias</a></li>
    	<li><a href="ABMUsuario.jsp">IR a ABM Usuarios</a></li>
    	<li><a href="ABMSucursales.jsp">IR a ABM Sucursales</a></li>
    	<li><a href="ABMAutos.jsp">IR a ABM de Autos</a></li>
    	<li><a href="ABMExtras.jsp">IR a ABM de Extras</a></li>
    	<li><a href="ABMPlanDePago.jsp">IR a ABM de Planes de Pago</a></li>
    </ul>
    
	
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <span class="text-muted">Place sticky footer content here.</span>
	  </div>
	</footer>
</body>
</html>