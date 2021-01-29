<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Opps...</h1>
	<p>Sorry, an error occurred.</p>
	<p>Here is the exception stack trace: </p>
	<% exception.printStackTrace(response.getWriter()); %>
</body>
</html>