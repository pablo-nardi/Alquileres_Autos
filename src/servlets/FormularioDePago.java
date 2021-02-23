package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alquiler;
import logic.ModeloLogic;

@WebServlet("/FormularioDePago")
public class FormularioDePago extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ModeloLogic ml = new ModeloLogic();
    public FormularioDePago() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			Alquiler alquiler = (Alquiler)session.getAttribute("alquiler");
			
			alquiler.setModelo(ml.getOne(Integer.parseInt(request.getParameter("id"))));
			
			session.setAttribute("alquiler", alquiler);
			
			request.getRequestDispatcher("WEB-INF/FormularioDePago.jsp").forward(request, response);
			
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
	}

}
