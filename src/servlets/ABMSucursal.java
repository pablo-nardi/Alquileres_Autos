package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Sucursal;
import logic.*;

@WebServlet("/ABMSucursal/*")
public class ABMSucursal extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Sucursal suc = null;
    SucursalLogic sl = null;
    LocalidadLogic ll = null;

    public ABMSucursal() {
        super();
        suc = new Sucursal();
        sl = new SucursalLogic();
        ll = new LocalidadLogic();
    }


	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				sl.addSucursal(suc);
				response.sendRedirect("/Alquileres_Autos/ABMSucursales.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				sl.updateSucursal(suc);
				response.sendRedirect("/Alquileres_Autos/ABMSucursales.jsp");
				break;
			case "/eliminar":
				sl.deleteSucursal(Integer.parseInt(request.getParameter("txtIdSucursal")));
				response.sendRedirect("/Alquileres_Autos/ABMSucursales.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMSucursales.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req)throws SQLException {
		
		if(req.getPathInfo().equals("/editar")) {
			suc.setIdSucursal(Integer.parseInt(req.getParameter("txtIdSucursal")));
		}
		
		suc.setDenominacion(req.getParameter("txtSucursal"));
		suc.setDireccion(req.getParameter("txtDireccion"));
		suc.setHoraApertura(req.getParameter("txtHoraApertura"));
		suc.setHoraCierre(req.getParameter("txtHoraCierre"));
		suc.setLocalidad(ll.getOne(Integer.parseInt(req.getParameter("selectProvincia"))));
		suc.setTelefono(req.getParameter("txtTelefono"));
	}
	
	
		
}
