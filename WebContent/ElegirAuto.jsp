<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Elegir Auto</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/CSS/ABM.css">
	
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
	AutoLogic au = new AutoLogic();
	AlquilerLogic al = new AlquilerLogic();
	LinkedList<Auto> autos = au.getAutosFromModelo(Integer.parseInt(request.getParameter("idMod")));
	session.setAttribute("alquiler",al.getAlquiler(Integer.parseInt(request.getParameter("idAlq"))));
	%>
	
	
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
		
	<form action="" name="myForm" method="post">
	
		    <div class="container" style="background-color:#96c287; margin-top:100px;">	
		     	<div class="row">
		     		<div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
			            <div class="table-responsive">
			              <table class="table table-hover">
			                <thead class="thead-dark">
			                  <tr>
			                    <th>Auto</th>
			                    <th>patente</th>
								<th>Capacidad del Tanque</th>
								<th>Kilometraje</th>	
								<th>Accion</th>	
			                  </tr>
			                </thead>
			                <tbody>
			                	<%
			                	if(!autos.isEmpty() ){ int j = 1;
				                	for(Auto a : autos) { %>
					                	<tr>
					                		<td>Auto <%=j %></td>
					                		<td><%=a.getPatente() %></td>
					                		<td><%=a.getCapacidadDelTanque() %></td>
					                		<td><%=a.getKilometraje() %></td>
						                  	<td><a class="form-botton-editar" href="CargarConductor.jsp?idAut=<%=a.getPatente() %>">Seleccionar</a></td>
						                </tr>
									<%j++;
									}
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