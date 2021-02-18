package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.*;
import logic.*;

@WebServlet("/ABMProvincia/*")
public class ABMProvincia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Provincia prov = null; 
	ProvinciaLogic pl = null; 
	Localidad loc = null;
	LocalidadLogic ll = null;
       
    public ABMProvincia() {
        super();
        prov = new Provincia();
        pl = new ProvinciaLogic();
        loc = new Localidad();
        ll = new LocalidadLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				pl.addProvincia(prov);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				prov.setIdProvincia(Integer.parseInt(request.getParameter("txtIdProvincia")));
				pl.updateProvincia(prov);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/eliminar":
				pl.deleteProvincia(Integer.parseInt(request.getParameter("txtIdProvincia")));
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/nuevaLocalidad":
				mapearADatos(request);
				ll.addLocalidad(loc);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/editarLocalidad":
				mapearADatos(request);
				ll.updateLocalidad(loc);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/eliminarLocalidad":
				ll.deleteLocalidad(Integer.parseInt(request.getParameter("txtCodigoPostal")));
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException {
		
		if(req.getPathInfo().equals("/nuevo") || req.getPathInfo().equals("/editar")) {
			prov.setDenominacion(req.getParameter("txtDenominacion"));
			
		}else if(req.getPathInfo().equals("/nuevaLocalidad") || req.getPathInfo().equals("/editarLocalidad")){
			loc.setCodigoPostal(Integer.parseInt(req.getParameter("txtCodigoPostal")));
			loc.setDenominacion(req.getParameter("txtLocalidad"));
			loc.setProvincia(pl.getOne(Integer.parseInt(req.getParameter("selectProvincia")) ) );
		}		
	}
}
