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

	<title>	Formulario ABM Usuarios </title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
	<style type="text/css">
		.form-botton-editar{
		display: block;
            text-decoration: none;
            padding: 5px 5px;
            border: 2px solid black;
            border-radius: 15px;
}
	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	
	
	<script type="text/javascript">
	function cargarFormulario(met) {
		document.myForm.action=met;
	}
	</script>
	
	<% 	//VALIDACION DE SESION DE USUARIO
	UsuarioLogic ul = new UsuarioLogic();
	if(!ul.validarSesion((Usuario)session.getAttribute("usuario"), "a")){
		String redirectURL = "login.jsp?estado=Usuario incorrecto o inexistente";
		response.sendRedirect(redirectURL);
	}
	%>
	
	<% 	
		Modelo modelo = null;
		String detailFormAction = "nuevo";
		LinkedList<TipoAuto> tiposAutos;
		LinkedList<Modelo> modelos;
		TipoAutoLogic tal = new TipoAutoLogic();
		ModeloLogic ml = new ModeloLogic();
		tiposAutos = tal.getAll();
		modelos = ml.getAll();
		
		String mode = (String)request.getParameter("mode");
		String foto = "Foto:";
		if(mode == null){	mode = "nuevo";	}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){
			int idModelo = Integer.parseInt((String)request.getParameter("id"));
			modelo = ml.getOne(idModelo);
			detailFormAction = "editar";
			foto = "Foto Anterior:";
		}
		else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
			int idModelo = Integer.parseInt((String)request.getParameter("id"));
			modelo = ml.getOne(idModelo);
			detailFormAction = "eliminar";
			foto = "Foto Anterior:";
		}
		
	%>
</head>


