<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
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

	
	LinkedList<Alquiler> alquileres = (LinkedList) request.getAttribute("alquileres");
	
	%>
	
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	
	<h1>Buscar Alquiler</h1>
	
	<form action="" name="myForm" method="post">
		<div class="container" style="background-color:#96c287;">
	      <div class="row">
	          	<div class="col-8 custom-control-inline">
	         		<label class="col-sm-2 col-form-label" >CUIL</label>
					<input type="text" name="txtCuil"  class="form-control col-sm-6" placeholder="EJ: 20378303355">
					
				   	<button onclick="javascript: buscarAlquileres('ElegirAuto')" class="btn btn-primary col-sm-2" >Buscar</button>		
	          	</div>
	      </div>
	    </div>
	    <div class="container" style="background-color:#96c287; margin-top:100px;">	
	     	<div class="row">
	     		<div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                  	<th>Id</th>
	                    <th>Nombre Cliente</th>
	                    <th>fecha retiro</th>
						<th>fecha devolucion</th>
						<th>Modelo</th>
						<th>Accion</th>	
	                  </tr>
	                </thead>
	                <tbody>
	                	<%
	                	if(alquileres != null ){
		                	for(Alquiler a : alquileres) { %>
			                	<tr>
			                		<td><%=a.getIdAlquiler() %></td>
			                		<td><%=a.getUsuario().getNombre() %></td>
			                		<td><%=a.getFecRetiroPrevisto() %></td>
			                		<td><%=a.getFecDevPrevista() %></td>
			                		<td><%=a.getModelo().getDenominacion() %></td>
				                  	<td><a class="form-botton-editar" 
				                  		href="ElegirAuto.jsp?idMod=<%=a.getModelo().getIdentificacion()%>&idAlq=<%=a.getIdAlquiler()%>"
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
     </form>
	
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>