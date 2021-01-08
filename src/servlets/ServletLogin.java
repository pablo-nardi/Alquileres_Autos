package servlets;


import java.io.IOException;
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
		String nombre = request.getParameter("txtNombre");
		String pswd = request.getParameter("txtpswd");
		
		user = new Usuario();
		user.setMail(nombre);
		user.setPassword(pswd);
		
		user = ul.validarUsuario(user);
		if(user != null) {
			if(user.getRol().toLowerCase().equals("administrador")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("usuario", user);
				getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
			}else if(user.getRol().toLowerCase().equals("usuario")) {
				HttpSession var = request.getSession(true);
				var.setAttribute("usuario", user);
				getServletContext().getRequestDispatcher("/Usuario.jsp").forward(request, response);
			}
		}
		else {
			//getServletContext().getRequestDispatcher("/Alquileres_Autos/login.html");
			response.sendRedirect("/EjemploWebIntro_2/login.jsp");
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}