<body>
	<h1>Formulario ABM de Modelos</h1>
		

	
	
	<a class="form-botton-editar" href="Admin.jsp">Volver a Admin.jsp</a>
		
	<div class="container-fluid">
      <div class="row">
        <h2>Modelos</h2>
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th>Foto</th>
                  	<th>ID Modelo</th>
					<th>Equipaje Grande</th>
					<th>Equipaje Chico</th>
					<th>Pasajeros</th>
					<th>Precio/dia</th>
					<th>Denominacion</th>
                    <th>Transmision</th>
					<th>A/C</th>
					<th>Tipo de Auto</th>
					<th>Editar</th>
					<th>Eliminar</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Modelo mod : modelos) { %>
                  <tr><!-- IMAGENES/Modelos/chev_joy.jpg -->
                  	<td><img alt="" src="<%=mod.getFotoModelo() %>" WIDTH=80 HEIGHT=40></td>
                  	<td><%=mod.getIdentificacion() %></td>
                  	<td><%= mod.getCantEquipajeGrande() %></td>
                  	<td><%= mod.getCantEquipajeChico() %></td>
                  	<td><%= mod.getCantPasajeros() %></td>
                  	<td><%= mod.getPrecioPorDia() %></td>
                    <td><%= mod.getDenominacion() %></td>
                    <td><%= mod.getTransmision() %></td>
                    <td><%= mod.getAireAcondicionado() %></td>
                    <td><%= mod.getTipoAuto().getNombreTipo() %></td>
                    <!-- <td><a href="ServletABMModelos/editar?id=<%=mod.getIdentificacion() %>">EDITAR</a></td>  -->
                    <td><a class="form-botton-editar" href="ABMModelos.jsp?mode=editar&id=<%=mod.getIdentificacion() %>">Editar</a></td>
                    <td><a class="form-botton-eliminar" href="ABMModelos.jsp?mode=eliminar&id=<%=mod.getIdentificacion() %>">Eliminar</a></td>
                  </tr>
                  <% } %>
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
    	<label>Id Modelo:</label>
    	<input type="text" name="txtId" value="<%=modelo==null?"":modelo.getIdentificacion() %>" class="form-control" readonly><br>
    	<label>Cantidad Maxima de pasajeros:</label>
		<input type="number" name="txtCantPasajeros" value="<%=modelo==null?"":modelo.getCantPasajeros()%>"  autofocus required <%=mode.equals("eliminar")?"readonly":""%> class="form-control"><br>
		<label>Denominacion:</label>
		<input type="text" name="txtDenominacion" value="<%=modelo==null?"":modelo.getDenominacion()%>" required <%=mode.equals("eliminar")?"readonly":""%> class="form-control"><br>
		<label>Cantidad de Equipaje Grande:</label>
		<select name="selectEquiGran" <%=mode.equals("eliminar")?"disabled":""%> class="form-control">
			<option value="1" <%=modelo!=null&&modelo.getCantEquipajeGrande()==1?"selected":"" %>>1</option>
			<option value="2" <%=modelo!=null&&modelo.getCantEquipajeGrande()==2?"selected":"" %> >2</option>
		</select><br>
		<label>Cantidad de Equipaje Chico:</label>
		<select name="selectEquiChico" <%=mode.equals("eliminar")?"disabled":""%> class="form-control" >
			<option value="1" <%=modelo!=null&&modelo.getCantEquipajeChico()==1?"selected":"" %> >1</option>
			<option value="2" <%=modelo!=null&&modelo.getCantEquipajeChico()==2?"selected":"" %> >2</option>
			<option value="3" <%=modelo!=null&&modelo.getCantEquipajeChico()==3?"selected":"" %> >3</option>
		</select><br>
		<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ServletABMModelos/<%=detailFormAction%>')">Aceptar</button>
		<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ServletABMModelos/cancelar')">Cancelar</button>
	</div>
    <div class="col-sm-4" style="background-color:orange;">
    	<label>Transmision:</label>
		<select name="selectTransmision" <%=mode.equals("eliminar")?"disabled":""%> class="form-control">
			<option value="manual" <%=modelo!=null&&modelo.getTransmision().equals("manual")?"selected":"" %> >Manual</option>
			<option value="automatica" <%=modelo!=null&&modelo.getTransmision().equals("automatica")?"selected":"" %> >Automatica</option>
		</select><br>
		<label>Aire Acondicionado:</label>
		<select name="selectAA" <%=mode.equals("eliminar")?"disabled":""%> class="form-control">
			<option value="si" <%=modelo!=null&&modelo.getAireAcondicionado().equals("si")?"selected":"" %> >Si</option>
			<option value="no" <%=modelo!=null&&modelo.getAireAcondicionado().equals("no")?"selected":"" %> >No</option>
		</select><br>
		<label>Tipo de Auto:</label>
		<select name="selectTipo" <%=mode.equals("eliminar")?"disabled":""%> class="form-control">
		<%int val = 0; 	for(TipoAuto ta:tiposAutos){++val; String var = Integer.toString(val); String value = Integer.toString(ta.getId_Tipo());%>
			
			<option value="<%=value%>" <%=modelo!=null&&val==modelo.getTipoAuto().getId_Tipo()?"selected":""%>><%=ta.getNombreTipo() %></option>
			
		<%}%>
		</select><br>
		<label>Precio por día:</label>
		<input type="number" name="txtPrecioPorDia" value="<%=modelo==null?"":modelo.getPrecioPorDia() %>" autofocus required <%=mode.equals("eliminar")?"readonly":""%> class="form-control"><br>
    	<label>Ingrese Foto: </label>
    	<input type="file" name="foto" class="form-control">
    </div>
    <div class="col-sm-4" style="background-color:blue; height: 250px;">
    	<label style="font-size: 32px;" ><%=foto %></label>
    	<div style="width:330px; height:170px; background-color: white;">
    	<img alt="No hay foto disponible" src="<%=modelo==null?"":modelo.getFotoModelo() %>" style="width:320px; height:160px; position: relative; top: 5px; left:5px;" >
    	</div>
    </div>

  </div>
</div>

</form>

</body>
</html>