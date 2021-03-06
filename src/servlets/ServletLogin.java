package servlets;


import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.*;
import entidades.Usuario;

@WebServlet({"/ServletLogin", "/servleLogin", "/servletlogin", "/Servletlogin"})
public class ServletLogin extends HttpServlet {
	UsuarioLogic ul;
	Usuario user;
	private static final long serialVersionUID = 1L;
       
    
    public ServletLogin() {
        super();
        ul = new UsuarioLogic();
        
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String nombre = request.getParameter("txtNombre");
			String pswd = request.getParameter("txtpswd");
			
			user = new Usuario();
			user.setMail(nombre);
			user.setPassword(pswd);
			

			//GUARDO EN SESION LA DIRECCION DE LAS IMAGENES
			String UPLOAD_DIRECTORY = "/IMAGENES/Modelos";
			Path path = Paths.get(getServletContext().getRealPath("")  + UPLOAD_DIRECTORY);
			String absolute = path.toString();
			
			user = ul.validarUsuario(user);
			if(user != null) {
				if(ul.validarSesion(user, "a")) {//user.getRol().toLowerCase().equals("administrador")
					HttpSession session = request.getSession(true);
					session.setAttribute("usuario", user);
					
					session.setAttribute("dirAbsolute",absolute );
					
					getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
					
				}else if(ul.validarSesion(user, "u")) {
					HttpSession session = request.getSession(true);
					session.setAttribute("usuario", user);
					
					session.setAttribute("dirAbsolute",absolute );
					
					getServletContext().getRequestDispatcher("/Usuario.jsp").forward(request, response);
				}
			}
			else {
				//getServletContext().getRequestDispatcher("/Alquileres_Autos/login.html");
				response.sendRedirect("/Alquileres_Autos/login.jsp?estado=Usuario y/o Clave incorrectos");
				
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
			
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}