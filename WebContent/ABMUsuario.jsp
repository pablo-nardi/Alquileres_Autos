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
			Usuario usuario = null;
			String detailFormAction = "nuevo";
			LinkedList<Usuario> usuarios;
			usuarios = ul.getAll();
			
			String mode = (String)request.getParameter("mode");
			if(mode == null){	mode = "nuevo";	}
			else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){
				usuario = ul.getOne(request.getParameter("id"));
				detailFormAction = "editar";
			}
			else if (mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
					usuario = ul.getOne(request.getParameter("id"));
					detailFormAction = "eliminar";
				}
		%>
			
		<title>	Formulario ABM Usuarios </title>
	
</head>


<body>

	<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <button type="button" class="btn btn-outline-warning">Logout</button>

	</nav>
	
	<h1>Formulario ABM de Usuarios</h1>
		
		<h2>Usuarios</h2>

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
					<th>Pass</th>
					<th>Rol</th>
					<th>Telefono</th>
                    <th>Ciudad</th>
					<th>Calle / Dpto / Piso</th>
					<th>Editar</th>
					<th>Eliminar</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Usuario user : usuarios) { %>
                  <tr>
                  	<td><%=user.getNombre() + " " + user.getApellido() %></td>
                  	<td><%= user.getCuil() %></td>
                  	<td><%= user.getMail() %></td>
                  	<td><%= user.getPassword() %></td>
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
                    <td><a class="form-botton-editar" href="ABMUsuario.jsp?mode=editar&id=<%=user.getCuil() %>">Editar</a></td>
                    <td><a class="form-botton-eliminar" href="ABMUsuario.jsp?mode=eliminar&id=<%=user.getCuil() %>">Eliminar</a></td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
      </div>
    </div>

	<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->

<form action="" name="myForm" method="post">			
<div class="container"> 
  <div class="row">
    <div class="col-sm-4" style="background-color:lavender;">
    	<label>Nombre:</label>
		<input type="text" name="txtNombre" autofocus  class="form-control" value="<%=usuario==null?"":usuario.getNombre() %>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Apellido:</label>
		<input type="text" name="txtApellido"  class="form-control" value="<%=usuario==null?"":usuario.getApellido()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>CUIL:</label>
		<input type="text" name="txtCuil"  class="form-control" value="<%=usuario==null?"":usuario.getCuil()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Mail:</label>
		<input type="email" name="txtEmail"  class="form-control" value="<%=usuario==null?"":usuario.getMail()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Contraseña:</label>
		<input type="password" name="txtPassword" id="txtPassword"  class="form-control" value="<%=usuario==null?"":usuario.getPassword() %>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
    	<label>Ingrese de nuevo la contraseña:</label>
		<input type="password" name="txtPasswordConfirm" id="txtPasswordConfirm" class="form-control" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<% String txtButton = "No paso el if"; 
		if(mode.equals("nuevo")){txtButton = "Cargar";}
		else if(mode.equals("editar")){txtButton = "Editar";}
		else if(mode.equals("eliminar")){txtButton = "Eliminar";} %>
		<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletsABMUSuarios/<%=detailFormAction%>')" ><%=txtButton %></button>
  		<button class="btn btn-outline-primary" onclick="javascript: cargarFormulario('ServletsABMUSuarios/cancelar')" name="">Cancelar</button>
    </div>
    <div class="col-sm-4" style="background-color:orange;">
    	<label>Rol en el sistema:</label>
		<select name="selectRol" class="form-control" <%=mode.equals("eliminar")?"disabled":"" %> >
			<option value="usuario" <%=usuario!=null&&usuario.getRol().equals("usuario")?"selected":"" %>>Usuario</option>
			<option value="administrador" <%=usuario!=null&&usuario.getRol().equals("administrador")?"selected":"" %>>Administrador</option>
			<option value="cliente" <%=usuario!=null&&usuario.getRol().equals("cliente")?"selected":"" %>>Cliente</option>
		</select><br>
		<label>Telefono:</label>
		<input type="text" name="txtTelefono"  class="form-control" value="<%=usuario==null?"":usuario.getTelefono()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Ciudad</label>
		<input type="text" name="txtCiudad"  class="form-control" value="<%=usuario==null?"":usuario.getCiudad()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>	
		<label>Codigo Postal:</label>
		<input type="text" name="txtCodigo"  class="form-control" value="<%=usuario==null?"":usuario.getCodigoPostal()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Calle:</label>
		<input type="text" name="txtCalle"  class="form-control" value="<%=usuario==null?"":usuario.getCalle()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Departamento:</label>
		<input type="text" name="txtDpto" class="form-control" value="<%=usuario==null?"":usuario.getDepartamento()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
		<label>Piso:</label>
		<input type="number" name="txtPiso" class="form-control" value="<%=usuario==null?"0":usuario.getPiso()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>		
    </div>
  </div>
</div>

</form>
<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->	
	
<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>

</body>
</html>