<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>		
<html lang="en">
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	
	<title>	Formulario ABM Usuarios </title>

	<style>
		body{
			

			/*align-items: center;
			 padding-top: 40px;
  			padding-bottom: 40px;*/
  			background-color: #f5f5f5;
		}
		h1{
			background-color: green;
		}
		
	</style>
</head>


<body>
	<h1>Formulario ABM de Usuarios</h1>
		<h2>Datos obligatorios</h2>

<form action="ServletABM" method="post">			
<div class="container-fluid"> 
  <div class="row">
    <div class="col" style="background-color:lavender;">
    	<label>Nombre:</label>
		<input type="text" name="txtNombre" autofocus required class="form-control"><br>
		<label>Apellido:</label>
		<input type="text" name="txtApellido" required class="form-control"><br>
		<label>CUIL:</label>
		<input type="text" name="txtCuil" required class="form-control"><br>
		<label>Mail:</label>
		<input type="email" name="txtEmail" required class="form-control"><br>
		<label>Contraseña:</label>
		<input type="password" name="txtPassword" class="form-control"><br>
    	<label>Ingrese de nuevo la contraseña:</label>
		<input type="password" name="txtPasswordConfirm" class="form-control"><br>
		<button type="submit" class="btn btn-primary">Primary</button>
    </div>
    <div class="col" style="background-color:orange;">
    	<label>Rol en el sistema:</label>
		<select name="selectRol" class="form-control">
			<option value="usuario">Usuario</option>
			<option value="administrador">Administrador</option>
			<option value="cliente">Cliente</option>
		</select><br>
		<label>Telefono:</label>
		<input type="text" name="txtTelefono" required class="form-control"><br>
		<label>Codigo Postal:</label>
		<input type="number" name="txtCodigoPostal" required class="form-control"><br>
		<label>Calle:</label>
		<input type="text" name="txtCalle" required class="form-control"><br>
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