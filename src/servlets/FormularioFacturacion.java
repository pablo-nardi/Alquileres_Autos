package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;

@WebServlet("/FormularioFacturacion")
public class FormularioFacturacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FormularioFacturacion() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Usuario usuario = new Usuario();
		
		usuario.setNumUltTarjeta(request.getParameter("txtNumTarjeta"));
		
		session.setAttribute("usuario", usuario);
		
		
		
		request.getRequestDispatcher("WEB-INF/FormularioFacturacion.jsp").forward(request, response);
		
	}

}
