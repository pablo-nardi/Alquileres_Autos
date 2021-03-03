package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AutoLogic;
import entidades.*;

@WebServlet("/BuscarAlternativa")
public class BuscarAlternativa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarAlternativa() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			LinkedList<Auto> autos = new LinkedList<>();
			AutoLogic al = new AutoLogic();
			HttpSession session = request.getSession();
			Alquiler alq = (Alquiler) session.getAttribute("alquiler");
			autos = al.getAutos(alq.getFecRetiroPrevisto(), alq.getFecDevPrevista(), alq.getSucursal());
			
			
		}catch (Exception e) {	response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}


	}

}
