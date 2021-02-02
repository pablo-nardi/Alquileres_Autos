<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title> ABM de Sucursales </title>
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
	function cargarSucursal(met){
		document.formSucursal.action=met;
	}
    </script>
    <%
    
    	Sucursal sucursal = null;
    	String formActionSucursal  = "nuevo";
    	LinkedList<Sucursal> sucursales = new LinkedList<>();
    	LinkedList<Provincia> provincias = new LinkedList<>();
    	SucursalLogic sl = new SucursalLogic();
    	LocalidadLogic ll = new LocalidadLogic();
    	ProvinciaLogic pl = new ProvinciaLogic();
    	sucursales = sl.getAll();
    	provincias = pl.getAll();
    
    	String mode = (String)request.getParameter("mode");
		if(mode == null){	mode = "nuevo";	}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){
			int idSuc = Integer.parseInt((String)request.getParameter("id"));
			sucursal = sl.getOne(idSuc);
			formActionSucursal = "editar";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
			int idSuc = Integer.parseInt((String)request.getParameter("id"));
			sucursal = sl.getOne(idSuc);
			formActionSucursal = "eliminar";
		}
    	
    %>
    
</head>
<body>
	<h1> Formulario de ABM de Sucursales </h1>
	
	
	<div class="container-fluid">		 
	    <h2>ABM de Provincias</h2>
	    <!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->
	      <div class="row">
	          <div class="col-sm-12"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                    <th>Nombre Sucursal</th>
	                    <th>Direccion</th>
	                    <th>Horarios</th>
	                    <th>Telefono</th>
	                    <th>Localidad / Provincia</th>
						<th>Editar</th>
						<th>Eliminar</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(Sucursal suc : sucursales) { %>
		                	<tr>
		                		<td><%=suc.getDenominacion() %></td>
		                		<td><%=suc.getDireccion() %></td>
		                		<td><%=suc.getHoraApertura().toString() +" a "+ suc.getHoraCierre().toString()%></td>
		                		<td><%=suc.getTelefono() %></td>
		                		<td><%=suc.getLocalidad().getDenominacion()+" / "+suc.getLocalidad().getProvincia().getDenominacion() %>
			                    <td><a class="form-botton-editar" href="ABMSucursales.jsp?mode=editar&id=<%=suc.getIdSucursal() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMSucursales.jsp?mode=eliminar&id=<%=suc.getIdSucursal() %>">Eliminar</a></td>
			                </tr>
	                  <%}%>
	                </tbody>
	              </table>
	            </div>
	          </div>
	      </div>
	      	          <!-- Linea divisora -->	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->
	 
	 	  <div class="col-sm-12" style="background-color:lavender;">
	          	<form action="" name="formSucursal" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-6" style="background-color:lavender;">
						    	<label>ID Sucursal</label>
						    	<input type="number" name="txtIdSucursal" value="<%=sucursal==null?"":sucursal.getIdSucursal() %>" class="form-control">
							 	<label>Nombre Sucursal</label>
							 	<input type="text" name="txtSucursal" value="<%=sucursal==null?"":sucursal.getDenominacion() %>" class="form-control">
							 	<label>Ubicacion: Provincia / Localidad</label>
							 	<select name="selectProvincia" class="form-control" <%=formActionSucursal=="eliminarLocalidad"?"disabled":"" %>>
							 	<%for(Provincia p: provincias)
							 	  {
							 		if(!p.getLocalidades().isEmpty()){
							 			for(Localidad l: p.getLocalidades())
							 			{
							 				String value = Integer.toString(l.getCodigoPostal()); %>		
							 				<option value="<%=value %>" <%=sucursal!=null&&Integer.parseInt(value)==sucursal.getLocalidad().getCodigoPostal()?"selected":"" %> ><%=p.getDenominacion()+" / "+l.getDenominacion() %></option>
							 	<%		}			
							 		}
							 	  } 
							 	%>
							 	</select>
							 	<label>Direccion</label>
							 	<input type="text" name="txtDireccion" value="<%=sucursal==null?"":sucursal.getDireccion() %>" class="form-control">
								<button class="btn btn-primary" onclick="javascript: cargarSucursal('ServeltABMSucursal/<%=formActionSucursal%>')">Cargar</button>
				   				<button class="btn btn-outline-primary" onclick="javascript: cargarSucursal('ServeltABMSucursal/cancelar')" name="">Cancelar</button>
				   			</div>
				   			<div class="col-sm-6" style="background-color:lavender;">
				   				<label>Telefono:</label>
							 	<input type="text" name="txtTelefono" value="<%=sucursal==null?"":sucursal.getTelefono() %>" class="form-control">
								<label>Hora de Apertura:</label>
								<input type="time" name="txtHoraApertura" value="<%=sucursal==null?"": sucursal.getHoraApertura() %>" class="form-control">
								<label>Hora de Cierre:</label>
								<input type="time" name="txtHoraCierre" value="<%=sucursal==null?"":sucursal.getHoraCierre() %>" class="form-control"><br>
								
							</div>
		   				</div>
	   				</div>
	   			</form>
	          </div>
	 
	  </div>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>