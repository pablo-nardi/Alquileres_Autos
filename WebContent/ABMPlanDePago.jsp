<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Formulario ABM Panes de Pago</title>
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
	
	<% 	//VALIDACION DE SESION DE USUARIO
	Usuario user = (Usuario)session.getAttribute("usuario");
	if(user == null){
		String redirectURL = "login.jsp";
	    response.sendRedirect(redirectURL);
	}
	else if(!user.getRol().toLowerCase().equals("administrador")){
	String redirectURL = "login.jsp";
	response.sendRedirect(redirectURL);
	}
	%>

    <%
    PlanDePago plan = null;
    String formActionPlan = "nuevo";
    LinkedList<PlanDePago> planes = new LinkedList<>();
    PlanDePagoLogic ppl = new PlanDePagoLogic();
    planes = ppl.getAll();
    
    String mode = (String)request.getParameter("mode");
	if(mode == null){	mode = "nuevo";	}
	else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("editar")){ 
		plan = ppl.getOne(Integer.parseInt(request.getParameter("id")));
		formActionPlan = "editar";
	}
	else if(mode != null && !mode.isEmpty() && !mode.isBlank() && mode.equals("eliminar")){
		plan = ppl.getOne(Integer.parseInt(request.getParameter("id")));
		formActionPlan = "eliminar";
	}
    
    %>
    
</head>

<body>
	<h1>Formulario ABM de Extras</h1>
	
	
	<div class="container-fluid">		 
	    <h2>ABM de Provincias</h2>
	    <div class="divider mt-2 mb-2 py-1 bg-dark"></div><!-- Linea divisora -->
	      <div class="row">
	          <div class="col-sm-8"><!-- col-12 col-sm-12 col-lg-12 -->
	            <div class="table-responsive">
	              <table class="table table-hover">
	                <thead class="thead-dark">
	                  <tr>
	                    <th>ID</th>
	                    <th>Nombre Plan</th>
	                    <th>Entidad Crediticia</th>
	                    <th>Nombre Tarjeta</th>
	                    <th>Cant. Cuotas</th>
						<th>Editar</th>
						<th>Eliminar</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%for(PlanDePago p : planes) { %>
		                	<tr>
		                		<td><%=p.getIdPlan() %></td>
		                		<td><%=p.getNombrePlan() %></td>
			                    <td><%=p.getEntidadCrediticia() %></td>
			                    <td><%=p.getNombreTarjeta() %></td>
			                    <td><%=p.getCantCuotas() %></td>
			                    <td><a class="form-botton-editar" href="ABMPlanDePago.jsp?mode=editar&id=<%=p.getIdPlan() %>">Editar</a></td>
			                    <td><a class="form-botton-eliminar" href="ABMPlanDePago.jsp?mode=eliminar&id=<%=p.getIdPlan() %>">Eliminar</a></td>
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
						    	<label>id Plan:</label>
								<input type="number" name="txtIdPlan" autofocus readonly  class="form-control" value="<%=plan==null?"":plan.getIdPlan() %>" ><br>
								<label>Nombre Plan:</label>
								<input type="text" name="txtNombrePlan"  class="form-control" value="<%=plan==null?"":plan.getNombrePlan() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<label>Entidad Crediticia:</label>
								<input type="text" name="txtEntidad"  class="form-control" value="<%=plan==null?"":plan.getEntidadCrediticia() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<label>Nombre Tarjeta:</label>
								<input type="text" name="txtTarjeta"  class="form-control" value="<%=plan==null?"":plan.getNombreTarjeta() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<label>Cantidad de Cuotas:</label>
								<input type="text" name="txtCuotas"  class="form-control" value="<%=plan==null?"":plan.getCantCuotas() %>" <%=mode.equals("eliminar")?"readonly":"" %>><br>
								<% String txtButton = "No paso el if"; 
								if(mode.equals("nuevo")){txtButton = "Cargar";}
								else if(mode.equals("editar")){txtButton = "Editar";}
								else if(mode.equals("eliminar")){txtButton = "Eliminar";} %>
								<button class="btn btn-primary" onclick="javascript: cargarFormulario('ServletABMPlanDePago/<%=formActionPlan%>')"><%=txtButton%></button>
				   				<button class="btn btn-outline-primary" name="" onclick="javascript: cargarFormulario('ServletABMPlanDePago/cancelar')">Cancelar</button>
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