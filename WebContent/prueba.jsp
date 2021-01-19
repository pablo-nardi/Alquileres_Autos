<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>
<html>
<head>
		<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
<title>Insert title here</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script type="text/javascript">
	function cargarFormulario(met){
		document.myForm.action=met;
	}
	function recargar(){
		location.href = 'ABMUsuario.jsp?mode=nuevo';
	}
	function viajar(valor){
		 location.href = valor;
	}
	
	function validar(valor){
		var password = document.getElementById("txtPassword")
		var confirm_password = document.getElementById("txtPasswordConfirm");

		if(password.value != confirm_password.value) {
		    //confirm_password.setCustomValidity("Las contraseñas No son iguales");
			alert('hola');  
		} else {
			  //cargarFormulario(met); onclick=validar('https://www.google.com.ar')
			 viajar(valor);
		  }
		}
		
	</script>
	<%
			Usuario usuario = null;
			String detailFormAction = "nuevo";
			LinkedList<Usuario> usuarios;
			//traer Localidad ¿?
			UsuarioLogic ul = new UsuarioLogic();
			usuarios = ul.getAll();
		%>

</head>
<body>



	<h1>Probando variables varias</h1>
	

		<div class="container-fluid">
      <div class="row">
        <h2>userelos</h2>
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
                    <th>Codigo Postal</th>
					<th>Calle</th>
					<th>Editar</th>
					<th>Eliminar</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Usuario user : usuarios) { %>
                  <tr><!-- IMAGENES/userelos/chev_joy.jpg -->
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
                    		lugar = user.getCalle() +" "+ user.getDepartamento()+" " + user.getPiso();
                    	}
                    %>
                    <td><%= lugar %></td>
                    <td><a class="form-botton-editar" href="ABMuserelos.jsp?usere=editar&id=<%=user.getCuil() %>">Editar</a></td>
                    <td><a class="form-botton-eliminar" href="ServletABMuserelos/eliminar?id=<%=user.getCuil() %>">Eliminar</a></td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
      </div>
    </div>
	
		<form action="" method="post">			
<div class="container"> 
  <div class="row">
    <div class="col-sm-4" style="background-color:lavender;">
    	<label>Nombre:</label>
		<input type="text" name="txtNombre" autofocus  class="form-control"><br>
		<label>Apellido:</label>
		<input type="text" name="txtApellido"  class="form-control"><br>
		<label>CUIL:</label>
		<input type="text" name="txtCuil"  class="form-control"><br>
		<label>Mail:</label>
		<input type="email" name="txtEmail"  class="form-control"><br>
		<label>Contraseña:</label>
		<input type="password" name="txtPassword" id="txtPassword" required class="form-control"><br>
    	<label>Ingrese de nuevo la contraseña:</label>
		<input type="password" name="txtPasswordConfirm" id="txtPasswordConfirm" class="form-control"><br>
		<button class="btn btn-primary" onclick="validar('https://www.google.com.ar')" >Primary</button>
    </div>
    <div class="col-sm-4" style="background-color:orange;">
    	<label>Rol en el sistema:</label>
		<select name="selectRol" class="form-control">
			<option value="usuario">Usuario</option>
			<option value="administrador">Administrador</option>
			<option value="cliente">Cliente</option>
		</select><br>
		<label>Telefono:</label>
		<input type="text" name="txtTelefono"  class="form-control"><br>
		<label>Codigo Postal:</label>
		<input type="number" name="txtCodigoPostal"  class="form-control"><br>
		<label>Calle:</label>
		<input type="text" name="txtCalle"  class="form-control"><br>
		<label>Departamento:</label>
		<input type="text" name="txtDpto" class="form-control"><br>
		<label>Piso:</label>
		<input type="text" name="txtPiso" class="form-control"><br>		
    </div>
  </div>
</div>

</form>
	
	
	
	
	
</body>
</html>