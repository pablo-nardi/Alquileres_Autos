<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "entidades.Usuario" %>
<%@ page import= "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error en la pagina</title>
</head>
<body>
	<% 	/*/VALIDACION DE SESION DE USUARIO
		Usuario user = (Usuario)session.getAttribute("usuario");
		if(!user.getRol().toLowerCase().equals("administrador")){
		String redirectURL = "index.html";
	    response.sendRedirect(redirectURL);
		}*/
	%>
	<%
		String mensaje = (String)request.getParameter("mensaje");
		String path = (String)request.getParameter("path");
	%>


	<h1>Ocurrio un error en la pagina:<%=path %> </h1>
	
	<p><b>El mensaje es: </b><br><% out.println(mensaje); %>
	
	
	
	
</body>
</html>