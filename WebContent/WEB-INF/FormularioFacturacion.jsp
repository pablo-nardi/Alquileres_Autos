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
	<h2>Formulario de Facturacion</h2>
	
			<% 
		 	Alquiler alquiler= (Alquiler) session.getAttribute("alquiler"); 
			Usuario usuario = (Usuario) session.getAttribute("usuario");
		 	String fecha = alquiler.getFecRetiroPrevisto().toString();
		 	String model = alquiler.getModelo().getDenominacion();
		 	String num = usuario.getNumUltTarjeta();
		 %>

	<p>Probando fecha <%=fecha %></p>	
	<p>Probando modelo <%=model %>	</p>
	<p>Probando num tarjeta <%=num %></p>

	<form action="ResumenReserva" name="myForm" method="post">	
		<div class="container">		 
			<div class="row">
				<div class="col-sm-4" style="background-color:lavender;">
					<label>Nombre (Mismo titular de la Tarjeta):</label>
					<input type="text" name="txtTitular" class="form-control">
					<label>CUIL</label>
					<input type="number" name="txtCuil" class="form-control">
					<label>Calle</label>
					<input type="text" name="txtCalle" class="form-control">
					<label>Numero</label>
					<input type="number" name="txtNumero" class="form-control">					
                    <br>
					<button class="btn btn-primary">Siguiente</button>
			   	</div>
			   	<div class="col-sm-4" style="background-color:lavender; position:relative; left: 100px;">
					<label>Piso (opcional):</label>
					<input type="number" name="txtPiso"  class="form-control">
					<label>Dpto (opcional):</label>
					<input type="text" name="txtDpto"  class="form-control">
					<label>Provincia:</label>
	  				<input type="text" name="txtProvincia" class="form-control">
	  				<label>Ciudad:</label>
	    			<input type="text" name="txtLocalidad" class="form-control">
			   	</div>
			 </div>
			 </div>
	</form>
</body>
</html>