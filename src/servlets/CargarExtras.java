package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;

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
			
			//OBTENGO SESSION
			
			HttpSession session = request.getSession();
			LinkedList<Cantidad> cantidades = (LinkedList<Cantidad>) session.getAttribute("cantidades");
			Alquiler alq = (Alquiler) session.getAttribute("alquiler");
		
			//CALCULO NUEVO PRECIO DEL ALQUILER SEGUN EL EXTRA ELEGIDO
						
			Date fechaRetiro= Date.valueOf(request.getParameter("fechaRetiro"));
			Date fechaDevolucion= Date.valueOf(request.getParameter("fechaDevolucion"));
			
			long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
			
			//CALCULO VALOR DE EXTRA Y DIVIDO POR CANTIDAD DE DIAS
			
			Double valorExtra = Double.parseDouble(request.getParameter("precio")) / (double)dias;
			
			alq.setPrecioDiario(alq.getPrecioDiario() + valorExtra);
			
			//PREPARO OBJETO CANTIDAD
			
			Cantidad c = new Cantidad(
										Integer.parseInt(request.getParameter("cant")),
										alq.getIdAlquiler(),
										Integer.parseInt(request.getParameter("cod"))
					);
			cantidades.add(c);
			
			
			
			session.setAttribute("alquiler", alq);
			session.setAttribute("cantidades", cantidades);
			
			
			request.getRequestDispatcher("CargarExtras.jsp").forward(request, response);
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
	}

}
