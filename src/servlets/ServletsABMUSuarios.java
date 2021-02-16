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

@WebServlet({"/ServletsABMUSuarios/*", "/ServletABMUsuarios/*"})
public class ServletsABMUSuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Usuario user;
	UsuarioLogic ul;
	LocalidadLogic ll;
       
    public ServletsABMUSuarios() {
        super();
        user = new Usuario();
        ul = new UsuarioLogic();
        ll = new LocalidadLogic();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//Validar sesion // Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				validaContraseña(request);
				mapearADatos(request);
				ul.addUser(user);
				response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
				break;
			case "/editar":
				validaContraseña(request);
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
		} catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		catch (NumberFormatException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());
		} catch (Exception e) {
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
		user.setPassword(req.getParameter("txtPassword"));
		if(req.getPathInfo().equals("/nuevo")) {
			
		}
		
	}
	private void validaContraseña(HttpServletRequest req)throws NumberFormatException, SQLException, Exception{
		
		String pswd, cpswd;
		pswd = req.getParameter("txtPassword");
		cpswd = req.getParameter("txtPasswordConfirm");
		if(req.getPathInfo().equals("/nuevo") && (cpswd.isBlank() || cpswd.isEmpty() || cpswd == null || !pswd.equals(cpswd)) ) {
			
			throw new Exception("El campo CONTRASEñA debe ser identico al campo CONFIRMA CONTRASEñA");
		
		}else if(req.getPathInfo().equals("/editar") && (!cpswd.isBlank() || !cpswd.isEmpty() || !cpswd.equals("") )) {
			
			if(!pswd.equals(cpswd)) {
				
				throw new Exception("El campo CONTRASEñA debe ser identico al campo CONFIRMA CONTRASEñA");
			}			
		}
	}

}
