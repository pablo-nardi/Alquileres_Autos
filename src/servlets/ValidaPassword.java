package servlets;

import java.io.IOException;
import java.sql.SQLException;

import logic.ValidaPassLogic;
import logic.UsuarioLogic;
import entidades.Usuario;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidaPassword")
public class ValidaPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ValidaPassLogic vpl=null;   
    Usuario user=null;
    UsuarioLogic ul = null;
	
    public ValidaPassword() {
        super();
        vpl = new ValidaPassLogic();
        user = new Usuario();
        ul = new UsuarioLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		String oldpass, newpass, repitedpass;
		
		oldpass = request.getParameter("txtPassVieja");
		newpass = request.getParameter("txtPassNueva");
		repitedpass = request.getParameter("txtPassConfirm");
		
		user.setCuil(request.getParameter("txtCuil"));
		
		
		if(vpl.validaPass(user, oldpass, newpass, repitedpass).equals("valido")) {
			user.setPassword(newpass);
			ul.setNewPassword(user);
			String redirectURL = "/Alquileres_Autos/ABMUsuario.jsp?estado=Clave cambiada correctamente";
			response.sendRedirect(redirectURL);
		}else {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+vpl.validaPass(user, oldpass, newpass, repitedpass));
			;
		}
		
		
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
	}

}
