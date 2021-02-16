package servlets;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidades.Modelo;
import entidades.TipoAuto;
import logic.ModeloLogic;
import entidades.Usuario;


@WebServlet({"/ABMModelos/*", "/ServletabmModelos/*", "/Servletambmodelos/*", "/servletabmModelos/*"})


public class ABMModelos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Modelo mod;
    TipoAuto tipo;
    ModeloLogic ml;
  
    public ABMModelos() {
        super();
        mod = new Modelo();
        ml = new ModeloLogic();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		
		if(usuario.getRol().toLowerCase().equals("administrador")) {
			
			try {
				switch(request.getPathInfo()) {
				case "/nuevo":
					MapearADatos(request);
					ml.addModelo(mod);
					response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp");
					break;
				case "/editar":
					MapearADatos(request);
					mod.setIdentificacion(Integer.parseInt(request.getParameter("txtId")));
					ml.update(mod);
					response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp");
					break;
				case "/eliminar":
					ml.delete(Integer.parseInt(request.getParameter("txtId")));
					response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp");
					break;
				case "/cancelar":
					response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp");
					break;
				}
			} catch (SQLException e) {
				response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}	
		}else {
			getServletContext().getRequestDispatcher("/login.jsp");
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	protected void MapearADatos(HttpServletRequest request) {
		mod.setCantEquipajeGrande(Integer.parseInt(request.getParameter("selectEquiGran")));
		mod.setCantEquipajeChico(Integer.parseInt(request.getParameter("selectEquiChico")));
		mod.setCantPasajeros(Integer.parseInt(request.getParameter("txtCantPasajeros")));
		mod.setPrecioPorDia(Float.parseFloat(request.getParameter("txtPrecioPorDia")));
		mod.setDenominacion(request.getParameter("txtDenominacion"));
		mod.setTransmision(request.getParameter("selectTransmision"));
		mod.setAireAcondicionado(request.getParameter("selectAA"));
		mod.getTipoAuto().setId_Tipo(Integer.parseInt(request.getParameter("selectTipo")));
		
		if(request.getPathInfo().equals("/editar")) {
			
			if(request.getParameter("foto").equals("")) {
				mod.setFotoModelo(request.getParameter("fotoAnterior"));
			}else {
				mod.setFotoModelo("IMAGENES/Modelos/" + request.getParameter("foto"));
			}
			
			
		}else {
			mod.setFotoModelo("IMAGENES/Modelos/" + request.getParameter("foto"));
		}
		
		
	}
}