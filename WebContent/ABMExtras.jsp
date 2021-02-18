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
	</script>

	<% 	//VALIDACION DE SESION DE USUARIO
	UsuarioLogic ul = new UsuarioLogic();
	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "a")){
		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
		response.sendRedirect(redirectURL);
	}
	%>

    <%
    Extras extra = null;
    String formActionExtras = "nuevo";
    LinkedList<Extras> extras = new LinkedList<>();
    ExtrasLogic el = new ExtrasLogic();
    extras = el.getAll();
    
    String mode = (String)request.getParameter("mode");
	if(mode == null){	mode = "nuevo";	}
	else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){ 
		extra = el.getOne(Integer.parseInt(request.getParameter("id")));
		formActionExtras = "editar";
	}
	else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
		extra = el.getOne(Integer.parseInt(request.getParameter("id")));
		formActionExtras = "eliminar";
	}
    
    %>
    
    <title>Formulario ABM Extras</title>
    
</head>
<body>
	
		<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <a class="navbar-brand" href="#">Logout</a>

	</nav>
	
	<h1>Formulario ABM de Extras</h1>
	
	<h2>ABM de Extras</h2>
		
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
	                    <th>Precio</th>
						<th>Editar</th>
						<th>Eliminar</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(Extras e : extras) { %>
		                	<tr>
		                		<td><%=e.getCodigo() %></td>
		                		<td><%=e.getDescripcion() %></td>
			                    <td><%=e.getPrecio() %></td>
			                    <td><a class="form-botton-editar" href="ABMExtras.jsp?mode=editar&id=<%=e.getCodigo() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMExtras.jsp?mode=eliminar&id=<%=e.getCodigo() %>">Eliminar</a></td>
			                </tr>
	                  <%}%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="col-sm-4" style="background-color:lavender;">
		          <form action="" name="myForm" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-12" style="background-color:lavender;">
						    	<label>id Extra:</label>
								<input type="number" name="txtIdExtra" autofocus readonly  class="form-control" value="<%=extra==null?"":extra.getCodigo() %>" ><br>
								<label>Descripcion:</label>
								<input type="text" name="txtDescripcion"  class="form-control" value="<%=extra==null?"":extra.getDescripcion() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<label>Precio:</label>
								<input type="text" name="txtPrecio"  class="form-control" value="<%=extra==null?"":extra.getPrecio() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<% String txtButton = "No paso el if"; 
								if(mode.equals("nuevo")){txtButton = "Cargar";}
								else if(mode.equals("editar")){txtButton = "Editar";}
								else if(mode.equals("eliminar")){txtButton = "Eliminar";} %>
								<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletABMExtras/<%=formActionExtras%>')"><%=txtButton%></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ServletABMExtras/cancelar')">Cancelar</button>
				   			</div>
		   				</div>
	   				</div>
	   			</form>
		   	</div>
	      </div>
	      	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	   </div>
	
	
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
	
	
	
</body>
</html>