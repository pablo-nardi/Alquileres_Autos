<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

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
		function cargarFormulario(met){
			document.myForm.action=met;
		}
		function cerrarSesion(){
			if(confirm("Desea cerrar la sesion?")){
				window.location.href = "login.jsp?estado=CERRARSESION";	
			}
			
		}
	</script>
    <% 	//VALIDACION DE SESION DE USUARIO
    	UsuarioLogic ul = new UsuarioLogic();
    	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "a")){
    		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
    		response.sendRedirect(redirectURL);
    	}
	%>
    <%
    
    TipoAuto tipo = null;
    LinkedList<TipoAuto> tipos = new LinkedList<>();
    TipoAutoLogic tpl = new TipoAutoLogic();
    tipos = tpl.getAll();
    

    
    
    %>
    
<title>ABM de Tipos de Autos</title>
</head>
<body>
	<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>


	</nav>
	
	<h1>Formulario ABM de Tipos de Auto</h1>
	
	<h2>ABM de Tipo de Auto</h2>
	
	
	<div class="container-fluid">		 
	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	      <div class="row">
	          <div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                    <th>ID</th>
	                    <th>Descripcion</th>
						<th>Editar</th>
						<th>Eliminar</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(TipoAuto ta : tipos) { %>
		                	<tr>
		                		<td><%=ta.getId_Tipo() %></td>
		                		<td><%=ta.getNombreTipo() %></td>
			                    <td><a class="form-botton-editar" href="ABMTipoDeAuto.jsp?mode=editar&id=<%=ta.getId_Tipo() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMTipoDeAuto.jsp?mode=eliminar&id=<%=ta.getId_Tipo() %>">Eliminar</a></td>
			                </tr>
	                  <%}%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	         
	      	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	   </div>
	   </div>
	
	
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
	
	
</body>
</html>