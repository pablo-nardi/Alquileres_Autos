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
    <script type="text/javascript">
	function cargarFormulario(met) {
		document.formAuto.action=met;
	}
	function cerrarSesion(){
		if(confirm("Desea cerrar la sesion?")){
			window.location.href = "login.jsp?estado=CERRARSESION";	
		}
		
	}
    </script>
    
    	<% 	//VALIDACION DE SESION DE USUARIO
    	UsuarioLogic ul = new UsuarioLogic();
    	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "G")){
    		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
    		response.sendRedirect(redirectURL);
    	}
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
		
		String mode = (String)request.getParameter("mode");
		if(mode == null){	mode = "nuevo";	}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){
			auto = al.getOne((String)request.getParameter("id"));
			detailFormAuto = "editar";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
			auto = al.getOne((String)request.getParameter("id"));
			detailFormAuto = "eliminar";
		}
	%>
    
</head>
<body>
		<nav class="navbar navbar-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
  <a class="navbar-brand" href="Admin.jsp">Home</a>
 
  <button type="button" class="btn btn-outline-warning" onclick="javascript: cerrarSesion()" >Logout</button>

	</nav>
	
	<h1>Formulario ABM de Autos</h1>
		
	 <h2>Autos</h2>
	 		
	 <!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->		
	 		
	<div class="container-fluid">
	   <!-- Linea divisora -->	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>
      
       <div class="col-sm-12" style="background-color:lavender;">
	          	<form action="" name="formAuto" method="post">			
					<div class="container"> 
				  		<div class="row">
						    <div class="col-sm-6" style="background-color:lavender;">
							 	<label>Patente</label>
							 	<input type="text" name="txtPatente" required class="form-control" value="<%=auto==null?"":auto.getPatente() %>" <%=mode.equals("eliminar")||mode.equals("editar")?"readonly":"" %> >
							 	<label>Estado</label>
							 	<select name="selectEstado" required class="form-control" <%=mode.equals("eliminar")?"disabled":"" %> >
							 		<option value="disponible" <%=auto!=null&&auto.getEstado().toString().equals("disponible")?"selected":"" %> >Disponible</option>
							 		<option value="alquilado" <%=auto!=null&&auto.getEstado().toString().equals("alquilado")?"selected":"" %> >Alquilado</option>
							 		<option value="inspeccion" <%=auto!=null&&auto.getEstado().toString().equals("inspeccion")?"selected":"" %> >Inspeccion</option>
							 		<option value="inhabilitado" <%=auto!=null&&auto.getEstado().toString().equals("inhabilitado")?"selected":"" %> >Inhabilitado</option>
							 	</select>
							 	<label>Capadidad del Tanque</label>
							 	<input type="number" name="txtCapacidad" required class="form-control" value="<%=auto==null?"":auto.getCapacidadDelTanque() %>" <%=mode.equals("eliminar")?"readonly":"" %> >
							 	<label>Kilometraje</label>
							 	<input type="number" name="txtKilometraje" required class="form-control" value="<%=auto==null?"":auto.getKilometraje() %>" <%=mode.equals("eliminar")?"readonly":"" %> ><br>
								<% String texto = "No paso el if"; 
								if(mode.equals("nuevo")){texto = "Cargar";}
								else if(mode.equals("editar")){texto = "Editar";}
								else if(mode.equals("eliminar")){texto = "Eliminar";} %>
								<button class="btn btn-primary" onclick="javascript: cargarFormulario('ABMAutos/<%=detailFormAuto%>')"><%=texto %></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ABMAutos/cancelar')">Cancelar</button>
				   			</div>
				   			<div class="col-sm-6" style="background-color:lavender;">
				   				<label>Fecha de Compra:</label>
							 	<input type="date" name="txtFechaCompra" required class="form-control" value="<%=auto==null?"":auto.getFecha_de_compra() %>" <%=mode.equals("eliminar")?"readonly":"" %> >
								<label>Fecha Ult. Servicio</label>
								<input type="date" name="txtServicio" class="form-control" value="<%=auto==null?"":auto.getFechaUtltimoServicio() %>" <%=mode.equals("eliminar")?"readonly":"" %> >
								<label>Modelo:</label>
								<select name="selectModelos" required class="form-control" <%=mode.equals("eliminar")?"disabled":"" %> >
								
									<%for (Modelo m: modelos){ String value = Integer.toString(m.getIdentificacion()); %>
										<option value="<%=value%>" <%=auto!=null&&auto.getModelo().getIdentificacion()==m.getIdentificacion()?"selected":"" %> > <%=m.getDenominacion() %> </option>
									<%} %>
								
								</select>
								<label>Sucursal:</label>
								<select name="selectSucursales" required class="form-control" <%=mode.equals("eliminar")?"disabled":"" %> >
										<option>SUCURSAL / LOCALIDAD / PROVINCIA </option>
									<%for (Sucursal s: sucursales){ String value = String.valueOf(s.getIdSucursal()); %>
										<option value="<%=value %>" <%=auto!=null&&auto.getSucursal().getIdSucursal()==s.getIdSucursal()?"selected":"" %> > <%=s.getDenominacion()+" / "+s.getLocalidad().getDenominacion()+" / "+s.getLocalidad().getProvincia().getDenominacion() %></option>
									<%} %>
								</select>
							</div>
		   				</div>
	   				</div>
	   			</form>
	     </div>	
      <div class="row">
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
                    <td><a class="form-botton-editar" href="ABMAutos.jsp?mode=editar&id=<%=a.getPatente() %>">Editar</a></td>
                    <td><a class="form-botton-eliminar" href="ABMAutos.jsp?mode=eliminar&id=<%=a.getPatente() %>">Eliminar</a></td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
      </div>
    </div>
	
	<!-- Linea divisora --> 	<div class="divider mt-2 mb-2 py-1 bg-dark"></div>		<!-- Linea divisora -->
	
	<footer class="navbar navbar-fixed-bottom">
	  <div class="container">
	    <p>Trabajo Practico de java</p>
	  </div>
	</footer>
</body>
</html>