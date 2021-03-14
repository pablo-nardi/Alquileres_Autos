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
			
			//OBTENGO SESSION Y OBJETOS NECESARIOS
			
			HttpSession session = request.getSession();
			LinkedList<Cantidad> cantidades = (LinkedList<Cantidad>) session.getAttribute("cantidades");
			Alquiler alq = (Alquiler) session.getAttribute("alquiler");
		
			//CALCULO NUEVO PRECIO DEL ALQUILER SEGUN CANTIDAD DE DIAS
						
			Date fechaRetiro= alq.getFecRetiroPrevisto();
			Date fechaDevolucion= alq.getFecDevPrevista();
			
			long dias = (fechaDevolucion.getTime() - fechaRetiro.getTime() ) / (1000*60*60*24);
			
			//CALCULO VALOR DE EXTRA Y DIVIDO POR CANTIDAD DE DIAS
			
			Double valorExtra = Double.parseDouble(request.getParameter("precio")) / (double)dias ;
			valorExtra = valorExtra + valorExtra *  Double.parseDouble(request.getParameter("cant"));
			
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
			
			
			//request.getRequestDispatcher("CargarExtras.jsp").forward(request, response);
			response.sendRedirect("/Alquileres_Autos/CargarExtras.jsp"); //UTILIZO ESTE PORQUE ENTRA CON LA URL LIMPIA SON VAL EN PARAMETROS
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
	}

}
