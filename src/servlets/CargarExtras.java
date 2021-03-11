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

@WebServlet("/CargarExtras")
public class CargarExtras extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ExtrasLogic el = new ExtrasLogic(); 
	
       
    public CargarExtras() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			HttpSession session = request.getSession();
			Alquiler alq = (Alquiler) session.getAttribute("alquiler");
			
			
			el.addCantidad(	Integer.parseInt(request.getParameter("cant")),
							alq.getIdAlquiler(),
							Integer.parseInt(request.getParameter("cod")));
			
			request.getRequestDispatcher("ResumenRetiro.jsp").forward(request, response);
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
	}

}
