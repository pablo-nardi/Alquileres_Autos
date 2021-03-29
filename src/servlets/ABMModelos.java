package servlets;


import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entidades.Modelo;
import entidades.TipoAuto;
import logic.ModeloLogic;


@WebServlet({"/ABMModelos/*", "/ServletabmModelos/*", "/Servletambmodelos/*", "/servletabmModelos/*"})
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
maxFileSize = 10485760L, // 10 MB
maxRequestSize = 20971520L // 20 MB 
)

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				MapearADatos(request);
				agregarFoto(request);
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
		} catch (SQLException e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}	
	
		
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
			
			if(request.getParameter("foto") == null) {
				mod.setFotoModelo(request.getParameter("fotoAnterior"));
			}else {
				mod.setFotoModelo("IMAGENES/Modelos/" + request.getParameter("foto"));
			}
			
			
		}else {
			//mod.setFotoModelo("IMAGENES/Modelos/" + request.getParameter("foto"));
		}
		
		
	}
	private void agregarFoto(HttpServletRequest request) throws ServletException, IOException{
		if(!request.getParts().isEmpty()){ //ESTE IF ESTA POR SI QUIEREN DAR DE ALTA UN AUTO SIN ELEGIR FOTO
			String uploadPath = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) uploadDir.mkdir();
			
			for (Part part : request.getParts()) {
				String fileName = part.getSubmittedFileName();
			    part.write(uploadPath + File.separator + fileName);
			    mod.setFotoModelo("IMAGENES/Modelos/" + fileName);
			}
		}
	}
}