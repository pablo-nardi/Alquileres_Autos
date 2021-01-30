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
		function cargarLocalidad(met){
			document.formLocalidad.action=met;
		}
		function recargar(){
			location.href = 'ABMProvincias.jsp?mode=""';
		}
	</script>
	<%
	
		Localidad local = null;
		Provincia prov = null;
		String formActionProvincia = "nuevo";
		String formActionLocalidad = "nuevaLocalidad";
		LinkedList<Provincia> provincias = new LinkedList<>();
		LocalidadLogic ll = new LocalidadLogic();
		ProvinciaLogic pl = new ProvinciaLogic();
		provincias = pl.getAll();
		
		String mode = (String)request.getParameter("mode");
		if(mode == null){	mode = "nuevo";	}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){ //CAMBIAR POR ELSE IF ///////////////////////
			prov = pl.getOne(Integer.parseInt(request.getParameter("id")));
			formActionProvincia = "editar";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
			prov = pl.getOne(Integer.parseInt(request.getParameter("id")));
			formActionProvincia = "eliminar";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editarLocalidad")){
			local = ll.getOne(Integer.parseInt(request.getParameter("id")));
			formActionLocalidad = "editarLocalidad";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminarLocalidad")){
			
			local = ll.getOne(Integer.parseInt(request.getParameter("id")));
			formActionLocalidad = "eliminarLocalidad";
			
		}
		
		 
	%>
	
	
	
</head>
<body>
												<!--  ///////////////////////////////
													      
													     EMPIEZA LA PARTE DE PROVINCIAS 
													      
													      /////////////////////////////////-->
													      
													      
	<h1>Formulario ABM de Provincias y localidades</h1>

		

	<div class="container-fluid">		 
	    <h2>ABM de Provincias</h2>
	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	      <div class="row">
	          <div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                    <th>Nombre Provincia</th>
						<th>Editar</th>
						<th>Eliminar</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(Provincia pro : provincias) { %>
		                	<tr>
		                		<td><%=pro.getDenominacion()%></td>
			                    <td><a class="form-botton-editar" href="ABMProvincias.jsp?mode=editar&id=<%=pro.getIdProvincia() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMProvincias.jsp?mode=eliminar&id=<%=pro.getIdProvincia() %>">Eliminar</a></td>
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
						    	<label>id Provincia:</label>
								<input type="number" name="txtIdProvincia" autofocus readonly  class="form-control" value="<%=prov==null?"":prov.getIdProvincia() %>" ><br>
								<label>Denominacion:</label>
								<input type="text" name="txtDenominacion"  class="form-control" value="<%=prov==null?"":prov.getDenominacion() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<% String txtButton = "No paso el if"; 
								if(mode.equals("nuevo")){txtButton = "Cargar";}
								else if(mode.equals("editar")){txtButton = "Editar";}
								else if(mode.equals("eliminar")){txtButton = "Eliminar";} %>
								<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletABMProvincia/<%=formActionProvincia%>')"><%=txtButton%></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: recargar()">Cancelar</button>
				   			</div>
		   				</div>
	   				</div>
	   			</form>
		   	</div>
	      </div>
	      	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	      <!-- 
													      ///////////////////////////////
													      
													     EMPIEZA LA PARTE DE LOCALIDADES 
													      
													      /////////////////////////////////
	      
	       -->
	       	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	      <h2>ABM de Localidades</h2>
	      
	      <div class="row">
	      	<div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
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
			                  	<td>no hay localidad cargada</td>
			                  	<td>no hay localidad cargada</td>
			                </tr>
		                <%}else{
		                	for(Localidad loc: pro.getLocalidades()){	
			                %>
			                <tr>
			                  	<td><%=pro.getDenominacion()%></td>
			                  	<td><%=loc.getDenominacion() %></td>
			                  	<td><%= loc.getCodigoPostal() %></td>
			                    <td><a class="form-botton-editar" href="ABMProvincias.jsp?mode=editarLocalidad&id=<%=loc.getCodigoPostal() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMProvincias.jsp?mode=eliminarLocalidad&id=<%=loc.getCodigoPostal() %>">Eliminar</a></td>
			                </tr>
	                  <%	} // cierre de segundo for
		                }
	                  } // cierre de primer for%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	          <div class="col-sm-4" style="background-color:lavender;">
	          	<form action="" name="formLocalidad" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-12" style="background-color:lavender;">
							 	<label>Provincia</label>
							 	<select name="selectProvincia" class="form-control" <%=formActionLocalidad=="eliminarLocalidad"?"disabled":"" %>>
							 	<%for(Provincia p: provincias){ String value = Integer.toString(p.getIdProvincia()); %>
							 	<option value="<%=value %>" <%=local!=null&&Integer.parseInt(value)==local.getProvincia().getIdProvincia()?"selected":"" %> ><%=p.getDenominacion() %></option>
							 	<%} %>
							 	</select>
								<label>Localidad:</label>
								<input type="text" name="txtLocalidad"  class="form-control" value="<%=local==null?"":local.getDenominacion() %>" <%=formActionLocalidad=="eliminarLocalidad"?"readonly":"" %>><br>
								<label>Codigo Postal</label>
								<input type="number" name="txtCodigoPostal"  class="form-control" value="<%=local==null?"":local.getCodigoPostal() %>" <%=formActionLocalidad=="eliminarLocalidad"?"readonly":"" %> ><br>
								<% String texto = "No paso el if"; 
								if(mode.equals("nuevo")){texto = "Cargar";}
								else if(mode.equals("editarLocalidad")){texto = "Editar";}
								else if(mode.equals("eliminarLocalidad")){texto = "Eliminar";} %>
								<button class="btn btn-primary" onclick="javascript: cargarLocalidad('ServletABMProvincia/<%=formActionLocalidad%>')"><%=texto%></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: recargar()">Cancelar</button>
				   			</div>
		   				</div>
	   				</div>
	   			</form>
	          </div>	
	      </div>
	      	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
    </div>
    
    
    
    
    
</body>
</html>