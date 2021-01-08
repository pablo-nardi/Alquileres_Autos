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
	<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #285CAC;">
	  <!-- Brand -->
	  <a class="navbar-brand" href="#">Logo</a>
	
	  <!-- Links -->
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="#">INICIO</a>
	    </li>
	
	    <!-- Dropdown -->
	    <li class="nav-item dropdown" my-2 my-lg-0>
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        Usuario
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="#">Cerrar Sesion</a>
	      </div>
	    </li>
	  </ul>
	  
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
    	<li><a href="ABMUsuario.jsp">IR a ABM Usuarios</a></li>
    </ul>
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <span class="text-muted">Place sticky footer content here.</span>
	  </div>
	</footer>
</body>
</html>