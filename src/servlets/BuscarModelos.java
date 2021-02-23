package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Alquiler;

@WebServlet("/BuscarModelos")
public class BuscarModelos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarModelos() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			validar(request);
			//CREO SESION PARA EL ALQUILER
			Alquiler alquiler = new Alquiler();
			HttpSession session = request.getSession(true);
			alquiler.setFecRetiroPrevisto( Date.valueOf(request.getParameter("fechaRetiro")));
			
			session.setAttribute("alquiler", alquiler);
				
			request.getRequestDispatcher("WEB-INF/MostrarModelos.jsp").forward(request, response);
			
		} catch (Exception e) {	response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
	}
	public void validar(HttpServletRequest request) throws Exception {
		//Date fechaRetiro= Date.valueOf(request.getParameter("fechaRetiro"));
		String fechaRetiro = request.getParameter("fechaRetiro");
		//Date fechaDevolucion= Date.valueOf(request.getParameter("fechaDevolucion"));
		String fechaDevolucion = request.getParameter("fechaDevolucion");
		String lugar = request.getParameter("selectProvincia");
		if((fechaRetiro != null && !fechaRetiro.isBlank() && !fechaRetiro.isEmpty()) &&
				(fechaDevolucion != null && !fechaDevolucion.isBlank() && !fechaDevolucion.isEmpty()) &&
				(lugar != null && !lugar.isEmpty() && !lugar.isBlank())){
				
			if (!(fechaRetiro.compareTo(fechaDevolucion) < 0)) {
				throw new Exception("La fecha de Devolucion debe ser mayor a la fecha de Retiro");
			}	
		}else {
			throw new Exception("Las fecha de retiro y devolucion no pueden estar vacias");
		}
	}

}
