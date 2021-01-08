<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import= "entidades.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP de Usuarios</title>
</head>
<body>
	<h1>Bienbenido al JSP de Usuarios!</h1>
	<%	
		Usuario user = (Usuario)session.getAttribute("usuario");
	%>
	<h2>Mail</h2>
	<%out.println((String) user.getNombre().toUpperCase()); %>
	
</body>
</html>