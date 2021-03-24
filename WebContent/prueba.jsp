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
    <h1><%=request.getParameter("pr") %></h1>
    <form method="post" action="ServletPrueba" enctype="multipart/form-data">
    Choose a file: <input type="file" name="multiPartServlet" />
    <input type="submit" value="Upload" />
	</form>
	
		<%
		String pepe = "IMAGENES/Modelos/";
	String sCarpAct = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
	File carpeta = new File(sCarpAct);
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
</body>
</html>