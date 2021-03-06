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
	function cancelarAlquiler(){
		if(confirm("Desea cancelar alquiler?")){
			window.location.href = "index.jsp";	
		}
		
	}
			
	</script>
	
	<%
	//int mes = 0 , anio = 0;
	//CharSequence mes=null, anio=null;
	String mes=null, anio=null;
	PlanDePago plan = null;
    LinkedList<PlanDePago> pBancos = new LinkedList<>(),pTarjetas = new LinkedList<>() ;
    PlanDePagoLogic ppl = new PlanDePagoLogic();
    pBancos = ppl.getBancos();
    pTarjetas = ppl.getTarjetas();
		
	Alquiler alq = (Alquiler) session.getAttribute("alquiler");
	Usuario user = (Usuario) session.getAttribute("usuario");
	
	// CALCULO CANTIDAD DE DIAS CON LAS FECHAS
	
	Date fechaRetiro= alq.getFecRetiroPrevisto();
	Date fechaDevolucion= alq.getFecDevPrevista();
		
	long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
	
	%>

<title>Carga de Formulario</title>
</head>
<body>
		<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Inicio</a>
 
  <a class="navbar-brand" href="login.jsp">Login</a>

	</nav>

<h1>Formulario de pago</h1>


	<form action="ResumenReserva" name="myForm" method="post">	
		<div class="container">		 
			<div 
			class="row">
				<div class="col-sm-4" style="background-color:lavender;">
			          		
							    	<label>Tarjeta:</label>
									<select name="selectTarjeta" class="form-control">
										<%for(PlanDePago pdp: pTarjetas){  String value = pdp.getNombreTarjeta(); %>
											<option value="<%=value%>" ><%=value %></option>
										<%} %>
									</select>
									
									<label>Banco:</label>
									<select name="selectBanco" class="form-control">
										<%for(PlanDePago pdp: pBancos){  String value = pdp.getEntidadCrediticia(); %>
											<option value="<%=value%>" ><%=value %></option>
										<%} %>
									</select>	
												
									<label>Cuotas:</label>
									<select name="selectCuotas" class="form-control">
										<%for(int i = 3; i <= 9 ; i+=3){   %>
											<option value="<%=i%>" ><%=i %></option>
										<%} %>
									</select>				
												
									<label>Total:</label>
									<input type="text" name="total" class="form-control" value="<%=alq==null?"":alq.getPrecioDiario() * dias%>" readonly >
									
									<br>
							
									<button class="btn btn-primary">Aceptar</button>
		   							<button type="button" class="btn btn-warning" onclick="javascript: cancelarAlquiler()" >Cancelar Alquiler</button>
			   	</div>
			   	<div class="col-sm-4" style="background-color:lavender; position:relative; left: 100px;">
			          		
							    	<label>Numero de Tarjeta (sin espacios ni guiones):</label>
									<input type="number" value="<%=user.getNumUltTarjeta()==null?"":user.getNumUltTarjeta() %>" name="txtNumTarjeta" required class="form-control">
									
									<label>Titular de la Tarjeta (como figura en la tarjeta):</label>
									<input type="text" name="txtTitular" value="<%=user.getNombreUltTarjeta()==null?"":user.getNombreUltTarjeta() %>" required class="form-control">
									
									<%
												if(user.getVencUltTarjeta()!=null){
													anio = user.getVencUltTarjeta().subSequence(0, 4).toString()  ;	
													mes = user.getVencUltTarjeta().subSequence
																(
																 user.getVencUltTarjeta().length()-1 ,
																 user.getVencUltTarjeta().length() 
																 ).toString();
												}
												
									%>
									
									<label>Fecha de Vencimiento:</label>
									<div>
										<select name="selectMes" class="form-control" style=" float:left; width: 25%;">
											<%for(int i = 1; i <= 12; i++){   %>
												<option value="<%=i%>" <%=mes!=null&&i==Integer.parseInt(mes)?"selected":""%> ><%=i %></option>
											<%} %>
										</select>
										<select name="selectYear" class="form-control" style=" width: 25%;" >
											<%for(int i = 2021; i <= 2032; i++){   %>
												<option value="<%=i%>" <%=mes!=null&&i==Integer.parseInt(anio)?"selected":""%> ><%=i %></option>
											<%} %>
										</select>
									</div>		
									<label>Codigo de Seguridad:</label>
									<input type="text" name="txtCodigo" required class="form-control">
		   			
			   	</div>
			 </div>
			 </div>
	</form>
</body>
</html>