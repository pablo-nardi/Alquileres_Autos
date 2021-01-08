package servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ServletABM
 */
@WebServlet("/ServletABM")
public class ServletABM extends HttpServlet {
	UsuarioLogic ul;
	Usuario user;
	private static final long serialVersionUID = 1L;
       
    public ServletABM() {
        super();
        ul = new UsuarioLogic();
        user = new Usuario();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//response.getWriter().append("Served at: Servlet de ABM").append(request.getContextPath());
		
		user.setNombre(request.getParameter("txtNombre"));
		user.setApellido(request.getParameter("txtApellido"));
		user.setCuil(request.getParameter("txtCuil"));
		user.setMail(request.getParameter("txtEmail"));
		user.setPassword(request.getParameter("txtPassword"));
		user.setRol(request.getParameter("selectRol"));
		user.setTelefono(request.getParameter("txtTelefono"));
		user.setCodigoPostal(Integer.parseInt(request.getParameter("txtCodigoPostal")));
		user.setCalle(request.getParameter("txtCalle"));
		user.setDepartamento(request.getParameter("txtDpto"));
		user.setPiso(Integer.parseInt(request.getParameter("txtPiso")));
		
		/*response.getWriter().append("nombre: " + user.getNombre()).append(" apellido: " + user.getApellido()).append(" cuil: " + user.getCuil()).append(" mail: " + user.getMail()).append(" pswd: " + user.getPassword()).append(" Rol: " + user.getRol()).append(" Tel: " + user.getTelefono() + " Codigo pposta: " + user.getCodigoPostal() + " calle: " + user.getCalle() + " Dpto: " + user.getDepartamento() + " Piso: " + user.getPiso());*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}