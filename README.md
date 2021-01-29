# Alquileres_Autos
Repositorio del TP de la Materia JAVA

**Mail de MEca:** adrianmeca@gmail.com
link de github: https://github.com/utnfrrojava/java2019

# Datos en clase
¿getAttribute? vs ¿getParameter?
getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
vs
request.getRequestDispatcher("/Admin.jsp").forward(request, response);
¿El index.html debe ir en Web-Inf

---


**Link interesante de sesiones y todo es.**
https://www.ecodeup.com/primeros-pasos-java-web-jsp-servlets/


**Datos**
Dentro de un Dynamic web prject

>source--> guarda todas las fuentes del programa
webContent --> Van todos los html, js, css, jsp, 
	web-inf --> guarda paginas que no se pueden acceder desde el browser, pero si desde un servlet
Si tenemos pagina publica --> validar que el usuario esté logueado ¿salvo en la pagina de inicio?
>Si es una pagina dentro de web-inf, preguntar los permisos del usuario.

Template--> codigo dentro de html



Para acceder a un WEB-INF solo se puede con el metodo forward

Sesiones
El objeto que se guarde, tiene que ser Java Bin, es decir, tener un contructor sin parametros y con getters y setters para todos sus atributos

Para guardad hasta que dura la sesion
```
request.getSession().setAtribute
```
Para Tener solo en la pagina donde se carga
```
request.setAtribute()
``
