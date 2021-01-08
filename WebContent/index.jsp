<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
	<link rel="stylesheet" href="./CSS/index.css">
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <title> Inicio </title>

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
  	<script type="text/javascript">
		function buscaLocalidades(met) {
			document.myForm.action=met;
    	}
    	function buscaModelos(met) {
    		if ($('#fechaRetiro').val().length == 0) {
    			 alert('Elija una fecha de Retiro');
    			 }
    		else if($('#fechaDevolucion').val().length == 0){
    			alert('Elija una fecha de Devolucion');
    		}
    		else{
    			document.myForm.action=met;
        		//document.getElementById("myFrom").submit();		
    		}
    			
    	
        }
    </script>
    	<% 	
		Provincia provincia = new Provincia();
		LocalidadLogic ll = null;
		ProvinciaLogic pl = new ProvinciaLogic(); 
		LinkedList<Localidad> localidades = null;
		LinkedList<Provincia> provincias = pl.getAll();
	%>
	<%
		String idProv = request.getParameter("id");
		if(idProv != null){
			int id = Integer.parseInt(idProv);
			provincia = pl.getOne(id);
			ll = new LocalidadLogic();
			localidades = ll.getLocalidades(id);
		}
	%>
</head>


<body>

   	<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Inicio</a>
 
  <a class="navbar-brand" href="login.jsp">Login</a>

	</nav>
	<form action="" name="myForm" method="post">
	<%/* */ %>
	  <div class="row" style="margin-left: 100px; margin-top: 300px;">
	  	<div class="col-sm-">
	  		<label>Provincia:</label>
	  		<select class="form-control" name="selectProvincia">
			<%for (Provincia prov: provincias){ %>
			
			<option value="<%=Integer.toString(prov.getIdProvincia()) %>" <%=provincia!=null&&provincia.getIdProvincia()==prov.getIdProvincia()?"selected":"" %>><%=prov.getDenominacion() %></option>
			
			<%} %>
	  		</select>
	  	</div>
	  	<div class="col-sm-">
	  		
	  		<button class="btn btn-primary" name="btnBuscaLocalidad" onclick="javascript: buscaLocalidades('ServletIndex/buscarLocalidad')" style="margin-top:15px;" >Buscar Localidad</button>
	  		
	  	</div>
	    <div class="col-sm-" style="background-color: red;">
	    	<label>Ciudad:</label>
	    	<select class="form-control" name="selectCiudad">
	    		<%if(localidades != null){
	    			for(Localidad local: localidades){%>
	    			<option value="<%=Integer.toString(local.getCodigoPostal())%>"><%=local.getDenominacion() %></option>
	    		
	    		<%}} %>
	    	</select>
	    </div>
	    <div class="col-sm-">
	    	<label>Fecha de Retiro:</label>
	      	<input type="datetime-local" class="form-control" id="fechaRetiro" name="fechaRetiro">
	    </div>
	    <div class="col-sm-">
	    	<label>Fecha de Devolucion::</label>
	      	<input type="datetime-local" class="form-control" id="fechaDevolucion" name="fechaDevolucion">
	    </div>
	    <div class="col-sm-">
	    	<button class="btn btn-primary" name="btnBuscaModelos" onclick="javascript: buscaModelos('ServletIndex/buscarModelos')" style="margin-top: 15px;">Buscar</button>
	    </div>
	    	
	  </div>
	 
	</form>

</body>
</html>