<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
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
	function cancelarAlquiler(){
		if(confirm("Desea cancelar alquiler?")){
			window.location.href = "index.jsp";	
		}
		
	}
			
	</script>
    
        <% 	
		Provincia provincia = new Provincia();
		LocalidadLogic ll = null;
		ProvinciaLogic pl = new ProvinciaLogic(); 
		LinkedList<Localidad> localidades = null;
		LinkedList<Provincia> provincias = pl.getAll();
	
		String idProv = request.getParameter("selectProvincia");
		if(idProv != null){
			provincia = pl.getOne(Integer.parseInt(idProv));
			ll = new LocalidadLogic();
			localidades = ll.getLocalidades(Integer.parseInt(idProv));
			
		}
		%>
	
<title>Formulario de Facturacion</title>
</head>
<body>
			<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
 
  <a class="navbar-brand" href="login.jsp">Login</a>

	</nav>
	<h1>Formulario de Facturacion</h1>
	
	<form action="FormularioDePago" name="myForm" method="post">	
		<div class="container">		 
			<div class="row">
				<div class="col-sm-4" style="background-color:lavender;">
					<label>Nombre:</label>
					<input type="text" name="txtNombre" required class="form-control">
					<label>Apellido:</label>
					<input type="text" name="txtApellido" class="form-control" required>
					<label>CUIL</label>
					<input type="number" name="txtCuil" class="form-control" required>
					<label>Mail</label>
					<input type="email" name="txtEmail" required class="form-control">
					<label>Numero de Celular</label>
					<input type="number" name="txtTelefono" class="form-control" required>					
                    <br>
					<button class="btn btn-primary">Siguiente</button>
					<button type="button" class="btn btn-warning" onclick="javascript: cancelarAlquiler()" >Cancelar Alquiler</button>
			   	</div>
			   	<div class="col-sm-4" style="background-color:lavender; position:relative; left: 100px;">
					<label>Calle</label>
					<input type="text" name="txtCalle" class="form-control" required>
					<label>Numero</label>
					<input type="text" name="txtNum" class="form-control">
					<label>Piso (opcional):</label>
					<input type="number" name="txtPiso"  class="form-control" value="0"> 
					<label>Dpto (opcional):</label>
					<input type="text" name="txtDpto"  class="form-control">
					<label>Ciudad:</label>
	  				<input type="text" name="txtCiudad" class="form-control" required>
	  				<label>Codigo Postal:</label>
	    			<input type="text" name="Codigo" class="form-control" required>
			   	</div>
			 </div>
			 </div>
	</form>
</body>
</html>