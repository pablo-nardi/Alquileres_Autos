<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>		
<html lang="en">
<head>

	<title>	Formulario ABM Usuarios </title>
	
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
	/*
	function validar(valor){
		var password = document.getElementById("txtPassword")
		var confirm_password = document.getElementById("txtPasswordConfirm");

		if(password.value != confirm_password.value) {
		    //confirm_password.setCustomValidity("Las contraseñas No son iguales");
			alert('Las contraseñas no coinciden');  
		} else {
			  //cargarFormulario(met); onclick=validar('https://www.google.com.ar')
			 viajar(valor);
		  }
		}*/
		
	</script>
		
		<% 	/*/VALIDACION DE SESION DE USUARIO
			Usuario user = (Usuario)session.getAttribute("usuario");
			if(!user.getRol().toLowerCase().equals("administrador")){
			String redirectURL = "login.jsp";
		    response.sendRedirect(redirectURL);
			}*/
		%>
		<%
			Usuario usuario = null;
			String detailFormAction = "nuevo";
			LinkedList<Usuario> usuarios;
			LinkedList<Provincia> provincias;
			UsuarioLogic ul = new UsuarioLogic();
			ProvinciaLogic pl = new ProvinciaLogic();
			usuarios = ul.getAll();
			provincias = pl.getAll();
			
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
			
		
	
</head>


<body>
	<h1>Formulario ABM de Usuarios</h1>
		<h2>Datos obligatorios</h2>


	<div class="container-fluid">
      <div class="row">
        <h3>Usuarios</h3>
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
                    <th>Localidad</th>
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
                    <%String lugar = user.getLocalidad().getProvincia().getDenominacion() + " "+ 
                    user.getLocalidad().getDenominacion();
                    %>
                    <td><%= lugar %></td>
                    <%	String calle;
                    	if(user.getDepartamento() == null || user.getPiso() == 0){
                    		lugar = user.getCalle();
                    	}else{
                    		lugar = user.getCalle() +" / "+ user.getDepartamento()+" / " + user.getPiso();
                    	}
                    %>
                    <td><%= lugar %></td>
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
		<input type="password" name="txtPassword" id="txtPassword"  class="form-control" value="<%=usuario==null?"":usuario.getPassword()%>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
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
		<label>Localidad</label>
		<select name="selectLocalidad" class="form-control" <%=mode.equals("eliminar")?"disabled":"" %>>
							 	<%for(Provincia p: provincias)
							 	  {
							 		if(!p.getLocalidades().isEmpty()){
							 			for(Localidad l: p.getLocalidades())
							 			{
							 				String value = Integer.toString(l.getCodigoPostal()); %>		
							 				<option value="<%=value %>" <%=usuario!=null&&Integer.parseInt(value)==usuario.getLocalidad().getCodigoPostal()?"selected":"" %> ><%=p.getDenominacion()+" / "+l.getDenominacion() %></option>
							 	<%		}			
							 		}
							 	  } 
							 	%>
							 	</select>
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

</body>
</html>