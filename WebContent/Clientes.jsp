z<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			Usuario usuario = null;
			LinkedList<Usuario> usuarios = null;
			usuarios = ul.getAllCli();			
		%>
			
		<title>	Listado de Clientes </title>
	
</head>


<body>

	<nav class="navbar navbar-dark">
  	<a class="navbar-brand" href="index.jsp">Inicio</a>
  	<a class="navbar-brand" href="Admin.jsp">Home</a>
 
  	<button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	<h1>Formulario ABM de Usuarios</h1>
		
	<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
	<div class="container-fluid">
      <div class="row">
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th>Nombre y Apellido</th>
					<th>Cuil</th>
					<th>Mail</th>
					<th>Rol</th>
					<th>Telefono</th>
                    <th>Ciudad</th>
					<th>Calle / Dpto / Piso</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Usuario user : usuarios) { %>
                  <tr>
                  	<td><%=user.getNombre() + " " + user.getApellido() %></td>
                  	<td><%= user.getCuil() %></td>
                  	<td><%= user.getMail() %></td>
                  	<td><%= user.getRol() %></td>
                    <td><%= user.getTelefono() %></td>
                    <td><%=user.getCiudad() %></td>
                    <%	String calle;
                    	if(user.getDepartamento() == null || user.getPiso() == 0){
                    		calle = user.getCalle();
                    	}else{
                    		calle = user.getCalle() +" / "+ user.getDepartamento()+" / " + user.getPiso();
                    	}
                    %>
                    <td><%= calle %></td>
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