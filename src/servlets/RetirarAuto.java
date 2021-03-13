package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;

import logic.*;

@WebServlet("/RetirarAuto")
public class RetirarAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AlquilerLogic al = null;
    public RetirarAuto() {
        super();
        al = new AlquilerLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			HttpSession session = request.getSession();
			
		
			
			al.updateAlquiler( 	(Alquiler) session.getAttribute("alquiler"),
								(Conductor) session.getAttribute("conductor"),
								(AlquilerConductor)session.getAttribute("alqcon"),
								(LinkedList<Cantidad>) session.getAttribute("cantidades")
					);
			
			
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
	}

}
