package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import logic.UsuarioLogic;

@WebServlet({"/ServletsABMUSuarios/*", "/ServletABMUsuarios/*"})
public class ServletsABMUSuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Usuario user;
	UsuarioLogic ul;
       
    public ServletsABMUSuarios() {
        super();
        user = new Usuario();
        ul = new UsuarioLogic();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//Validar sesion // Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				ul.addUser(user);
				response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				ul.updateUser(user);
				response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
				break;
			case "/eliminar":
					ul.deleteUser(request.getParameter("id"));
					response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
			}
		} catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	public void mapearADatos(HttpServletRequest req) {
		user.setNombre(req.getParameter("txtNombre"));
		user.setApellido(req.getParameter("txtApellido"));
		user.setCuil(req.getParameter("txtCuil"));
		user.setMail(req.getParameter("txtEmail"));
		user.setPassword(req.getParameter("txtPassword"));
		user.setRol(req.getParameter("selectRol"));
		user.setTelefono(req.getParameter("txtTelefono"));
		user.setCodigoPostal(Integer.parseInt(req.getParameter("txtCodigoPostal")));
		user.setCalle(req.getParameter("txtCalle"));
		user.setDepartamento(req.getParameter("txtDpto"));
		user.setPiso(Integer.parseInt(req.getParameter("txtPiso")));
		
		
		

	}

}
