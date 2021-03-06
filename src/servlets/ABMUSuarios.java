package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import logic.*;

@WebServlet({"/ABMUSuarios/*", "/ABMUsuarios/*"})
public class ABMUSuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Usuario user;
	UsuarioLogic ul;
	LocalidadLogic ll;
	ValidaPassLogic vpl;
       
    public ABMUSuarios() {
        super();
        user = new Usuario();
        ul = new UsuarioLogic();
        ll = new LocalidadLogic();
        vpl = new ValidaPassLogic();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//Validar sesion // Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				validaPassword(request);
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
					ul.deleteUser(request.getParameter("txtCuil"));
					response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
					break;
			
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
				break;
			}
		}catch (Exception e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());
		}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException, Exception {

		
		user.setNombre(req.getParameter("txtNombre"));
		user.setApellido(req.getParameter("txtApellido"));
		user.setCuil(req.getParameter("txtCuil"));
		user.setMail(req.getParameter("txtEmail"));
		user.setRol(req.getParameter("selectRol"));
		user.setTelefono(req.getParameter("txtTelefono"));
		user.setCiudad(req.getParameter("txtCiudad"));
		user.setCodigoPostal(req.getParameter("txtCodigo"));
		user.setCalle(req.getParameter("txtCalle"));
		user.setDepartamento(req.getParameter("txtDpto"));
		user.setPiso(Integer.parseInt(req.getParameter("txtPiso")));
		
		if(req.getPathInfo().equals("/nuevo")) {
			user.setPassword(req.getParameter("txtPassword"));
		}
		
	}
	private void validaPassword(HttpServletRequest req)throws NumberFormatException, SQLException, Exception{
		
		String newpass = req.getParameter("txtPassword");
		String repitedpass = req.getParameter("txtPassRepited");
		
		if(vpl.validaPass(newpass, repitedpass).equals("valido")) {
			
		}else {
			throw new Exception(vpl.validaPass(newpass, repitedpass));
		}//EL METODO VALIDA PASS DEVUELVE LO NECESARIO PARA MOSTRAR EN LA EXCEPCION
	}

}
