package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Sucursal;
import logic.*;

@WebServlet("/ServeltABMSucursal")
public class ServeltABMSucursal extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Sucursal suc = null;
    SucursalLogic sl = null;

    public ServeltABMSucursal() {
        super();
        suc = new Sucursal();
        sl = new SucursalLogic();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				//mapearADatos(request);
				sl.addSucursal(suc);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/editar":
				//mapearADatos(request);
				//prov.setIdProvincia(Integer.parseInt(request.getParameter("txtIdProvincia")));
				//pl.updateProvincia(prov);
				response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			case "/eliminar":
				//pl.deleteProvincia(Integer.parseInt(request.getParameter("txtIdProvincia")));
				//response.sendRedirect("/Alquileres_Autos/ABMProvincias.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}*/
	}
	private void mapearADatos(HttpServletRequest req) {
		suc.setDenominacion(req.getParameter("txtSucursal"));
		suc.setDireccion(req.getParameter("txtDireccion"));
		suc.setHoraApertura(LocalTime.parse(req.getParameter("txtHoraApertura")));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
