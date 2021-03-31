<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Alquileres</title>

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
	function cargarFormulario(met) {
		document.formAuto.action=met;
	}
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
	}
    </script>
    
    	<% 	//VALIDACION DE SESION DE USUARIO
    	UsuarioLogic ul = new UsuarioLogic();
    	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "g")){
    		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
    		response.sendRedirect(redirectURL);
    	}
		%>
			<%
	Alquiler alq = null;
	AlquilerLogic al = new AlquilerLogic();
	LinkedList<Alquiler> alquileres = al.getAll();
	
	
	%>
</head>
<body>
	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Usuario.jsp">Home</a>
 
	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	
	<h1>Listado de todos los alquileres Alquileres</h1>
			
	    <div class="fluid-container" style="background-color:#96c287; margin-top:100px;">	
	     	<div class="row">
	     		<div class="col-lg-12"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                  	<th>Id</th>
	                  	<th>Costo Desperfecto</th>
	                  	<th>Costo Dev. Tardia</th>
	                  	<th>Precio diario</th>
	                  	<th>Estado</th>
	                    <th>fecha retiro prevista</th>
						<th>fecha dev. prevista</th>
						<th>fecha retiro real</th>
						<th>fecha dev. real</th>
						<th>Modelo</th>
						<th>Sucursal</th>
						<th>Nombre Cliente</th>
						<th>Plan</th>
						<th>Auto</th>
	                  </tr>
	                </thead>
	                <tbody>
	                	<%
	                	if(alquileres != null ){
		                	for(Alquiler a : alquileres) { %>
			                	<tr>
			                		<td><%=a.getIdAlquiler() %></td>
			                		<td><%=a.getCostoDesperfecto() %></td>
			                		<td><%=a.getCostoDevolucionTardia() %></td>
			                		<td><%=a.getPrecioDiario() %></td>
			                		<td><%=a.getEstado() %></td>
			                		<td><%=a.getFecRetiroPrevisto() %></td>
			                		<td><%=a.getFecDevPrevista() %></td>
			                		<td><%=a.getFecRetiroReal() %></td>
			                		<td><%=a.getFecDevReal() %></td>
			                		<td><%=a.getModelo().getDenominacion() %></td>
			                		<td><%=a.getSucursal().getDenominacion() %></td>
			                		<td><%=a.getUsuario().getNombre() %></td>
			                		<td><%=a.getPlan().getNombrePlan() %></td>
			                		<td><%=a.getAuto().getPatente() %></td>
			                		
				                  	<td></td>
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