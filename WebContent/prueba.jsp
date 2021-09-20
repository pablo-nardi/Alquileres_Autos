<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import="entidades.*" %>
<%@ page import="logic.*"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
		<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	



</head>
<body>
    
    <h1>TItulo</h1>
   
		<%
		String pepe = "IMAGENES/Modelos/";
	//String sCarpAct = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
	File carpeta = new File(request.getAttribute("absolute").toString());
	String[] listado = carpeta.list();
	if (listado == null || listado.length == 0) {%>
		<p>No hay elementos dentro de la carpeta actual</p>
	<%}
	else {
		%>
		<ul>
	    <%for (int i=0; i< listado.length; i++) { %>
	     <li><img alt="NO CARGO" src="<%=pepe+listado[i] %>" WIDTH=80 HEIGHT=40><%=listado[i] %></li>   
	        
	<%    }
	}
	
	%>
    </ul>
    
    <h3>Aca está lo ultimo</h3>
    <h4><%=request.getAttribute("deciphered") %></h4>
    
</body>
</html>