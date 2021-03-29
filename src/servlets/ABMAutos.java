package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.*;
import logic.*;


@WebServlet("/ABMAutos/*")
public class ABMAutos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Auto auto = null;
    AutoLogic al = null;
    ModeloLogic ml = null;
    SucursalLogic sl = null;
    
    public ABMAutos() {
        super();
        auto = new Auto();
        al = new AutoLogic();
        ml = new ModeloLogic();
        sl = new SucursalLogic();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				al.addAuto(auto);
				response.sendRedirect("/Alquileres_Autos/ABMAutos.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				al.updateAuto(auto);
				response.sendRedirect("/Alquileres_Autos/ABMAutos.jsp");
				break;
			case "/eliminar":
				al.deleteAuto(request.getParameter("txtPatente"));
				response.sendRedirect("/Alquileres_Autos/ABMAutos.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMAutos.jsp");
				break;
			}
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException, Exception {
		auto.setCapacidadDelTanque(Float.parseFloat(req.getParameter("txtCapacidad")));
		auto.setEstado(Auto.Estado.valueOf(req.getParameter("selectEstado")));
		String txtServicio = req.getParameter("txtServicio") ;
		if(txtServicio != null && !txtServicio.isBlank() && !txtServicio.isEmpty() ) {
			Date fechaCompra = Date.valueOf(req.getParameter("txtFechaCompra"));
			Date fechaServicio = Date.valueOf(txtServicio);
			
			if (fechaCompra.compareTo(fechaServicio)== 0 || fechaCompra.compareTo(fechaServicio) < 0) {
				auto.setFecha_de_compra(Date.valueOf(req.getParameter("txtFechaCompra")));
				auto.setFechaUtltimoServicio(Date.valueOf(txtServicio));
			}else {
				throw new Exception("La fecha de Servicio debe ser igual o mayor a la fecha de compra");
			}	
		}else {
			auto.setFecha_de_compra(Date.valueOf(req.getParameter("txtFechaCompra")));
			auto.setFechaUtltimoServicio(null);
		}
		auto.setKilometraje(Float.parseFloat(req.getParameter("txtKilometraje")));
		auto.setModelo(ml.getOne(Integer.parseInt(req.getParameter("selectModelos"))));
		auto.setPatente(req.getParameter("txtPatente"));
		auto.setSucursal(sl.getOne(Integer.parseInt(req.getParameter("selectSucursales")))); 
	}
}
