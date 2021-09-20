<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErrordesdeJSP.jsp" %>
<%@	page import="java.util.*"%>
<%@ page import="entidades.Usuario" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*" %>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login Alquileres Autos</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="./CSS/index.css">
  <link rel="stylesheet" href="./CSS/login.css">

<style type="text/css">
	.form-botton-editar{
		display: block; 
		text-decoration: none; 
		padding: 5px 5px; 
		border: 2px solid black; 
		border-radius: 15px; 
		margin-bottom: 10px;
		}
	 .form-botton-editar:hover{
        background-color: rgb(10,150,150);
        color: white;  
 		}
 		#informa{
 			background-color: red;
 		}
</style>

	<%
	String estado = (String) request.getParameter("estado");
	if(estado!=null){
		if(estado.toUpperCase().equals("CERRARSESION")){
			session.invalidate();
			estado = "Sesion cerrada exitosamente";
		}	
	}else{
		//VALIDACION DE SESION DE USUARIO
		UsuarioLogic ul = new UsuarioLogic();
		if(ul.validarSesion((Usuario)session.getAttribute("usuario"), "a")){
			String redirectURL = "Admin.jsp";
			response.sendRedirect(redirectURL);
		}else if(ul.validarSesion((Usuario)session.getAttribute("usuario"), "u")){
			String redirectURL = "Usuario.jsp";
			response.sendRedirect(redirectURL);
		}
		
		
	}
	 
	%>

</head>
	<body>
		<!-- partial:index.partial.html -->
		<div class="login-page">
			
			<div class="alert alert-warning alert-dismissible" style="display: <%=estado==null?"none":""%>">
  				<button type="button" class="close" data-dismiss="alert">&times;</button>
  				<label><%=estado==null?"":estado%></label>
			</div>
			<div class="form">
		  		<a class="form-botton-editar" href="index.jsp" >Volvar al Inicio</a>
		    	<form class="register-form" action="ServletLogin" method="post">
			      <input type="email" name="txtNombre" id="name" placeholder="ejemplo@ejem.com" value="pnardi@gmail.com" required autofocus>
			      <input type="password" name="txtpswd" id="pswd" required placeholder="password" value="pablo1234" />
			      <button type="submit" >Login</button>
		      
		      
		    	</form>
		    
		  	</div>
		</div>
	</body>
</html>