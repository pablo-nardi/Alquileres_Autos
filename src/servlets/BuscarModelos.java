package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet("/BuscarModelos")
public class BuscarModelos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    SucursalLogic sl = null;
	
    public BuscarModelos() {
        super();
        sl = new SucursalLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			validar(request);
			//CREO SESION PARA EL ALQUILER
			Alquiler alquiler = new Alquiler();
			HttpSession session = request.getSession(true);
			alquiler.setFecRetiroPrevisto( Date.valueOf(request.getParameter("fechaRetiro")));
			alquiler.setFecDevPrevista( Date.valueOf(request.getParameter("fechaDevolucion")));
			alquiler.setSucursal(sl.getSucursal(Integer.parseInt(request.getParameter("selectCiudad"))));
			
			session.setAttribute("alquiler", alquiler);
				
			//request.getRequestDispatcher("WEB-INF/MostrarModelos.jsp").forward(request, response);
			request.getRequestDispatcher("MostrarModelos.jsp").forward(request, response);
			
		} catch (Exception e) {	response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
	}
	public void validar(HttpServletRequest request) throws Exception {
		
		String fechaRetiro = request.getParameter("fechaRetiro");
		
		String fechaDevolucion = request.getParameter("fechaDevolucion");
		String lugar = request.getParameter("selectProvincia");
		if((fechaRetiro != null && !fechaRetiro.isBlank() && !fechaRetiro.isEmpty()) &&
				(fechaDevolucion != null && !fechaDevolucion.isBlank() && !fechaDevolucion.isEmpty()) &&
				(lugar != null && !lugar.isEmpty() && !lugar.isBlank())){
			
			Date dateRetiro= Date.valueOf(request.getParameter("fechaRetiro"));
			Date dateDevolucion= Date.valueOf(request.getParameter("fechaDevolucion"));
			
			if(dateRetiro.compareTo(Calendar.getInstance().getTime()) <= 0) {
				throw new Exception("la fecha de Retiro debe ser posterior al dia de hoy");
			}
			else if(dateRetiro.compareTo(dateDevolucion) >= 0) {
					throw new Exception("La fecha de Devolucion debe ser mayor a la fecha de Retiro");
				}
		}else {
			throw new Exception("Las fecha de retiro y devolucion no pueden estar vacias");
		}
	}
	
}
