package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet("/FormularioFacturacion")
public class FormularioFacturacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ModeloLogic ml = null;
       
    public FormularioFacturacion() {
        super();
        ml = new ModeloLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		HttpSession session = request.getSession();
		Alquiler alquiler = (Alquiler)session.getAttribute("alquiler");
		
		alquiler.setModelo(ml.getOne(Integer.parseInt(request.getParameter("id"))));
		alquiler.setPrecioDiario(alquiler.getModelo().getPrecioPorDia());
		alquiler.setCostoDesperfecto(alquiler.getPrecioDiario() + alquiler.getPrecioDiario() * 0.1);
		alquiler.setCostoDevolucionTardia(alquiler.getPrecioDiario() + alquiler.getPrecioDiario() * 0.2);
		
		session.setAttribute("alquiler", alquiler);	
		
		//request.getRequestDispatcher("WEB-INF/FormularioFacturacion.jsp").forward(request, response);
		request.getRequestDispatcher("FormularioFacturacion.jsp").forward(request, response);
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}

}
