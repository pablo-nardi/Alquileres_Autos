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
	<style type="text/css">
		p{
			margin: 0;
		}
		#parrafo{
			font-size: 20px;
			
			text-align: center;
		}
		#parrafo::first-letter, .datos::first-letter{
        text-transform: uppercase;
 	    } 
	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	
	<%
	Auto auto = null;
	LinkedList<Auto> autos = new LinkedList<>();
	LinkedList<Modelo> modelos = new LinkedList<>();
	LinkedList<Sucursal> sucursales = new LinkedList<>();
	AutoLogic al = new AutoLogic();
	ModeloLogic ml = new ModeloLogic();
	SucursalLogic sl = new SucursalLogic();
	autos = al.getAutos("disponible");
	//modelos = ml.getAll();
	//sucursales = sl.getAll();
	
	%>
	    
</head>
<body>
	<h1>Pagina donde se van a mostrar los modelos</h1>
	<!--tipo: nombre
		modelo: imagen, denominacion, cant pasaj, cant equipajes, caja cambio, ac, 
        precio por dia
		PRECIO TOTAL POR DIAS SELECCIONADOS
		 -->
	<div class="container-fluid">
      <div class="row">
        <h2>Autos</h2>
          <div class="col-12 col-sm-12 col-lg-12">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                  	<th>Foto</th>
					<th>Datos</th>
					<th></th>
                    <th>Precio por dia</th>
					<th>Editar</th>
					<th>Eliminar</th>

                  </tr>
                </thead>
                <tbody>
                <%for(Auto a : autos) { Modelo mod = new Modelo(); mod = a.getModelo(); %>
                  <tr>
                  	<td> <p id="parrafo" ><b><%=mod.getTipoAuto().getNombreTipo() %>:</b></p>
                  	  <img alt="" src="<%=mod.getFotoModelo() %>" style="width:240px; height:120px;
                  	  											  position: relative; top: 5px; left:5px;"></td>
                  	<td WIDTH=300><p class="datos" ><b>modelo</b> <br> <%=mod.getDenominacion()  %></p>
                  		<p><b>cant pasajeros</b> <br> <%=mod.getCantPasajeros() %></p>
                  		<p><b>cant equipaje grande</b> <br> <%=mod.getCantEquipajeGrande() %></p>
                  		<p><b>cant equipaje chico</b> <br> <%=mod.getCantEquipajeChico() %> </p>	</td>
                    <td><p><b>Caja de cambio:</b> <br> <%=mod.getTransmision() %></p>
                    	<p><b>Aire Acondicionaso</b> <br> <%=mod.getAireAcondicionado() %></p>	</td>

                    <td><%=mod.getPrecioPorDia() %>
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
</body>
</html>