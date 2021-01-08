<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "entidades.Usuario" %>
<%@ page import= "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Usuario user = (Usuario)session.getAttribute("usuario");
		String desc;
	if(user.getRol().equals("administrador")){
		desc = "Parace que se conserva la sesion amiguito";
	}else{
		 desc = "ola";
	}
	%>


	<h1>Probando variables varias</h1>
	
	<p>El valor obtenido es: <% out.println(desc); %></p>
</body>
</html>