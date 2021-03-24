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

       <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="CSS/ABM.css">
<title>Insert title here</title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

        #texto{
            border:none;
            width: 40px;
        }

    </style>



</head>
<body>
    
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
	     <li><img alt="" src="<%=pepe+listado[i] %>" WIDTH=80 HEIGHT=40><%=listado[i] %></li>   
	        
	<%    }
	}
	
	%>
    </ul>
</body>
</html>