package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.*;
import logic.*;

/**
 * Servlet implementation class ElegirAuto
 */
@WebServlet({"/ElegirAuto","/ElegirAuto/*","/elegirauto","/elegirAuto"})

public class ElegirAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Alquiler alq = null;
    AlquilerLogic al = new AlquilerLogic();
    LinkedList<Alquiler> alquileres = new LinkedList<>();
    public ElegirAuto() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			try {
					alquileres = al.buscarAlquiler(request.getParameter("txtCuil"));
					
					if(alquileres.isEmpty()) {
						throw new Exception("No se encontro el alquiler");
					}else{
						request.setAttribute("alquileres", alquileres);
						request.getRequestDispatcher("BuscarAlquiler.jsp").forward(request, response);
					}
					
				
			
				
		
			}catch (Exception e) {
				response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		}

}
