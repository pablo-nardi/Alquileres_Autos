package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletIndex/*")
public class ServletIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletIndex() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch(request.getPathInfo()) {
		case "/buscarLocalidad":
			response.sendRedirect("/Alquileres_Autos/index.jsp?id="+request.getParameter("selectProvincia"));
			break;
			
		case "/buscarModelos":
			//request.getRequestDispatcher("/MostrarModelos.jsp").forward(request, response); SI LO HAGO POR ACA
			//NO CARGA LAS IMAGENES
			
			try {
				validar(request);
				response.sendRedirect("/Alquileres_Autos/MostrarModelos.jsp");
			} catch (Exception e) {	response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
			
			break;
			
		}
		
		
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











