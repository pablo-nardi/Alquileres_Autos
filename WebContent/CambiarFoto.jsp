<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>		
<html lang="en">
<head>

	<title>	Cambiar Foto de Modelo </title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style type="text/css">
    
    .imagen{
		width: 360px;
		height: 180px;    
    }
    .form-botton-editar{
    	width: 100px;
    }
    
    </style>
    
    <%
    
    if(request.getParameter("id") != null){
    	request.getRequestDispatcher("CambiarFoto/select").forward(request, response);
    }
    
    
		String pepe = "IMAGENES/Modelos/";
	String sCarpAct = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
	File carpeta = new File(sCarpAct);
	String[] listado = carpeta.list();
	
	%>
    
</head>
<body>
	<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	<h1>Formulario ABM de Modelos</h1>
		
	<h2>Modelos</h2>
	
	<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
	
	<form method="post" action="CambiarFoto/upload" enctype="multipart/form-data">
	<div class="container-fluid">
		<div class="col-4 col-sm-4 col-lg-4">
    <label>Elegir Archivo</label> 
    <input type="file" name="multiPartServlet"  class="form-control"/>
    <input type="submit" value="Subir" class="form-control"/>
    <button class="btn btn-outline-primary" name="" >Subir</button>
    	</div>
    </div>
	</form>
	
	<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
	
	<div class="container-fluid">
      <div class="row">
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th>Foto</th>
                  	<th>Nombre Archivo</th>
					<th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                <%for (int i=0; i< listado.length; i++) { %>
                  <tr><!-- IMAGENES/Modelos/chev_joy.jpg -->
                  	<td><img class="imagen" alt="" src="<%=pepe+listado[i] %>"></td>
                  	<td><%=listado[i] %></td>
                    <td><a class="form-botton-editar" href="CambiarFoto.jsp?id=<%=listado[i] %>">Seleccionar</a></td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
      </div>
    </div>
		    
    <!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>