<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<title>ABM de Autos</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    	<% 	/*VALIDACION DE SESION DE USUARIO
		Usuario user = (Usuario)session.getAttribute("usuario");
		if(!user.getRol().toLowerCase().equals("administrador")){
		String redirectURL = "login.jsp";
	    response.sendRedirect(redirectURL);
		}*/
	%>
	
	<%
		Auto auto = null;
		String detailFormAuto = "nuevo";
		LinkedList<Auto> autos = new LinkedList<>();
		LinkedList<Modelo> modelos = new LinkedList<>();
		LinkedList<Sucursal> sucursales = new LinkedList<>();
		AutoLogic al = new AutoLogic();
		ModeloLogic ml = new ModeloLogic();
		SucursalLogic sl = new SucursalLogic();
		autos = al.getAll();
		modelos = ml.getAll();
		sucursales = sl.getAll();
	%>
    
</head>
<body>
	
	
		<h1>Formulario ABM de Autos</h1>
		

	
	
	<a class="form-botton-editar" href="Admin.jsp">Volver a Admin.jsp</a>
		
	<div class="container-fluid">
      <div class="row">
        <h2>Autos</h2>
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th>patente</th>
                  	<th>estado</th>
					<th>Cap. Tanque</th>
					<th>Kilometraje</th>
					<th>Fecha de Compra</th>
					<th>Fecha Ult. Servicio</th>
					<th>Modelo</th>
                    <th>Sucursal</th>
					<th>Editar</th>
					<th>Eliminar</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Auto a : autos) { %>
                  <tr>
                  	<td><%=a.getPatente() %></td>
                  	<td><%=a.getEstado() %></td>
                  	<td><%=a.getCapacidadDelTanque()  %></td>
                  	<td><%=a.getKilometraje() %></td>
                  	<td><%=a.getFecha_de_compra() %></td>
                    <td><%=a.getFechaUtltimoServicio() %></td>
                    <td><%=a.getModelo().getDenominacion() %></td>
                    <td><%=a.getSucursal().getDenominacion() %></td>
                    <td><a class="form-botton-editar" href="ABMModelos.jsp?mode=editar&id=<%=a.getPatente() %>">Editar</a></td>
                    <td><a class="form-botton-eliminar" href="ServletABMModelos/eliminar?id=<%=a.getPatente() %>">Eliminar</a></td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
      </div>
      
      <!-- Linea divisora -->	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>
      
       <div class="col-sm-12" style="background-color:lavender;">
	          	<form action="" name="formSucursal" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-6" style="background-color:lavender;">
							 	<label>Patente</label>
							 	<input type="text" name="txtPatente"  class="form-control">
							 	<label>Estado</label>
							 	<select name="selectEstado" class="form-control">
							 		<option value="disponible">Disponible</option>
							 		<option value="alquilado">Alquilado</option>
							 		<option value="inspeccion">Inspeccion</option>
							 		<option value="inhabilitado">Inhabilitado</option>
							 	</select>
							 	<label>Capadidad del Tanque</label>
							 	<input type="number" name="txtCapacidad" class="form-control">
							 	<label>Kilometraje</label>
							 	<input type="number" name="txtKilometraje" class="form-control"><br>
								<button class="btn btn-primary" >Cargar</button>
				   				<button class="btn btn-outline-primary" name="">Cancelar</button>
				   			</div>
				   			<div class="col-sm-6" style="background-color:lavender;">
				   				<label>Fecha de Compra:</label>
							 	<input type="date" name="txtFechaCompra"  class="form-control">
								<label>Fecha Ult. Servicio</label>
								<input type="date" name="txtServicio" class="form-control">
								<label>Modelo:</label>
								<select name="selectModelos" class="form-control">
								
									<%for (Modelo m: modelos){ %>
										<option> <%=m.getDenominacion() %> </option>
									<%} %>
								
								</select>
								<label>Sucursal:</label>
								<select name="selectSucursales" class="form-control">
									<%for (Sucursal s: sucursales){ %>
										<option> <%=s.getDenominacion() %> </option>
									<%} %>
								</select>
							</div>
		   				</div>
	   				</div>
	   			</form>
	     </div>
	 
    </div>
	
	
</body>
</html>