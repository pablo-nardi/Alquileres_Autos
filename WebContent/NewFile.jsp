<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> Hola </p>
	
	<%out.println((String) request.getAttribute("applicationPath") ) ; %>
	<%out.println((String) request.getAttribute("uploadFilePath")); %>
</body>
</html>