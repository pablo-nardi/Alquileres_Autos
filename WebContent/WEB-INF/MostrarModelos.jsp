<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>
<%@ page import="java.sql.Date" %>
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
 	    .button-seleccionar{
			display: block;
            text-decoration: none;
            padding: 5px 5px;
            border: 2px solid black;
            border-radius: 15px;
            text-align: center;
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
	
	// CALCULO CANTIDAD DE DIAS CON LAS FECHAS
	
	Date fechaRetiro= Date.valueOf(request.getParameter("fechaRetiro"));
	Date fechaDevolucion= Date.valueOf(request.getParameter("fechaDevolucion"));
	
	long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
	
	
	%>
	    
</head>
<body>
	<h1>Modelos de autos diponibles</h1>
		 
	<div class="container-fluid">
      <div class="row">
        <h2>Autos</h2>
          <div class="col-12 col-sm-12 col-lg-12">
          <form action="FormularioFacturacion" name="myForm" method="post">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                  	<th>Foto</th>
					<th>Datos</th>
					<th></th> <!-- ESTA COLUMNA ES NECESARIA, NO BORRAR -->
                    <th>Precio</th>

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

                    <td><p><b>Precio por dia: </b> <br> <%=mod.getPrecioPorDia() %></p>
                    	<p><b>Cantidad de dias: </b> <br> <%=dias %></p>
                    	<input type="text" name="total" class="form-control" value="<%=dias * mod.getPrecioPorDia()  %>" readonly >
                    	<input type="hidden" name="id" value="<%=mod.getIdentificacion()  %>" >
                    	<button class="btn btn-primary" >Reservar</button>
                    	</td>
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div>
            </form>
          </div>
      </div>
    </div>
</body>
</html>