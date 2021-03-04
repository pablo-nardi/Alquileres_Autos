package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet("/FormularioDePago")
public class FormularioDePago extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Usuario user = null;
    ModeloLogic ml; 
    UsuarioLogic ul;
    public FormularioDePago() {
        super();
        ml =  new ModeloLogic();
        ul = new UsuarioLogic();
        user = new Usuario();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

		try {
			HttpSession session = req.getSession();
			
			user = ul.getOne(req.getParameter("txtCuil"));
			if(user == null) {
				user.setNombre(req.getParameter("txtNombre"));
				user.setApellido(req.getParameter("txtApellido"));
				user.setCuil(req.getParameter("txtCuil"));
				user.setMail(req.getParameter("txtEmail"));
				user.setTelefono(req.getParameter("txtTelefono"));
				user.setCiudad(req.getParameter("txtCiudad"));
				user.setCodigoPostal(req.getParameter("Codigo"));
				user.setCalle(req.getParameter("txtCalle") + " " + req.getParameter("txtNum"));
				user.setDepartamento(req.getParameter("txtDpto"));
				user.setPiso(Integer.parseInt(req.getParameter("txtPiso")));
			}
			
			
			
			
			session.setAttribute("usuario", user);
			
			//req.getRequestDispatcher("WEB-INF/FormularioDePago.jsp").forward(req, response);
			req.getRequestDispatcher("FormularioDePago.jsp").forward(req, response);
		
		}catch (Exception e) {	response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
			
		
		
	}

}
