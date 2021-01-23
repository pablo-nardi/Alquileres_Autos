<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Formulario ABM Provincias</title>
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
	<%
	
		Provincia prov = null;
		String detailFormAction = "nuevo";
		LinkedList<Provincia> provincias = new LinkedList<>();
		ProvinciaLogic pl = new ProvinciaLogic();
		provincias = pl.getAll();
		
		String mode = (String)request.getParameter("mode");
		if(mode == null){	mode = "nuevo";	}
		if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){
			prov = pl.getOne(Integer.parseInt(request.getParameter("id")));
			detailFormAction = "editar";
		}
		if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
			prov = pl.getOne(Integer.parseInt(request.getParameter("id")));
			detailFormAction = "eliminar";
		}
		
	%>
	
	
	
</head>
<body>
	<h1>Formulario ABM de Usuarios</h1>
		<h2>Datos obligatorios</h2>


	<div class="container-fluid">
      <div class="row">
        <h3>Provincias</h3>
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th>Nombre Provincia</th>
					<th>Nombre Localidad</th>
					<th>Codigo Postal</th>
					<th>Editar</th>
					<th>Eliminar</th>
                  </tr>
                </thead>
                <tbody>
                <%for(Provincia pro : provincias) { 
	                if(pro.getLocalidades().isEmpty()){%>
	                	<tr>
	                		<td><%=pro.getDenominacion()%></td>
		                  	<td> - </td>
		                  	<td> - </td>
		                    <td><a class="form-botton-editar" href="ABMProvincias.jsp?mode=editar&id=<%=pro.getIdProvincia() %>">Editar</a></td>
		                    <td><a class="form-botton-eliminar" href="ABMProvincias.jsp?mode=eliminar&id=<%=pro.getIdProvincia() %>">Eliminar</a></td>
		                </tr>
	                <%}else{
	                	for(Localidad loc: pro.getLocalidades()){	
		                %>
		                <tr>
		                  	<td><%=pro.getDenominacion()%></td>
		                  	<td><%=loc.getDenominacion() %></td>
		                  	<td><%= loc.getCodigoPostal() %></td>
		                    <td><a class="form-botton-editar" href="ABMProvincias.jsp?mode=editar&id=<%=pro.getIdProvincia() %>">Editar</a></td>
		                    <td><a class="form-botton-eliminar" href="ABMProvincias.jsp?mode=eliminar&id=<%=pro.getIdProvincia() %>">Eliminar</a></td>
		                </tr>
                  <%	} // cierre de segundo for
	                }
                  } // cierre de primer for%>
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
			    	<label>id Provincia:</label>
					<input type="number" name="txtIdProvincia" autofocus readonly  class="form-control" value="<%=prov==null?"":prov.getIdProvincia() %>" ><br>
					<label>Denominacion:</label>
					<input type="text" name="txtDenominacion"  class="form-control" value="<%=prov==null?"":prov.getDenominacion() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
					<% String txtButton = "No paso el if"; 
					if(mode.equals("nuevo")){txtButton = "Cargar";}
					else if(mode.equals("editar")){txtButton = "Editar";}
					else if(mode.equals("eliminar")){txtButton = "Eliminar";} %>
					<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletABMProvincia/<%=detailFormAction%>')"><%=txtButton%></button>
	   			</div>
   			</div>
   		</div>
   	</form>
</body>
</html>